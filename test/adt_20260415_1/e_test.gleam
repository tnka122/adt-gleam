import adt_20260415_1/e

pub fn c_test() {
  assert e.solve(#("aab", 2)) == "aba"
  assert e.solve(#("baba", 4)) == "baab"
  assert e.solve(#("ydxwacbz", 40_320)) == "zyxwdcba"
}
