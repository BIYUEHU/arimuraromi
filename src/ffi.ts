export type GleamElement = Element | Text

export type GleamEvent = Event & { target: GleamElement | null }

type OptionSome<T> = (value: T) => unknown
type OptionNone = unknown

export function get_element_by_id(id: string, some: OptionSome<GleamElement>, none: OptionNone): unknown {
  const el = document.getElementById(id)
  return el ? some(el) : none
}

export function query_selector(selector: string, some: OptionSome<GleamElement>, none: OptionNone): unknown {
  const el = document.querySelector(selector)
  return el ? some(el) : none
}

export function create_element(tag: string): GleamElement {
  return document.createElement(tag)
}

export function create_text_node(text: string): GleamElement {
  return document.createTextNode(text)
}

export function set_text_content(el: GleamElement, text: string): void {
  el.textContent = text
}

export function set_attribute(el: GleamElement, name: string, value: string): void {
  if (el instanceof Text) throw new Error('Cannot set attribute on a Text node')
  el.setAttribute(name, value)
}

export function get_attribute(el: GleamElement, name: string, some: OptionSome<string>, none: OptionNone): unknown {
  if (el instanceof Text) throw new Error('Cannot get attribute from a Text node')
  const val = el.getAttribute(name)
  return val !== null ? some(val) : none
}

export function append_child(parent: GleamElement, child: GleamElement): void {
  parent.appendChild(child)
}

export function remove(el: GleamElement): void {
  el.remove()
}

export function add_event_listener(el: GleamElement, event_type: string, handler: (event: GleamEvent) => void): void {
  el.addEventListener(event_type, (event) => handler(event as GleamEvent))
}

export function event_target(ev: GleamEvent): GleamElement | null {
  return ev.target
}
