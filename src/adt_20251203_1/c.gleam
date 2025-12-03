import gleam/int
import gleam/io
import gleam/list
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
  let assert [_, a] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.to_list

  let assert Ok(a) = a |> string.split(" ") |> list.try_map(int.parse)
  a
}

pub fn solve(a) {
  let assert Ok(max) = list.max(a, int.compare)

  int.min(max, 100)
  |> list.range(1, _)
  |> list.fold(0, fn(acc, x) {
    let count = list.count(a, fn(ai) { ai >= x })
    case count >= x {
      True -> x
      False -> acc
    }
  })
}
