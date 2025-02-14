// Info boxes
#import "@preview/gentle-clues:0.8.0": *

#let cargo_error(content) = {
  clue(
    icon: none,
    title: none,
    accent-color: rgb(255, 0, 0),
    radius: 0pt,
    content
  )
}