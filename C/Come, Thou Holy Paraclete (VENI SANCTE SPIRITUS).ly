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
  poet = \markup{ \fontsize #4 \smallCaps "Come, Thou Holy Paraclete"  }
  meter = \markup { \small { Music: VENI SANCTE SPIRITUS, 777. D.; S. Webbe the elder} }
  piece = \markup { \small {Text: \italic "Veni, sancte Spiritus," 13th cent.; tr. J.M. Neale }}
  %breakbefore
  %copyright = ""
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
  f4 f f g |
  a4. g8 f2 \bar "||"

  g4 a g c |
  c b c2 \bar "||"

  d4 c bf a |
  g4. f8 f2 \bar "||"

  f4 bf a bf8[ c] |
  d4 c bf2 \bar "||"

  a4 c bf a |
  g f e2 \bar "||"

  g4 bf a g |
  f e f2 \bar "|."
}

alto = \relative c' {
  \global
  f4 f f f |
  f e f2 |

  c4 f g g |
  g g8[ f] e2 |

  f4 f f8[ e] f4 |
  f e f2 |

  f4 f ef f |
  f ef d2 |

  f4 c d8[ e] f4 |
  d d c2 |

  e4 f8[ g] f4 d |
  c4. bf8 a2
}

tenor = \relative c' {
  \global
  a4 d c d |
  c bf a2 |

  c4 c c e |
  d d c2 |

  bf4 c d8[ bf] c4 |
  c bf a2 |

  bf4 bf c d8[ c] |
  bf4 a bf2 |

  c4 a bf c |
  d bf g2 |

  g4 d'8[ c] c4 bf |
  a g f2
}

bass = \relative c, {
  \global
  f4 bf a bf |
  c c f2 |

  e4 f e c |
  g' g c,2 |

  bf'4 a g f |
  c c f,2 |

  d'4 d c bf |
  f' f bf,2 |

  f'4 a g f |
  bf, g c2 |

  c4 d8[ e] f4 bf, |
  c c f,2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Come, Thou ho -- ly Pa -- ra -- clete,
  And from Thy ce -- les -- tial seat
  Send Thy light and bril -- lian -- cy:
  Fa -- ther of the poor draw ear;
  Giv -- er pf all gifts, be here;
  Come, the soul's true ra -- dian -- cy:
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Come, of com -- for -- ters the best,
  Of the soul the sweet -- est guest,
  Come in toil re -- fresh -- ing -- ly:
  Thou in la -- bour rest most sweet,
  Thou art sha -- dow from the heart,
  Com -- fort in ad -- ver -- si -- ty.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O Thou Light, most pure and blest,
  Shine with -- in the in -- most breat
  Of Thy faith -- ful com -- pan -- y.
  Where Thou art not, man hath nought;
  Ev -- 'ry ho -- ly deed and thought
  Comes form Thy Di -- vin -- i -- ty.
}

verseFour = \lyricmode {
  \set stanza = "4."
  What is soil -- èd, make Thou pure;
  What is wound -- ed, work its cure;
  What is parch -- èd, fruc -- ti -- fy;
  What is ri -- gid, gent -- ly bend;
  What is fro -- zen, warm -- ly tend;
  Straight -- en what goes err -- ing -- ly.
}


verseFive = \lyricmode {
  \set stanza = "5."
  Fill Thy faith -- ful, who con -- fide
  In Thy pow'r to guard and guide,
  With Thy sev'n -- fold Mys -- ter -- y.
  Here Thy grace and vir -- tue send:
  Grant sal -- va -- tion in the end,
  And in heav'n fe -- li -- ci -- ty.
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
      \context Lyrics = four \lyricsto sopranos \verseFour
      \context Lyrics = five \lyricsto sopranos \verseFive

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
      tempoWholesPerMinute = #(ly:make-moment 84 4)
    }
  }

  \layout {}
}


