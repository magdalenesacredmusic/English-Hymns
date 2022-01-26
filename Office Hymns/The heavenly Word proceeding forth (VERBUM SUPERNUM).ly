\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \tiny {
  \fill-line {
    \column {
      \line {VERBUM SUPERNUM}
    }
    \right-column{
      \line {\italic "Antiphonale Romanum"}
      \line {Harm. David O'Donnell, 2022}
    }
  }
  }
}

bottom = \markup  {
  \tiny {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Verbum supernum prodiens, nec Patris"}
      \line {Thomas Aquinas (1227-74)}
      \line {Tr. J.M. Neale (1818-66)}
    }
  } 
}
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g8 g8[( a] c[ b a]) g[ f] a[ g] a[ b a] g f g4 \hb
  g8 b c d c[ b] a[ g] a c4 \bar "|"
  c8 a c g g[ a] \bar "" \break a[ g] f g4 \hb 
  f8 a[ g] a[ c] c[ b] a[ g] e f g4 \bar "||"
  g8[ a g] f4( g) \bar "|."
}

alto = \relative c' {
  \global
  c8~ c4~ c4.~ c2 c4. c4 b4~
  b8 e4.~ e4 f4. e4~
  e8~ e4.~ e4 c4.~ c4
  d8~ d2 e c4 d
  
  e4. d4~ d4
}

tenor = \relative c {
  \global
  e8~ e4~ e4. f2~ f4. d4~ d4~
  d8 g4. a4~ a4.~ a4~
  a8~ a4 b8 c4~ c4. g4
  a8 f2 a2~ a4 b
  
  c4. a4 b
}

bass = \relative c {
  \global
 c8~ c4 a4.~ a2 f4. g4~ g~
 g8 e'4. c4 d4. a4~
 a8 c4.~ c4 f4. e4
 d8~ d2 c a4 g
 
 c4. d4 g,
}

verseOne = \lyricmode {
  \vOne
  The heav'n -- ly Word pro -- ceed -- ing forth
  Yet leav -- ing not his Fa -- ther's side,
  And go -- ing to his work on earth,
  Had reached at length life's ev -- en -- tide.
}

verseTwo = \lyricmode {
  \vTwo
  By false dis -- ci -- ple to be giv'n
  To foe -- men for his blood a -- thirst,
  Him -- self, the liv -- ing bread from heav'n,
  He gave to his dis -- ci -- ples first.
}

verseThree = \lyricmode {
  \vThree
  In two -- fold form of sac -- ra -- ment,
  He gave his flesh, he gave his blood,
  That man, of soul and bo -- dy blent,
  Might whol -- ly feed on mys -- tic food.
}

verseFour = \lyricmode {
  \vFour
  In birth man's fel -- low man was he,
  His meat while sit -- ting at the board;
  He died, our ran -- som -- er to be,
  He reigns to be our great re -- ward.
  \set stanza = "6." A -- men.
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
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "O saving Victim, opening wide"
            "  The gate of heaven to man below;"
            "Our foes press hard on every side,"
            "  Thine aid supply, thy strength bestow."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "All praise and thanks to thee ascend"
            "  For evermore, blest One in Three;"
            "O grant us life that shall not end,"
            "  In our true native land with thee.  Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}
  \bottom
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Hymnal")
\book {
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  \top
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
    \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "O saving Victim, opening wide"
            "  The gate of heaven to man below;"
            "Our foes press hard on every side,"
            "  Thine aid supply, thy strength bestow."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "All praise and thanks to thee ascend"
            "  For evermore, blest One in Three;"
            "O grant us life that shall not end,"
            "  In our true native land with thee.  Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
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
      \new Lyrics \lyricsto "tune" { \verseFour}
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
    \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "O saving Victim, opening wide"
            "  The gate of heaven to man below;"
            "Our foes press hard on every side,"
            "  Thine aid supply, thy strength bestow."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "All praise and thanks to thee ascend"
            "  For evermore, blest One in Three;"
            "O grant us life that shall not end,"
            "  In our true native land with thee.  Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}
  \bottom
}
