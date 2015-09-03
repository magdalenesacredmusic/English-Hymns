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
  poet = \markup{ \fontsize #4 \smallCaps "O Jesu Christ, From Thee Began"  }
  meter = \markup { \small { Music: PLAISTOW, L.M.; from \italic "Magdalen Hymns," c. 1760, \italic "The English Hymnal" } }
  piece = \markup { \small {Text: \italic "Jesu quadragenariae," c. 9th cent.; \italic tr. T.A. Lacey, \italic "The English Hymnal" }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key d \minor
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  a' e f d |
  g8[ a] bf4 a4 \bar "||" e |
  f g a8[ c] bf[ a] |
  a4 g f \bar "||" a |
  c a8[ g] f4 g8[ a] |
  bf4 bf a \bar "||" cs |
  d a bf a8[ g] |
  f4 e d \bar "|."

}

alto = \relative c' {
  \global
  \partial 4
  a4 |
  a cs d d |
  d d d e |
  d e f8[ a] f[ a] |
  f4 e f f |
  g e f f |
  f e8[ d] cs4 e |
  d f g d8[ e] |
  d4 cs d
}

tenor = \relative c {
  \global
  \partial 4
  f4 |
  e a a f |
  g g f \bar "||" a |
  a c c d |
  c c8[ bf] a4 \bar "||" c4 |
  g a a d8[ c] |
  bf4 e, a \bar "||" a|
  a d d d8[ bf] |
  a4 g f \bar "|."

}

bass = \relative c {
  \global
  \partial 4
  d4 |
  cs a d d8[ c] |
  bf4 g d' cs |
  d c! f bf, |
  c c f, f' |
  e cs d8[ c] bf[ a] |
  g4 g a g' f d g f8[ g] |
  a4 a, d
}

verseOne = \lyricmode {
  \set stanza = "1."
  O Je -- su Christ, from thee be -- gan
  This heal -- ing for the soul of man,
  By fast -- ing sought, by fast -- ing found,
  Through for -- ty days of year -- ly round;
}

verseTwo = \lyricmode {
  \set stanza = "2."
  That he who fell from high de -- light,
  Borne down to sens -- ual ap -- pe -- tite,
  By dint of stern con -- trol may rise
  To climb the hills of Par -- a -- dise.
}

verseThree = \lyricmode {
  \set stanza = "3."
  There -- fore be -- hold Thy Church, O Lord,
  And grace of pen -- i -- tence ac -- cord
  To all who seek with gen' -- rous tears
  Re -- new -- al of their wast -- ed years.
}

verseFour = \lyricmode {
  \set stanza = "4."
  For -- give the sin that we have done,
  For -- give the course that we have run,
  And show hence -- forth in e -- vil day
  Thy -- self our suc -- cor and our stay.
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
      tempoWholesPerMinute = #(ly:make-moment 72 4)
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
          \bold "5. "
          \column {
            "But now let every heart prepare,"
            "By sacrifice of fast and prayer,"
            "To keep with joy magnifical"
            "The solemn Easter festival."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "Father and Son and Spirit blest,"
            "To Thee be every prayer addrest,"
            "Who art in threefold Name adored,"
            "From age to age, the only Lord."
          }
        }
      }
      \hspace #1.0

    }
  }
}




