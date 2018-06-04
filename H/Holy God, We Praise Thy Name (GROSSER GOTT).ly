\version "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup{ \fontsize #4 \smallCaps "Holy God, We Praise Thy Name"  }
  meter = \markup { \small { Music: GROSSER GOTT, 78.78.77; \italic "Katholisches Gesangbuch," 1774 }}
  piece = \markup { \small {Text: \italic "Te Deum laudamus;" paraphrased: \large \override #'(font-name . "CloisterBlack") "Grosser Gott, wir loben dich," I. Franz; tr. C.A. Walworth }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key f \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f2 f4 |
  f( e) f |
  g( a) g |
  f2.

  a2 a4 |
  a( g) f |
  c'( bf) a4 |
  a g2 |

  f2 f4 |
  f( e) f |
  g( a) g |
  f2.

  a2 a4 |
  a( g) f |
  c'( bf) a4 |
  a g2 |

  \repeat volta 2 {
    g2 a4 |
    bf( a) g |
    a2 bf4 |
    c2.

    d2 d4 |
    c( bf) a |
    bf( a) g |
    f2.
  }
}

alto = \relative c' {
  \global
  c2 c4 |
  c2 c4 |
  d2 e4 |
  f2.
  f2 g4 |
  f( d) d |
  f2 f4 |
  f e2 |

  c2 c4 |
  c2 c4 |
  d2 e4 |
  f2.
  f2 g4 |
  f( d) d |
  f2 f4 |
  f e2 |

  e2 fs4 |
  g( f!) e |
  f2 f4 |
  g2. |
  f2 g4 |
  g2 f4 |
  d( f) e |
  c2.
}

tenor = \relative c' {
  \global
  a2 a4 |
  g2 c4 |
  g( f) c'4 |
  a2.
  c2 cs4 |
  d( bf) a |
  c( d) c |
  c c2 |

  a2 a4 |
  g2 c4 |
  g( f) c'4 |
  a2.
  c2 cs4 |
  d( bf) a |
  c( d) c |
  c c2 |

  c2 c4 |
  d( c) c |
  c2 d4 |
  e2.
  bf2 bf4 |
  c2 c4 |
  bf( c) c4 |
  a2.
}

bass = \relative c {
  \global
  f2 f4 |
  c2 a4 |
  bf( d) c |
  f2.
  f2 e4 |
  d2 d4 |
  a( bf) f' |
  f4 c2 |

  f2 f4 |
  c2 a4 |
  bf( d) c |
  f2.
  f2 e4 |
  d2 d4 |
  a( bf) f' |
  f4 c2 |

  c4( bf) a |
  g( a) c |
  f( c) d |
  c2.
  bf2 g'4 |
  e2 f4 |
  g, a8[ bf] c4 |
  f2.
}


verseOne = \lyricmode {
  \set stanza = "1."
  Ho -- ly God, we praise thy name!
  Lord of all, we bow be -- fore thee;
  All on earth thy scep -- ter claim,
  All in heav'n a -- bove a -- dore thee;
  In -- fi -- nite thy vast do -- main,
  Ev -- er -- last -- ing is thy reign.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Hark! the loud ce -- les -- tial hymn
  An -- gel choirs a -- bove are rais -- ing;
  Cher -- u -- bim and Ser -- a -- phim
  In un -- ceas -- ing cho -- rus prais -- ing,
  Fill the heav'ns with sweet ac -- cord:
  Ho -- ly, ho -- ly, ho -- ly Lord!
}

verseThree = \lyricmode {
  \set stanza = "3."
  Ho -- ly Fa -- ther, Ho -- ly Son,
  Ho -- ly Spir -- it, Three we name thee,
  While in es -- sence on -- ly One,
  Un -- di -- vid -- ded God we claim thee,
  And a -- dor -- ing bend the knee,
  While we own the mys -- ter -- y.
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
    \new Staff  <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 96 4)
    }
  }
  \layout { }
}

