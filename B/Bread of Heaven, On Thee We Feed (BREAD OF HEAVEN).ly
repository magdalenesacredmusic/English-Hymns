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
          \line {BREAD OF HEAVEN    77 77 77}
      }
      \column{
      \line {W.D. Maclagan, 1875}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {J. Conder, 1824, alt. to plural}
   }
  } 
}

\header {
  tagline = ""
}


global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a4 g8[ fs] e4 e |
  d e fs2 |
  g4 a g fs |
  fs e e2 \bar "||"

  a4 g8[ fs] e4 e |
  d e fs2 |
  gs4 a b a |
  a gs a2 \bar "||"

  d4 cs8[ b] a4 fs |
  g a b2 |
  a4 d, g fs |
  fs e d2 \bar "|."
}

alto = \relative c' {
  \global
  d4 cs8[ d] cs4 cs |
  d cs d2 |
  e4 e d d |
  d d cs2 |

  d4 cs8[ d] cs4 cs |
  d cs d2 |
  d4 cs b bs |
  cs d cs2 |

  d4 g fs d |
  d d d2 |
  d4 d cs d |
  cs cs d2
}

tenor = \relative c' {
  \global
  a4 a a g |
  fs a a2 |
  a4 a b a |
  a gs a2 |

  a4 a a g |
  fs a a2 |
  e4 e fs fs |
  a b a2 |

  fs4 e a a |
  b fs g2 |
  a4 a a a |
  a g fs2
}

bass = \relative c {
  \global
  fs4 e8[ d] a4 a |
  b a d2 |
  cs4 cs d d |
  b b a2 |

  fs'4 e8[ d] a4 a |
  b a d2 |
  b4 a d ds |
  e e a,2 |

  b4 cs d c |
  b a g2 |
  fs4 fs' e d |
  a a d2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Bread of heav'n, on Thee we feed,
  For Thy Flesh is meat in -- deed;
  Ev -- er may our souls be fed
  With this true and liv -- ing Bread,
  Day by day with strength sup -- plied
  Through the life of Him who died.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Vine of heav'n, Thy Blood sup -- plies
  This blest cup of sac -- ri -- fice;
  'Tis Thy wouds our heal -- ing give;
  To Thy Cross we look and live:
  Thou our life! O let us be
  Root -- ed, graft -- ed, built on Thee.
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
        tempoWholesPerMinute = #(ly:make-moment 84  4)
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

