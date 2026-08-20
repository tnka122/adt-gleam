import adt_20260813_1/c

pub fn c_test() {
  assert c.solve(#(3, ["takahashi", "aoki", "snuke"], [2, 6, 5])) == "snuke"
  assert c.solve(
      #(3, ["takahashi", "takahashixx", "takahashix"], [2813, 1086, 4229]),
    )
    == "takahashix"
}
