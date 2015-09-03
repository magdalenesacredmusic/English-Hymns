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
  poet = \markup{ \fontsize #4 \smallCaps "Gentle Mary Laid Her Child"  }
  meter = \markup { \small { Music: TEMPUS ADEST FLORIDUM, 76.76.D.; \italic "Piae Cantiones," 1582; arr. E.C. MacMillan, 1893 } }
  piece = \markup { \small {Text: J.S. Cook, 1919 }}
  %breakbefore
  %copyright = ""
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
  g2 g |

  g4 g g a |
  g g d2 |
  e4 d e fs |
  g2 g |

  d'4 c b a |
  b a g2 |
  e4 d e fs |
  g2 g |
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


\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranos { \voiceOne << \melody >> }
      \context Voice =
      altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
      \context Lyrics = two \lyricsto sopranos \verseTwo
      \context Lyrics = three \lyricsto sopranos \verseThree

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
      tempoWholesPerMinute = #(ly:make-moment 120 4)
    }
  }
  \layout {}
}
