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
  poet = \markup{ \fontsize #4 \smallCaps "o Jesu, Thou the Beauty Art"  }
  meter = \markup { \small { Music: KING'S NORTON, C.M.; J. Clark; arr. \italic "The English Hymnal"} }
  piece = \markup { \small {Text: \italic "Jesu, decus angelicum," St. Bernard; tr. E. Caswall }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key f \minor
  \time 3/2
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  af2 f2. g4 |
  e2 c1 |
  f4.( g8 af2) bf |
  c1. \bar "||" \break

  c2 df4( c) bf( af) |
  af1 g2 |
  af1 \bar "||"

  c2 |
  ef2( bf4 c) df2 |
  df2( af4 bf) c2 | \break
  bf4.( af8 g4 af) g( f) |
  e1 \bar "||"

  e'2 |
  f4.( ef8 df2) df4( c) |
  af1 g4( f) |
  f1. \bar "|."
}

alto = \relative c' {
  \global
  c2 df df |
  c c1 |
  af2( df) f |
  e1. |

  ef2 f c |
  ef1 ef2 |
  ef1

  af2 |
  bf1 bf2 |
  af1 f2 |
  c1 b2 |
  c1

  g'2 |
  af1 f2 |
  c1 c2 |
  af1.

}

tenor = \relative c' {
  \global
  af2 af bf |
  g e1 |
  f f2 |
  g1. |

  af2 af f |
  bf1 bf2 |
  c1

  ef2 |
  ef1 ef2 |
  af,1 af2 |
  c1 f,2 |
  g1

  c2 |
  c( df) f, |
  f1 e4( f) |
  f1.
}

bass = \relative c {
  \global
  f2 df bf |
  c c1 |
  d d2 |
  c2.( df4 c bf) |
  af2 df f |
  ef1 ef2 |
  af,1

  af'2 |
  g1 g2 |
  f1 f2 |
  e( f) df |
  c1

  c2 |
  f,1 af2 |
  c1 c2 |
  f,1.
}


verseOne = \lyricmode {
  \set stanza = "1."
  O Je -- su, Thou the beau -- ty art
  Of An -- gel worlds a -- bove;
  Thy name is mu -- sic to the heart,
  En -- chant -- ing it with love.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Ce -- les -- tial sweet -- ness un -- al -- loyed!
  Who eat Thee hun -- ger still;
  Who drink of Thee still feel a void,
  Which nought but Thou can fill.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O my sweet Je -- su! hear the sighs
  Which un -- to Thee I send;
  To Thee mine in -- most spir -- it cries,
  By be -- ing's hope and end!
}

verseFour = \lyricmode {
  \set stanza = "4."
  Stay with us, Lord, and with Thy light
  Il -- lume the soul's a -- byss;
  Scat -- ter the dark -- ness of our night,
  And fill the world with bliss.
}


verseFive = \lyricmode {
  \set stanza = "5."
  O Je -- su! spot -- less vir -- gni -- flow'r!
  Our life and joy! to Thee
  Be praise, be -- a -- ti -- tude, and pow'r
  Through all e -- ter -- ni -- ty.
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
    \new Staff  <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 80 4)
    }
  }
  \layout { }
}


