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
          \line {GOTT VATER SEI GEPRIESEN   76 76 with refrain}
      }
      \column{
      \line {harm. Healey Willan, 1958}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {\italic "Gott Vater! sei gepriesen," anon.}
     \line {"tr. Edward C. Currie, 1958"}
   }
  } 
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  g fs g a |
  b2 a4 d, |
  e8[ fs] g4 a a |
  g2. \bar "" \break
  d4 |
  g fs g a |
  b2 a4 d, |
  e8[ fs] g4 a a |
  g2. b4\rest \bar "||"  \break

  d4.^\markup {Refrain} c8 b4 d |
  c b a2 |
  b4 a g a8[ b] |
  c4 b a2 |
  b4 a g2 |
  c4 b a2 |
  d4 c b8[ c] d4 |
  a a g \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  d d d d |
  d2 d4 d |
  c d d d|
  b2. d4 |
  b d d c |
  d2 d4 d |
  c d c d |
  b2. s4 |

  g'4 fs g d |
  e8[ fs] g4 fs2 |
  fs4 fs g fs |
  g g fs2 |
  g4 fs g2 |
  e8[ fs] g4 fs2 |
  g4 fs g g |
  g fs g
}

tenor = \relative c' {
  \global
  \partial 4
  d4 |
  b4 c b a |
  g2 fs4 g |
  g g g fs |
  g2. a4 |
  g4 a g g |
  g2 fs4 g |
  g g g fs |
  g2. d4\rest |

  d'4 d d b |
  c d d2 |
  d4 d b d |
  e d d2 |
  d4 c b2 |
  c4 d d2 |
  d4 a g g |
  a d b
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  g,4 a g fs |
  g( b) d b |
  c b c d |
  g2. fs4 |
  e d8[ c] b4 a |
  g( b) d b |
  c b a d |
  << {\voiceTwo g2.} \\ { \voiceFour \once \override NoteColumn #'force-hshift = #0.4 \override NoteHead #'font-size = #-3 \parenthesize g,2.} >> s4 |

  b'4 a g b |
  a g d2 |
  b4 d e d |
  c g d'2 |
  g4 d e2 |
  a,4 b8[ c] d4( c) |
  b d e b |
  d d g,
}

verseOne = \lyricmode {
  \set stanza = "1."
  O God, Al -- might -- y Fa -- ther,
  Thou Maj -- es -- ty di -- vine,
  All glo -- ry, laud and hon -- or
  E -- ter -- nal -- ly be Thine.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  To -- geth -- er with the Fa -- ther
  We praise His ho -- ly Son,
  Through Je -- sus, Word in -- car -- nate,
  Was our Re -- demp -- tion won.

  O most ho -- ly Trin -- i -- ty,
  Three in One and One in Three;
  God of Love, God of Might,
  God e -- ter -- nal, be a -- dored.
}

verseThree = \lyricmode {
  \set stanza = "3."
  And God the Ho -- ly Spi -- rit
  Who dwells with -- in the soul,
  With truth and com -- fort guide us
  To heav'n's e -- ter -- nal goal.
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
      \new Lyrics \lyricsto "tune" { \verseThree }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}


