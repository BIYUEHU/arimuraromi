// src/dom_ffi.js

export function get_element_by_id(id) {
  const el = document.getElementById(id)
  return el ? { ok: true, value: el } : { ok: false }
}

export function query_selector(selector) {
  const el = document.querySelector(selector)
  return el ? { ok: true, value: el } : { ok: false }
}

export function create_element(tag) {
  return document.createElement(tag)
}

export function create_text_node(text) {
  return document.createTextNode(text)
}

export function set_text_content(el, text) {
  el.textContent = text
}

export function set_attribute(el, name, value) {
  el.setAttribute(name, value)
}

export function get_attribute(el, name) {
  const val = el.getAttribute(name)
  return val !== null ? { ok: true, value: val } : { ok: false }
}

export function append_child(parent, child) {
  parent.appendChild(child)
}

export function remove(el) {
  el.remove()
}

// 事件监听（Gleam 传过来的 handler 已经是 Gleam 函数，可直接调用）
export function add_event_listener(el, event_type, handler) {
  el.addEventListener(event_type, (event) => {
    // 调用 Gleam 侧的 handler 函数
    handler(event)
  })
}

export function event_target(ev) {
  return ev.target
}
