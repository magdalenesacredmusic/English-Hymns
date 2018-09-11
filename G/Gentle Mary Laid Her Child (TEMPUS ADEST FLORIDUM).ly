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
      \line {TEMPUS ADEST FLORIDUM 76 76 D}
    }
    \right-column{
      \line {\italic "Piae Cantiones," 1582; arr. E.C. MacMillan, 1893}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Joseph Simpson Cook, (1859-1933) 1919}
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

melody = \relative c'' {
  \global
  g4 g g a |
  g g d2 |
  e4 d e fs |
  g2 g | \break

  g4 g g a |
  g g d2 |
  e4 d e fs |
  g2 g | \break

  d'4 c b a |
  b a g2 |
  e4 d e fs |
  g2 g | \break
  
  d4 d e fs |
  g g a2 |
  d4 c b a |
  g2( c) |
  g1 \bar "|."
}

alto = \relative c' {
  \global
  d4 d e d |
  d d a( b) |
  c d c c |
  d( c) b2 |

  d4 d e d |
  d c a( b) |
  c d d c |
  b( c) d2 |

  d4 e fs fs |
  fs ds b2 |
  c4 d c c |
  b2 c4( b) |

  a4 d d c |
  b cs d2 |
  d4 e d c |
  b2( e) |
  d1
}

tenor = \relative c' {
  \global
  b4 b b a |
  b g fs2 |
  g4 g g a |
  b( a) g2 |

  b4 b c c |
  b e, fs2 |
  g4 g b a |
  g( a) b2 |

  g4 g d' c |
  g fs g2 |
  g4 g g a |
  g( fs) e2 |

  fs4 g b a |
  g g fs2 |
  g4 g fs fs |
  g1 |
  <g b>1
}

bass = \relative c' {
  \global
  g4 fs e fs |
  g b, d2 |
  c4 b c a |
  g2 g |

  g'4 fs e fs |
  g c, d2 |
  c4 b c d |
  g,2 g' |

  b,4 c d d |
  ds b e( d) |
  c b a d |
  e( d) c2 |

  c4 b c d |
  e e d2 |
  b4 c d d |
  e( d c e) |
  g,1
}

verseOne = \lyricmode {
  \set stanza = "1."
  Gen -- tle Ma -- ry laid her child
  Low -- ly in a man -- ger;
  There He lay, the un -- de -- filed,
  To the world a stran -- ger.
  Such a babe in such a place,
  Can He be the Sa -- viour?
  Ask the saved of all the race
  Who have found His fa -- vor.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  An -- gels sang a -- bout His birth;
  Wise men sought and found Him;
  Hea -- ven's star shone bright -- ly forth,
  Glo -- ry all a -- round Him.
  Shep -- herds saw the won -- drous sight,
  Heard the an -- gels sing -- ing;
  All the plains were lit that night,
  All the hills were ring -- ing.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Gen -- tle Ma -- ry laid her child
  Low -- ly in a man -- ger;
  He is still the un -- de -- filed,
  But no more a stran -- ger.
  Son of God, of hum -- ble birth,
  Beau -- ti -- ful the sto -- ry;
  Praise His Name in all the earth,
  Hail the King of glo -- ry!
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
        tempoWholesPerMinute = #(ly:make-moment 120 4)
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
