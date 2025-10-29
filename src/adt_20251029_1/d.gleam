import gleam/int
import gleam/io
import gleam/list
import gleam/set
import gleam/string
import gleam/yielder
import stdin

pub fn main() {
  read_list()
  |> solve
  |> io.println
}

fn read_list() {
  let assert [n, d] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.to_list

  let assert Ok(n) = int.parse(n)
  let assert Ok(d) = d |> string.split(" ") |> list.try_map(int.parse)
  #(n, d)
}

pub fn solve(input) {
  let #(n, d) = input
  list.zip(list.range(1, n), d)
  |> list.fold(0, fn(acc, x) {
    let #(i, di) = x
    list.fold(list.range(1, di), 0, fn(acc2, dii) {
      let num_count =
        { int.to_string(i) <> int.to_string(dii) }
        |> string.to_graphemes
        |> set.from_list
        |> set.size

      case num_count {
        1 -> acc2 + 1
        _ -> acc2
      }
    })
    + acc
  })
  |> int.to_string
}
