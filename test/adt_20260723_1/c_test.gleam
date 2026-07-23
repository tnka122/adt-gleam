import adt_20260723_1/c

pub fn c_test() {
  assert c.solve([10, -10, 1]) == 10
  assert c.solve([20, 10, -10]) == 40
  assert c.solve([100, 1, 1000]) == -1
}
