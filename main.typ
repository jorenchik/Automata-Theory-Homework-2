#import "@preview/tablex:0.0.6": tablex, rowspanx, colspanx, cellx

#let authors = ("Kristiāns Francis Cagulis, kc22015",)
#let title = [Automātu teorija -- 2. mājasdarbs]

#set document(author: authors, title: title)
#set page(numbering: "1", number-align: center,
  header: align(center)[
    $i=2 | j=0 | k=1 | m=5$
  ],
)
#set text(font: "CMU", lang: "lv", region: "LV")
#show link: set text(blue)
#show link: it => {underline(it)}
#show math.equation: set text(weight: 400)
  // Headings
#set heading(numbering: "1.1.")
  #show heading: it => {
    if it.level == 1 {
      pagebreak()
      text(14pt, align(center, upper(it)))
    } else {
      it
    }
}

#show figure.caption: it => {
  if it.kind == image {
    align(start, emph(it.counter.display(it.numbering) + " att. ") + text(weight: "bold", it.body))
  } else if it.kind == table {
    align(end, emph(it.counter.display(it.numbering) + " tabula ") + text(weight: "bold", it.body))
  } else {
    it
  }
}

#set list(marker: ([•], [--], [\*], [·])) 
// #set enum(numbering: "1aiA)")
#set enum(numbering: "(a)")
#show figure: set par(justify: false) // disable justify for figures (tables)

  // Title row.
#align(center)[
  #block(text(weight: 700, 1.75em, title))
]

  // Author information.
#pad(
  top: 0.5em,
  bottom: 0.5em,
  x: 2em,
  grid(
    columns: (1fr,) * calc.min(3, authors.len()),
    gutter: 1em,
    ..authors.map(author => align(center, strong(author))),
  ),
)


#show par: set block(spacing: 1.5em) // Set 1.5em gap between paragraphs
#show heading: set block(spacing: 1.5em)
#set terms(separator: " -- ")

  // Main body.
#set par(justify: true)


= Uzdevums

== Nosacījums

Akceptors ar magazīna tipa atmiņu $(Q, X, S, delta, q_0, dollar, Q_A)$ ir definēts sekojoši:
#tablex(
  columns: 2,
  auto-hlines: false,
  auto-vlines: false,
  $Q={s_0, s_1, s_2}$, [-- stāvokļu kopa],
  $X={0,1}$, [-- ieejas alfabēts],
  $S={z,dollar}$, [-- steka alfabēts],
  $q_0=s_0$, [-- sākumstāvoklis],
  $dollar$, [-- steka beigas simbols],
  $Q_A={s_0}$, [-- akceptējošo stāvokļu kopa],
)


Pārejas funkcija $delta$ ir dota ar tabulu:
#figure(
  tablex(
    columns: 4,
    [*Stāvoklis* $q$], [*Ieeja* $x$], [*Simbols no steka*], [*Mērķstāvoklis*], [*Virkne uz steku*],
    $s_0$, $epsilon$, $dollar$, $s_1$, $z dollar$,
    $s_1$, $0$, $z$, $s_1$, $z z z$,
    $s_1$, $epsilon$, $z$, $s_2$, $epsilon$,
    $s_2$, $1$, $z$, $s_2$, $epsilon$,
    $s_2$, $0$, $z$, $s_0$, $epsilon$,
    $s_1$, $1$, $z$, $s_2$, $z z$,
  )
)

Uzrakstiet visus attiecīgās valodas vārdus ar garumu $<=4$.

== Atbilde

- $epsilon$, $00$, $10$, $000$, $010$, $100$, $110$, $0000$, $0010$, $0100$, $0110$, $1000$, $1010$


= Uzdevums

== Nosacījums

+ Uzbūvējiet akceptoru ar magazīna tipa atmiņu ar ieejas alfabētu $X={0,1}$, kurš akceptē tādus (un tikai tādus) vārdus kuros apakšvirkņu $010$ ir mazāk nekā apakšvirkņu $101$. Pārejas funkciju $delta$ uzrakstiet kā tabulu teksta formātā.
+ Vai šī valoda ir regulāra? Pamatojiet!

== Atbilde

=== Atļauts
- $$,

+ Akceptors ar magazīna tipa atmiņu $(Q, X, S, delta, q_0, dollar, Q_A)$ ir definēts sekojoši:

#tablex(
  columns: 2,
  auto-hlines: false,
  auto-vlines: false,
  $Q={s_0, }$, [-- stāvokļu kopa],
  $X={0,1}$, [-- ieejas alfabēts],
  $S={1,0,dollar}$, [-- steka alfabēts],
  $q_0=s_0$, [-- sākumstāvoklis],
  $dollar$, [-- steka beigas simbols],
  $Q_A={}$, [-- akceptējošo stāvokļu kopa],
)

+ #lorem(10)


= Uzdevums

== Nosacījums

