import gleam/int
import gleam/io
import gleam/list
import gleam/string
import gleam/yielder
import stdin

pub fn main() {
  read()
  |> solve
  |> list.map(int.to_string)
  |> string.join(" ")
  |> io.println
}

fn read() {
  let assert [_n, a] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.to_list

  let assert Ok(a) = a |> string.split(" ") |> list.try_map(int.parse)
  a
}

pub fn solve(a) {
  f(a, []) |> list.reverse()
}

fn f(rest, result) {
  case rest {
    [] -> result
    [x] -> [x, ..result]
    [x, y, ..tail] -> {
      let range = list.range(y, x) |> list.drop(1)
      f([y, ..tail], list.append(range, result))
    }
  }
}
