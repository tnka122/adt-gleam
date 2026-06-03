import gleam/int
import gleam/io
import gleam/list
import gleam/string
import gleam/yielder
import stdin

pub fn main() {
  read()
  |> solve
  |> print
}

fn read() {
  let assert [_n, ..s] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.filter(fn(x) { x != "" })
    |> yielder.to_list

  s |> list.map(string.to_graphemes)
}

pub fn solve(s) {
  s
  |> list.index_map(fn(si, i) { #(si |> list.count(fn(c) { c == "o" }), i + 1) })
  |> list.sort(fn(a, b) { int.compare(b.0, a.0) })
  |> list.map(fn(si) { si.1 })
}

fn print(result) {
  result |> list.map(int.to_string) |> string.join(" ") |> io.println
}
