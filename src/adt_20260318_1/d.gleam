import gleam/int
import gleam/io
import gleam/list
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
  let assert [xyz] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.to_list

  let assert Ok([x, y, z]) = xyz |> string.split(" ") |> list.try_map(int.parse)

  #(x, y, z)
}

pub fn solve(xyz) {
  let #(x, y, z) = xyz

  let #(x, y, z) = case y > 0 {
    True -> #(x, y, z)
    False -> #(-x, -y, -z)
  }

  case x < y {
    True -> int.absolute_value(x)
    False ->
      case z < y {
        True -> int.absolute_value(z) + int.absolute_value(x - z)
        False -> -1
      }
  }
}
