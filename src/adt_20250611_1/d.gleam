import gleam/int
import gleam/io
import gleam/list
import helper

pub fn main() {
  let _ = helper.read_int()
  let d = helper.read_list_int()

  let #(month, day) = solve(d)
  io.println(int.to_string(month) <> " " <> int.to_string(day))
}

pub fn solve(d) {
  let assert Ok(total_days) = list.reduce(d, fn(acc, x) { acc + x })
  let mid_day = { total_days + 1 } / 2

  f(d, mid_day, 1)
}

fn f(d: List(Int), rest_day: Int, month) {
  let assert [d_hd, ..d_rest] = d
  let diff = rest_day - d_hd

  case diff <= 0 {
    True -> #(month, rest_day)
    False -> f(d_rest, diff, month + 1)
  }
}
