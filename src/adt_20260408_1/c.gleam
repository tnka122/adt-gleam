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
  let assert [nm, ..s] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.to_list

  let assert Ok([n, _m]) = nm |> string.split(" ") |> list.try_map(int.parse)

  s
  |> list.take(n)
  |> list.map(fn(ox_list) {
    ox_list |> string.to_graphemes |> list.map(fn(ox) { ox == "o" })
  })
}

pub fn solve(s) {
  s
  |> list.combination_pairs
  |> list.filter(fn(ss) {
    list.zip(ss.0, ss.1)
    |> list.all(fn(ox) { ox.0 || ox.1 })
  })
  |> list.length
}
