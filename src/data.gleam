// import gleam/list.{type List}

pub type Link {
  Link(text: String, url: String)
}

pub const link: List(Link) = [
  Link("HimenoSena", "https://himeno-sena.com"),
  Link("Blog", "https://hotaru.icu"),
  Link("GitHub", "https://github.com/biyuehu"),
  Link("Codeberg", "https://codeberg.org/lomi"),
]
