%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {ST. THEOCTISTUS 76 76 88 77}
    }
    \right-column{
      \line {Frederick A. Gore Ouseley, 1882}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Greek, Theoctistus of the Studium, C. 890}
      \line {tr. John Mason Neale}
    }
  } 
}

\header {
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
  b4 b g g |
  e'4. e8 d2 \bar "||"

  d4 b g c |
  b2 a \bar "||"

  b4 fs g b |
  a e fs2 \bar "||"

  d'4 b a fs |
  e2 d \bar "||"

  \time 2/4 d4 e8[ fs] \bar "|"
  \time 4/4g4 b d4. c8 |
  c4 b \bar "||"

  e,4 fs8[ gs] |
  a4 c e4. d8 |
  d4 c \bar "||" \break

  c4 b |
  a b c c |
  b2 \bar "||"
  b4 e, |
  c'4 b8[ a] g4 a |
  g1 \bar "|."
}

alto = \relative c'' {
  \global
  g4 fs g g |
  g g g2 |

  d4 fs e e |
  b( cs) d2 |

  b4 ds e g8[ fs] |
  e4 cs d2 |

  d4 e fs d |
  d( cs) d2

  d4 d |
  d d d fs |
  fs g

  e e |
  e e e gs |
  gs a

  a gs |
  a d, e fs8[ e] |
  ds2

  e4 e |
  e8[ fs] g[ e] d4 c |
  b1 \bar "|."
}

tenor = \relative c' {
  \global
  d4 d b d |
  d c b2 |

  a4 b b a8[ g] |
  g4( e) fs2 |

  fs4 b b b |
  e, a a2 |

  b4 g fs a |
  b( a) fs2 |

  fs4 g8[ a] |
  g4 g a a |
  a b

  gs a8[ b] |
  a4 a b b |
  b c

  c d |
  e d c a8[ g] |
  fs2

  g4 b |
  c d8[ c] b4 fs |
  g1 \bar "|."
}

bass = \relative c' {
  \global
  g4 d e b |
  c e g2 |

  fs4 d e a, |
  d2 d |

  ds4 b e4. d8 |
  cs4 a d2 |

  b4 cs d fs |
  g( a) d,2 |

  d4 c |
  b g' fs d |
  g g,

  e' d |
  c a' gs e |
  a a,

  a b |
  c b a fs |
  b2

  e4 g |
  a8[ a,] b[ a] d4 d |
  g,1 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  Je -- sus, Name all names a -- bove,
  Je -- sus, best and dear -- est,
  Je -- sus, Fount of per -- fect love,
  Ho -- liest, tend' -- rest, near -- est;
  Je -- sus, source of grace com -- plet -- est,
  Je -- sus pur -- est, Je -- sus sweet -- est,
  Je -- sus, Well of pow'r Di -- vine,
  Make me, keep me, seal me Thine!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Je -- sus, o -- pen me the gate
  That of old he en -- tered,
  Who, in that most lost es -- tate,
  Whol -- ly on Thee ven -- tured;
  Thou, Whose Wounds are ev -- er plead -- ing,
  And Thy Pas -- sion in -- ter -- ced -- ing,
  From my mis' -- ry let me rise
  To a Home in Pa -- ra -- dise!
}

verseThree = \lyricmode {
  \set stanza = "3."
  Thou didst call the Pro -- di -- gal:
  Thou didst par -- don Ma -- ry:
  Thou Whose words can nev -- er fall,
  Love can nev -- er va -- ry:
  Lord, to heal my lost con -- di -- tion,
  Give- for Thou canst give- con -- tri -- tion,
  Thou canst par -- don all mine ill
  If Thou wilt: O say, 'I will!'
}

verseFour = \lyricmode {
  \set stanza = "4."
  Woe, that I have turn -- ed a -- side
  After flesh -- ly plea -- sure!
  Woe, that I have nev -- er tried
  For the Heav' -- nly Trea -- sure!
  Trea -- sure, safe in Home su -- per -- nal;
  In -- cor -- rup -- ti -- ble, e -- ter -- nal!
  Trea -- sure no less price hath won
  Than the Pas -- sion of The Son!
}


\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_layout.ly"
  }
  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "4. "
          \column {
            " Jesus, crowned with Thorns for me,"
            "   Scourged for my transgression,"
            " Witnessing, through agony,"
            "   That Thy good confession!"
            "Jesus, clad in purple raiment,"
            "For my evils making payment;"
            " Let not all Thy woe and pain,"
            " Let not Calv'ry, be in vain!"
          }
        }
        \vspace #1
        \line {
          \bold "5. "
          \column {
            " When I reach Death’s bitter sea"
            "   And its waves roll higher,"
            " Help the more forsaking me"
            "   As the storm draws nigher:"
            "Jesus, leave me not to languish,"
            "Helpless, hopeless, full of anguish!"
            " Tell me,— 'Verily I say,"
            " Thou shalt be with Me today!'"
          }
        }
      }
      \hspace #1.0

    }
        \vspace #1
  }
}
  \bottom
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  \top
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "4. "
          \column {
            " Jesus, crowned with Thorns for me,"
            "   Scourged for my transgression,"
            " Witnessing, through agony,"
            "   That Thy good confession!"
            "Jesus, clad in purple raiment,"
            "For my evils making payment;"
            " Let not all Thy woe and pain,"
            " Let not Calv'ry, be in vain!"
          }
        }
        \vspace #1
        \line {
          \bold "5. "
          \column {
            " When I reach Death’s bitter sea"
            "   And its waves roll higher,"
            " Help the more forsaking me"
            "   As the storm draws nigher:"
            "Jesus, leave me not to languish,"
            "Helpless, hopeless, full of anguish!"
            " Tell me,— 'Verily I say,"
            " Thou shalt be with Me today!'"
          }
        }
      }
      \hspace #1.0

    }
    \vspace #1
  }
}
  \bottom
}



