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
  poet = \markup{ \fontsize #4 \smallCaps "Bread of the World in Mercy Broken"  }
  meter = \markup { \small { Music: RENDEZ À DIEU, 98.98.D.; L. Bourgeois, 1543  }}
  piece = \markup { \small {Text: R. Herber, 1827 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

\paper {
  page-count = 1
}

global = {
  \key g \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g2 e4 d \bar "|"
  g g a c \bar "|"
  b2 a \bar "|"

  d2 b4 b \bar "|"
  g4 c b2 a \bar "|"
  g2 \bar "||"

  g2 e4 d \bar "|"
  g4 g a c \bar "|"
  b2 a \bar "|"

  d2 c4 b \bar "|"
  a g g fs \bar "|"
  g2 \bar "||"

  d'2 d4 c \bar "|"
  b2 a g4 fs \bar "|"
  e2 d \bar "||"

  d2 g4 g fs e \bar "|"
  g2 a \bar "|"
  b2 \bar "||"

  g2 g4 a \bar "|"
  b g c c \bar "|"
  b2 a \bar "|"

  d2 c4 b \bar "|"
  a g g fs \bar "|"
  g2 \bar "|."
}

alto = \relative c' {
  \global
  b4( d) c a |
  e' d e e |
  g2 fs |

  fs2 fs4 fs |
  g a g( e) fs2 |
  g2 |

  b,2 c4 a |
  d e fs g |
  g2 fs |

  g2 fs4 g |
  e e d d |
  d2 |

  g2 g4 fs |
  d( e) fs2 e4 d |
  d( cs) d2 |

  a2 d4 e d b |
  e2. fs4 |
  gs2 |

  e2 e4 d |
  d e e4.( fs8) |
  gs2 e4( fs) |

  g2 g4 g |
  e e d d |
  d2
}

tenor = \relative c' {
  \global
  g2 g4 fs |
  b g c c |
  d( e) a,2 |

  b2 b4 b |
  b e d2. c4 |
  b2 |

  g2 g4 fs |
  g b d e |
  d2 d |
  b2 c4 d |
  c b a a |
  b2 |

  b2 b4 c |
  g2 d' b4 a |
  b( a) fs2 |

  fs2 g4 c a g |
  g2 c |
  b |

  b2 b4 a |
  g b e e |
  e( d) c2 |

  d2 e4 d |
  c b a a |
  b2
}

bass = \relative c {
  \global
  g4( b) c d |
  e b c a |
  b( c) d2 |

  b2 d4 d |
  e a, b( c) d2 |
  g,2 |

  e'4( d) c2 |
  b4 e d c |
  g( b) d2 |
  g,2 a4 b |
  c c d d |
  g,2 |

  g2 g4 a |
  b( c) d2 e4 fs |
  g( a) d,2 |

  d2 b4 c d e |
  c( b) a2 |
  e'2 |

  e2 e4 fs |
  g e c4. d8 |
  e2 a,2 |

  b2 c4 g |
  a8[ b] c4 d d |
  g,2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Bread of the world in mer -- cy bro -- ken,
  Wine of the soul in mer -- cy shed,
  By whom the words of life were spo -- ken,
  And in whose death our sins are dead:
  Look on the heart by sor -- row bro -- ken,
  Look on the tears by sin -- ners shed,
  And be Thy feast to us the to -- ken
  That by Thy grace our souls are fed.
}


\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranos { \voiceOne << \melody >> }
      \context Voice =
      altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenor >> }
      \context Voice =
      basses { \voiceTwo << \bass >> }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 92 4)
    }
  }

  \layout {}
}






