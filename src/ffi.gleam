// src/dom.gleam
pub type Element

pub type Event

// 常用 document 操作
@external(javascript, "./ffi.ts", "get_element_by_id")
pub fn get_element_by_id(id: String) -> Result(Element, Nil)

@external(javascript, "./ffi.ts", "query_selector")
pub fn query_selector(selector: String) -> Result(Element, Nil)

// 创建元素
@external(javascript, "./ffi.ts", "create_element")
pub fn create_element(tag: String) -> Element

@external(javascript, "./ffi.ts", "create_text_node")
pub fn create_text_node(text: String) -> Element

// 属性 / 内容操作
@external(javascript, "./ffi.ts", "set_text_content")
pub fn set_text_content(el: Element, text: String) -> Nil

@external(javascript, "./ffi.ts", "set_attribute")
pub fn set_attribute(el: Element, name: String, value: String) -> Nil

@external(javascript, "./ffi.ts", "get_attribute")
pub fn get_attribute(el: Element, name: String) -> Result(String, Nil)

// 节点操作
@external(javascript, "./ffi.ts", "append_child")
pub fn append_child(parent: Element, child: Element) -> Nil

@external(javascript, "./ffi.ts", "remove")
pub fn remove(el: Element) -> Nil

// 事件绑定（最基础版）
@external(javascript, "./ffi.ts", "add_event_listener")
pub fn add_event_listener(
  el: Element,
  event_type: String,
  handler: fn(Event) -> Nil,
) -> Nil

// 获取事件 target / currentTarget（可选）
@external(javascript, "./ffi.ts", "event_target")
pub fn event_target(ev: Event) -> Element
