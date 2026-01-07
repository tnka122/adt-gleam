import adt_20260107_1/d

pub fn d_test() {
  assert d.solve("|---|-|----|-|-----|") == [3, 1, 4, 1, 5]
  assert d.solve("|----------|") == [10]
  assert d.solve("|-|-|-|------|") == [1, 1, 1, 6]
}
