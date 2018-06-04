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
  poet = \markup{ \fontsize #4 \smallCaps "With Golden Splendour"  }
  meter = \markup { \small { Music: ANNUE CHRISTE, 1212.1212.; from La Feillée, \italic "Méthode du plain-chant;" harm. \italic "The English Hymnal"} }
  piece = \markup { \small {Text: \italic "Aurea luce," ascribed to Elbis, c. 500; tr. T.A. Lacy }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

ignore = \override NoteColumn #'ignore-collision = ##t

global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g2^\markup { \italic "To be sung in unison."} g4 a |
  b2 b |
  b4 a b c |
  <g b>2 a4.( g8) |
  g1 \bar "||"

  b2 b4 c |
  d2 d |
  g,4 e fs g |
  fs2 e4.( d8) |
  d1 \bar "||"

  g2 e4 fs |
  g2 g |
  a4 g a b |
  c2 b4.( a8) |
  a1 \bar "||"

  d2 b4 g |
  c2 b |
  g4 a b c |
  b2 a4.( g8) |
  g1 \bar "|."
}

alto = \relative c' {
  \global
  <b d>2 << \ignore {\stemDown b4 c}\\{\stemDown \once \override NoteColumn #'force-hshift = #0.5 g'2}>> |
  <d g>2 <d g>~ |
  <c g'> <d g>4 <e g> |
  d4 e fs2 |
  d1 |

  g2 g4 g8[ a]
  <fs b>2~ <fs a> |
  d2 d4 d |
  d2 cs |
  s1 |

  d2 d4 c |
  d2 d |
  e fs4 gs |
  a2 gs |
  e1 |

  <g b>2 fs4 e |
  g2 fs |
  e4 c e <e a> |
  g2 <d fs> |
  d1
}

tenor = \relative c' {
  \global
  g1~ |
  g1~ |
  g1 |
  d'2 c |
  b1 |

  d2 d4 c |
  b2 a |
  g2 a4 b |
  a b <g cs>2 |
  <fs a>1 |

  g2 g4 a |
  c2 b |
  b d |
  e2. d4 |
  c1 |
  g2 d'4 b |
  e2 d |
  b4 a gs a |
  d e a, c |
  b1
}

bass = \relative c {
  \global
  g1~ |
  g2 g'4 fs |
  e2 d4 c |
  d1 |
  g |

  g2 fs4 e |
  d2 c |
  b a4 g |
  a1 |
  d |

  b2 b4 a |
  g2 g'4 fs |
  e4. d8 c4 b |
  a c e2 |
  a,1 |

  b2 d4 e |
  a a, b c8[ d] |
  e4 f e a, |
  b c d2 |
  g,1

}

verseOne = \lyricmode {
  \set stanza = "1."
  With gol -- den splen -- dour and with ro -- seate hues of morn,
  O gra -- cious Sa -- viour, Light of light, the day a -- doren,
  Which brings to ran -- somed sin -- ners hopes of that far home
  Where saints and an -- gels sing the praise of mar -- tyr -- dom.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Lo, the Key -- bear -- er, lo, the Teach -- er of man -- kind,
  Lights of the world and judg -- es sent to loose and bind,
  A -- like tri -- um -- phant or by cross or sword -- stroke found,
  In life's high Se -- nate stand with vic -- tor's lau -- rel crowned.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Good Shep -- herd, Pe -- ter, un -- to whom the charge was giv'n
  To close or o -- pen ways of pil -- gri -- mage to heav'n,
  In sin's hard bon -- dage held may we have grace to know
  The full re -- mis -- sion thou wast grant -- ed to be -- stow.
}

verseFour = \lyricmode {
  \set stanza = "4."
  O no -- ble Teach -- er, Paul, we trust to learn of thee
  Both earth -- ly con -- verse and the flight of ec -- sta -- sy;
  Till from the fa -- ding truths that now we know in part
  We pass to ful -- ness of de -- light for mind and heart.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Twin o -- live branch -- es, pour -- ing oil of glad -- ness forth,
  Your prayers shall aid us, that for all our lit -- tle worht,
  Be -- liev -- ing, hop -- ing, lov -- ing, we for whom ye plead,
  This bo -- dy dy -- ing, may at -- tain to life in -- deed.
}

verseSix = \lyricmode {
  \set stanza = "6."
  Now to the glo -- rious Trin -- i -- ty be du -- ly paid
  Wor -- ship and ho -- nour, praise and ser -- vice un -- a -- fraid,
  Who in un -- chang -- ing U -- ni -- ty, one Lord sub -- lime,
  Hath ev -- er lived as now and to un -- end -- ing time.
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
      tempoWholesPerMinute = #(ly:make-moment 96 4)
    }
  }
  \layout {}
}



