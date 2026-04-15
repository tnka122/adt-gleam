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
  let assert [sk, ..] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.to_list

  let assert [s, k] = sk |> string.split(" ")
  let assert Ok(k) = int.parse(k)
  #(s, k)
}

pub fn solve(sk) {
  let #(s, k) = sk

  let assert [result, ..] =
    s
    |> string.to_graphemes
    |> list.permutations
    |> list.map(fn(l) { string.join(l, "") })
    |> list.unique
    |> list.sort(string.compare)
    |> list.drop(k - 1)

  result
}
