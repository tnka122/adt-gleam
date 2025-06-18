import adt_20250611_1/d

pub fn d_test() {
  assert d.solve([31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]) == #(7, 2)
  assert d.solve([1]) == #(1, 1)
}
