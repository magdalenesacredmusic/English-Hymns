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
      \line {AVE MARIS STELLA   66 66}
    }
    \right-column{
      \line {18th cent.; \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Ave, maris stella"}
      \line {tr. Athelstan Riley}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key e \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  e4 e fs gs |
  fs2 e \bar "||"

  gs4 fs gs8[ a] b4 |
  cs2 b \bar "||"

  b4 b cs b |
  a2 gs \bar "||"

  fs4 gs a gs |
  fs2 e \bar "|."
}

alto = \relative c' {
  \global
  b4 cs ds e |
  e( ds) e2 |

  e4 fs e ds |
  fs4.( e8) ds2 |

  e4 e e8[ fs] gs4 |
  cs,( ds) e2 |

  e4 e ds e |
  e( ds) e2
}

tenor = \relative c' {
  \global
  gs4 gs b b |
  cs( b8[ a]) gs2 |

  b4 b b b |
  b( as) b2 |

  gs4 gs a gs |
  a2 cs2 |

  cs4 b a b |
  cs4( b8[ a]) gs2
}

bass = \relative c {
  \global
  e4 cs b e |
  a,( b) e2 |

  e4 ds e8[ fs] gs4 |
  fs2 b, |

  e4 d cs8[ ds] e4 |
  fs2 cs |

  a'4 gs fs e |
  a,( b) e2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Hail, O Star that point -- est
  Towards the port of heav -- en,
  Thou to whom as maid -- en
  God for Son was giv -- en.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  When the sal -- u -- ta -- tion
  Ga -- bri -- el had spo -- ken,
  Peace was shed up -- on us,
  E -- va's bonds were bro -- ken.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Bound by Sa -- tan's fet -- ters,
  Health and vi -- sion need -- ing,
  God will aid and light us
  At thy gen -- tle plead -- ing.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Je -- su's ten -- der Moth -- er,
  Make thy sup -- pli -- ca -- tion
  Un -- to him who chose thee
  At His In -- car -- na -- tion.
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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
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
          \bold "5. "
          \column {
            "That, O matchless Maiden,"
            "  Passing meek and lowly,"
            "Thy dear Son may make us"
            "  Blameless, chaste and holy."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "So, as now we journey,"
            "  Aid our weak endeavour,"
            "Till we gaze on Jesus,"
            "  And rejoice for ever."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "Father, Son and Spirit,"
            "  Three in One confessing,"
            "Give we equal glory,"
            "  Equal praise and blessing."
          }
        }
      }
      \hspace #1.0

    }
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
          \bold "5. "
          \column {
            "That, O matchless Maiden,"
            "  Passing meek and lowly,"
            "Thy dear Son may make us"
            "  Blameless, chaste and holy."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "So, as now we journey,"
            "  Aid our weak endeavour,"
            "Till we gaze on Jesus,"
            "  And rejoice for ever."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "Father, Son and Spirit,"
            "  Three in One confessing,"
            "Give we equal glory,"
            "  Equal praise and blessing."
          }
        }
      }
      \hspace #1.0

    }
  }
}
  \bottom
}

