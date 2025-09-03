import gleam/int
import gleam/io
import gleam/list
import helper

pub fn main() {
  let q = helper.read_int()
  let order_list =
    list.range(1, q)
    |> list.map(fn(_) { helper.read_list_int() })

  solve(order_list)
  |> list.each(fn(x) {
    x
    |> int.to_string
    |> io.println
  })
}

pub fn solve(order_list) {
  let #(queue, count) = loop(order_list, [], 0)

  queue
  |> list.reverse
  |> list.take(count)
}

fn loop(l, queue, count) {
  case l {
    [] -> #(queue, count)
    [head, ..tail] ->
      case head {
        [1, x] -> loop(tail, [x, ..queue], count)
        [2] -> loop(tail, queue, count + 1)
        _ -> panic
      }
  }
}
