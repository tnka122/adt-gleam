import gleam/io
import gleam/string
import gleam/yielder
import stdin

pub fn main() {
  read()
  |> solve
  |> io.println
}

fn read() {
  let assert [s, t, ..] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.to_list

  #(s, t)
}

pub fn solve(st) {
  let #(s, t) = st
  case string.starts_with(t, s) {
    True -> "Yes"
    False -> "No"
  }
}
