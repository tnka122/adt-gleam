import gleam/int
import gleam/io
import gleam/list
import helper

pub fn main() {
  helper.read_int()
  let a = helper.read_list_int()

  solve(a)
  |> int.to_string
  |> io.println
}

pub fn solve(a) {
  f(a, 0)
}

fn f(a, t) {
  case list.count(a, fn(x) { x > 0 }) <= 1 {
    True -> t
    False -> {
      let assert [a1, a2, ..rest] = list.sort(a, fn(a, b) { int.compare(b, a) })
      f([a1 - 1, a2 - 1, ..rest], t + 1)
    }
  }
}
