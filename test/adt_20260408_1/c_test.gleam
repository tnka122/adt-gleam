import adt_20260408_1/c

pub fn c_test() {
  assert c.solve([
      [True, True, True, True, True],
      [True, True, True, False, False],
      [False, False, True, True, True],
      [True, False, True, False, True],
      [False, False, False, False, False],
    ])
    == 5

  assert c.solve([
      [True, False],
      [False, True],
      [False, False],
    ])
    == 1

  assert c.solve([
      [False, False, False, False],
      [True, False, True, False],
    ])
    == 0
}