Varbūtiskais akceptors $(Q, X, p, q_0, Q_A, lambda)$ ir definēts sekojoši:
#tablex(
  columns: 2,
  auto-hlines: false,
  auto-vlines: false,
  $Q={s_0, s_1}$, [-- stāvokļu kopa],
  $X={a,b}$, [-- ieejas alfabēts],
  $q_0=s_0$, [-- sākumstāvoklis],
  $Q_A={s_1}$, [-- akceptējošo stāvokļu kopa],
  $lambda=0.5$, [-- akceptēšanas slieksnis],
)


Pārejas funkcija $p$ ir dota ar tabulu (tikai pozitīvas varbūtības):
#figure(
  tablex(
    columns: 4,
    [*Stāvoklis* $q$], [*Ieeja* $x$], [*Mērķstāvoklis* $q'$], [*Varbūtība* $p(q,x,q')$],
    $s_0$, $a$, $s_1$, $1$,
    $s_0$, $b$, $s_0$, $1/8$,
    $s_0$, $b$, $s_1$, $7/8$,
    $s_1$, $a$, $s_0$, $1$,
    $s_1$, $b$, $s_0$, $1/8$,
    $s_1$, $b$, $s_1$, $7/8$,
  )
)

+ Uzrakstiet visus attiecīgās valodas vārdus ar garumu $<=4$.
+ Vai šī valoda ir regulāra? Pamatojiet?

== Atbilde

+ $a$, $b$, $a b$, $b b$, $a a a$, $a a b$, $a b b$, $b a a$, $b a b$, $b b b$, $a a a b$, $a a b b$, $a b a a$, $a b a b$, $a b b b$, $b a a b$, $b a b a$, $b a b b$, $b b a a$, $b b a b$, $b b b b$
+ #lorem(10)

= Uzdgvums

== Nosacījums


Uzbūvējiet varbūtisko akceptoru ar ieejas alfabētu $X={a,b}$ un stāvokļu skaitu ne vairāk ka $10$, kurš akceptē tādus un tikai tādus vārdus, kuros burtu $a$ skaits ir $min(2,0)+3=3$ un burtu $b$ skaits ir $max(1,5)+6=11$. 
Pārejas funkciju p uzrakstiet kā tabulu teksta formātā.

Vai divreiz vieglāks uzdevums par divreiz mazāku atzīmi šajā uzdevumā: burtu a nav, burtu b skaits ir $max(1,5)+6=11$, stāvokļu skaits nepārsniedz $5$.

== Atbilde

Varbūtiskais akceptors $(Q, X, p, q_0, Q_A, lambda)$ ir definēts sekojoši:
#tablex(
  columns: 2,
  auto-hlines: false,
  auto-vlines: false,
  $Q={s_0, s_1, s_2, s_3, s_4, s_5, s_6, s_7}$, [-- stāvokļu kopa],
  $X={a,b}$, [-- ieejas alfabēts],
  $q_0=s_0$, [-- sākumstāvoklis],
  $Q_A={s_2, s_7}$, [-- akceptējošo stāvokļu kopa],
  $lambda=0.33445$, [-- akceptēšanas slieksnis],
)


Pārejas funkcija $p$ ir dota ar tabulu (tikai pozitīvas varbūtības):
#figure(
  tablex(
    repeat-header: true,
    columns: 4,
    [*Stāvoklis* $q$], [*Ieeja* $x$], [*Mērķstāvoklis* $q'$], [*Varbūtība* $p(q,x,q')$],
    $s_0$, $b$, $s_1$, $0.25$,
    $s_0$, $a$, $s_3$, $0.25$,
    $s_0$, $b$, $s_3$, $0.25$,
    $s_0$, $a$, $s_4$, $0.5$,
    $s_0$, $b$, $s_5$, $0.5$,
    $s_0$, $a$, $s_6$, $0.5$,

    $s_1$, $a$, $s_1$, $1$,
    $s_1$, $b$, $s_1$, $0.8$,
    $s_1$, $b$, $s_2$, $0.8$,

    $s_2$, $a$, $s_2$, $1$,
    $s_2$, $b$, $s_2$, $0.95$,
    $s_2$, $b$, $s_3$, $0.05$,
    $s_3$, $a$, $s_3$, $1$,
    $s_3$, $b$, $s_3$, $1$,

    $s_4$, $b$, $s_1$, $0.5$,
    $s_4$, $b$, $s_3$, $0.5$,
    $s_4$, $a$, $s_4$, $1$,

    $s_5$, $a$, $s_3$, $0.5$,
    $s_5$, $b$, $s_5$, $1$,
    $s_5$, $a$, $s_6$, $0.5$,

    $s_6$, $a$, $s_6$, $0.3$,
    $s_6$, $b$, $s_6$, $1$,
    $s_6$, $a$, $s_7$, $0.7$,

    $s_7$, $a$, $s_7$, $0.75$,
    $s_7$, $b$, $s_7$, $1$,
  )
)
