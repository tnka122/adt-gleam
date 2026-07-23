import gleam/dict
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
  let assert [s, ..] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.filter(fn(l) { l != "" })
    |> yielder.to_list

  s
}

pub fn solve(s) {
  let m =
    s
    |> string.to_graphemes
    |> list.index_map(fn(x, i) { #(x, i) })
    |> dict.from_list

  let assert Ok(i0) = dict.get(m, "A")

  let #(result, _) =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    |> string.to_graphemes
    |> list.fold(#(0, i0), fn(acc, x) {
      let #(ans, before_i) = acc
      let assert Ok(i) = dict.get(m, x)
      #(ans + int.absolute_value(i - before_i), i)
    })

  result
}

fn print(result) {
  result
  |> int.to_string
  |> io.println
}
