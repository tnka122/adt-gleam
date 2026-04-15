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
  |> int.to_string
  |> io.println
}

fn read() {
  let assert [pq] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.filter(fn(line) { line != "" })
    |> yielder.to_list

  pq |> string.split(" ")
}

pub fn solve(pq) {
  let assert [p, q] = pq

  let m =
    [0, 3, 1, 4, 1, 5, 9]
    |> list.scan(0, fn(acc, x) { acc + x })
    |> list.zip(["A", "B", "C", "D", "E", "F", "G"], _)
    |> dict.from_list

  let assert Ok(dp) = dict.get(m, p)
  let assert Ok(dq) = dict.get(m, q)

  int.absolute_value(dp - dq)
}
