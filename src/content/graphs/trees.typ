#import "../../globals.typ": *

= Stromy

#focus-slide[
  Co to je strom?
]

== Stromy #small[\- Tree]
#speaker-note[
  Pojem "_strom_" je odvozen od vzhledu grafu, pokud jeden z jeho vrcholů budeme považovat za "_kořen_" a zbytek se vrcholů se z něj "_větví_".
  #align(center+horizon, grid(
    align: left,
    columns: (auto, auto),
    column-gutter: 10%,
    render("graph {
      layout = dot
      rankdir = BT
      node [colorscheme=set19,fixedsize=true, style=filled, shape=circle]
  
      a [color=7, xlabel=kořen] 
      b [color=5, xlabel=\"levá větev\"]
      h [color=3, xlabel=list]
  
      a -- b, c
      b -- d, e
      c -- o, f
      f -- g
      e -- h, i
    }"),
    [
      - Stromy se kreslí _naopak_ (vzhůru nohama)
      
      - Volba kořenu je čistě na nás
      
      - Stromy jsou nejpraktičtější formou grafů

      - 
    ]
  ))
]

Strom je graf. Aby graf byl považován za strom, tak musí splňovat libovolnou podmínku:

- Nesmí obsahovat kružnice a musí být *_souvislý_*

- Nesmí obsahovat kružnice a $|E| = |V| - 1$#footnote[počet hran je počet vrcholů bez jedné]

- *_Mezi každou dvojicí vrcholů vede právě jedna cesta_*

- Přidání _libovolné_ hrany vytvoří cyklus

- každý vrchol je potomkem jediného vrcholu

== Zakořenění stromu #small[\- Rooted tree]
Stromové grafy se zpravidla _zakořeňují_. Vybereme jeden vrchol, který prohlásíme za kořen a všechny ostatní vrcholy se stanou jeho potomky a vytvoří tak jasnou hierarchii. 

#pause

#align(center+horizon, render("graph {
      layout = dot
      rankdir = BT
      node [colorscheme=set19,fixedsize=true, style=filled, shape=circle]
  
      a [color=7, xlabel=kořen] 
  
      a -- b, c
      b -- d, e
      c -- f
}"))

#speaker-note[
  Aby se se stromy lépe pracovalo, tak definujeme kořen stromu, tedy vrchol který nemá žádné předky a všechny ostatní vrcholy jsou jeho potomky. 

  Navzdory názvu se kořen kreslí na vrch grafu.
]


== Listy zakořeněného stromu #small[\- Leaves]
Listy jsou vrcholy, které nemají žádné potomky.

- Jsou to vrcholy na _konci_ stromu

- Listy zpravidla obsahují data

#pause

#align(center+horizon, render("graph {
      layout = dot
      rankdir = BT
      node [colorscheme=set19,fixedsize=true, style=filled, shape=circle]

      a
      b [color=3]
      c
      d,e,f,i,j [color=3]
  
      a -- b,c,d
      c -- e,f,i,j
}"))


== $N$-ární stromy
$N$-ární stromy omezují navíc maximální počet potomků všech vrcholů. Například *_binární_* strom může mít pro každý vrchol $<= 2$, _ternární_ $<= 3$, atd...

#pause
#align(center+horizon, grid(
    align: center+horizon,
    rows: (auto, auto),
    row-gutter: 10%,
    columns: (auto, auto),
    column-gutter: 10%,
    [Ternární(3) strom], [Oktární(8) strom],
    render("graph {
      layout = dot
      rankdir = BT
      node [colorscheme=set19,fixedsize=true, style=filled, shape=circle]

      a[color=7]

      e,f,g,c,d [color=3]
  
      a -- b,c,d
      b -- e,f,g
    }"),
    render("graph {
      layout = dot
      rankdir = BT
      node [colorscheme=set19,fixedsize=true, style=filled, shape=circle]

      a[color=7]
      b[color=3]
      c
      d,e,f,g,h,i,j [color=3]
  
      a -- b,c,d
      c -- e,f,g,h,i,j
    }"),
))


