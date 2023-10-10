\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: John Cummins (1795-1867), Ed. \italic "The English Hymnal," 1906
      }
      \wordwrap {
        Music: ST. RAPHAEL  87 87 47, Edward John Hopkins (1818-1901)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {ST. RAPHAEL  87 87 47}
    }
    \right-column{
      \line {E.J. Hopkins (1818-1901)}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {John Cummins (1795-1867)}
      \line {ed. \italic "The English Hymnal"}
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
  g4 g fs g |
  e4. fs8 g4 d |
  e fs g c |
  a4. g8 g2 |
  
  g4 g fs g |
  g c b fs |
  b4. b8 a4 d |
  cs4. d8 d2 |
  
  a4 g fs d |
  e fs g b |
  a2 a |
  g1

\bar "|."
}

alto = \relative c' {
  \global
  b4 b c d |
  c c b b |
  c c b e |
  d c b2 |
  
  b4 c d d |
  e e ds ds |
  e4 d d fs |
  e4. d8 d2 |
  
  c4 b a d |
  d c b d |
  c2 c |
  b1
}

tenor = \relative c' {
  \global
  d,4 d d g |
  g a d, g |
  g a g g |
  g fs g2 |
  
  g4 g a g |
  g e fs b |
  e, es fs a |
  g4. fs8 fs2 |
  
  fs4 g a b |
  b a g gs |
  a( e) fs2 |
  g1
}

bass = \relative c {
  \global
 g4 g a b |
 c a g g |
 c a e' c |
 d4. d8 g,2 |
 
 e'4 e d b |
 c c b b |
 gs gs a a |
 a4. d8 d2 |
 
 d4 d d b |
 c d e e |
 a,2 d |
 g,1
}

verseOne = \lyricmode {
  \vOne
  Je -- sus, Lord of life and glo -- ry,
  Bend from heav'n -- thy gra -- cious ear;
  While our wait -- ing souls a -- dore thee,
  Friend of help -- less sin -- ners, hear:
  By thy mer -- cy,
  O de -- liv -- er us, good Lord.
}

verseTwo = \lyricmode {
  \vTwo
  From the depth of na -- ture's blind -- ness,
  From the hard -- 'ning power of sin,
  From all mal -- ice and -- un -- kind -- ness,
  From the pride that lurks with -- in:
  By thy mer -- cy,
  O de -- liv -- er us, good Lord.
}

verseThree = \lyricmode {
  \vThree
  When temp -- ta -- tion sore -- ly press -- es,
  In the day of Sa -- tan's power,
  In our times of deep dis -- tress -- es,
  In each dark and try -- ing hour:
  By thy mer -- cy,
  O de -- liv -- er us, good Lord.
}

verseFour = \lyricmode {
  \vFour
  In the wear -- y hours of sick -- ness,
  In the times of grief and pain,
  When we feel our mor -- tal weak -- ness,
  When the crea -- ture's help is vain:
  By thy mer -- cy,
  O de -- liv -- er us, good Lord.
}

extraVerses =
  \markup {
    \vspace #1
  \fontsize #0.2 {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "In the solemn hour of dying,"
            "  In the face of judgement day,"
            "May our souls, on thee relying,"
            "  Find thee still our rock and stay:"
            "    By thy mercy,"
            "  O deliver us, good Lord."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "Jesus, may thy prom -- ised bless -- ing"
            "  Comfort to our souls afford;"
            "May we now, thy love possessing,"
            "  And at length our full reward,"
            "    Ever praise thee,"
            "  Good and ever-glorious Lord."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
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
  \extraVerses
  \markup {
    \vspace #0.5
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
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \extraVerses
  \markup {
    \vspace #0.5
  }
  \refs
}