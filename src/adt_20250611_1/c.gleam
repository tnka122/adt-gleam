import gleam/int
import gleam/io
import helper

pub fn main() {
  let k = helper.read_int()
  let assert [a, b] = helper.read_list()

  solve(k, a, b)
  |> int.to_string
  |> io.println
}

pub fn solve(k, a, b) {
  let assert Ok(a_dec) = int.base_parse(a, k)
  let assert Ok(b_dec) = int.base_parse(b, k)
  a_dec * b_dec
}
