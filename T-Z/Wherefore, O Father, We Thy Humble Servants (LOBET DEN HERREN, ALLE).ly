%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {LOBET DEN HERREN, ALLE  11 11 11 5}
    }
    \right-column{
      \line {melody, J. Crueger, 1653; harm. F. Layriz}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {W.H.H. Jervois, 1906}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g2 c4 b |
  a2 g |
  e4 f g g |
  f2 e |
  g a4 b |
  c2 a |
  b4 c d g, |
  a2 g \bar "||"

  e2 d4 c |
  g'2 g |
  a4 c b a |
  a( gs) a2 |
  g2 f4 e |
  d2 c \bar "|."
}

alto = \relative c' {
  \global
  e2 e4 d |
  d2 d |
  c4 c d c |
  c( b) c2 |
  d2 d4 d |
  e2 fs |
  g4 g fs g |
  g( fs) g2 |

  c,2 b4 a |
  d2 e2 |
  f4 g g e |
  e2 cs2 |
  c2 c4 c |
  b2 c2
}

tenor = \relative c' {
  \global
  g2 g4 g |
  fs2 g |
  g4 a g e |
  f2 g |
  b2 fs4 g |
  g2 d' |
  d4 g, a d |
  d2 b |

  g2 g4 e |
  g2 c2 |
  c4 c d c |
  b2 a |
  e a4 g |
  g2 e
}

bass = \relative c {
  \global
  c2 c4 g |
  d'2 b |
  c4 a b c |
  d2 c |
  g2 d'4 g |
  c,2 d |
  g4 e d b |
  d2 g |

  c, g4 a |
  b2 c |
  f4 e g a |
  e2 a,2 |
  c2 f,4 c' |
  g2 c
}

verseOne = \lyricmode {
  \set stanza = "1."
  Where -- fore, O Fa -- ther, we Thy hum -- ble ser -- vants
  Here bring be -- fore Thee Christ, Thy well be -- lov -- èd,
  All per -- fect Of -- f'ring, sac -- ri -- fice im -- mor -- tal,
  Spot -- less ob -- la -- tion.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  See now Thy chil -- dren, mak -- ing in -- ter -- ces -- sion
  Through Him our Sa -- viour, Son of God in -- car -- nate,
  For all Thy peo -- ple, liv -- ing and de -- part -- ed,
  Plead -- ing be -- fore Thee.
}

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score {
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
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
    \include "hymn_layout.ly"
  }
  \bottom
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

