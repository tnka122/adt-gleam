import gleam/int
import gleam/io
import gleam/list
import gleam/string
import gleam/yielder
import iv
import stdin

pub fn main() {
  read()
  |> solve
  |> fn(result) {
    case result {
      True -> "Yes"
      False -> "No"
    }
  }
  |> io.print
}

fn read() {
  let assert [hw, ..s] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.filter(fn(x) { x != "" })
    |> yielder.to_list

  let assert Ok([h, w]) = hw |> string.split(" ") |> list.try_map(int.parse)

  let s =
    s
    |> list.map(fn(line) {
      line
      |> string.to_graphemes
      |> iv.from_list
    })
    |> iv.from_list

  #(h, w, s)
}

pub fn solve(input) {
  let #(h, w, s) = input

  list.range(0, h - 1)
  |> list.all(fn(i) {
    list.range(0, w - 1)
    |> list.all(fn(j) { cond(s, h, w, i, j) })
  })
}

fn cond(s, h, w, i, j) {
  case at(s, i, j) {
    "." -> True
    "#" -> {
      neighbors(h, w, i, j)
      |> list.count(fn(p) { at(s, p.0, p.1) == "#" })
      |> fn(n) { n == 2 || n == 4 }
    }
    _ -> panic
  }
}

const directions = [#(1, 0), #(0, 1), #(-1, 0), #(0, -1)]

fn neighbors(h, w, i, j) {
  directions
  |> list.map(fn(d) { #(i + d.0, j + d.1) })
  |> list.filter(fn(p) { in_s(h, w, p.0, p.1) })
}

fn in_s(h, w, i, j) {
  i >= 0 && i < h && j >= 0 && j < w
}

fn at(s, i, j) {
  let assert Ok(row) = iv.get(s, i)
  let assert Ok(elem) = iv.get(row, j)
  elem
}
