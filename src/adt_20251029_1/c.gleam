import gleam/int
import gleam/io
import gleam/list
import gleam/string
import gleam/yielder
import stdin

pub fn main() {
  read_list()
  |> solve
  |> print
}

fn read_list() {
  let assert [_, ..queries] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.to_list

  let assert Ok(queries) =
    list.try_map(queries, fn(x) {
      x |> string.split(" ") |> list.try_map(int.parse)
    })
  queries
}

pub fn solve(queries) {
  list.fold(queries, #(list.repeat(0, 100), []), fn(acc, q) {
    let #(deck, result) = acc
    case q {
      [1, x] -> #([x, ..deck], result)
      [2] -> {
        let assert [top, ..rest] = deck
        #(rest, [top, ..result])
      }
      _ -> panic
    }
  }).1
  |> list.reverse
}

fn print(result) {
  result
  |> list.map(int.to_string)
  |> string.join("\n")
  |> io.println
}
