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
      \line {ST. THOMAS 87 87 87}
    }
    \right-column{
      \line {\italic "Cantus Diversi," John Francis Wade}
      \line {principally harm. V. Novello; trad. Catholic ending}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Pange lingua, gloriosi"}
      \line {Thomas Aquinas; tr. Edward Caswall, \italic "Lyra Catholica"}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d4 e fs d |
  e fs g fs |
  b a g fs |
  e e d2 |

  d'4 cs d a |
  b a g fs |
  b cs d cs |
  b b a2 |

  a4 a fs d |
  e fs g fs |
  b a g fs |
  e e d2 \bar "||"
}

alto = \relative c' {
  \global
  a4 cs d d |
  a d cs d |
  d d d8[ cs] d4 |
  d cs d2

  fs4 e d d |
  d d cs d |
  fs4. e8 d4 e |
  e4. d8 cs2 |

  d4 e d d |
  cs d d8[ cs] d4 |
  d d d8[ e] d4 |
  d cs d2

}

tenor = \relative c {
  \global
  fs4 a a a |
  a a a a |
  g a b8[ g] a4 |
  a4. g8 fs2 |
  a4 g fs fs |
  g a a a |
  d cs b a |
  a gs4 a2 |

  a4 a a a |
  a a g a |
  g a b8[ a] a4 |
  b a8[ g] fs2

}

bass = \relative c {
  \global
  d4 a d fs |
  cs d e d |
  g fs e d |
  a a d2 |
  d4 e fs d |
  g fs e d |
  b as b cs8[ d] |
  e4 e a,2 |

  fs'4 cs d fs |
  g fs e d |
  g fs b,8[ cs] d4 |
  g, a d2

}



verseFive = \lyricmode {
  \set stanza = "1."
  Down in a -- dor -- a -- tion fal -- ling,
  Lo! the sa -- cred Host we hail;
  Lo! o'er an -- cient forms de -- part -- ing,
  New -- er rites of grace pre -- vail;
  Faith, for all de -- fects sup -- ply -- ing,
  Where the fee -- ble sens -- es fail.
}

verseSix = \lyricmode {
  \set stanza = "2."
  To the Ev -- er -- last -- ing Fa -- ther,
  And the Son who reigns on high,
  With the Ho -- ly Ghost pro -- ceed -- ing
  Forth from Each e -- ter -- nal -- ly,
  Be sal -- va -- tion, ho -- nor, bles -- sing,
  Might, and end -- less ma -- jes -- ty.
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
      \new Lyrics \lyricsto soprano \verseFive
      \new Lyrics \lyricsto soprano \verseSix
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 84 4)
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
      \new Lyrics \lyricsto "tune" { \verseFive}
      \new Lyrics \lyricsto "tune" { \verseSix}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}


