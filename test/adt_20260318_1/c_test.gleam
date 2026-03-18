import adt_20260318_1/c

pub fn c_test() {
  assert c.solve([7, 7, 7, 7]) == "Weak"
  assert c.solve([0, 1, 1, 2]) == "Strong"
  assert c.solve([9, 0, 1, 2]) == "Weak"
}
