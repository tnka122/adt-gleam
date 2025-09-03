import gleam/int
import gleam/io
import gleam/list
import helper

pub fn main() {
  let _ = helper.read_int()
  let a = helper.read_list_int()

  solve(a) |> io.println()
}

pub fn solve(a) {
  let assert [_, #(ans, _), ..] =
    a
    |> list.index_map(fn(x, i) { #(i, x) })
    |> list.sort(fn(a, b) {
      let #(_, x1) = a
      let #(_, x2) = b
      int.compare(x2, x1)
    })

  int.to_string(ans + 1)
}
