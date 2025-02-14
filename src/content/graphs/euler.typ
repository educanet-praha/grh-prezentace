#import "../../globals.typ": *

= Eulerovské grafy

== Graf jedním tahem
#align(center+horizon, grid(
  align: horizon+center,
  columns: (auto, auto),
  column-gutter: 20%,

  render("graph {
      layout = dot
      node [fixedsize=true, style=filled, colorscheme=set19, shape=circle]
  
      subgraph {
        rank = same
        a, b [label = \"\"]
      }
  
      subgraph {
        rank = same
        c, d [label = \"\"]
      }
  
      e [label = \"\"]
  
      e -- c
      e -- d
  
      c -- d -- a -- b
      d -- b
      c -- a
      c -- b
  }"),
  render("graph {
      layout = neato
      node [fixedsize=true, style=filled, colorscheme=set19, shape=circle]
      
      subgraph {
        rank = same
        a, b [label = \"\"]
      }
  
      subgraph {
        rank = same
        c, d  [label = \"\"]
      }

      subgraph  {
        rank = same
        f, g  [label = \"\"]
      }

      subgraph {
        rank = same
        h, e [label = \"\"]
      }

      e -- a
      e -- b
      a -- b
      b -- f
      a -- g
      a -- c
      b -- d
      c -- d

      c -- g
      d -- f

      a -- d
      c -- b


      c -- h -- d
  }"),  
))

== Problém sedmi mostů města Královce
#speaker-note[
  https://cs.wikipedia.org/wiki/Sedm_most%C5%AF_m%C4%9Bsta_Kr%C3%A1lovce

  https://en.wikipedia.org/wiki/Seven_Bridges_of_K%C3%B6nigsberg

  https://www.matweb.cz/sedm-mostu/

  https://wikisofia.cz/wiki/Teorie_s%C3%ADt%C3%AD_a_nov%C3%A1_m%C3%A9dia

  https://www.britannica.com/science/Konigsberg-bridge-problem
]
#align(center+horizon, text(size: 148pt, [_*Storytime*_]))

== Graf jedním tahem
- Aby graf byl nakreslitelný jedním tahem, tak musí:

  - Být souvislý
  
  - Mít 0 nebo 2 vrcholů s lichým stupněm
    - Pokud máme lichý stupeň, pak musíme začít tah v něm
    