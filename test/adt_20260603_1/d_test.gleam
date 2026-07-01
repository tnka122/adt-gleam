import adt_20260603_1/d
import gleam/list
import gleam/string

fn make_input(lines) {
  lines |> list.map(string.to_graphemes)
}

pub fn d_1_test() {
  let input =
    make_input([
      "-xx",
      "o-x",
      "oo-",
    ])
  assert d.solve(input) == [3, 2, 1]
}

pub fn d_2_test() {
  let input =
    make_input([
      "-oxoxox",
      "x-xxxox",
      "oo-xoox",
      "xoo-ooo",
      "ooxx-ox",
      "xxxxx-x",
      "oooxoo-",
    ])
  assert d.solve(input) == [4, 7, 3, 1, 5, 2, 6]
}
