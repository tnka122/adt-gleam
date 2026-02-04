import adt_20260204_1/c

pub fn c_test() {
  assert c.solve(#("atco", "atcoder")) == "Yes"
  assert c.solve(#("code", "atcoder")) == "No"
  assert c.solve(#("abc", "abc")) == "Yes"
  assert c.solve(#("aaaa", "aa")) == "No"
}
