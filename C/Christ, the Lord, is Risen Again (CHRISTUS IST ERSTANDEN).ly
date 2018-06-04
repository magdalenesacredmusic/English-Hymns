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
  poet = \markup{ \fontsize #4 \smallCaps "Christ, the Lord, is Risen Again"  }
  meter = \markup { \small { Music: CHIRST IST ERSTANDEN, 77.77.; German, 13th cent.; harm. anon.} }
  piece = \markup { \small {Text: \large \override #'(font-name . "CloisterBlack")  "Christus ist erstanden," M. Weisse, 1531; tr. C. Winkworth, 1858 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key a \minor
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a4 a g a |
  c d a2 \bar "||"
  a4 g a f |
  e f d2 \bar "||" \break

  g4 g d c |
  f g a2 \bar "||"

  a4 g a f |
  e f d e~ |
  e cs4 d2 |
  d1 \bar "||" \break

  a'2^\markup {\italic "After 2nd, 4th, and 6th verses."} g4 ( f) |
  g( bf) a2 |
  c2 a4( c) |
  a( g) f2 |
  a2 f4( d) |
  e( f) d2 \bar "||"

  g4 g d c |
  f g a2 \bar "||"
  a4 g a f |
  e f d e~ |
  e cs d2 |
  d1 \bar "||" \break

  d2 d \bar "|."
}

alto = \relative c' {
  \global
  e4 e e c |
  g' f e2 |
  f4 e cs d |
  cs cs d2 |

  bf4 bf bf c |
  d d cs2
  d4 d cs d |
  d cs d cs~ |
  cs a a2 |
  a1 |

  c2 c4( d) |
  d2 f |
  f f4( g) |
  f( e) f2 |
  c2 d4( d) |
  d( cs) d2

  bf4 bf a c |
  c d cs2 |

  d4 d cs d |
  d cs d cs~ |
  cs a a2 |
  a1

  bf2 a
}

tenor = \relative c' {
  \global
  c4 c b a |
  g a cs2 |
  d4 bf a a |
  a a f2 |

  g4 g f g |
  a g e2 |
  f4 bf a a |
  a a f a~ |
  a e f2 |
  f1 |

  f2 g4 ( a) |
  bf2 d |
  c d4( c) |
  c2 a |
  f f4( g) |
  a2 f2 |

  g4 g f g |
  a g e2 |

  f4 bf a a |
  a a f a~ |
  a e f2 |
  f1 |

  g2 fs
}

bass = \relative c' {
  \global
  a4 a e f |
  e d a2 |
  d4 g e d |
  a a d2 |

  g,4 g d' e |
  d bf a2 |
  d4 g8[ f] e4 d |
  a a d a~ |
  a a d2 |
  d1 |

  f2 e4( d) |
  g2 d |
  a d4( e) |
  f( c) f2 |
  f2 d4( bf) |
  a2 d |

  g,4 g d' e |
  f bf, a2 |
  d4 g8[ f] e4 d |
  a a d a~ |
  a a d2 |
  d1 |

  g,2 d'

}

verseOne = \lyricmode {
  \set stanza = "1."
  Christ the Lord is ris'n a -- gain;
  Christ hath bro -- ken ev' -- ry chain
  Hark! an -- gel -- ic voi -- ces cry,
  Sing -- ing ev -- er -- more on high,
  Al -- le -- lu -- ia!

  Al -- le -- lu -- ia! Al -- le -- lu -- ia!
  Al -- le -- lu -- ia!
  Hark, an -- gel -- ic voi -- ces cry,
  Sing -- ing ev -- er -- more on high,
  Al -- le -- lu -- ia!
  A -- men.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  He Who gave for us His life,
  Who for us en -- dured the strife,
  Is our Pas -- chal Lamb to -- day;
  We too sing for joy, and say:
  Al -- le -- lu -- ia!
}

verseThree = \lyricmode {
  \set stanza = "3."
  He Who bore all pain and loss
  Com -- fort -- less up -- on the Cross,
  Lives in glo -- ry now on high,
  Pleads for us, and hears our cry:
  Al -- le -- lu -- ia!
}

verseFour = \lyricmode {
  \set stanza = "4."
  He Who slum -- bered in the grave,
  Is ex -- alt -- ed now to save;
  Through the u -- ni -- verse it rings
  That the Lamb is King of kings,
  Al -- le -- lu -- ia!
}


verseFive = \lyricmode {
  \set stanza = "5."
  Now he bids us tell a -- broad,
  How the lost may be re -- stored,
  How the pen -- i -- tent for -- giv'n,
  How we too may en -- ter heav'n.
  Al -- le -- lu -- ia!
}

verseSix = \lyricmode {
  \set stanza = "6."
  Thou, our Pas -- chal Lamb in -- deed,
  Christ, Thy ran -- somed peo -- ple feed;
  Take our sins and guilt a -- way,
  That we all may sing for aye:
  Al -- le -- lu -- ia!
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
      \context Lyrics = six \lyricsto sopranos \verseSix

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

  \layout {
    ragged-last = ##t
  }
}


