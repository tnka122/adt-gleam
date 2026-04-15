import gleam/float
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
  let assert [ab, ..] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.to_list

  let assert Ok([a, b]) = ab |> string.split(" ") |> list.try_map(int.parse)
  #(a, b)
}

pub fn solve(ab) {
  let #(a, b) = ab

  let assert Ok(a2) = int.power(a, 2.0)
  let assert Ok(b2) = int.power(b, 2.0)

  let assert Ok(d) = float.square_root(a2 +. b2)

  let x = int.to_float(a) /. d
  let y = int.to_float(b) /. d

  float.to_string(x) <> " " <> float.to_string(y)
}
