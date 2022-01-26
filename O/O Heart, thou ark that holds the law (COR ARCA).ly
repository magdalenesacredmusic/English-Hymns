\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \tiny {
  \fill-line {
    \column {
      \line {COR ARCA}
    }
    \right-column{
      \line {from an 18th cent. Slovak Melody}
      \line {Arr. Edward C. Currie}
    }
  }
}
}

bottom = \markup  {
  \tiny {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Cor, arca legem continens"}
      \line {Tr. John Fitzpatrick, O.M.I., c. 1930}
    }
  }
}
}

\header {
  tagline = ""
}

% this is a version of WER NUR DEN LIEBEN GOTT, from The New St. Basil Hymnal, 1958 credited as a Slovak Melody. Is a Long Meter tune
global = {
  \key a \major
  \time 2/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  cs2 |
  fs4 gs |
  a gs |
  fs d cs \bar ""
  
  e4 |
  e d
  cs fs |
  fs es |
  fs \bar ""
  
  gs4 |
  a b cs cs 
  b b 
  a \bar ""
  
  cs4 |
  b a 
  gs fs8[ gs]
  a4 gs |
  fs2 \bar "||"
  
  \time 4/4 fs2 fs \bar "|."
}

alto = \relative c' {
  \global
  cs2
  d4 d 
  cs cs8[ b] |
  a4 b 
  cs
  
  b |
  a b a a d cs8[ b] |
  a4
  
  cs4 |
  cs e 
  e fs 
  fs gs
  a
  
  fs4 |
  fs fs 
  d fs
  fs fs8[ es] |
  fs2
  
  d2 cs
}

tenor = \relative c' {
  \global
  a2 |
  a4 b 
  a es |
  fs fs 
  fs
  
  e4 |
  fs e e fs 
  gs gs
  fs
  
  es |
  e gs |
  a a 
  d d
  cs 
  
  cs4 |
  d cs b a8[ b] |
  cs4 b 
  a2
  
  b2 a
}

bass = \relative c {
  \global
 fs4( e) |
 d b 
 fs cs'
 d8[ cs] b4 |
 a
 
 gs |
 fs gs |
 a d8[ cs] |
 b4 cs 
 fs, 
 
 cs'4 |
 a d |
 cs d |
 b e |
 a,
 
 a4 |
 gs a |
 b d |
 cs cs 
 fs2
 
 b,2 fs'2
}

verseOne = \lyricmode {
  \vOne
  O Heart! thou ark which holds the Law,
  Not of the ser -- vi -- tude of old,
  But that from which we par -- don draw;
  And grace, and mer -- cies man -- i -- fold.
}

verseTwo = \lyricmode {
  \vTwo
  Heart, thou in -- vi -- o -- la -- ble shrine
  Where God's new cov -- e -- nant has lain;
  Tem -- ple, than Sa -- lem's more di -- vine;
  Veil, bet -- ter than its veil in twain.
}

verseThree = \lyricmode {
  \vThree
  With such a wound as must ap -- pear,
  Love willed that thou shouldst wound -- ed be,
  That we might all the wounds re -- vere,
  Which love doth bear in -- vis -- i -- bly
}

verseFour = \lyricmode {
  \vFour
  'Neath love's own sym -- bol, suff -- 'ring twice,
  Things mys -- ti -- cal and blood -- y both,
  Christ, as a priest, in sac -- ri -- fice
  To heav'n up -- lift -- ed, noth -- ing loath.
  
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
            "Who would not love for love repay?"
            "What man, redeemed, could love refuse"
            "To this Heart, or herein, for aye,"
            "His Tabernacle fail to choose?"
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "All glory be to thee, O Lord,"
            "Who from thy Heart all grace outpour;"
            "With Father and with Spirit blest"
            "In every age, for evermore.   Amen."
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
            "Who would not love one loving him,"
            "  Who bought him back by grace,"
            "And choose within his Sacred Heart"
            "  A lasting dwelling place?"
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "All praise to thee, O Lord, whose Heart"
            "  Of grace is a rich store,"
            "To Father and to Comforter"
            "  Now and forevermore.   Amen."
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
            "Who would not love one loving him,"
            "  Who bought him back by grace,"
            "And choose within his Sacred Heart"
            "  A lasting dwelling place?"
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "All praise to thee, O Lord, whose Heart"
            "  Of grace is a rich store,"
            "To Father and to Comforter"
            "  Now and forevermore.   Amen."
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
