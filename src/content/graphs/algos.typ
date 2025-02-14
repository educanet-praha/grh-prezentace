#import "../../globals.typ": *



  
= Algoritmy a implementace


== Heapsort
Prvky necháme seřadit haldou

#align(horizon, [
- Vložit všechny prvky do minimální haldy
  - Halda se postará, aby nejmenší prvek byl navrchu

#linebreak()

- Vybrat všechny prvky z haldy
  - Při každém odebrání se další nejmenší prvek dostane na vrch
])

== Heapsort - Implementace
```python
def heapsort(list)
  heap = Heap()
  for element in list heap.insert(element)
  sorted = []
  while not heap.empty()
    sorted += heap.remove()
  return sorted
```

== Quicksort
Algoritmus vždy třídí okolo nějakého _pivotu_

- Vybereme _náhodný_#footnote([Na volbě prvního pivotu velmi záleží, protože nám určí jak dobře se prvky rozdělí]) pivot

- Procházím pole zleva / zprava směrem k pivotu

- Pokud je prvek menší / větší prvek s pivotem prohodím

- Skončím když se levý a pravý konec setkají
  - Menší prvky jsou nalevo a větší napravo od pivotu

- Stejný algoritmus provedeme na levé a pravé polovině


== Mergesort
Algoritmus metody _Divide-and-Conquer_
1. Rozdělíme kolekci na jednotlivé prvky

2. Pod dvojicích je setříděně spojíme

3. Spojíme dvě dvojce
  - Prvky ve dvojci jsou seřazené
  - Vezmeme první prvek z obou a porovnáme, menší přidáme
  - Přidáme všechny čtyři prvky
  
4. Opakujeme krok 3 s o stupeň většími kolekcemi

5. Máme setříděný seznam

== Mergesort - Implementace
```python
def sort(input)
  if input.length() <= 2
    merge(input[0], input[1])
  remerge(sort(input.split()[0]), sort(input.split()[1])
```
```python
def merge(a, b)
  res = []
  while not a.empty() || not b.empty():
    res += min(a.peek(), b.peek()).consume()
  res
```

== Časová náročnost

- Heapsort
  - Worst / Average: $O(n log n)$
  - Best: $O(n)$
  
- Quicksort
  - Worst: $O(n^2)$
  - Average: $O(n log n)$
  - Best: $O(n)$
  
- Mergesort
  - Worst / Average: $O(n log n)$
  - Best: $O(n)$
#focus-slide[Vyhledávání]

== Binární vyhledávací strom
- Snažíme se najít konkrétní prvek v poli

- Obecně umíme v lineárním čase - $O(n)$

- BVS umožní průměrnou složitost snížit na $O(log n)$

- Binární strom

== Binární vyhledávací strom
- Prvky postupně vkládáme do stromu:
  - Začneme vkládat od kořene
  
  - Menší a stejné hodnoty se pokoušíme vložit do levého podstromu
 
  - Větší prvky vkládáme do pravého podstromu


- Při mazání nahradíme nejmenším prvekem v pravém podstromu, nebo největším prvekem v levém podstromu

- Při vyhledávání procházíme od kořene
  - Pokud hledáme menší hodnotu, rekurzivně prohledáme levý podstrom
  
  - Pokud hledáme větší hodnotu, prohledáme pravý podstrom

== BVS - insert
```java
void insert(int key) {
  if (value <= key) {
    if (left == null)
      left = new Node(key);
    else
      left.insert(key);
  } else {
    if (right == null)
      right = new Node(key);
    else
      right.insert(key);
  }
}
```

== BVS - search
```java
Integer find(int key) {
  if (value == key)
    return value;

  if (value < key && left != null)
    return left.find(key);
  else if (value > key && right != null)
    return right.find(key);
    
  return null;
}
```

== AVL
- BVS mohou být nevyvážené

  - vznikne nám _"šňůra"_

- AVL při vkládání a odebírání provádí kontrol vyváženosti
  - od přidaného / mazeného vrcholu se posouváme ke kořenu stromu
  
  - V každém uzlu zkontrolujeme vyváženost
    - hloubka pravého a levého podstromu se může lišit maximálně o jedna
    
  - Pokud je strom nevyvážený, provedeme rotaci
    - Left rotace: Pravý potomek uzlu se stane novým kořenem podstromu

    - Right rotace: Levý potomek uzlu se stane novým kořenem podstromu

    - Left right rotace: Levá rotace v potomkovi, pravá rotace v kořeni

    - Right left rotace: Pravá rotace v potomkovi, levá rotace v koření

#align(center+horizon,image("../../../media/avl-rotace.png"))