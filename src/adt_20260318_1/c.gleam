import gleam/int
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
  let assert [s] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.to_list

  let assert Ok(x) = s |> string.to_graphemes |> list.try_map(int.parse)

  x
}

pub fn solve(x) {
  case f1(x) || f2(x) {
    True -> "Weak"
    False -> "Strong"
  }
}

fn f1(x) {
  let assert [a, b, c, d] = x
  a == b && b == c && c == d
}

fn f2(x) {
  let assert [a, b, c, d] = x
  { a + 1 } % 10 == b && { b + 1 } % 10 == c && { c + 1 } % 10 == d
}
