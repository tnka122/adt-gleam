import gleam/int
import gleam/io
import gleam/list
import helper

pub fn main() {
  let assert [_, p] = helper.read_list_int()
  let a = helper.read_list_int()

  solve(a, p)
  |> io.println
}

pub fn solve(a, p) {
  list.count(a, fn(x) { x < p })
  |> int.to_string
}
