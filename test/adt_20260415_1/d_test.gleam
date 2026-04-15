import adt_20260415_1/d

pub fn c_test() {
  assert d.solve(#(3, 4)) == "0.6 0.8"
  assert d.solve(#(1, 0)) == "1.0 0.0"
  assert d.solve(#(246, 402)) == "0.5219648702449755 0.8529669830832527"
}
