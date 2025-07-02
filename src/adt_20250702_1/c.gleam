import gleam/int
import gleam/io
import gleam/list
import gleam/string
import helper

pub fn main() {
  let assert [h, _] = helper.read_list_int()
  let a = list.map(list.range(1, h), fn(_) { helper.read_list_int() })

  solve(a) |> print()
}

pub fn solve(a) {
  list.transpose(a)
}

fn print(b) {
  b
  |> list.map(fn(row) {
    row
    |> list.map(int.to_string)
    |> string.join(" ")
  })
  |> string.join("\n")
  |> io.println
}
