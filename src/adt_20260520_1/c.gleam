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
  |> fn(result) {
    case result == -1 {
      True -> "inf"
      False -> int.to_string(result)
    }
  }
  |> io.println
}

fn read() {
  let assert [nm, ..] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.to_list

  let assert Ok([n, m]) = nm |> string.split(" ") |> list.try_map(int.parse)

  #(n, m)
}

pub fn solve(input) {
  let #(n, m) = input

  list.range(0, m)
  |> list.map(int.to_float)
  |> list.fold_until(0.0, fn(acc, i) {
    let assert Ok(ni) = int.power(n, i)
    let acc = acc +. ni
    case acc <=. 1_000_000_000.0 {
      True -> list.Continue(acc)
      False -> list.Stop(-1.0)
    }
  })
  |> float.round
}
