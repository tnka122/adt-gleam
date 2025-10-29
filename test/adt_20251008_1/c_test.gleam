import adt_20251008_1/c

pub fn c_test() {
  assert c.solve(#(5, 2, ".@@.@")) == ".@..."
  assert c.solve(#(3, 3, "@@@")) == "..."
  assert c.solve(#(10, 4, "@@@.@@.@@.")) == "@@@......."
}
