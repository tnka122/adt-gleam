import adt_20250903_1/c

pub fn c_test() {
  assert c.solve([1, 3, 5, 2], [2, 3, 1, 4]) == [1, 2]
  assert c.solve([1, 2, 3], [4, 5, 6]) == [0, 0]
  assert c.solve([4, 8, 1, 7, 9, 5, 6], [3, 5, 1, 7, 8, 2, 6]) == [3, 2]
}
