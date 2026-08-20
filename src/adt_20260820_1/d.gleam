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
  |> print
}

fn read() {
  let assert [xy, ..] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.filter(fn(l) { l != "" })
    |> yielder.to_list

  let assert Ok([x, y]) = xy |> string.split(" ") |> list.try_map(int.parse)
  #(x, y)
}

pub fn solve(xy) {
  let #(x, y) = xy

  let count =
    {
      use x <- list.map(list.range(1, 6))
      use y <- list.map(list.range(1, 6))
      #(x, y)
    }
    |> list.flatten
    |> list.count(fn(ij) {
      let #(i, j) = ij
      i + j >= x || int.absolute_value(i - j) >= y
    })

  int.to_float(count) /. 36.0
}

fn print(result) {
  result
  |> float.to_string
  |> io.println
}
