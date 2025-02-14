#import "../../globals.typ": *

= Hry

== Hry jako grafy
Několik omezení
- Hra má jasně definované
  - Stavy
  - Přechody mezi stavy
  - Výherní podmínku
- Fixní počet hráčů

Můžeme analyzovat strategie například pro:
- Piškvorky

- Šachy 

- Mariáš

== Použitelnost
Grafově znázorněné hry mají jasně danou výherní strategii, proč tedy nevíme jak přesně vyhrát každou hru šachu?

=== Paměť
Graf hry šachu bude _hodně_ velký. Dobrým odhadem je $10^65 ~ 2^215$ možných stavů hry... To je přibližně hodně!

=== Výpočet
S výpočetním výkonem to je obdobné.

=== Proč potřebujeme všechny stavy najednou?
Abychom mohli najít jádro grafu, tak *potřebujeme* znát všechny hrany a vrcholy v grafu hry.
Některé stavy a přechody můžeme spojit (_kondensace grafu_)

== K čemu to vlastně tedy je?

Ideální jsou hry s málo možnými stavy.#footnote([*málo* je opravdu důležité, třeba 3x3 piškvorky mají $5477$ platných stavů])
Ukázkovou hrou bývá tahání sirek z hromádky: 

- Na počátku máte 7 sirek
- Střídají se dva hráči
- V každém tahu může vzít 1 nebo 2 sirky
- Kdo vezme poslední sirku prohrává

Možných stavů máme pouze 7 (jednotlivé počty sirek) a přechodů 11.

Jaká je optimální strategie?

== Sirky
#align(center+horizon, render("digraph {
  layout = dot
  rankdir = LR
  node [fixedsize=true, style=filled, colorscheme=set19, shape=circle]

  7 -> 6, 5
  6 -> 5, 4
  5 -> 4, 3
  4 -> 3, 2
  3 -> 2, 1
  2 -> 1
}"))

== Stavový automat
Stavový automat je graf, kde vrcholy znázorňují nějaký stav (prostředí, programu, výpočtu, ...) a vrcholy možné přechody mezi jednotlivými stavy.

== Jádro grafu
.
== Výherní strategie
.