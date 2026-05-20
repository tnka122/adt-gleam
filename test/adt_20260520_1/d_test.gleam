import adt_20260520_1/d
import gleam/list
import gleam/string
import iv

fn make_grid(lines) {
  lines
  |> list.map(fn(line) {
    line
    |> string.to_graphemes
    |> iv.from_list
  })
  |> iv.from_list
}

pub fn d_test_1() {
  let grid =
    make_grid([
      ".######",
      "##....#",
      "#.###.#",
      "#.#.#.#",
      "#.#.#.#",
      "#.#####",
      "#...#..",
      "#####..",
    ])
  assert d.solve(#(8, 7, grid)) == True
}

pub fn d_test_2() {
  let grid = make_grid(["##"])
  assert d.solve(#(1, 2, grid)) == False
}

pub fn d_test_3() {
  let grid =
    make_grid([
      "...",
      "...",
      "...",
      "...",
    ])
  assert d.solve(#(4, 3, grid)) == True
}

pub fn d_test_4() {
  let grid =
    make_grid([
      "##.###..##.##..##.",
      "##.#.##.##.##.####",
      "...##.#.......####",
      "###.###....###.##.",
      "#.##.......#.#....",
      "#..#.##.##.#.#....",
      "#.########.####.##",
      "#.##.##.#....##.##",
      "#......##.........",
      "##.##..#..##..####",
      ".#.#####..#####..#",
      ".#..#...##.#.....#",
      ".#..#.####.#.....#",
      ".##.#.#.#..##..###",
      "..###.###...####..",
    ])
  assert d.solve(#(15, 18, grid)) == True
}
