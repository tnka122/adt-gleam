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
  let assert [n, ..] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.filter(fn(l) { l != "" })
    |> yielder.to_list

  let assert Ok(n) = int.parse(n)
  n
}

pub fn solve(n) {
  list.range(1, 60)
  |> list.fold_until(1, fn(acc, i) {
    let acc = acc * 2
    case acc <= n {
      True -> list.Continue(acc)
      False -> list.Stop(i - 1)
    }
  })
}

fn print(result) {
  result
  |> int.to_string
  |> io.println
}
