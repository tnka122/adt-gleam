import adt_20260716_1/c

pub fn c_test() {
  assert c.solve([
      ["tanaka", "taro"],
      ["tanaka", "jiro"],
      ["suzuki", "hanako"],
    ])
    == True

  assert c.solve([
      ["aaa", "bbb"],
      ["xxx", "aaa"],
      ["bbb", "yyy"],
    ])
    == False

  assert c.solve([
      ["tanaka", "taro"],
      ["tanaka", "taro"],
    ])
    == False
}
