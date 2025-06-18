import adt_20250618_1/d

pub fn d1_test() {
  let events = [
    [3, 1],
    [3, 2],
    [1, 2],
    [2, 1],
    [3, 1],
    [3, 2],
    [1, 2],
    [3, 2],
    [3, 3],
  ]

  let expected = ["No", "No", "Yes", "No", "Yes", "No"]

  assert d.solve(events, 3) == expected
}
