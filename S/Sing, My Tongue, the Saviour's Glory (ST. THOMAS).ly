%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup{ \fontsize #4 \smallCaps "Sing, My Tongue, the Saviour's Glory"  }
  meter = \markup { \small { Music: ST. THOMAS, 87.87.87.; \italic "Cantus Diversi," J.F. Wade; principally harm. V. Novello; trad. Catholic ending } }
  piece = \markup { \small {Text: \italic "Pange lingua, gloriosi," T. Aquinas; tr. E. Caswall, \italic "Lyra Catholica" }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key d \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d4 e fs d |
  e fs g fs |
  b a g fs |
  e e d2 |

  d'4 cs d a |
  b a g fs |
  b cs d cs |
  b b a2 |

  a4 a fs d |
  e fs g fs |
  b a g fs |
  e e d2 \bar "||"
}

alto = \relative c' {
  \global
  a4 cs d d |
  a d cs d |
  d d d8[ cs] d4 |
  d cs d2

  fs4 e d d |
  d d cs d |
  fs4. e8 d4 e |
  e4. d8 cs2 |

  d4 e d d |
  cs d d8[ cs] d4 |
  d d d8[ e] d4 |
  d cs d2

}

tenor = \relative c {
  \global
  fs4 a a a |
  a a a a |
  g a b8[ g] a4 |
  a4. g8 fs2 |
  a4 g fs fs |
  g a a a |
  d cs b a |
  a gs4 a2 |

  a4 a a a |
  a a g a |
  g a b8[ a] a4 |
  b a8[ g] fs2

}

bass = \relative c {
  \global
  d4 a d fs |
  cs d e d |
  g fs e d |
  a a d2 |
  d4 e fs d |
  g fs e d |
  b as b cs8[ d] |
  e4 e a,2 |

  fs'4 cs d fs |
  g fs e d |
  g fs b,8[ cs] d4 |
  g, a d2

}

verseOne = \lyricmode {
  \set stanza = "1."
  Sing, my tongue, the Sa -- viour's glo -- ry,
  Of His Flesh the mys -- t'ry sing;
  Of the Blood, all price ex -- ceed -- ing,
  Shed by our im -- mor -- tal King,
  Des -- tined, for the world's re -- demp -- tion,
  From a no -- ble womb to spring.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Of a pure and spot -- less Vir -- gin
  Born for us on earth be -- low,
  He, as Man with man con -- ver -- sing,
  Stay'd, the seeds of truth to sow;
  Then He closed in so -- lemn or -- der
  Won -- drous -- ly His life of woe.
}

verseThree = \lyricmode {
  \set stanza = "3."
  On the night of that Last Sup -- per,
  Seat -- ed with His cho -- sen band,
  He the Pas -- chal vic -- tim eat -- ing,
  Firt ful -- fulls the Law's com -- mand;	Then, as Food to all His breth -- ren
  Gives Him -- self with His own hand.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Word made Flesh, the bread of na -- ture
  By His word to Flesh He turns;
  Wine in -- to His Blood He chang -- es:
  What though sense no change dis -- cerns?
  On -- ly be the heart in earn -- est,
  Faith her les -- son quick -- ly learns.
}


verseFive = \lyricmode {
  \set stanza = "5."
  Down in a -- dor -- a -- tion fal -- ling,
  Lo! the sa -- cred Host we hail;
  Lo! o'er an -- cient forms de -- part -- ing,
  New -- er rites of grace pre -- vail;
  Faith, for all de -- fects sup -- ply -- ing,
  Where the fee -- ble sens -- es fail.
}

verseSix = \lyricmode {
  \set stanza = "6."
  To the Ev -- er -- last -- ing Fa -- ther,
  And the Son who reigns on high,
  With the Ho -- ly Ghost pro -- ceed -- ing
  Forth from Each e -- ter -- nal -- ly,
  Be sal -- va -- tion, ho -- nor, bles -- sing,
  Might, and end -- less ma -- jes -- ty.
}


\score {
  \new ChoirStaff <<
    \new Staff  <<
      \new Voice = "soprano" { \voiceOne \melody }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics  \lyricsto soprano \verseOne
    \new Lyrics  \lyricsto soprano \verseTwo
    \new Lyrics  \lyricsto soprano \verseThree
    \new Lyrics \lyricsto soprano \verseFour
    \new Lyrics \lyricsto soprano \verseFive
    \new Lyrics \lyricsto soprano \verseSix
    \new Staff  <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 72 4)
    }
  }
  \layout { }
}


