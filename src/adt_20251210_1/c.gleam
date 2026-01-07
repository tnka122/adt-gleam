import gleam/dict
import gleam/io
import gleam/list
import gleam/string
import gleam/yielder
import stdin

pub fn main() {
  read()
  |> solve
  |> io.println
}

fn read() {
  let assert [_, ..names] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.to_list

  names
}

pub fn solve(names) {
  let n_duplicated_name =
    names
    |> list.group(fn(name) { name })
    |> dict.filter(fn(_, v) { v |> list.length() > 1 })
    |> dict.size

  case n_duplicated_name {
    0 -> "No"
    _ -> "Yes"
  }
}
