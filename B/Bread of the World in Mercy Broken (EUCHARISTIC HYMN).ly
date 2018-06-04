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
          \line {EUCHARISTIC HYMN   98 98}
      }
      \column{
      \line {J.S.B. Hodges, 1868}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line { Reginald Herber, 1827}
   }
  } 
}

\header {
  tagline = ""
}

global = {
  \key ef \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  bf4 bf af |
  g2 bf4 |
  af( g) f |
  g8[ af] bf2 |
  bf4 bf af |
  g2 ef4 |
  f4.( g8) f4 |
  ef2. \bar "||"

  af4 af g |
  c2 bf4 |
  af2 g4 |
  g4 f2 |
  bf4 g ef |
  af2 g4 |
  f4.( g8) f4 |
  ef2. \bar "|."
}

alto = \relative c' {
  \global
  ef4 ef ef |
  ef2 ef4 |
  d( ef) d |
  ef ef2 |
  ef4 g af |
  ef2 ef4 |
  ef2 d4 |
  ef2. |

  ef4 f ef |
  ef2 e4 |
  f4( d) ef |
  ef4 d2 |
  ef4 ef c |
  c( d) ef |
  ef2 d4 |
  ef2.
}

tenor = \relative c' {
  \global
  g4 g c |
  bf2 g4 |
  f( bf) bf |
  bf8[ af] g2 |
  g8[ bf] df4 c |
  bf2 a4 |
  bf2 af4 |
  g2. |

  c4 bf bf |
  af2 bf4 |
  c( af) bf8[ c] |
  bf4 bf2 |
  bf4 bf c |
  af2 bf4 |
  bf2 af4 |
  g2.
}

bass = \relative c {
  \global
  ef4 ef ef |
  ef2 ef4 |
  bf2 bf4 |
  ef4 ef2 |
  ef4 ef ef |
  ef4.( d8) c4 |
  bf2 bf4 |
  ef2. |

  c4 d ef |
  af2 g4 |
  f2 g8[ af] |
  bf4 bf2 |
  g4 g af |
  f2 ef4 |
  bf2 bf4 |
  ef2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Bread of the world in mer -- cy bro -- ken,
  Wine of the soul in mer -- cy shed,
  By whom the words of life were spo -- ken,
  And in whose death our sins are dead:
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Look on the heart by sor -- row bro -- ken,
  Look on the tears by sin -- ners shed,
  And be Thy feast to us the to -- ken
  That by Thy grace our souls are fed.
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
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