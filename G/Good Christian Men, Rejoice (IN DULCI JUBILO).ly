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
  poet = \markup{ \fontsize #4 \smallCaps "Good Christian Men, Rejoice"  }
  meter = \markup { \small { Music: IN DULCI JUBILO, 67.77.78.55.; German melody 13th cent.; harm. W. Douglas, 1918 } }
  piece = \markup { \small {Text: J.M. Neale }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key f \major
  \time 3/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  f4 |
  f2 f4 a2 bf4 |
  c2( d4 c2) c4 |
  f,2 f4 a2 bf4 |
  c2( d4 c2.) \bar "||" \break

  c2 d4 c2 bf4 |
  a2 g4 f2. |
  g2 g4 a2 g4 |
  f2 g4 a2. \bar "||" \break

  c2 d4 c2 bf4 |
  a2 g4 f2 f4 |
  g2 g4 a2 g4 |
  f2 g4 a2. \bar "||" \break

  d,2 d4 e2 e4 |
  f2.( c'2.) |
  a2 a4 g2 g4 |
  f2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  c2 d4 f4.( e8) f4 |
  c2( f4 e2) f4 |
  d2 c4 f4.( e8) f4 |
  c2( f4 e2.) |

  f2 f4 e2 g4 |
  f2 e4 f2. |
  e2 d4 e2 e4 |
  f4.( d8) e4 f2. |

  f2 f4 f2 g4 |
  f2 e4 d2 f4 |
  f2 f4 e4.( d8) e4 |
  f2 e4 e2. |

  d2 d4 d2 cs4 |
  d2.( c!2.) |
  c2 f4 f2 e4 |
  f2. \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4
  bf4 |
  a2 bf4 c2 d4 |
  a2( bf4 g2) a4 |
  bf2 a4 c2 d4 |
  a2( bf4 g2.) |

  c2 bf4 g2 c4 |
  c2 bf4 a2. |
  c2 d4 c2 bf4 |
  a2 c4 c2. |

  c2 bf4 c2 c4 |
  c2 bf4 a2 c4 |
  d2 d4 c4.( bf8) c4 |
  a2 c4 c2. |

  f,2 a4 g2 a4 |
  a4.( bf8 a4 g2.) |
  f2 c'4 d2 c4 |
  a2. \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  bf4 |
  f'2 f4 f2 f4 |
  f2.~ f2 f4 |
  f2 f4 f2 f4 |
  f2.( c2.) |

  a2 bf4 c2 e4 |
  f2 c4 d2. |
  c2 bf4 a2 c4 |
  d2 c4 f2. |

  a2 bf4 a2 e4 |
  f2 c4 d2 a'4 |
  bf2 bf,4 c2 c4 |
  d2 c4 a2. |

  d2 f4 e2 a,4 |
  d2.( e2.) |
  f2 a,4 bf2 c4 |
  f2. \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  Good Chris -- tian men, re -- joice,
  With heart, and soul, and voice;
  Give ye heed to what we say:
  Je -- sus Christ is born to -- day;
  Ox and ass be -- fore Him bow,
  And He is in the man -- ger now.
  Christ is born to -- day!
  Christ is born to -- day!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Good Chris -- tian men, re -- joice,
  With heart, and soul, and voice;
  Now ye hear of end -- less bliss:
  Je -- sus Christ was born for this!
  He hath op'd the heav'n -- ly door,
  And man  is bles -- sèd ev -- er -- more.
  Christ was born for this!
  Christ was born for this!
}

verseThree = \lyricmode {
  \set stanza = "3."
  Good Chris -- tian men, re -- joice,
  With heart, and soul, and voice;
  Now ye need not fear the grave:
  Je -- sus Christ was born to save!
  Calls you one and calls you all,
  To gain his ev -- er -- last -- ing hall;
  Christ was born to save!
  Christ was born to save!
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
      tempoWholesPerMinute = #(ly:make-moment 112 4)
    }
  }

  \layout {}
}