== Kostry grafů #small[\- Spanning tree]
Kostra grafu je strom vytvořený z hran a vrcholů grafu tím, že se zruší kružnice. Výsledkem je graf (strom), který má _nejmenší_ možný počet hran tak, aby propojil všechny vrcholy. 

Koster grafu může být více.

#align(center+horizon, render("graph {
      layout = circo
      node [colorscheme=set19,fixedsize=true, style=filled, shape=circle]
      edge [colorscheme=set19]
      scale = 0.7

      a, b, c, d, e, f, g [label = \"\"]

      edge [color = 0, penwidth = 1]
      a -- b, c, d, e, f, g
      b -- c, d, e, f, g
      d -- e, f, g
      c -- d, e, f, g
      e -- f, g
      f -- g

      edge [color = 5, penwidth = 10]
      a -- b -- f -- e -- d -- c -- g

      edge [color = 2, penwidth = 6]
      a -- b -- c -- e -- g -- f -- d
}"))

== Minimální kostry grafů #small[\- Minimum spanning tree]
Minimální kostra je kostra váženého grafu s nejmenší možnou kumulativní váhou. 

#pause
#align(center+horizon, render("graph {
      layout = circo
      node [colorscheme=set19,fixedsize=true, style=filled, shape=circle]
      edge [colorscheme=set19]
      scale = 1.5

      a -- b [label = 2, color = 1, penwidth = 5]
      b -- c [label = 4]
      c -- d [label = 2, color = 2, penwidth = 5]
      d -- a [label = 1, color = 1, penwidth = 5]
      a -- c [label = 2, color = 3, penwidth = 5]
      
      a -- e [label = 2]
      c -- f [label = 15, color = 1, penwidth = 5]
      a -- g [label = 1, color = 1, penwidth = 5]
      g -- e [label = 1, color = 1, penwidth = 5]
}"))



#focus-slide[
  Co to je les?

  #speaker-note[
    Poměrně logická odpověd: les je více stromů pohromadě.

    Les jako celek můžeme považovat za graf. Pak platí poměrně pěkné rovnosti.
    - \# souvislých komponent = $|V| - |E|$ = \# stromů v lese
      - Každý strom má o jeden vrchol více než hran
      
      - ...

    - ...
  ]
]


== Kruskal

1. Setřídit všechny hrany

2. #pause Postupě od nejlevnější přidat každou hranu, která přidáním nevytvoří cyklus

3. #pause Skončit při $|V| - 1$ přidaných hranách

== Kruskal - pseudo
```python
def kruskal(graph)
  tree = Graph.with_nodes(graph.nodes)
  for edge in graph.edges.sorted()
    if not tree.with(edge).has_cycle()
      tree.add(edge)
    if tree.length() + 1 == vertices.length()
      return tree
  retrun Error("Graf nema kostru")
```


= Halda

== Halda #small[\- Heap]
Halda je jednou z nejpoužívanějších struktur v informatice. Jedná se o binární strom, který navíc splňuje tyto podmínky:
- Vrcholy jsou topologicky uspořádané
  - Pořádá se podle úrovní a zleva do prava
  
- Je plný
  - Každý vrchol vyjma posledního má právě dva _potomky_
  
- Největší / nejmenší prvek je na vrcholu
  - menší hodnoty jsou na levo
  - větší na pravo
#speaker-note[
  ! Je třeba si dát pozor, že v informatice se pojem halda využívá pro dva zcela odlišné koncepty. Jedním je grafová halda, kterou si zde vysvětlujeme, druhá je část operační paměti určená k dynamickému alokování. 
]

== Halda v paměti
Haldu znázorníme prostým polem. Pro indexování použijeme jednoznačnost topologického uspořádání stromu. #footnote([Připomeňme si: to pro binární strom znamená číslování odshora zleva počínaje kořenem. Chybějící potomky počítáme také!])

