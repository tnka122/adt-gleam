import adt_20260603_1/c
import gleam/list
import gleam/set

fn make_input(a_lines, b_line) {
  let a = a_lines |> list.map(set.from_list)
  let b = set.from_list(b_line)
  #(a, b)
}

pub fn c_1_test() {
  let input =
    make_input([[12, 3, 5, 7], [6, 10, 11, 9], [1, 2, 4, 8]], [2, 4, 9, 6, 11])
  assert c.solve(input) == 3
}

pub fn c_2_test() {
  let input =
    make_input(
      [[81, 63, 31, 16, 15], [30, 3, 6, 54, 24], [26, 41, 48, 64, 66]],
      [44, 79],
    )
  assert c.solve(input) == 0
}

pub fn c_3_test() {
  let input =
    make_input(
      [[78, 19, 70, 58, 83], [12, 30, 80, 20, 27], [48, 71, 8, 43, 82]],
      [82, 30, 43, 8, 80, 70, 20, 78, 12, 71, 19, 48],
    )
  assert c.solve(input) == 5
}
