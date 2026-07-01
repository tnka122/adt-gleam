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
  let assert [s] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.filter(fn(l) { l != "" })
    |> yielder.to_list

  s
}

pub fn solve(s) {
  let #(i, result) =
    s
    |> string.to_graphemes
    |> list.fold(#(1, 0), fn(acc, si) {
      let #(i, ans) = acc
      case int.is_odd(i) && si == "i" || int.is_even(i) && si == "o" {
        True -> #(i + 1, ans)
        False -> #(i + 2, ans + 1)
      }
    })

  case int.is_odd(i) {
    True -> result
    False -> result + 1
  }
}

fn print(result) {
  result |> int.to_string |> io.println
}
