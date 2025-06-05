import gleam/io
import helper

pub fn main() {
  let assert [a, b, c] = helper.read_list_int()

  solve(a, b, c)
  |> io.println
}

pub fn solve(a, b, c) {
  let result =
    { a == b && a == c && b == c }
    || { a + b == c }
    || { a + c == b }
    || { b + c == a }

  case result {
    True -> "Yes"
    False -> "No"
  }
}
