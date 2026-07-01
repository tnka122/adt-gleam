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
  let assert [_, d] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.filter(fn(l) { l != "" })
    |> yielder.to_list

  let assert Ok(d) = d |> string.split(" ") |> list.try_map(int.parse)
  d
}

pub fn solve(d) {
  f(d, []) |> list.reverse
}

fn f(d, acc) {
  case d {
    [] -> acc
    [_, ..rest] -> {
      let result = list.scan(d, 0, fn(acc, x) { x + acc })
      f(rest, [result, ..acc])
    }
  }
}

fn print(result) {
  result
  |> list.map(fn(x) { x |> list.map(int.to_string) |> string.join(" ") })
  |> list.each(io.println)
}
