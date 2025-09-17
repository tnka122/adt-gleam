import gleam/dict
import gleam/int
import gleam/io
import gleam/list
import gleam/order.{Eq, Gt, Lt}
import gleam/string
import helper

pub fn main() {
  let s = helper.read_line()
  solve(s) |> io.println
}

pub fn solve(s) {
  let #(_, result) =
    s
    |> string.to_graphemes()
    |> list.group(fn(c) { c })
    |> dict.fold(#(0, ""), fn(acc, c, l) {
      let #(max, result) = acc
      let len = list.length(l)

      case int.compare(len, max) {
        Gt -> #(len, c)
        Eq -> {
          case string.compare(c, result) {
            Lt -> #(len, c)
            _ -> #(max, result)
          }
        }
        Lt -> #(max, result)
      }
    })
  result
}
