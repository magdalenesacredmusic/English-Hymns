%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: James Montgomery (1771-1854), 1816, 1825
      }
      \wordwrap {
        Music: REGENT SQUARE, 87 87 87, Henry Smart (1813-79), 1866
      }
    }
  }
}

top = \markup {
\fill-line {
      \column {
          \line {REGENT SQUARE 87 87 87}
      }
      \column{
      \line {Henry Smart (1813-79), 1866}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {James Montgomery, 1816, 1825; vv. 6-7 possibly anon.}
   }
  } 
}

\header {
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
  f ef d2 \bar "|"

  f4 d bf' f |
  d'4. c8 bf4 a |
  bf a g a8[ bf] |
  a4 g f2 \bar "|" %\break

  c'4.^\markup {\smallCaps Refrain.} c8 a4 f |
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
  \vOne
  An -- gels, from the realms of glo -- ry,
  Wing your flight o'er all the earth;
  Ye who sang cre -- a -- tion's sto -- ry,
  Now pro -- claim Mes -- si -- ah's birth:
}

verseTwo = \lyricmode {
  \vTwo
  Shep -- herds, in the fields a -- bid -- ing,
  Watch -- ing o'er your flocks by night,
  God with man is now re -- sid -- ing,
  Yon -- der shines the in -- fant light;
  
   
}

verseThree = \lyricmode {
  \vThree
  Sag -- es, leave your con -- tem -- pla -- tions,
  Bright -- er vi -- sions beam a -- far;
  Seek the great De -- sire of na -- tions;
  Ye have seen his na -- tal star;
  
   {
      \override LyricText #'font-shape = #'italic  
 \unset shortVocalName
 Come and wor -- ship,
    come and wor -- ship,
    Wor -- ship Christ, the new -- born King.
  }
}

verseFour = \lyricmode {
  \vFour
  Saints, be -- fore the al -- tar bend -- ing,
  Watch -- ing long in hope and fear,
  Sud -- den -- ly the Lord, des -- cend -- ing,
  In his tem -- ple shall ap -- pear;
}

verseFive = \lyricmode {
  \vFive
  All cre -- a -- tion, join in prais -- ing
  God, the Fa -- ther, Spir -- it, Son,
  Ev -- er -- more your voic -- es rais -- ing
  To th’e -- ter -- nal Three in One.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
 % \top
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
      \new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_layout.ly"
  }
  %\bottom
  \refs
}

%%%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 16)
#(define output-suffix "Hymnal")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  %\top
  \score { %\transpose c d
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      \new Lyrics \lyricsto soprano \verseFour
      \new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_hymnal_layout.ly"
  }    
  \refs
  %\bottom
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
 % \top
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
      \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \refs
  %\bottom
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


