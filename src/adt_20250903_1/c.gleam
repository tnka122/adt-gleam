import gleam/int
import gleam/io
import gleam/list
import gleam/set
import helper

pub fn main() {
  let _n = helper.read_int()
  let a = helper.read_list_int()
  let b = helper.read_list_int()

  solve(a, b)
  |> list.each(fn(x) {
    x
    |> int.to_string
    |> io.println
  })
}

pub fn solve(a, b) {
  let ans1 =
    list.zip(a, b)
    |> list.filter(fn(x) {
      let #(ai, bi) = x
      ai == bi
    })
    |> list.length

  let n_intersection =
    set.intersection(set.from_list(a), set.from_list(b)) |> set.size

  let ans2 = n_intersection - ans1

  [ans1, ans2]
}
