import gleam/dict
import gleam/int
import gleam/io
import gleam/list
import gleam/set
import gleam/string
import gleam/yielder
import stdin

pub fn main() {
  read()
  |> solve
  |> int.to_string
  |> io.println
}

fn read() {
  let assert [[_n, x], a] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.to_list
    |> list.map(fn(line) {
      let assert Ok(parsed) =
        line |> string.split(" ") |> list.try_map(int.parse)
      parsed
    })

  #(x, a)
}

pub fn solve(input) {
  let #(x, a) = input

  let relations =
    a
    |> list.index_map(fn(ai, i) { #(i, ai - 1) })
    |> dict.from_list

  step(relations, set.new(), x - 1)
}

fn step(relations, known, current) {
  case set.contains(known, current) {
    True -> set.size(known)
    False -> {
      let known = set.insert(known, current)
      let assert Ok(next) = dict.get(relations, current)
      step(relations, known, next)
    }
  }
}
