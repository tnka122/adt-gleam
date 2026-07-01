import adt_20260701_1/c

pub fn c_test() {
  assert c.solve([5, 10, 2, 3])
    == [
      [5, 15, 17, 20],
      [10, 12, 15],
      [2, 5],
      [3],
    ]

  assert c.solve([100]) == [[100]]
}
