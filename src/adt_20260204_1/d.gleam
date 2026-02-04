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
  let assert [s, ..] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.to_list

  s
}

pub fn solve(s) {
  let g = string.to_graphemes(s)
  let n = list.length(g)

  list.fold(list.range(1, n + 1), [], fn(acc, i) {
    g
    |> list.window(i)
    |> list.append(acc, _)
  })
  |> set.from_list
  |> set.size
}
