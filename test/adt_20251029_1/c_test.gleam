import adt_20251029_1/c

pub fn c_test() {
  assert c.solve([
      [2],
      [1, 4],
      [1, 3],
      [2],
      [2],
      [2],
    ])
    == [0, 3, 4, 0]

  assert c.solve([
      [2],
      [2],
      [2],
      [2],
      [2],
    ])
    == [0, 0, 0, 0, 0]
}
