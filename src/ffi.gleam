import gleam/option.{type Option, None, Some}

pub type Element

pub type Event

@external(javascript, "./ffi.ts", "get_element_by_id")
fn priv_get_element_by_id(
  id: String,
  some: fn(Element) -> Option(Element),
  none: Option(Element),
) -> Option(Element)

pub fn get_element_by_id(id: String) -> Option(Element) {
  priv_get_element_by_id(id, Some, None)
}

@external(javascript, "./ffi.ts", "query_selector")
fn priv_query_selector(
  selector: String,
  some: fn(Element) -> Option(Element),
  none: Option(Element),
) -> Option(Element)

pub fn query_selector(selector: String) -> Option(Element) {
  priv_query_selector(selector, Some, None)
}

@external(javascript, "./ffi.ts", "create_element")
pub fn create_element(tag: String) -> Element

@external(javascript, "./ffi.ts", "create_text_node")
pub fn create_text_node(text: String) -> Element

@external(javascript, "./ffi.ts", "set_text_content")
pub fn set_text_content(el: Element, text: String) -> Nil

@external(javascript, "./ffi.ts", "set_attribute")
pub fn set_attribute(el: Element, name: String, value: String) -> Nil

@external(javascript, "./ffi.ts", "get_attribute")
fn priv_get_attribute(
  el: Element,
  name: String,
  some: fn(String) -> Option(String),
  none: Option(String),
) -> Option(String)

pub fn get_attribute(el: Element, name: String) -> Option(String) {
  priv_get_attribute(el, name, Some, None)
}

@external(javascript, "./ffi.ts", "append_child")
pub fn append_child(parent: Element, child: Element) -> Nil

@external(javascript, "./ffi.ts", "remove")
pub fn remove(el: Element) -> Nil

@external(javascript, "./ffi.ts", "add_event_listener")
pub fn add_event_listener(
  el: Element,
  event_type: String,
  handler: fn(Event) -> Nil,
) -> Nil

@external(javascript, "./ffi.ts", "event_target")
pub fn event_target(ev: Event) -> Element
