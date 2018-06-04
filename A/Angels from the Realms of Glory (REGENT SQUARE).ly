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
  poet = \markup{ \fontsize #4 \smallCaps "Angels From the Realms of Glory"  }
  meter = \markup { \small { Music: REGENT SQUARE, 87.87.87.; H. Smart, 1866 } }
  piece = \markup { \small {Text: James Montgomery, 1816, 1825; vv. 6-7 possibly anon. }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key bf \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f4 d bf' f |
  d'4. c8 bf4 f |
  g g f bf |
  f ef d2 \bar "||"

  f4 d bf' f |
  d'4. c8 bf4 a |
  bf a g a8[ bf] |
  a4 g f2 \bar "||"

  c'4.^\markup {Refrain} c8 a4 f |
  d'4. c8 bf4 g |
  ef' d c bf |
  bf a bf2 \bar "|."
}

alto = \relative c' {
  \global
  d4 bf f' d |
  f4. f8 f4 f |
  bf, bf bf bf |
  c a bf2 |

  d4 bf f' f8[ ef] |
  d4. ef8 d4 d |
  d d d d |
  f e f2 |

  f4. f8 f4 c |
  d4. d8 ef4 ef |
  g f ef d8[ ef] |
  f4. ef8 d2 \bar "|."
}

tenor = \relative c' {
  \global
  bf4 f f bf |
  bf4. a8 bf4 bf |
  g bf f g |
  f f f2 |

  bf4 bf f f |
  bf4. a8 g4 fs |
  g fs d' c8[ bf] |
  c4 bf a2 |

  a4. a8 c4 a |
  bf4. af8 g4 bf |
  c f, g8[ a] bf4 |
  c c bf2 \bar "|."
}

bass = \relative c {
  \global
  bf4 bf d bf |
  f'4. ef8 d4 d |
  ef ef d g, |
  a f bf2 |

  bf'4 f d d8[ c] |
  bf4. c8 d4 d |
  g d bf g |
  c c f,2 |

  f'4. f8 f4 f |
  bf,4. bf8 ef4 ef |
  c d ef8[ f] g4 |
  f f, bf2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  An -- gels, from the realms of glo -- ry,
  Wing your flight o'er all the earth;
  Ye who sang cre -- a -- tion's sto -- ry,
  Now pro -- claim Mes -- si -- ah's birth:
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Shep -- herds, in the fields a -- bid -- ing,
  Watch -- ing o'er your flocks by night,
  God with man is now re -- sid -- ing,
  Yon -- der shines the in -- fant light;
  
    {
    	\override LyricText.extra-offset = #'(0 . -1.2)
    \override LyricExtender.extra-offset = #'(0 . -1.2)
    \override LyricHyphen.extra-offset = #'(0 . -1.2) 
		    \override LyricText #'font-shape = #'italic  Come and wor -- ship,

	\override LyricText.extra-offset = #'(0 . 0)
    \override LyricExtender.extra-offset = #'(0 . 0)
    \override LyricHyphen.extra-offset = #'(0 . 0)	
    \override LyricText #'font-shape = #'italic
    come and wor -- ship,
    Wor -- ship Christ, the new -- born King.
  }
}

verseThree = \lyricmode {
  \set stanza = "3."
  Sag -- es, leave your con -- tem -- pla -- tions,
  Bright -- er vi -- sions beam a -- far;
  Seek the great De -- sire of na -- tions;
  Ye have seen his na -- tal star;
}

verseFour = \lyricmode {
  \set stanza = "4."
  Saints, be -- fore the al -- tar bend -- ing,
  Watch -- ing long in hope and fear,
  Sud -- den -- ly the Lord, des -- cend -- ing,
  In his tem -- ple shall ap -- pear;
}

verseFive = \lyricmode {
  \set stanza = "5."
  All creation, join in praising
  God, the Father, Spirit, Son,
  Evermore your voices raising
  To th’eternal Three in One.
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \layout {}
  }

  %{ The orgininal verses 5-7 are found below.
\markup {
	\normalsize {
	\fill-line {
	\hspace #1.0
	\column {
		\line { \bold "5. "
		\column {
		"Sinners, wrung with true repentance,"
		"  Doomed for guilt to endless pains,"
		"Justice now revokes the sentence,"
		"  Mercy calls you; break your chains."
		}
		}
		\vspace #0.5
		\line { \bold "6. "
		\column {
		"Though an Infant now we view Him,"
		"  He shall fill His Father’s throne,"
		"Gather all the nations to Him;"
		"  Every knee shall then bow down:"
  		}
		}
		\vspace #0.5
		\line { \bold "7. "
		\column {
		"All creation, join in praising"
		"  God, the Father, Spirit, Son,"
		"Evermore your voices raising"
		"  To th’eternal Three in One."
		}
		}
		}
	\hspace #1.0

	}
  }
} %}


