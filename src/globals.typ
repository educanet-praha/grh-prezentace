#import "@preview/touying:0.4.1": *
#import "@preview/codly:0.2.1": *
#import "@preview/gentle-clues:0.8.0": *
#import "@preview/cetz:0.2.2": canvas, draw, tree
#import "@preview/fletcher:0.4.4" as fletcher: node, edge
#import "@preview/diagraph:0.2.4": *
#import "@preview/pinit:0.1.3": *
#import "@preview/plotst:0.2.0"

#import "./utils/text.typ": *

#let cetz-canvas = touying-reducer.with(reduce: canvas, cover: draw.hide.with(bounds: true))
#let fletcher-diagram = touying-reducer.with(reduce: fletcher.diagram, cover: fletcher.hide)


#let s = themes.metropolis.register(aspect-ratio: "16-9")
#let s = (s.methods.info)(
  self: s,
  title: [Grafy a hry],
  subtitle: [Teorie grafů a grafové hry],
  author: [Sedláček Pavel],
  date: "2024-11-04",
  institution: [EDUcanet],
)


#let s = (s.methods.enable-handout-mode)(self: s)

#let icon = (ico) => {
  box(
    baseline: 2pt,
    image("../media/" + ico + ".svg", width: 20pt)
  );
}

#let s = (s.methods.append-preamble)(self: s)[
  #codly(languages: (
    java:       (name: "Java",        icon: icon("java"), color: rgb("#CE412B")),
    python:     (name: "Pseudokód",   icon: icon("pseudo"), color: rgb("#fafaaa")),
    rust:       (name: "Rust",        icon: icon("rust"), color: rgb("#CE412B")),
    javascript: (name: "JavaScript",    ),
    go:         (name: "Go",            ),
    csharp:     (name: "C#",            ),
    
  ))
]

#let s = (s.methods.show-notes-on-second-screen)(self: s, right)

#let s = (s.methods.colors)(
  self: s,
  primary: rgb("#04364A"),
  secondary: rgb("#176B87"),
  tertiary: rgb("#448C95"),
)

#let (init, slides, touying-outline, alert, speaker-note, uncover) = utils.methods(s)
#let (slide, empty-slide, title-slide, focus-slide) = utils.slides(s)

#let c_plot(data, xlabel, ylabel, title) = {
  
  let y_axis = plotst.axis(min: 0, max: 10, step: 1, location: "left", helper_lines: true, invert_markings: false, title: ylabel)
  let x_axis = plotst.axis(min: 0, max: 10, step: 1, location: "bottom", helper_lines: true, invert_markings: false, title: xlabel)
  
  let pl = plotst.plot(data: data, axes: (x_axis, y_axis))
  plotst.graph_plot(pl, (75%, 60%), rounding: 40%, caption: title)
}


#let setup() = {
  
}


#let toc() = {
  touying-outline(enum-args: (:), padding: 0pt)
}

#let note(content) = clue(
  accent-color: blue,
  title: "Poznámka",
  content
)