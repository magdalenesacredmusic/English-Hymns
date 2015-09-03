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
  poet = \markup{ \fontsize #4 \smallCaps "O Little Town of Bethlehem"  }
  meter = \markup { \small { Music: ST. LOUIS, 8.6.8.6 D; Lewis H. Redner, 1868 } }
  piece = \markup { \small {Text: Phillips Brooks, 1868 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  b4 |
  b b as b |
  \slurDashed \set melismaBusyProperties = #'() d( c) \unset melismaBusyProperties e, \bar "||"

  a |
  g fs8[ g] a4 d, |
  b'2. \bar "||" \break

  b4 |
  b b e d |
  d c e, \bar "||"

  a |
  g fs8[ g] b4 a |
  g2. \bar "||" \break

  b4 |
  b b a g |
  fs2 fs4 \bar "||"

  fs |
  e fs g a |
  b2. \bar "||" \break

  b4 |
  b b as b |
  d c e, \bar "||"

  e' |
  d g, b4. a8 |
  g2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  d d cs d |
  \slurDashed f( e) c

  e |
  d d d d |
  d2.

  d4 |
  d g gs gs |
  a e c

  e |
  d d fs fs |
  g2.

  g4 |
  g g fs e |
  ds2 ds4

  ds |
  e fs g e |
  fs2.

  g4 |
  d d cs d |
  e e c

  e8[ fs] |
  g4 cs, d4. c8 |
  b2. \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4
  g4 |
  g g g g |
  \slurDashed gs( a) a

  c |
  b a8[ b] c4 c |
  b2.

  g4 |
  g b b e |
  e e e

  c |
  b as8[ b] d4 c |
  b2.

  d4 |
  d b c cs |
  ds2 ds4

  b |
  e, fs g e' |
  ds2.

  d4 |
  d b g g |
  gs a a

  c |
  b a8[ g] g4. fs8 |
  g2. \bar "|."
}

bass = \relative c' {
  \global
  \partial 4
  g4 |
  g g g g |
  \tieDashed c,~ c c

  c |
  d d d d |
  g,2.

  g'4 |
  g f e e |
  a a a,

  c |
  d4. d8 d4 d |
  g2.

  g4 |
  g g a as |
  b2 b4

  b,4 |
  e fs g c |
  b2.

  g4 |
  g g g g |
  c, c c

  c |
  d e d4. d8 |
  g,2. \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  O lit -- tle town of Beth -- le -- hem,
  How still we see thee lie!
  A -- bove thy deep and dream -- less sleep
  The si -- lent stars go by.
  Yet in thy dark streets shin -- eth
  The ev -- er -- last -- ing Light;
  The hopes and fears of all the years
  Are met in thee to -- night.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  For Christ is born of Mar -- _ y,
  And gath -- ered all a -- bove,
  While mor -- tals sleep, the an -- gels keep
  Their watch of won -- d'ring love.
  O morn -- ing stars to -- geth -- er,
  Pro -- claim the ho -- ly birth,
  And prais -- es sing to God the King,
  And peace to men on earth!
}

verseThree = \lyricmode {
  \set stanza = "3."
  How si -- lent -- ly, how si -- lent -- ly,
  The won -- drous Gift is giv’n;
  So God im -- parts to hu -- man hearts
  The bles -- sings of His Heav’n.
  No ear may hear His com -- ing,
  But in this world of sin,
  Where meek souls will re -- ceive Him still,
  The dear Christ en -- ters in.
}


%%% if more verses are needed in between the musical staves, uncomment this section
%{
verseFour = \lyricmode {
	\set stanza = "4."

}
%}

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
      tempoWholesPerMinute = #(ly:make-moment 92 4)
    }
  }
  \layout { }
}

\markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "4. "
          \column {
            "Where children pure and happy"
            "  Pray to the blessèd Child,"
            "Where misery cries out to Thee,"
            "  Son of the mother mild;"
            "Where charity stands watching"
            "  And faith holds wide the door,"
            "The dark night wakes, the glory breaks,"
            "  And Christmas comes once more."
          }
        }
      }
      \hspace #1
      \column {

        \line {
          \bold "5. "
          \column {
            "O holy Child of Bethlehem,"
            "  Descend to us, we pray;"
            "Cast out our sin, and enter in,"
            "  Be born in us today."
            "We hear the Christmas Angels"
            "  The great glad tidings tell;"
            "O come to us, abide with us,"
            "  Our Lord Emmanuel!"
          }
        }
      }
      \hspace #1.0

    }
  }
}



