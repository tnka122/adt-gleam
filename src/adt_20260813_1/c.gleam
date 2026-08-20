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
  let assert [n, ..sc] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.filter(fn(l) { l != "" })
    |> yielder.to_list

  let assert Ok(n) = int.parse(n)

  let #(s, c) =
    list.map(sc, fn(l) {
      let assert [s, c] = string.split(l, " ")
      let assert Ok(c) = int.parse(c)
      #(s, c)
    })
    |> list.unzip

  #(n, s, c)
}

pub fn solve(input) {
  let #(n, s, c) = input
  let assert Ok(sum) = list.reduce(c, int.add)
  let assert Ok(index) = int.modulo(sum, n)

  let assert Ok(ans) =
    s
    |> list.sort(string.compare)
    |> list.drop(index)
    |> list.first

  ans
}

fn print(result) {
  result
  |> io.println
}
