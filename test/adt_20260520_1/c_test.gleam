import adt_20260520_1/c

pub fn c_test() {
  assert c.solve(#(7, 3)) == 400
  assert c.solve(#(1_000_000, 2)) == -1
  assert c.solve(#(999_999_999, 1)) == 1_000_000_000
  assert c.solve(#(998_244_353, 99)) == -1
}
