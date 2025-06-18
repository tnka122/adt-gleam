import gleam/dict.{type Dict}
import gleam/io
import gleam/list
import gleam/option.{type Option, None, Some}
import gleam/string
import helper

pub fn main() {
  let assert [n, q] = helper.read_list_int()
  let events = list.map(list.range(0, q), fn(_) { helper.read_list_int() })

  solve(events, n)
  |> string.join(with: "\n")
  |> io.println
}

pub fn solve(events, n) {
  let players =
    list.range(1, n + 1)
    |> list.map(fn(i) { #(i, 0) })
    |> dict.from_list()

  f(events, players, [])
}

fn f(events, players: Dict(Int, Int), ans) {
  case events {
    [] -> list.reverse(ans)
    [event, ..rest] -> {
      let assert [t, x] = event

      let #(updated_players, updated_ans) = case t {
        1 -> {
          #(dict.upsert(players, x, fn(i) { increment_n(i, 1) }), ans)
        }
        2 -> {
          #(dict.upsert(players, x, fn(i) { increment_n(i, 2) }), ans)
        }
        3 -> {
          let assert Ok(t) = dict.get(players, x)
          case t < 2 {
            True -> #(players, ["No", ..ans])
            False -> #(players, ["Yes", ..ans])
          }
        }
        _ -> panic
      }

      f(rest, updated_players, updated_ans)
    }
  }
}

fn increment_n(x: Option(Int), delta: Int) {
  case x {
    Some(i) -> i + delta
    None -> 0
  }
}
