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
  poet = \markup{ \fontsize #4 \smallCaps "Jesus, The Very Thought of Thee"  }
  meter = \markup { \small { Music: ST.  AGNES, C.M. ; J.B. Dykes, 1866 } }
  piece = \markup { \small {Text: \italic "Jesu dulcis memoria," St. Bernard, 11th cent.; tr. E. Caswall }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key g \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  b4 b b |
  a2 b4 |
  c2 fs,4 |
  g2. \bar "||"

  d4 d d |
  b'2 a4 |
  a2. \bar "||"

  c4 c b |
  a2 g4 |
  fs2 e4 |
  d2. \bar "||"

  d4 e g |
  b2 a4 |
  g2. \bar "|."
}

alto = \relative c' {
  \global
  d4 d d |
  e2 d4 |
  c( e) d |
  d2. |

  d4 d d |
  d2 cs4 |
  d2. |

  e4 e d |
  c2 cs4 |
  d2 cs4 |
  d2. |

  d4 d c |
  b2 c4 |
  b2.
}

tenor = \relative c' {
  \global
  b4 b g |
  c2 g4 |
  a2 a4 |
  b2. |

  c4 b a |
  g2 g4 |
  fs2. |

  e4 fs gs |
  a2 a4 |
  a2 g4 |
  fs2. |

  g4 g g |
  g2 fs4 |
  g2.
}

bass = \relative c' {
  \global
  g4 g b, |
  c2 b4 |
  a2 d4 |
  g2. |

  a4 g fs |
  g2 e4 |
  d2. \bar "||"

  a4 a a |
  a2 a4 |
  d2 d4 |
  d2( c!4) |

  b4 c e |
  d2 d4 |
  g,2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  \tagIt Je -- sus, the ve -- ry thought of Thee
  With sweet -- ness fills my breat;
  \tagIt But sweet -- er far Thy face to see,
  And in Thy pre -- sence rest.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Nor voice can sing, nor heart can frame,
  Nor can the mem' -- ry find,
  A sweet -- er sound than Thy blest name,
  O Sa -- viour of man -- kind!
}

verseThree = \lyricmode {
  \set stanza = "3."
  O hope of ev' -- ry con -- trite heart,
  O joy of all the meek,
  To those who fall, how kind Thou art!
  How good to those who seek!
}

verseFour = \lyricmode {
  \set stanza = "4."
  But what to those who find? Ah! this
  Nor tongue nor pen can show;
  The love of Je -- sus! what it is,
  None but his loved ones know.
}


verseFive = \lyricmode {
  \set stanza = "5."
  Je -- sus, our on -- ly joy be Thou,
  As Thou our prize wilt be;
  Je -- sus, be Thou our glo -- ry now,
  And through e -- ter -- ni -- ty.
}


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
  \layout { }
}

