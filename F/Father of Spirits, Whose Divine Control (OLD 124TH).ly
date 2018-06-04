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
  poet = \markup{ \fontsize #4 \smallCaps "Father of Spirits, Whose Divine Control"  }
  meter = \markup { \small { Music: OLD 124TH, 10.10.10.10.10.; \italic "Genevan Psalter;" Louis Bourgeois, 1551 } }
  piece = \markup { \small {Text: \italic "Deus ignee fons animarum," Prudentius, 4th cent.; tr. P. Dearmer, 1906}}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key f \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f2 g4 a |
  bf2 a |
  g4 f f e |
  f1 \bar "||"
  a2 bf4 c | \break
  d2 c |
  bf4 a g f |
  e1 \bar "||"

  c2 f4 f |
  e2 f |
  g4 bf a g |
  a1 \bar "||"

  c2 c4 bf |
  a2 g |
  a4 c c bf |
  c1 \bar "||"

  a2 g4 f |
  e2 f |
  \time 3/2 g4 bf a2 g |
  f1 \bar "|."
}

alto = \relative c' {
  \global
  c2 c4 c |
  f2 f4( e) |
  d4 d c c |
  c1 \bar "||"

  c2 f4 e |
  d2 ef |
  f4 f d d |
  c1 \bar "||"

  c2 a4 b |
  c2 f |
  d4 d f d |
  e1 \bar "||"

  f2 f4 g |
  f2 d4( e) |
  f4. e8 d4 d |
  e1 \bar "||"

  f4( e) d4 d |
  c2 f |
  d4 g f2. e4 |
  f1
}

tenor = \relative c' {
  \global
  a2 c4 c |
  bf2 c |
  bf4. a8 g4 g |
  a1 |

  f2 f8[ g] a4 |
  bf2 g4( a) |
  bf c bf4. a8 |
  g1 |

  f2 f4 f |
  g( c) bf( a) |
  g4 g c d |
  d2( cs) |

  c!2 a4 g |
  c2 bf |
  c4. b8 a4 g |
  g1 |

  f2 bf4. a8 |
  g2 c |
  d4 bf c( d) g,2 |
  a1
}

bass = \relative c {
  \global
  f2 e4 f |
  d2 f |
  bf,4 bf c c |
  f1 |

  f4( e) d c |
  bf2 c |
  d4 f bf, bf |
  c1 |

  a2 d4 d |
  c2 d |
  bf4 g a bf |
  a1 |

  a2 d4 e |
  f2 bf |
  a4. g8 f4 g |
  c,1 |

  f2 bf,4 bf |
  c2 bf4( a) |
  bf g a( bf) c2 |
  f1

}

verseOne = \lyricmode {
  \set stanza = "1."
  Fa -- ther of spi -- rits, whose di -- vine con -- trol
  Doth bind the soul and bo -- dy in -- to one,
  Thou wilt re -- store this bo -- dy now un -- done;
  For once it was the man -- sion of a soul,
  Where dwelt the glow -- ing wis -- dom of Thy Son.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Thou, Ma -- ker of the bo -- dy, dost or -- dain
  That this Thine im -- age, mould -- ed by Thy will,
  Our ev' -- ry hope in glo -- ry shall ful -- fil;
  So, till the bo -- dy Thou dost build a -- gain,
  Thou wilt pre -- serve the spi -- rit freed from ill.
}

verseThree = \lyricmode {
  \set stanza = "3."
  In that blest re -- gion shall this spi -- rit dwell
  Where flow'rs un -- dy -- ing bloom on ev' -- ry side:
  For, lo, we trust Thy word, O Cru -- ci -- fied,
  When in Thy tri -- umph o -- ver death and hell,
  The thief for -- giv -- en took Thee for his guide.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Our \override LyricText #'font-shape = #'italic bro -- ther \revert Lyrics.LyricText #'font-shape
  go -- eth by the shin -- ing way,
  That ev -- er to the faith -- ful o -- pen lies:
  Lord, train Thy ser -- vant now in Par -- a -- dise,
  And bless him in his fa -- ther -- land, we pray,
  Till Thou shalt bid his bo -- dy to a -- rise.
}


\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranos { \voiceOne << \melody >> }
      \context Voice =
      altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
      \context Lyrics = two \lyricsto sopranos \verseTwo
      \context Lyrics = three \lyricsto sopranos \verseThree
      \context Lyrics = four \lyricsto sopranos \verseFour
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenor >> }
      \context Voice =
      basses { \voiceTwo << \bass >> }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 88 4)
    }
  }
  \layout { }
}


