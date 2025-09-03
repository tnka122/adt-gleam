import gleam/int
import gleam/io
import gleam/list
import gleam/set
import helper

pub fn main() {
  let _ = helper.read_list()
  let a = helper.read_list_int()
  let b = helper.read_list_int()

  solve(a, b) |> io.println()
}

pub fn solve(a, b) {
  let set_a = set.from_list(a)
  let c = list.append(a, b) |> list.sort(int.compare)

  let ans =
    c
    |> list.window_by_2()
    |> list.any(fn(pair) {
      let #(ci, cj) = pair
      set.contains(set_a, ci) && set.contains(set_a, cj)
    })

  case ans {
    True -> "Yes"
    False -> "No"
  }
}
