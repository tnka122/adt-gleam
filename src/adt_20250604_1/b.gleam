import gleam/io
import gleam/string
import helper

pub fn main() {
  helper.read_line()
  |> solve
  |> io.println
}

pub fn solve(s) {
  s
  |> string.trim
  |> string.slice(-2, 2)
}
