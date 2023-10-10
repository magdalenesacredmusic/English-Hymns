%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Prome vocem, mens, canoram," Claude de Santeüil; tr. H.W. Baker and J. Chandler
      }
      \wordwrap {
        Music: ST. THOMAS  87 87 87, John Francis Wade, 1751, alt. American traditional
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {ST. THOMAS  87 87 87}
    }
    \right-column{
      \line {John Francis Wade, 1751}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Prome vocem, mens, canoram"}
      \line {Claude de Santeüil; tr. H.W. Baker and J. Chandler}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

%%%%% British melody %%%%%%%

melody = \relative c' {
  \global
  d4 e fs d |
  e fs g fs |

  b a g fs |
  e e d2 |

  d'4 cs d a |
  b a g fs |

  b4 cs d cs |
  b b a2 |

  a4 a fs d |
  e fs g fs |

  b a g fs |
  e e d2 \bar "|."
}

alto = \relative c' {
  \global
  a4 cs d d |
  a d cs d |

  d d d8[ cs] d4 |
  d cs d2 |

  fs4 e d d |
  d d cs d |

  fs4. e8 d4 e |
  e4. d8 cs2 |

  d4 e d d |
  cs d d8[ cs] d4 |

   d d d8[ e] d4 |
  d cs d2 \bar "|."
}

tenor = \relative c {
  \global
  fs4 a a a |
  a a a a |

  g a b8[ g] a4 |
  a4. g8 fs2 |

  a4 g fs fs |
  g a a a |

  d cs b a! |
  a gs a2 |

  a4 a a a |
  a a g a |

 g a b8[ a] a4 |
	b a8[ g] fs2  \bar "|."
}

bass = \relative c {
  \global
  d4 a d fs |
  cs d e d |

  g fs e d |
  a a d2 |

  d4 e fs d |
  g fs e d |

  b as b cs8[ d] |
  e4  << {\voiceTwo \override Stem #'length = #4.5 e4 } \\ {\voiceFour \ignore \teeny \shiftOff e,4 } >> a2 |

  fs'4 cs d fs |
  g fs e d |

 g fs b,8[ cs] d4 |
	g, a d2 \bar "|."
}

verseOne = \lyricmode {
  \vOne
  Now, my soul, thy voice up -- rais -- ing,
  Tell in sweet and mourn -- ful strain
  How the Cru -- ci -- fied, en -- dur -- ing
  Grief, and wounds, and dy -- ing pain,
  Free -- ly of His love was of -- fered,
  Sin -- less was for sin -- ners slain.
}

verseTwo = \lyricmode {
  \vTwo
  Scourged with un -- re -- lent -- ing fu -- ry
  For the sins which we de -- plore,
  By His liv -- id stripes He heals us,
  Rais -- ing us to fall no more;
  All our bruis -- es gent -- ly sooth -- ing,
  Bind -- ing up the bleed -- ing sore.
}

verseThree = \lyricmode {
  \vThree
  See! His hands and feet are fast -- ened
  So He makes His peo -- ple free;
  Not a wound whence blood is flow -- ing
  But a fount of grace shall be;
  Yea the ve -- ry nails which nail Him
  Nail us al -- so to the tree.
}


verseFour = \lyricmode {
  \vFour
  Through His heart the spear is pierc -- ing,
  Though His foes have seen Him die;
  Blood and wa -- ter thence are stream -- ing
  In a tide of mys -- ter -- y,
  Wa -- ter from our guilt to cleanse us,
  Blood to win us crowns on high.
}

verseFive = \lyricmode {
  \vFive
  Je -- sus, may those pre -- cious foun -- tains
  Drink to thirst -- ing souls af -- ford:
  Let them be our cup and heal -- ing,
  And at length our full re -- ward;
  So a ran -- somed world shall ev -- er
  Praise Thee, its re -- deem -- ing Lord.
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
      }
    }
    \include "hymn_layout.ly"
  }
  % \bottom
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
  %  \top
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
  % \bottom
  \refs
}
