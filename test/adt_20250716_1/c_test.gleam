import adt_20250716_1/c

pub fn c_test() {
  assert c.solve([3, 2, 5], [4, 1]) == "Yes"
  assert c.solve([3, 1, 5], [4, 2]) == "No"
  assert c.solve([1], [2]) == "No"
}
