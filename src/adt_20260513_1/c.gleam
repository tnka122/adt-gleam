import gleam/int
import gleam/io
import gleam/list
import gleam/string
import gleam/yielder
import iv
import stdin

pub fn main() {
  read()
  |> solve
  |> list.map(int.to_string)
  |> string.join("\n")
  |> io.println
}

fn read() {
  let assert [_n, a, _q, ..queries] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.filter(fn(line) { line != "" })
    |> yielder.map(fn(line) {
      let assert Ok(nums) = line |> string.split(" ") |> list.try_map(int.parse)
      nums
    })
    |> yielder.to_list

  #(a, queries)
}

pub fn solve(input) {
  let #(a, queries) = input
  let a = iv.from_list(a)

  let #(_, result) =
    list.fold(queries, #(a, []), fn(acc, query) {
      let #(a_cur, result) = acc
      case query {
        [2, k] -> {
          let assert Ok(ak) = iv.get(a_cur, k - 1)
          #(a_cur, [ak, ..result])
        }
        [1, k, x] -> #(iv.try_set(a_cur, k - 1, x), result)
        _ -> panic
      }
    })

  list.reverse(result)
}
