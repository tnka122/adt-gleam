import gleam/int
import gleam/io
import gleam/list
import gleam/set
import gleam/string
import gleam/yielder
import stdin

pub fn main() {
  read()
  |> solve
  |> print
}

fn read() {
  let assert [hwn, ..ab] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.filter(fn(x) { x != "" })
    |> yielder.to_list

  let assert Ok([h, _w, n]) =
    hwn |> string.split(" ") |> list.try_map(int.parse)
  let #(a_lines, b_lines) = list.split(ab, h)
  let a =
    a_lines
    |> list.map(fn(line) {
      let assert Ok(l) = line |> string.split(" ") |> list.try_map(int.parse)
      set.from_list(l)
    })

  let b =
    b_lines
    |> list.take(n)
    |> list.map(fn(line) {
      let assert Ok(v) = int.parse(line)
      v
    })
    |> set.from_list

  #(a, b)
}

pub fn solve(input) {
  let #(a, b) = input

  let assert Ok(result) =
    a
    |> list.map(fn(ai) { set.intersection(ai, b) |> set.size })
    |> list.max(int.compare)

  result
}

fn print(result) {
  result |> int.to_string |> io.println
}