#pause
#align(center+horizon, grid(
  align: center+horizon,
  column-gutter: 15%,
  columns: (auto, auto),

  render("graph {
    layout = dot
    
    a -- b, c
    b -- d, e
    c -- f, g
    
  }"),

  table(
    fill: (x, y) =>
      if calc.odd(x + y) { luma(240) }
      else { white },
    stroke: (x, y) =>
      if (x == 1) { (left: (paint: black, thickness: 2pt), ) }
      else { none },
    inset: 10pt,
    align: center+horizon,
    rows: (auto, auto),
    columns: (auto, auto, auto, auto, auto, auto, auto, auto),
    [Index], [0], [1], [2], [3], [4], [5], [6],
    [Data], [a], [b], [c], [d], [e], [f], [g]
  )
))

#speaker-note[
  Haldy o známém počtu potomků se znázorňují velmi lehce a _levně_.
]


== Vztah potomků a předků
Explicitní hrany/vztahy pro binární haldu můžeme dopočítat přes:

#pause
#align(center, grid(
  align: center+horizon,
  rows: (auto, auto),
  columns: (auto, auto, auto),
  row-gutter: 10%,
  column-gutter: 10%,

  [Předek], [Levý potomek], [Pravý potomek],
  [$(i - 1)/2$], [$2i + 1$], [$2i + 2$]
))

#meanwhile
Obdobné vzorce můžeme najít pro libovolně _n-ární_ haldy.

#linebreak()

```java
int parent(int child) { return (child - 1) / 2; }
int leftChild(int parent) { return 2 * parent + 1; }
int rightChild(int parent) { return 2 * parent + 2; }
```


== Vkládání do haldy
Jediné _prázdné_ místo v haldě, na které máme ukazatel, je její konec#footnote([Teoreticky máme ještě ukazatel na kořen/počátek, ale tam již nějaký prvek je]). 

=== Algoritmus
1. Vložit prvek na konec haldy
2. _Heapifikovat_ haldu podle minima/maxima
 1. Porovnat prvek s předkem
 2. Pokud je předek menší/větší, tak je vyměníme
 3. Opakujeme dokud není předek větší/menší
3. Prvek je vložený v grafu a graf je _validní_ halda

== Vkládání do haldy
_`MinHeap.java`_
```java
void insert(int element) {
  this.raw[this.tail] = element;
  int pos = this.tail;
  while (this.raw[parent(pos)] < element) {
      this.swap(parent(pos), pos);
      pos = parent(pos);
  }
  this.tail += 1;
}
```

#speaker-note[
  - Ideální by bylo mít funkci `heapify` která by uměla haldu sestavit z nějaké posice směrem dolu i nahoru.
]

== Halda jako prioritní fronta
#speaker-note[
  ```java
    class Node<T> {
        int priorityKey;
        T my_data;    
    }
  ```
  nebo
  ```java
    class Node {
      int priorityKey;
      int data_index;
    }
  ```
]

Prioritní fronta by měla umět:
- *Vkládat* prvek
 - Umíme v logaritmickém čase

- *Odebrat* první prvek
 - Umíme v logaritmickém čase

- *Změnit* *prioritu* prvku
 - Zatím neumíme

- Podívat se na největší prvek
- Zjistit počet prvků

== Logaritmický _update key_
#speaker-note[

  
   - Rozumný způsob:
    1. nalezení klíče $O(1)$
    2. zinvalidování $O(1)$
    3. přidání nového klíče $O(log n)$. 
   Tak v čem je problém? Při odebrání prvku, pokud se na vrch haldy dostane nevalidní prvek, musíme haldu _heapifikovat_ dvakrát.

   - Chytrý způsob
    1. nalezení klíče $O(1)$
    2. změna klíče $O(1)$
    3. heapifikace $O(log n)$ z posice

]

#pause
- Naivní způsob: dostat klíč na vrch haldy, vyhodit ho a přidat nový
  - $O(1 + 2log n)$
#pause
- Rozumný způsob: znevalidnit starý klíč a přidat nový.
  - $O(1 + 2log n)$#footnote([Jeden $log n$  amortizovaný v odebírání dalších prvků])
#pause
- Chytrý způsob: změnit starý klíč a vytvořit haldu _z posice_ 
  - $O(log n)$

#meanwhile #pause
Nutné je si povšimnout, že _asymptotické_ chování všech algoritmů je stejné, ale pro _rozumně_ konečné $n$ je rozdíl $~2$x


