import gleam/dict
import gleam/int
import gleam/io
import gleam/list
import gleam/string
import helper

pub fn main() {
  let n = helper.read_int()
  solve(n)
  |> list.each(fn(row) {
    row
    |> list.map(int.to_string)
    |> string.join(" ")
    |> io.println
  })
}

pub fn solve(n) {
  list.fold(list.range(1, n - 1), [[1]], fn(acc, i) {
    let assert [prev, ..] = acc
    let prev = list.index_map(prev, fn(x, j) { #(j, x) }) |> dict.from_list

    let result =
      list.map(list.range(0, i), fn(j) {
        case j {
          _ if j == 0 || j == i -> 1
          _ -> {
            let assert Ok(p1) = dict.get(prev, j - 1)
            let assert Ok(p2) = dict.get(prev, j)
            p1 + p2
          }
        }
      })
    [result, ..acc]
  })
  |> list.reverse
}
