#import "../../globals.typ": *

= Representace grafů v paměti

== Základní třída

Budeme uvažovat třídu
```java
class Label {
  String name;

  public Label(String name) {
    this.name = name;
  }
}
```

s přepsanou metodou `equals` na porovnání atributu `name`.

#speaker-note[

  přepsaná funkce `equals` a `hash`
  ```java
  @Override
  public boolean equals(Object other) {
    return other instanceof Label &&
            ((Label) other).name = this.name;
  }
  @Override
  public int hashCode() {
    return this.name.hashCode();
  }
  ```
]

== Seznamem hran

```java
class Edge {
   // Pro orientované grafy je lepší `from` a `to`
   // Případně můžeme využít nějaký enum `Orientation`
   Label a;
   Label b;
   
   // Pokud chceme vážený graf
   float weight;
}
```

== Seznamem hran

```java
Label a = new Label("a");
   ...
Label d = new Label("f");

Label[] vertices = { a, b, c, d};
Edge[] edges = { new Edge(a, b), new Edge(b, c),
                 new Edge(c, d), new Edge(b, d) };
```


== Spojovým seznamem

Potřebujeme dodefinovat novou třídu:

```java
  class Vertex {
    Label label;
    Label[] connectedLabels;
  }
```

#pause

- Mohli bychom využít `Pair<Label, Label[]>`, ale kvůli čitelnosti a vyhnutí se zbytečné generice je lepší takto explicitní třída.

- Místo pole můžeme využít `List`; případně `Set`, pokud víme, že graf nepovoluje paralelní hrany.

== Spojovým seznamem #small[\- Implementace]

```java
  Label a = new Label("a");
   ...
  Label d = new Label("f");
  
  List<Vertex> graph = new ArrayList<>();

  graph.add(new Vertex(a, { b } ));
  graph.add(new Vertex(b, { c, d } ));
  graph.add(new Vertex(c, { d } ));
```

== Maticí

```java
float[][] graph = { { 0, 1, 0 },
                    { 1, 0, 1 },
                    { 0, 1, 0 } };
```

#pause
- Místo `float` můžeme využít libovolný typ, který znázorňuje váhu hrany, nebo jednoduchý `boolean`.

- Musíme si sami nastavit pravidla, co která hodnota značí. 

- Dejme tomu, že předchozí příklad znázorňuje: 

#align(center+horizon ,render("graph {
    layout = circo
    node [fixedsize=true, style=filled, shape=circle]
  
    subgraph {
      a -- b -- c
    }
  }")
)

#speaker-note[
  Několik důležitých poznámek:
  
  - Pro neorientované grafy je matice symetrická podle diagonály
  
  - Pro grafy bez smyček je diagonála nulová
  
  - Pro řídké grafy dostaneme řídkou matici
    - Matici s hodně nulami
]