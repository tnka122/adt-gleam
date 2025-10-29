import gleam/int
import gleam/io
import gleam/list
import gleam/string
import gleam/yielder
import stdin

pub fn main() {
  read_list()
  |> solve
  |> io.println
}

fn read_list() {
  let assert [nd, s, ..] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.to_list

  let assert Ok([n, d]) = string.split(nd, " ") |> list.try_map(int.parse)
  #(n, d, s)
}

pub fn solve(input) {
  let #(_, d, s) = input

  let #(result, _) =
    s
    |> string.to_graphemes
    |> list.fold_right(#([], 0), fn(acc, c) {
      let #(chars, count) = acc
      case c, count {
        "@", count if count < d -> #([".", ..chars], count + 1)
        _, _ -> #([c, ..chars], count)
      }
    })

  string.join(result, "")
}
