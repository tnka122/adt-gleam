import gleam/dict
import gleam/int
import gleam/io
import gleam/list
import helper

pub fn main() {
  let assert [n, q] = helper.read_list_int()
  let a =
    list.map(list.range(1, n), fn(_) {
      let assert [_, ..rest] = helper.read_list_int()
      rest
    })

  let q =
    list.map(list.range(1, q), fn(_) {
      let assert [x, y] = helper.read_list_int()
      #(x, y)
    })

  solve(a, q)
  |> list.each(io.println)
}

pub fn solve(a, q) {
  let a =
    a
    |> list.index_map(fn(x, i) {
      let v =
        x
        |> list.index_map(fn(y, j) { #(j, y) })
        |> dict.from_list
      #(i, v)
    })
    |> dict.from_list

  list.map(q, fn(query) {
    let #(s, t) = query
    let assert Ok(a_s) = dict.get(a, s - 1)
    let assert Ok(a_st) = dict.get(a_s, t - 1)
    int.to_string(a_st)
  })
}
