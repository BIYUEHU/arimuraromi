import data.{link}
import ffi
import gleam/io
import gleam/list
import gleam/option.{None, Some}

fn create_link(text: String, url: String) -> ffi.Element {
  let a = ffi.create_element("a")
  ffi.set_attribute(a, "target", "_blank")
  ffi.set_attribute(a, "href", url)
  ffi.set_text_content(a, text)
  a
}

pub fn main() -> Nil {
  io.println("Hello! LOVE from Arimura Romi!")
  case ffi.get_element_by_id("sites") {
    None -> io.println_error("Could not find element with id'sites'")
    Some(el) -> {
      {
        use link <- list.map(link)
        let li = ffi.create_element("li")
        ffi.append_child(li, create_link(link.text, link.url))
        ffi.append_child(el, li)
      }
      Nil
    }
  }
}
