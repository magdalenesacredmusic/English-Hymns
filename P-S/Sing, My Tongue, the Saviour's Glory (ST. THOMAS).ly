\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Pange lingua, gloriosi/ Corporis mysterium," Thomas Aquinas (1225-74); Tr. Edward Caswall (1814-78), \italic "Lyra Catholica"
      }
      \wordwrap {
        Music: ST. THOMAS 87 87 87, \italic "Cantus Diversi," John Francis Wade (1711-86); Harm. principally Vincent Novello (1781-1861); Trad. USA ending
      }
    }
  }
}


\header {
  tagline = ""
}

global = {
  \key d \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d4 e fs d |
  e fs g fs |
  b a g fs |
  e e d2 |

  d'4 cs d a |
  b a g fs |
  b cs d cs |
  b b a2 |

  a4 a fs d |
  e fs g fs |
  b a g fs |
  e e d2 \bar "||"
  
  d2 d \bar "|."
}

alto = \relative c' {
  \global
  a4 cs d d |
  a d cs d |
  d d d8[ cs] d4 |
  d cs d2

  fs4 e d d |
  d d cs d |
  fs4. e8 d4 e |
  e4. d8 cs2 |

  d4 e d d |
  cs d d8[ cs] d4 |
  d d d8[ e] d4 |
  d cs d2
  
  b2 a
}

tenor = \relative c {
  \global
  fs4 a a a |
  a a a a |
  g a b8[ g] a4 |
  a4. g8 fs2 |
  a4 g fs fs |
  g a a a |
  d cs b a |
  a gs4 a2 |

  a4 a a a |
  a a g a |
  g a b8[ a] a4 |
  b a8[ g] fs2

  g2 fs
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
  e4 e a,2 |

  fs'4 cs d fs |
  g fs e d |
  g fs b,8[ cs] d4 |
  g, a d2

  g,2 d'
}

verseOne = \lyricmode {
  \vOne
  Sing, my tongue, the Sa -- viour's glo -- ry,
  Of His Flesh the mys -- t'ry sing;
  Of the Blood, all price ex -- ceed -- ing,
  Shed by our im -- mor -- tal King,
  Des -- tined, for the world's re -- demp -- tion,
  From a no -- ble womb to spring.
}

verseTwo = \lyricmode {
  \vTwo
  Of a pure and spot -- less Vir -- gin
  Born for us on earth be -- low,
  He, as Man with man con -- ver -- sing,
  Stay'd, the seeds of truth to sow;
  Then He closed in so -- lemn or -- der
  Won -- drous -- ly His life of woe.
}

verseThree = \lyricmode {
  \vThree
  On the night of that Last Sup -- per,
  Seat -- ed with His cho -- sen band,
  He the Pas -- chal vic -- tim eat -- ing,
  Firt ful -- fulls the Law's com -- mand;	Then, as Food to all His breth -- ren
  Gives Him -- self with His own hand.
}

verseFour = \lyricmode {
  \vFour
  Word made Flesh, the bread of na -- ture
  By His word to Flesh He turns;
  Wine in -- to His Blood He chang -- es:
  What though sense no change dis -- cerns?
  On -- ly be the heart in earn -- est,
  Faith her les -- son quick -- ly learns.
  
  \set stanza = "6."
  A -- men.
}


verseFive = \lyricmode {
  \vFive
  Down in a -- dor -- a -- tion fal -- ling,
  Lo! the sa -- cred Host we hail;
  Lo! o'er an -- cient forms de -- part -- ing,
  New -- er rites of grace pre -- vail;
  Faith, for all de -- fects sup -- ply -- ing,
  Where the fee -- ble sens -- es fail.
}

verseSix = \lyricmode {
  \vSix
  To the Ev -- er -- last -- ing Fa -- ther,
  And the Son who reigns on high,
  With the Ho -- ly Ghost pro -- ceed -- ing
  Forth from Each e -- ter -- nal -- ly,
  Be sal -- va -- tion, ho -- nor, bles -- sing,
  Might, and end -- less ma -- jes -- ty.
  
  A -- men.
}

extraVerses =
 \markup {
  \fontsize #0.2 {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "Down in adoration falling,"
  "Lo! the sacred Host we hail;"
  "Lo! o'er ancient forms departing,"
  "Newer rites of grace prevail;"
  "Faith, for all defects supplying,"
  "Where the feeble senses fail."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "To the Everlasting Father,"
  "And the Son who reigns on high,"
  "With the Holy Ghost proceeding"
  "Forth from Each eternally,"
  "Be salvation, honor, blessing,"
  "Might, and endless majesty."
          }
        }
      }
      \hspace #1.0

    }
  }
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
      % \new Lyrics \lyricsto soprano \verseFive
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
  
\extraVerses
\markup {
  \vspace #0.5
}
  %}
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
      % \new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \include "hymn_hymnal_layout.ly"
  }    
  
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
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
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
      % \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}
