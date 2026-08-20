import adt_20260820_1/c

pub fn c_test() {
  assert c.solve(6) == 2
  assert c.solve(1) == 0
  assert c.solve(1_000_000_000_000_000_000) == 59
}
