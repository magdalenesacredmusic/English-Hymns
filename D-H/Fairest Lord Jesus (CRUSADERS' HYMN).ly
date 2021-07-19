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
      \line {SCHÖENSTER HERR JESU (ST. ELISABETH)  Irreg.}
    }
    \right-column{
      \line {Silesian folk melody}
      \line {\italic "Schleisches Volkslieder," 1842}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Schönster Herr Jesu," 17th cent.} 
      \line {st. 1-3, tr. anon. ; st. 4, Joseph A. Seiss (1823-1904)}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f2 f4 f |
  g( e) f2 |
  a4 a a a |
  bf( g) a2 |
  c2 f4 d |
  c2 bf4( a) |
  bf2 a |
  g1 |

  c2 d4 c |
  c( a) bf2 |
  bf2 c4 bf |
  bf( g) a a |
  a a c bf |
  a2 g2 |
  f1 \bar "|."
}

alto = \relative c' {
  \global
  c2 d4 d |
  d( c) c2 |
  f4 f f fs |
  g( e) f2 |
  f2 f4 f |
  f2 g4( f) |
  g2 f |
  e1 |

  f2 f4 f |
  fs2 g |
  d2 d4 d |
  e2 f4 f |
  g f f f |
  f2 e |
  c1 \bar "|."
}

tenor = \relative c' {
  \global
  a2 a4 a |
  bf( g) a2 |
  c4 c d d |
  d( c) c2 |
  a2 d4 bf |
  a2 c |
  c c |
  c1 |

  c2 bf4 a |
  a( d) d2 |
  g,2 fs4 g |
  g( c) c c |
  cs d ef d |
  c2 c4( bf) |
  a1 \bar "|."
}

bass = \relative c {
  \global
  f2 d4 d |
  bf( c) f2 |
  f4 e d c |
  bf( c) f2 |
  f2 bf,4 d4 |
  f2 f |
  e f |
  c1 |

  a2 bf4 c |
  d2 g |
  g,2 a4 bf |
  c2 f4 f4 |
  e d a bf |
  c2 c |
  f1 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  Fair -- est Lord Je -- sus, Rul -- er of all na -- ture,
  O Thou of God and man the Son,
  Thee will I cher -- ish, Thee will I hon -- or,
  Thou, my soul’s glo -- ry, joy and crown.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Fair are the mead -- ows, fair -- er still the wood -- lands,
  Robed in the bloom -- ing garb of spring;
  Je -- sus is fair -- er, Je -- sus is pur -- er,
  Who makes the woe -- ful heart to sing.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Fair is the sun -- shine, fair -- er still the moon -- light,
  And all the twink -- ling star -- ry host;
  Je -- sus shines brigh -- ter, Je -- sus shines pur -- er
  Than all the an -- gels heav'n can boast.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Beau -- ti -- ful Sa -- vior! Lord of all the na -- tions!
  Son of _ God and Son of Man!
  Glo -- ry and hon -- or, praise, a -- do -- ra -- tion,
  Now and for -- ev -- er more be Thine.
}

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { \transpose c a,
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
