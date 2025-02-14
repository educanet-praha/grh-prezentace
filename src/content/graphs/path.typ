#import "../../globals.typ": *

= Cesty v grafech

== Sled, Tah a Cesta

=== Sled #small[\- Walk]
Sled je  posloupnost vrcholů a hran.

=== Tah #small[\- Trail]

Tah je posloupnost vrcholů a hran, ve které je každá hrana maximálně jednou.

=== Cesta #small[\- Path]
Cesta je posloupnost vrcholů a hran, ve které je každý vrchol maximálně jednou


== Uzavřený sled, tah a cesta #small[\- Closed trail]
Sled, tah nebo cesta jsou uzavřené, pokud začínají a končí ve stejném vrcholu.

#linebreak()

=== Kružnice / cyklus   #small[\- Cycle]
Kružnice je uzavřený tah, kde pouze první a poslední vrcholy jsou stejné. (Nejsou žádná jiná _překřížení_).

=== Orientovaná kružnice
Kružnice ve směrovém grafu v alespoň jednom _směru_.

== Komponenty #small[\- component]
Komponenty (souvislosti) grafu jsou největší podgrafy, pro něž platí, že každé dva vrcholy jsou spojené cestou.

_i.e._: nespojené části grafu

- Stromy mají pouze jednu (hlavní) komponentu souvislosti. 

- Jiné grafy mohou mít až tolik, kolik je v nich vrcholů.

=== Silné komponenty #small[\- Strongly connected component]

Silné komponenty jsou obdobou pro orientované grafy. Komponenta je omezená na vrcholy, mezi kterými vede orientovaná cesta.

== Komponenty tohoto grafu?

#align(center+horizon, render("graph {
 node [style=filled, colorscheme=set19, fixedsize=true, shape=circle]
 layout = neato
 overlap=voronoi

   a, b, c, d,  e, f, g
   h, i, j, k, l, m
   n, o, p, q, r, s, t
   u, v, w, x, y, z

   a -- b 
   b -- c
   c -- d
   d -- e
   d -- a
   a -- f
   f -- g
   g -- e
   c -- f

   h -- i
   i -- j
   j -- k
   k -- l
   l -- i
   l -- m
   m -- h

   n -- o
   o -- q
   q -- p
   p -- r
   r -- t
   t -- q
   q -- n
   n -- s
   s -- r

   u -- v
   v -- w
   x -- z
   z -- y
   z -- v
   y -- x
   w -- u

   edge [style=invis]
   c -- j
   j -- q
   q -- w
   w -- l
   u -- e
   y -- o
   q -- g
   d -- x
   r -- a
   r -- l
   r -- x
   x -- l
   i -- y
   o -- x
   o -- g
   t -- j
   b -- z
   a -- i
}"))

#align(center+horizon, render("graph {
 node [style=filled, colorscheme=set19, fixedsize=true, shape=circle]
 layout = neato
 overlap=voronoi

   node[color=1]
   a, b, c, d,  e, f, g
   node[color=2]
   h, i, j, k, l, m
   node[color=3]
   n, o, p, q, r, s, t
   node[color=5]
   u, v, w, x, y, z

   a -- b 
   b -- c
   c -- d
   d -- e
   d -- a
   a -- f
   f -- g
   g -- e
   c -- f

   h -- i
   i -- j
   j -- k
   k -- l
   l -- i
   l -- m
   m -- h

   n -- o
   o -- q
   q -- p
   p -- r
   r -- t
   t -- q
   q -- n
   n -- s
   s -- r

   u -- v
   v -- w
   x -- z
   z -- y
   z -- v
   y -- x
   w -- u

   edge [style=invis]
   c -- j
   j -- q
   q -- w
   w -- l
   u -- e
   y -- o
   q -- g
   d -- x
   r -- a
   r -- l
   r -- x
   x -- l
   i -- y
   o -- x
   o -- g
   t -- j
   b -- z
   a -- i


}"))

== Protože je identický s:
#align(center+horizon, render("graph {
 node [style=filled, colorscheme=set19, fixedsize=true, shape=circle]
 layout =sfdp
 overlap=prism

   node[color=1]
   a, b, c, d,  e, f, g
   node[color=2]
   h, i, j, k, l, m
   node[color=3]
   n, o, p, q, r, s, t
   node[color=5]
   u, v, w, x, y, z


   
   
   a -- b 
   b -- c
   c -- d
   d -- e
   d -- a
   a -- f
   f -- g
   g -- e
   c -- f

   h -- i
   i -- j
   j -- k
   k -- l
   l -- i
   l -- m
   m -- h

   n -- o
   o -- q
   q -- p
   p -- r
   r -- t
   t -- q
   q -- n
   n -- s
   s -- r

   u -- v
   v -- w
   x -- z
   z -- y
   z -- v
   y -- x
   w -- u


}"))

