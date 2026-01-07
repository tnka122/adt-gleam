import gleam/int
import gleam/io
import gleam/list
import gleam/string
import gleam/yielder
import stdin

pub fn main() {
  read()
  |> solve
  |> list.map(int.to_string)
  |> string.join(" ")
  |> io.println
}

fn read() {
  let assert [s] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.to_list

  s
}

pub fn solve(s) {
  s
  |> string.split("|")
  |> list.filter(fn(x) { x != "" })
  |> list.map(string.length)
}
