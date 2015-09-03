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
  poet = \markup{ \fontsize #4 \smallCaps "Hark! The Herald Angels Sing"  }
  meter = \markup { \small { Music: Mendelssohn, 7.7.7.7. D, F. Mendelssohn, 1840; arr. William H. Cummings, 1850 } }
  piece = \markup { \small {Text: Charles Wesley, 1730; alt. various, traditional text }}
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

melody = \relative c' {
  \global
  d4 g g4. fs8 |
  g4 b b( a) |
  d d d4. c8 |
  b4 a b2 |
  d,4 g g4. fs8 |
  g4 b b( a) |
  d4 a a4. fs8 |
  fs4 e d2 |

  d'4 d d g, |
  c b b( a)
  d4 d d g, |
  c b b( a)

  e' e e d |
  c b c2 |
  a4 b8[ c] d4. g,8 |
  g4 a b2 |

  e4. e8 e4 d |
  c b c2 |
  a4 b8[ c] d4. g,8 |
  g4 a g2 \bar "|."

}

alto = \relative c' {
  \global
  d4 d d4. d8 |
  d4 g g( fs) |
  g4 fs e a |
  g fs g2 |

  d4 d d4. d8 |
  b4 g' g2 |
  fs4 e fs4. d8 |
  d4 cs d2 |

  d4 d d g |
  a g g( fs) |
  d d d g |
  c g g( fs) |
  c' c c b |
  a gs a2 |
  fs4 fs g4. d8 |
  d4 fs g2 |
  c4 c c b |
  a gs a2 |

  d,4 fs g4. g8 |
  d4 d d2
}

tenor = \relative c' {
  \global
  b4 b b4. a8 |
  g4 d' d2 |
  d4 d e e |
  d d d2 |

  b4 b b4. a8 |
  g4 d' e2 |
  d4 e d4. a8 |
  b4 g fs2 |

  d'4 d d d |
  d d d2 |
  d4 d d d |
  d d d2 |

  e4 e e e |
  e d c2 |
  d4 d d4. b8 |
  b4 d d2 |
  e4 e e d |
  c b c2 |

  d4 d d4. b8 |
  b4 c b2
}

bass = \relative c' {
  \global
  g4 g g d |
  b g d'2 |
  b4 b c c |
  d d g,2 |

  g'4 g g d
  e d cs4.( a8) |
  b4 cs d fs, |
  g a d2 |

  d'4 d d b |
  fs g d2 |
  d'4 d d b |
  fs g d2 |

  c4 c c c |
  c e a2 |
  c4 c b g |
  d d g2 |
  <<
    {
      \stemDown c4 c c b |
      a gs
    } \\ {\teeny c,1~ | c4 e }
  >>
  a( g) |
  fs c' b g |
  d d g2 |
}

verseOne = \lyricmode {
  \set stanza = "1."
  Hark! The her -- ald an -- gels sing,
  "\"Glo-" ry to the new -- born King;
  Peace on earth, and mer -- cy mild,
  God and sin -- ners rec- on- "ciled!\""
  Joy -- ful, all ye na -- tions rise,
  Join the tri -- umph of the skies;
  With th’an -- gel -- ic host pro -- claim,
  "\"Christ" is born in Beth- le- "hem!\""
  Hark! the her -- ald an -- gels sing,
  "\"Glo-" ry to the new -- born "King!\""
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Christ, by high -- est Heav’n a -- dored;
  Christ the ev -- er -- last -- ing Lord;
  Late in time, be -- hold Him come,
  Off -- spring of a vir -- gin’s womb.
  Veiled in flesh the God -- head see;
  Hail th’in -- car -- nate De -- i -- ty,
  Pleased as man with man to dwell,
  Je -- sus our Em -- ma -- nu -- el.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Hail the heav’n -- born Prince of Peace!
  Hail the Sun of Right -- eous -- ness!
  Light and life to all He brings,
  Ris’n with heal -- ing in His wings.
  Mild He lays His glo -- ry by,
  Born that man no more may die.
  Born to raise the sons of earth,
  Born to give them sec -- ond birth.
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
      tempoWholesPerMinute = #(ly:make-moment 92 4)
    }
  }
  \layout { }
}

%{
\markup {
	\normalsize {
	\fill-line {
	\hspace #1.0
	\column {
		\line { \bold "4. "
		\column {
		"Come, Desire of nations, come,"
		"Fix in us Thy humble home;"
		"Rise, the woman’s conqu’ring Seed,"
		"Bruise in us the serpent’s head."
		"Now display Thy saving power,"
		"Ruined nature now restore;"
		"Now in mystic union join"
		"Thine to ours, and ours to Thine."
		"Hark! the herald angels sing,"
		"Glory to the newborn King!"

		}
		}
		\vspace #0.5
		\line { \bold "5. "
		\column {
		"Adam’s likeness, Lord, efface,"
		"Stamp Thine image in its place:"
		"Second Adam from above,"
		"Reinstate us in Thy love."
		"Let us Thee, though lost, regain,"
		"Thee, the Life, the inner man:"
		"O, to all Thyself impart,"
		"Formed in each believing heart."
		"Hark! the herald angels sing,"
		"Glory to the newborn King!"

  		}
		}
		}
	\hspace #1.0

	}
  }
}

%}
