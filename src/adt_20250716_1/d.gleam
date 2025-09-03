import gleam/int
import gleam/io
import gleam/list
import helper

pub fn main() {
  let _ = helper.read_int()
  let a = helper.read_list_int()

  solve(a) |> io.println()
}

pub fn solve(a) {
  let assert [a1, a2, ..] = a
  let gcd1 = gcd(a1, a2)
  let ratio = #(a2 / gcd1, a1 / gcd1)
  let ans =
    a
    |> list.window_by_2()
    |> list.all(fn(pair) {
      let #(a1, a2) = pair
      let gcd2 = gcd(a1, a2)
      #(a2 / gcd2, a1 / gcd2) == ratio
    })

  case ans {
    True -> "Yes"
    False -> "No"
  }
}

pub fn gcd(a: Int, b: Int) -> Int {
  let a = int.absolute_value(a)
  let b = int.absolute_value(b)
  case b {
    0 -> a
    _ -> gcd(b, a % b)
  }
}
