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
      \line {ZUM FRIEDEN  87 87 D}
    }
    \column{
      \line {J.S. Bach}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {F.W. Faber, 1862}
    } 
  }
}

global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a4 f d d' |
  bf a bf a \bar "||"

  g4 f bf a |
  g f e2 \bar "||"

  a4 f d d' |
  bf a bf a \bar "||"

  g4 f bf a |
  g f e2 \bar "||"

  e4 e e a |
  f e f f \bar "||"

  f4 e f d' |
  gs,4. a8 a2 \bar "||"

  a4 g8[ f] bf4 a |
  d8[ cs] d[ e] cs4 a \bar "||"

  a4 d8[ c] bf[ a] g[ f] |
  e4. d8 d2 \bar "|."
}

alto = \relative c' {
  \global
  f4 d d f |
  f8[ e] e[ d] d[ c] c4 |

  e4 f f8[ e] e[ d] |
  d[ cs] d4 cs2 |

  f4 d d f |
  f8[ e] e[ d] d[ c] c4 |

  e4 f f8[ e] e[ d] |
  d[ cs] d4 cs2 |

  cs4 b cs e |
  d cs d d |
  d e d f |
  e d cs2 |

  e4 d f8[ e] a4 |
  a8[ g] f[ e] e4 cs |

  d8[ e] f4 d d |
  d( cs8) d d2
}

tenor = \relative c' {
  \global
  d4 d a a |
  g a g f |

  a a g a |
  e f8[ g] a2

  d4 d a a |
  g a g f |

  a a g a |
  e f8[ g] a2

  a4 b a a |
  a a a a |

  a a a a |
  b b a2 |

  a4 a bf d |
  bf bf a a |

  a a g a |
  a g f2
}

bass = \relative c {
  \global
  d4. e8 f4 d |
  g f e f |

  cs d g f |
  e d a2 |

  d4. e8 f4 d |
  g f e f |

  cs d g f |
  e d a2 |

  a'4 gs a cs, | 
  d a d d |

  d cs d b |
  e e a,2 |

  cs4 d g f |
  bf g a a8[ g] |

  f8[ e] d4 g d |
  a' a, d2
}

verseOne = \lyricmode {
  \set stanza = "1. "
  There's a wide -- ness in God's mer -- cy,
  Like the wide -- ness of the sea;
  There's a kind -- ness in his jus -- tice,
  Which is more than li -- ber -- ty.
  
  There is no place where earth's sor -- rows
  Are more felt than up in heav'n;
  There is no place where earth's fail -- ings
  Have such kind -- ly judge -- ment giv'n.
}

verseTwo = \lyricmode {
  \set stanza = "2. "
  There is grace e -- nough for thou -- sands
  Of new worlds as great as this;
  There is room for fresh cre -- a -- tions
  In that up -- per home of bliss.
  
  For the love of God is broad -- er
  Than the mea -- sures of man's mind;
  And the heart of the E -- ter -- nal
  Is most won -- der -- ful -- ly kind.
}

verseThree = \lyricmode {
  \set stanza = "3. "
  But we make his love too nar -- row
  By false lim -- its of our own;
  And we mag -- ni -- fy his strict -- ness
  With a zeal he will not own.
  
  There is plen -- ti -- ful re -- demp -- tion
  In the Blood that has been shed,
  There is joy for all the mem -- bers
  In the sor -- rows of the Head.
}

verseFour = \lyricmode {
  \set stanza = "4. "
   'Tis not all we owe to Je -- sus;
   It is some -- thing more than all;
   Great -- er good be -- cause of e -- vil,
   Larg -- er mer -- cy through the fall.
   
   If our love were but more sim -- ple,
   We should take him at his word;
   And our lives would be all sun -- shine
   In the sweet -- ness of our Lord.
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