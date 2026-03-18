import adt_20260318_1/d

pub fn d_test() {
  assert d.solve(#(10, -10, 1)) == 10
  assert d.solve(#(20, 10, -10)) == 40
  assert d.solve(#(100, 1, 1000)) == -1
}
