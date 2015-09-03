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
  poet = \markup{ \fontsize #4 \smallCaps "O God, Our Help in Ages Past"  }
  meter = \markup { \small { Music: ST. ANNE, C.M., William Croft, 1708; \italic "Hymns Ancient and Modern,"  1904} }
  piece = \markup { \small {Text: Isaac Watts, 1719; alt. Traditional, \italic "The English Hymnal," 1906 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key c \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  g4 |
  e a g c |
  c b c \bar "||"

  g |
  c g a fs |
  g2. \bar "||"

  b4 |
  c a d b |
  c a b \bar "||"

  g4 |
  a c d b |
  c2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  c4 |
  c c c e |
  d d e \bar "||"

  e4 |
  e e e d |
  d2. \bar "||"

  d4 |
  e c f d |
  e4. d8 b4 \bar "||"

  c4 |
  f e d d |
  e2. \bar "|."
}

tenor = \relative c {
  \global
  \partial 4
  e4 |
  g a c c |
  a g g \bar "||"

  c4 |
  c b a a |
  b2. \bar "||"

  g4 |
  g a a g |
  g a gs \bar "||"

  g4 |
  f g  a g |
  g2. \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  c4 |
  c f e a |
  f g c, \bar "||"

  c4 |
  a e' c d |
  g,2. \bar "||"

  g'4 |
  c, a d g |
  c, f e \bar "||"

  e4 |
  d c f g |
  c,2. \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  O God, our help in a -- ges past,
  Our hope for years to come,
  Our shel -- ter from the storm -- y blast,
  And our e -- ter -- nal home;
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Un -- der the shad -- ow of Thy throne
  Thy Saints have dwelt se -- cure;
  Suf -- fi -- cient is Thine arm a -- lone,
  And our de -- fense is sure.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Be -- fore the hills in or -- der stood,
  Or earth re -- ceived her frame,
  From ev -- er -- last -- ing Thou art God,
  To end -- less years the same.
}

verseFour = \lyricmode {
  \set stanza = "4."
  A thou -- sand a -- ges in Thy sight
  Are like an even -- ing gone;
  Short as the watch that ends the night
  Be -- fore the ris -- ing sun.
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
      tempoWholesPerMinute = #(ly:make-moment 76 4)
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
            "Time, like an ever-rolling stream,"
            "  Bears all its sons away;"
            "They fly forgotten, as a dream"
            "  Dies at the opening day."
          }
        }
        \vspace #1.0
        \line {
          \bold "5. "
          \column {
            "O God, our help in ages past,"
            "  Our hope for years to come,"
            "Be Thou our guard while troubles shall last,"
            "  And our eternal home."
          }
        }
      }
      \hspace #1.0

    }
  }
}