== Tahová Vzdálenost
\= Počet hran v tahu

#align(center+horizon, render("graph {
   node [style=filled, colorscheme=set19, fixedsize=true, shape=circle]
   edge [colorscheme=set19, penwidth=2]
   layout = circo

   node[color = 9]
   a, b, c, d,  e, f, g

   f -- e -- c -- b -- a [ color = 1, penwidth = 8 ]

   b -- g -- c
   b -- e
   c -- f
}"))

Vzdálenost *_a_* od *_f_* je 4.

== Vážená vzdálenost
\= Součet vah hran v tahu

#align(center+horizon, render("graph {
   node [style=filled, colorscheme=set19, fixedsize=true, shape=circle]
   edge [colorscheme=set19]
   layout = circo

   node[color = 9]
   a, b, c, d,  e, f, g

   edge [color = 1, penwidth = 8]
   f -- e [label = \"1\"]
   e -- c [label = \"2\"]
   c -- b [label = \"4\"]
   b -- a [label = \"5\"]

   edge [color = 0, penwidth = 2]

   b -- g [xlabel = \"2\"]
   g -- c [xlabel = \"3\"]
   b -- e [xlabel = \"4\"]
   c -- f [xlabel = \"6\"]
}"))

Vzdálenost *_a_* od *_f_* je $5+4+2+1 = 12$.

== DFS
Graf prohledáváme _přednostně_ do hloubky.

1. *_L_*_IFO_ fronta a vložíme počáteční vrchol
2. Vybereme vrchol z fronty
3. Vložíme do fronty všechny jeho potomky#footnote([Organizovaně, ideálně topologicky, ie. nejdřív levé potomky a pak pravé])
4. opakujeme 2. a 3. krok, dokud:
  1. není fronta prázdná
  2. nenajdeme cílový bod
  
Pokud chceme znát cestu, pak při přidávání vrcholu do fronty k němu přiložíme jeho předky.

== BFS
Graf prohledáváme _přednostně_ do šířky.

1. _*F*__IFO_ fronta a vložíme počáteční vrchol
2. Vybereme vrchol z fronty
3. Vložíme do fronty všechny jeho potomky#footnote([Organizovaně, ideálně topologicky, ie. nejdřív levé potomky a pak pravé])
4. opakujeme 2. a 3. krok, dokud:
  1. není fronta prázdná
  2. nenajdeme cílový bod
  
Pokud chceme znát cestu, pak při přidávání vrcholu do fronty k němu přiložíme jeho předky.


== Dijkstra
Graf prohledáváme chamtivě (_greedy algorithm_).

Dijkstrův algoritmus se snaží přednostně prohledávat zatím nejlevnější cesty.

1. _Prioritní_ fronta a vložíme počáteční vrchol
2. Vybereme vrchol z fronty
3. Vložíme do fronty jeho potomky. Jako klíč použijeme cenu cesty do daného bodu.
4. opakujeme 2. a 3. krok, dokud:
  1. není fronta prázdná
  2. nenajdeme cílový bod

== Několik poznámek k Dijkstrově algoritmu

- Algoritmus nám ohodnotí vzdálenost každého vrcholu od počátku prohledávání

- Dijkstra selže na většině grafech se zápornou váhou 

== A\*

A\* je rozšířením Dijkstrova algoritmu, který přidává heuristické ohodnocení každému vrcholu. Tím můžeme vybrat lepší příští vrchol na prozkoumání.

1. Prioritní fronta a vložíme počáteční vrchol
2. Vybereme vrchol fronty
3. Vložíme do fronty jeho potomky. Jako klíč použijeme cenu cesty do daného vrcholu  + vypočítaná heuristika pro vrchol.
4. opakujeme 2. a 3. krok, dokud:
  1. není fronta prázdná
  2. nenajdeme cílový bod
  

== Několik poznámek k A\* algoritmu

- Pokud by naše ohodnocovací funkce byla _perfektní_, pak by A\* nenavštívil žádný vrchol, který není na nejkratší cestě
  - Perfektní funkce, by byla taková, která každému vrcholu přiřadí skutečnou vzdálenost od cíle.

- Pokud ohodnocovací funkce bude konstantní, pak se A\* bude chovat stejně jako Dijkstra

- Čím komplexnější heuristická funkce, tím lepších výsledků algoritmus dosáhne.

== Jak vybrat správnou heuristiku

- Pro grafy znázorňující reálné prostředí je vhodnou metrikou euklidovská vzdálenost. Rychlá na vypočítání v $O(1)$ a pro otevřené terény dává skoro perfektní výsledky.
