import gleam/erlang
import gleam/int
import gleam/list
import gleam/string

pub fn read_line() -> String {
  let assert Ok(line) = erlang.get_line("")
  string.trim(line)
}

pub fn read_int() -> Int {
  let assert Ok(i) = int.parse(read_line())
  i
}

pub fn read_list() -> List(String) {
  string.split(read_line(), " ")
}

pub fn read_list_int() -> List(Int) {
  let assert Ok(list) = list.try_map(read_list(), int.parse)
  list
}
