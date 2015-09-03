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
  poet = \markup{ \fontsize #4 \smallCaps "Thou Hallowed Chosen Morn of Praise"  }
  meter = \markup { \small { Music: DIES IST DER TAG, 87.87.88; melody by P. Sohren, c. 1676; adapt. \italic "The English Hymnal" } }
  piece = \markup { \small {Text: St. John of Damascus, c. 750; tr. J.M. Neale }}
  %breakbefore
  %copyright = ""
  tagline = ""

}

global = {
  \key bf \major
  \time 6/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  bf4 |
  bf2 f4 bf2 d4 |
  c2 c4 bf2 \bar "||"

  c4 |
  c2 a4 bf2 a4 |
  g2. f2 \bar "||"

  bf4 |
  bf2 f4 bf2 d4 |
  c2 c4 bf2 \bar "||" \break

  c4 |
  c2 a4 bf2 a4 |
  g2. f2. \bar "||"

  g4 g g g2 bf4 | \break
  a8[ g fs g] a4 g2. \bar "||" 

  bf4 bf c d2 d4 |
  c8[ bf a g] a4 bf2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  f4 |
  f2 f4 d2 f4 |
  g2 f4 d2

  f4 |
  g2 f4 f2 f4 |
  f2( e4) f2

  f4 |
  f2 f4 d2 f4 |
  g2 f4 d2

  f4 |
  g2 f4 f2 f4 |
  f2( e4) f2. |

  bf,4 bf ef d2 g4 |
  ef( c) c bf2. |

  g'4 f a bf2 bf4 |
  g( ef) ef d2. \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4
  d4 |
  d2 c4 bf2 bf4 |
  bf2 a4 bf2

  a4 |
  c2 c4 d2 d4 |
  g,2. a2

  d4 |
  d2 c4 bf2 bf4 |
  bf2 a4 bf2

  a4 |
  c2 c4 d2 d4 |
  g,2. a2. |

  g4 g g g2 d'4 |
  a2 fs4 g2.

  g4 bf ef d2 f4 |
  c2 c4 bf2. \bar "|."
}

bass = \relative c' {
  \global
  \partial 4
  bf4 |
  bf2 a4 g2 d4 |
  ef2 f4 bf,2

  f'4 |
  e2 f4 g,4.( a8) bf4 |
  c2. f2

  bf4 |
  bf2 a4 g2 d4 |
  ef2 f4 bf,2

  f'4 |
  e2 f4 g,4.( a8) bf4 |
  c2. f2. |

  ef4 d c bf2 g4 |
  c( ef) d g2. |
  ef4 d c bf2 d4 |
  ef( c) f bf,2. \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  Thou hal -- lowed cho -- sen morn of praise,
  That best and great -- est shin -- est;
  La -- dy and Queen and Day of days,
  Of things di -- vine, di -- vin -- est!
  On thee our prais -- es Christ a -- dore
  For -- ev -- er and for -- ev -- er -- more.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Come, let us taste the Vine's new fruit,
  For heav' -- nly joy pre -- par -- ing;
  To -- day the bran -- ches with the Root
  In re -- sur -- rec -- tion shar -- ing:
  Whom as True God our hymns a -- dore
  For ev -- er and for ev -- er -- more.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Rise, Si -- on, rise! and look -- ing forth,
  Be -- hold thy chil -- dren round thee!
  From East and West, from South and North,
  Thy scat -- tered sons have found thee!
  And in thy bo -- som Christ a -- dore
  For ev -- er and for ev -- er -- more.
}

verseFour = \lyricmode {
  \set stanza = "4."
  O Fa -- ther! O co -- e -- qual Son!
  O co -- e -- ter -- nal Spi -- rit!
  In per -- sons Three, in Sub -- stance One,
  And One in pow'r and mer -- it;
  In Thee bap -- tized, we Thee a -- dore
  For ev -- er and for ev -- er -- more!
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
      tempoWholesPerMinute = #(ly:make-moment 120 4)
    }
  }

  \layout {}
}
