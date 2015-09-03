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
  poet = \markup{ \fontsize #4 \smallCaps "Lord, Enthroned in Heavenly Splendour"  }
  meter = \markup { \small { Music: BRYN CALFARIA, 87.87.47.; W. Owen; harm. \italic "The English Hymnal," 1906} }
  piece = \markup { \small {Text: G.H. Bourne, 1874 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key g \minor
  \time 3/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d4 d g2 a |
  bf4 bf bf2 a |
  bf4 bf d2 c4( bf) |
  a a g1 \bar "||" \break

  d4 d g2 a | \noBreak
  bf4 bf bf2 a | \noBreak
  bf4 bf d2 c4( bf) | \noBreak
  a a g1 \bar "||" \break

  g4 a bf2 g |
  a4 bf c2 a |
  bf4 c d2 bf4( d) \bar "||" \break

  ef8[ d] c4 d8[ c] bf4 c8[ bf] a8[ g] |
  d'1 bf4 bf |
  d2 c4( bf) a a |
  g1. \bar "|."
}

alto = \relative c' {
  \global
  bf4 bf d2 d |
  d4 d g2 fs |
  g4 g g2 g |
  g4 fs g1 |

  bf,4 bf d2 d |
  d4 d g2 fs |
  g4 g g2 g |
  g4 fs g1 |

  g4 g g2 d |
  a'4 g g2 fs |
  d4 f f2 d4( f) |

  ef4 f d ef ef ef8[ g] |
  fs1 g4 g |
  g2 g g4 fs |
  g1.
}

tenor = \relative c' {
  \global
  g4 g g2 fs |
  g4 g d'2 d |
  d4 d d2 ef |
  a,4 d bf1 |

  g4 g g2 fs |
  g4 g d'2 d |
  d4 d d2 ef |
  a,4 d bf1 |

  bf4 c d2 bf |
  d4 d ef2 d |
  bf4 a bf2 bf |

  bf4 a bf g c c8[ bf] |
  a1 g4 g |
  d'2 ef a,4 d |
  bf1.
}

bass = \relative c {
  \global
  g4 g bf2 d |
  g4 g g2 d |
  g4 g bf,2 c |
  d4 d g,1 |

  g4 g bf2 d |
  g4 g g2 d |
  g4 g bf,2 c |
  d4 d g,1 |

  g'4 g g2 g |
  fs4 g c,2 d |
  g4 f bf2 bf, |

  c4 f bf, ef a, c |
  d1 g4 g |
  bf,2 c d4 d |
  g,1.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Lord, en -- throned, in heav'n -- ly splen -- dour,
  First be -- got -- ten from the dead,
  Thou a -- lone, our strong De -- fend -- er,
  Lift -- est up thy peo -- ple's head.
  Al -- le -- lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- ia,
  Je -- su, true and liv -- ing Bread,
  Je -- su, true and liv -- ing Bread!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Though the low -- liest form doth veil thee
  As of old in Beth -- le -- hem,
  Here as there thine An -- gels hail thee,
  Branch and Flower of Jes -- se's stem.
  Al -- le -- lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- ia,
  We in wor -- ship join with them,
  We in wor -- ship join with them.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Pas -- chal Lamb, thine Of -- f'ring, fin -- ished
  Once for all when thou wast slain,
  In its full -- ness un -- dim -- in -- ished
  Shall for ev -- er -- more re -- main,
  Al -- le -- lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- ia,
  Clean -- sing souls from ev -- 'ry stain,
  Clean -- sing souls from ev -- 'ry stain.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Life -- im -- part -- ing heav'n -- ly Man -- na,
  Strick -- en Rock with strem -- ing side,
  Heav'n and earth with loud ho -- san -- na
  Wor -- ship thee, the Lamb who died,
  Al -- le -- lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- ia,
  Ris'n, as -- cend -- ed, glo -- ri -- fied,
  Ris'n, as -- cend -- ed, glo -- ri -- fied!
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
    \new Staff  <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 72 2)
    }
  }
  \layout { }
}

