import gleam/float
import gleam/int
import gleam/io
import gleam/list
import gleam/result
import helper

pub fn main() {
  let assert [n, _] = helper.read_list_int()
  let a = helper.read_list_int()
  let pos_list = list.map(list.range(1, n), fn(_) { helper.read_list_int() })

  solve(a, pos_list) |> float.to_string |> io.println
}

pub fn solve(a, pos_list: List(List(Int))) {
  let a_pos =
    pos_list
    |> list.index_map(fn(pos, i) { #(i, pos) })
    |> list.filter(fn(x) {
      let #(i, _) = x
      list.contains(a, i + 1)
    })
    |> list.map(fn(x) {
      let #(_, pos) = x
      pos
    })

  let assert Ok(closest) =
    list.map(pos_list, fn(p) {
      let min_dist =
        list.fold(a_pos, 1.0e10, fn(acc, ap) {
          let assert Ok(dist) = distance(p, ap)
          float.min(acc, dist)
        })
      min_dist
    })
    |> list.max(float.compare)

  closest
}

fn distance(p1, p2) {
  let assert [x1, y1] = p1
  let assert [x2, y2] = p2
  use x <- result.try(int.power(x1 - x2, 2.0))
  use y <- result.try(int.power(y1 - y2, 2.0))
  use ans <- result.try(float.square_root(x +. y))
  Ok(ans)
}
