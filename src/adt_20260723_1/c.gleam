import gleam/int
import gleam/io
import gleam/list
import gleam/string
import gleam/yielder
import stdin

pub fn main() {
  read()
  |> solve
  |> print
}

fn read() {
  let assert [l, ..] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.filter(fn(l) { l != "" })
    |> yielder.to_list

  let assert Ok(xyz) = l |> string.split(" ") |> list.try_map(int.parse)
  xyz
}

pub fn solve(xyz) {
  let assert [x, y, z] = xyz
  let assert [x, y, z] = case x > 0 {
      True -> [x, y, z]
      False -> [-x, -y, -z]
    }

  case x > y && y > 0 { // x -- 壁 -- 0
    True -> case z > y {
      True -> -1 // ハンマー -- 壁 -- 0
      False -> int.absolute_value(z) + x - z // 壁 -- ハンマー
    }
    False -> x // x -- 0
  }
}

fn print(result) {
  result
  |> int.to_string
  |> io.println
}
