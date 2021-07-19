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
      \line {QUEM PASTORES 88 87}
    }
    \right-column{
      \line {Hohenfurth Manuscript, 1410; harm. \italic "The Hymnal," 1940}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Quem pastores laudavere," ca. 1410}
      \line {tr. Charles Winfred Douglas, 1940}
    }
  } 
}

\header {
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
  f2 a4 |
  c2 a4 |
  bf( c) d |
  c2 g4 |
  a( bf) c |
  bf( a) g |
  f2 d4 |
  e2 c4 |

  a'2 bf4 |
  c2 d4 |
  c2 g4 |
  a2 f4 \bar "||"
  bf2 bf4 |
  a4( g) f |
  f( d) e |
  f2. \bar "|."
}

alto = \relative c' {
  \global
  f2 f4 |
  g2 f4 |
  f2 f4 |
  f2 e4 |
  f2 f4 |
  d2 e4 |
  d2 b4 |
  c2 c4 |
  c2 f4 |
  e2 f4 |
  f2 d4 |
  e2 d4 |

  d2 g4 |
  e2 d4 |
  d2 c4 |
  c2.
}

tenor = \relative c' {
  \global
  a2 c4 |
  c2 c4 |
  bf2 bf4 |
  g( a) bf |
  a2 a4 |
  bf2 c4 |
  a2 g4 |
  g2 e4 |
  f2 f4 |
  g2 bf4 |
  c2 bf4 |
  a2 a4 |

  bf2 d4 |
  c2 a4 |
  bf2 g4 |
  a2.
}

bass = \relative c {
  \global
  f2 f4 |
  e2 f4 |
  d2 bf4 |
  c2 c4 |
  f2 a4 |
  g2 c,4 |
  d2 g4 |
  c,2 c4 |
  f2 d4 |
  c2 bf4 |
  a2 bf4 |
  c2 d4 |

  g,2 g4 |
  c2 d4 |
  bf2 c4 |
  f2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  He whom joy -- ous shep -- herds prais -- ed,
  When the an -- gel's song was rais -- ed
  Bid -- ding them be not a -- maz -- ed,
  Heav'n's all -- glo -- rious King is born.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  He whom sa -- ges, west -- ward far -- ing,
  Myrrh and gold and in -- cense bear -- ing,
  Wor -- ship -- ped, bow -- ing low be -- fore Him,
  Reigns as King this hap -- py morn.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Now re -- joice with Je -- sus' moth -- er;
  Praise her new -- born son, our broth -- er;
  An -- gles vie with one an -- other -- er,
  Prais -- ing Him be -- yond the sky.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Sing to Christ, the King who reign -- eth,
  Yet of Ma -- ry man -- hood gain -- eth,
  Born our God; let us a -- dore Him:
  Glo -- ry be to God on high.
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
        tempoWholesPerMinute = #(ly:make-moment 128 4)
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
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

