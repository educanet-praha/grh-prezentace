#import "../../globals.typ": *


= Grafy

== ...

#focus-slide[
  Co to je graf?
]

== Grafy

_Vrcholy_ / _body_ / _hodnoty_ mezi kterými existují _hrany_ / _čáry_ / _vztahy_. 

#pause
#align(center+horizon, render("graph {
    layout = circo
    node [style=filled, shape=circle, fixedsize=true]
    subgraph {     
      a -- b -- c -- e -- d -- b -- e
      c -- f
    }
  }"), 
)

== Trochu praktičtěji

#align(center+horizon,
grid(
  align: left+horizon,
  columns: (auto, auto),
  render("graph {
    layout = dot
    node [style=filled, shape=square, fixedsize=true, width=0.9]
    subgraph {
       Fry
       Alice -- Bob -- Colin -- Ella -- Dale -- Bob -- Ella
       Colin -- Fry
           
     {rank=same; Colin}
     {rank=same; Fry; Ella}
     {rank=same; Dale; Alice}
     {rank=same; Bob}
    }
  }"),
  [
    Můžeme se ptát:
    - Jaká největší skupina se může sejít, tak aby se všichni znali?
    
    - Kdo je pojící prvek všech lidí?
    - Zná každý někoho, kdo zná Ellu?
    - Kdo má nejvíce přátel?
  ]
))


== Řídké a husté grafy

=== Řídké
#speaker-note[
  Řídké grafy jsou takové grafy, které mají relativně nízký počet hran vůči vrcholům.
  Obecně neexistuje konkrétní hranice mezi normálním a řídkým grafem. Extrémním případem jsou grafy bez hran (množina všech hran je prázdná).

    Husté grafy jsou protikladem grafů řídkých. Vyznačují se tím, že existuje hrana mezi _většinou_ vrcholů. Extrémním případem jsou plné grafy, kde existuje cesta mezi _každými_ dvěma vrcholy. Množina hran pak obsahuje $n(n - 1)$ prvků.
]

Grafy, které mají významně malý počet hran vůči počtu vrcholů. 

=== Husté
Grafy, které mají významně velký počet hran vůči počtu vrcholů. 

\

Řídké grafy umožňují levnější znázornění v paměti, můžeme využívat hloupější algoritmy, atd ...
\
Husté grafy většinou mají optimalizovanější algoritmy, skoro konstantní vyhledávací časy, atd ...

== Řídké a husté grafy

#align(center+horizon, grid(
  align:horizon+center,
  columns: (50%, 50%),
  rows: (auto, auto),
  row-gutter: 10%,
  [=== Řídký], [=== Hustý],
  render("graph {
    layout = fdp
 node [style=filled, colorscheme=set19, fixedsize=true, shape=circle]
    
    a -- b
    k -- j
    c d e f g h i l m
  }"),
  render("graph {
    layout = circo
 node [style=filled, colorscheme=set19, fixedsize=true, shape=circle]
    scale = 0.5
    
    a -- b, c, d, e, f, g, h, i, j, k, l, m
    b -- c, d, e, f, g, h, i, j, k, l, m
    c -- d, e, f, g, h, i, j, k, l, m
    d -- e, f, g, h, i, j, k, l, m
    e -- f, g, h, i, j, k, l, m
    f -- g, h, i, j, k, l, m
    g -- h, i, j, k, l, m
    h -- i, j, k, l, m
    i -- j, k, l, m
    j -- k, l, m
    k -- l, m
    l -- m
  }")
))

== Vážené grafy #small[\- weighted graph]

Vážené grafy každé hraně přiřadí váhu (hodnotu). Hodnota většinou znázorňuje cenu cesty nebo hodnotu znázorněné relace.

#align(center+horizon, render("graph {
  layout = neato

  node [style=filled, colorscheme=set19, fixedsize=true, shape=circle]
  edge [colorscheme=set19]
  
  a -- b
  c -- d -- a
  a -- e -- f -- d
  f -- b

  b -- c [color=2]
  c -- b [color=2]
}"))

#speaker-note[
  Vážené grafy jsou jednou z nejpoužívanějších variací grafů, protože umožňují řešit praktické problémy (hledání _nejkratších_ cest, optimalizace výkonu operací, ...)
]

== Orientované (směrové) grafy  #small[\- directed graph]

