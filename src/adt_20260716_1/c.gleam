import gleam/io
import gleam/list
import gleam/string
import gleam/yielder
import stdin

pub fn main() {
  read()
  |> solve
  |> print
}

fn read() {
  let assert [_, ..st] =
    stdin.read_lines()
    |> yielder.map(string.trim)
    |> yielder.filter(fn(l) { l != "" })
    |> yielder.to_list

  st |> list.map(fn(l) { string.split(l, " ")})
}

pub fn solve(st_list) {
  let sti_list = list.index_map(st_list, fn(x, i) { #(x, i) })

  list.all(sti_list, fn(sti) {
    let assert #([s, t], i) = sti
    check(i, s, sti_list) || check(i, t, sti_list)
  })
}

fn check(i, name, sti_list) {
  list.all(sti_list, fn(stj) {
    let assert #([s, t], j) = stj
    j == i || name != s && name != t
    }
  )
}

fn print(result) {
  case result {
    True -> "Yes"
    False -> "No"
  }
  |> io.println
}
