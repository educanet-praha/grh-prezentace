#import "../globals.typ": *

= Algoritmická složitost

== Složitost #small[\- Complexity]
Složitost je metrika, která určuje kolik zdrojů algoritmus zabere na vykonání pro určitou velikost vstupu.

#note[Většinou nás zajímá _čas_ a _pamět_.]

Časová náročnost vymezuje čas, který algoritmus $A$ potřebuje ke zpracování vstupu $V$ o velikosti $n$. Náročnost se vyjadřuje v počtu operací procesoru vůči velikosti vstupu.



== Třídy složitosti
- $1$ 
  - Konstatní čas
  - Sečtení prvních dvou prvků
- $log n$
  - Logaritmnický čas
  - Kdykoliv něco dělíme na půlky
- $n$
  - Lineární čas
  - Procházení pole
- $n log n$
  - Linearitmický čas
  - Vkládání do haldy, většina třídících algoritmů
- $n^2$
  - Kvadratický čas
  - Procházení pole v poli
- $2^n$
  - Exponenciální čas
  - Rekursivní dělící algoritmy
- $n!$
  - Faktoriálový čas
  - Permutace, Variace, ...

== Chování složitostí
#align(horizon+center, image("../../media/time_complexity.png"))


== Asymptotické chování algoritmů
Asymptotické chování = \*chování v nekonečnu\*