Směrové grafy navíc každé hraně přiřadí směr. Hranu pak lze využít pouze pro _přesun_ po směru hrany.

- Orientované grafy značíme šipkou na konci čar.

- Můžeme kombinovat s váženým i _obousměrným_
  - Některé kombinace jsou velmi nepraktické
  - Některé naopak využívané skoro všude
#align(center+horizon, render("digraph {
  layout = fdp

  node [style=filled, colorscheme=set19, fixedsize=true, shape=circle]
  edge [colorscheme=set19]
  
  a -> b, c
  c -> d -> a

  b -> c [color=2]
  c -> b [color=2]
}"))

#speaker-note[
  Všechny typy grafů můžeme libovolně kombinovat, ale výrazně se nám tím limitují algoritmy, které na takovém grafu budou schopné operovat.
]

== Paralelní hrany  #small[\- parallel edge]

Hrana je paralelní, pokud existuje alespoň další jedna hrana ze stejného vrcholu do stejného cílového vrcholu.

#pause
#align(center+horizon, render("digraph {
  layout = neato

  node [style=filled, colorscheme=set19, fixedsize=true, shape=circle]
  edge [colorscheme=set19]
  
  a -> b
  c -> d -> a
  a -> e -> f -> d
  f -> b

  b -> c [color=2, xlabel=\"paralelní hrana\"]
  b -> c [color=2]
}"))

#speaker-note[
  Nyní můžeme smysluplně zadefinovat paralelní hrany, tedy hrany, které jsou ze stejného počátečního vrcholu do stejného koncového vrcholu.

  Každá taková hrana může mít vlastní váhu.
]

== Stupně vrcholů  #small[\- vertex degree]
Stupeň vrcholu přímo odpovídá počtu hran k/od vrcholu.

#note[Stupeň vrcholu vypovídá o _důležitosti_ vrcholu v grafu.]

=== Výstupní stupeň
Hodnotu omezuje pouze na hrany, které směřují *_z_* tohoto vrcholu.

=== Vstupní stupeň
Hodnotu omezuje pouze na hrany, které směřují *_do_* tohoto vrcholu.

== Podgrafy  #small[\- subgraph]

Podgraf grafu je graf, který neobsahuje žádné vrcholy a hrany, které nejsou v původním grafu. 

#pause
#align(center+horizon, grid(
  align:horizon+center,
  columns: (50%, 50%),
  render("graph {
    layout = neato
   node [style=filled, colorscheme=set19, fixedsize=true, shape=circle]
    
    a -- b -- c -- d
    b -- d
    b -- e -- f -- a
    a -- e
  }"),
  render("graph {
    layout = neato
   node [style=filled, colorscheme=set19, fixedsize=true, shape=circle]

    a, b, c
    d [style = invis, label=\"\"]
   
    a -- b
    b -- c [ style = invis ]
    c -- d [ style = invis ]
    b -- d [ style = invis ]
    b -- e
    e -- f
    f -- a
    a -- e [ style = invis ]
  }")
))

== Kreslení grafů

#speaker-note[
  - https://github.com/dagrejs/dagre
  
  - https://eclipse.dev/elk/reference/algorithms.html

  - https://github.com/terrastruct/d2

  - https://gitlab.com/graphviz/graphviz/-/tree/main/lib/dotgen
]

Graf je abstraktní struktura. Pro každý graf existuje nekonečně mnoho _nakreslení_ - způsobů jak graf graficky znázornit. Většinou je cílem graf nakreslit tak, aby měl co _*nejméně*_ (ideálně nula) *překřížení* hran.

#small[
  Topologicky rozvrhnout kreslení grafů je _relativně_ obtížná úloha a nebudeme se jí zde zabývat. Grafy budeme případně kreslit ručně, kde to lze vyřešit intuitivně. 
]

== Mřížky jako grafy - #small[Grid]
Problém, který se snažíme vyřešit:

- Známe (_nebo alespoň znát budeme_) celou řadu algoritmů, které umí pracovat na grafech, ale my bychom potřebovali, aby je bylo možné spustit na mřížce

- Přirozeně se s mřížkou setkáme častěji než s grafem

Řešení, která se nabízí:

- Umíme upravit algoritmy na to, aby fungovaly i na mřížce

- Umíme nakreslit mřížku jako graf