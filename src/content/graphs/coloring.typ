#import "../../globals.typ": *
#import "../../blocks/task.typ": task-slide

= Barevnost

== Obarvení grafu #small[\- Graph coloring]
Obarvení grafu se říká přiřazení barev každému vrcholu tak, aby žádné dva vrcholy spojené hranou neměly stejnou barvu.

#pause
#align(center+horizon, [
#grid(
  column-gutter: 10%,
  columns: (auto, auto, auto),
  render("graph {
    node [colorscheme=set19,fixedsize=true, style=filled, shape=circle]
    subgraph {
      a [color=1]
      b [color=2]
      c [color=2]
      d [color=1]
      e [color=3]
      
      a -- b, c, e
      b -- e
      c -- d
    }
  }"), 
  render("graph {
    node [colorscheme=set19,fixedsize=true, style=filled, shape=circle]
  
    subgraph {
      a [color=1]
      b [color=2]
      c [color=3]
      d [color=4]
      e [color=1]

      a -- b -- d
      a -- c -- e
      b -- e
      c -- d
      d -- e
      a -- d

    }
  }"), 
  render("graph {
    node [colorscheme=set19,fixedsize=true, style=filled, shape=circle]
  
    subgraph {
      a [color=1]
      b [color=2]
      c [color=2]
      d [color=3]
      e [color=1]
      f [color=1]
      g [color=1]

      a -- b -- d
      a -- c -- e
      b -- e
      b -- f
      d -- e
      a -- d

    }
  }")
)])




== Stromy
*_Každý_ strom má barevnost dva*, ale ... 

#speaker-note[
  Tak to není tak úplně pravda, výjimkou jsou stromy o jednom vrcholu, které mají barevnost jedna, a stromy o nula vrcholech, pro které barevnost není úplně definovaná, ale intuitivně bychom řekli nulová.
]

#pause
#align(center+horizon, [
#grid(
  columns: (50%, 50%),
  render("graph {
    node [colorscheme=set19,fixedsize=true, style=filled, shape=circle]
    subgraph {
      a [color=1]
      b [color=2]
      c [color=2]
      d [color=1]
      e [color=1]
      f [color=1]
      g [color=1]
      
      a -- b, c
      b -- d, e
      c -- f, g
    }
  }"), 
  render("graph {
    node [colorscheme=set19,fixedsize=true, style=filled, shape=circle]
  
    subgraph {
      a [color=1]
      b [color=2]
      c [color=2]
      d [color=1]
      e [color=1]
      f [color=2]

      a -- b, c
      b -- d
      e -- f
      b -- e

    }
  }")
)])


#speaker-note[
  
]


== Cyklické grafy
Grafy s kružnicí mají barevnost $>= 3$, pokud je kružnice liché délky, $>= 2$ pokud je sudé délky.

#pause
#align(horizon+center, [
#grid(
  column-gutter: 10%,
  columns: (auto, auto, auto),
  [#render("graph {
    layout = circo
    node [colorscheme=set19,fixedsize=true, style=filled, shape=circle]
    subgraph {
      a [color=1]
      b [color=2]
      c [color=1]
      d [color=2]
      
      a -- b -- c
      a -- d -- c

     {rank=same; a; b}
     {rank=same; c; d}
    }
  }")], 
  render("graph {
    layout = circo
    node [colorscheme=set19,fixedsize=true, style=filled, shape=circle]
  
    subgraph {
      a [color=1]
      b [color=2]
      c [color=2]
      d [color=1]
      e [color=3]

      a -- b -- d -- e -- c-- a
      
     {rank=same; a}
     {rank=same; b; c}
     {rank=same; d; e}
    }
  }"), 
  render("graph {
    layout = circo
    node [colorscheme=set19,fixedsize=true, style=filled, shape=circle]
  
    subgraph {
      a [color=1]
      b [color=2]
      c [color=2]
      d [color=3]
      e [color=1]
      f [color=3]

      a -- b -- d -- e
      f -- c -- a
      f -- e
      d -- c -- e
      a -- f
      
     {rank=same; a; b}
     {rank=same; c; d}
     {rank=same; e; f}
    }
  }")
)])

#focus-slide[
  Jakou barevnost má tento graf?
]

== Jakou barevnost má tento graf?
#align(center+horizon ,render("graph {
    layout = circo
    node [fixedsize=true, shape=circle]
  
    subgraph {

      a -- b -- c -- d -- e -- f -- a -- c -- e -- a
      d -- f -- g
      g -- a -- d
      f -- b
      b -- g
      
     {rank=same; a; b}
     {rank=same; c; d}
     {rank=same; e; f}
    }
  }"))

  

== Jakou barevnost má tento graf?

  === Omezující je:
  #align(center+horizon ,render("graph {
    layout = circo
    node [fixedsize=true, style=filled, colorscheme=set19, shape=circle]
  
    subgraph {
      a [color=1]
      b 
      c [color=3]
      d [color=2]
      e [color=4]
      f
      g
      

      a -- b [style=invis]
      b -- c [style=invis]
      c -- d -- e
      e -- f [style=invis]
      f -- a [style=invis]
      a -- c -- e -- a
      d -- f [style=invis]
      f -- g [style=invis]
      g -- a [style=invis]
      a -- d 
      f -- b [style=invis]
      b -- g [style=invis]
      
     {rank=same; a; b}
     {rank=same; c; d}
     {rank=same; e; f}
    }
  }"))  

== Jakou barevnost má tento graf?

  === Barevnost 4
#align(center+horizon ,render("graph {
    layout = circo
    node [fixedsize=true, style=filled, colorscheme=set19, shape=circle]
  
    subgraph {
      a [color=1]
      b [color=2]
      c [color=3]
      d [color=2]
      e [color=4]
      f [color=3]
      g [color=4]
      

      a -- b -- c -- d -- e -- f -- a -- c -- e -- a
      d -- f -- g
      g -- a -- d
      f -- b
      b -- g
      
     {rank=same; a; b}
     {rank=same; c; d}
     {rank=same; e; f}
    }
  }"))

  
== K čemu barevnost je?
- Návrh síťové infrastruktury

- Řešení her ( Sudoku )

- Návrh rozvrhu

- Barvení map ve hrách

- Data mining

- Plánování procesů a přístup ke zdrojům

- Přejmenování registrů

- ...

== Welsh-Powell
- Uvažujeme vrcholy seřazené podle stupně

- Každému vrcholu přiřadíme _nejmenší_ barvu, kterou nemá žádný jeho soused

Jedná se o *greedy* algoritmus, které obecně *nenajdou* *optimální* obarvení. Správnost
obarvení záleží na zvoleném pořadí vrcholů. Welsh-Powell (řazení podle stupně) zaručuje
obarvení *nanejvýše* o jednou barvou více, než je optimální. 

== Welsh-Powell - Implementace

```python
def welshPowell(graph)
  coloring = graph.nodes.map_to(Color.None)
  vertices = graph.nodes.sort_by(Node.Degree)
  for vertex in vertices
    neighbours = vertex.neighbours()
    color = Color.first_not_present_in(neighbours)
    coloring[vertex] = color

  return coloring
```