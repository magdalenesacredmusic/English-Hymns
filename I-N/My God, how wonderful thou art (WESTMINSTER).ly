\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Frederick W. Faber (1814-63)
      }
      \wordwrap {
        Music: WESTMINSTER CM, James Turle (1802-82)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {WESTMINSTER  CM}
    }
    \right-column{
      \line {James Turle (1802-82)}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Frederick W. Faber (1814-63)}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  e4 |
  g g c, c' |
  b a g g 
  e' b c d 
  g,2. \bar "" \break
  
  g4 |
  b a gs a |
  c b a a
  g c, d f 
  e2.

\bar "|."
}

alto = \relative c' {
  \global
  c4 
  e d c e
  e c8[ d] e4 f
  e g8[ f] e4 f8[ e]
  d2.
  
  d4
  d d d c 
  e e8[ d] c4 f
  e c c b 
  c2.
}

tenor = \relative c' {
  \global
  g4 
  g d e c' 
  e a,8[ b] c4 b
  c e8[ d] c4 a
  b2.
  
  b4
  g a b a
  a gs a d
  g, g a g
  g2.
}

bass = \relative c {
  \global
   c4
   c b a a'
   g f e d
   c g' a f
   g2.
   
   g4
   g f e f
   e e a, b
   c e f g 
   c,2.
}

verseOne = \lyricmode {
  \vOne
  My God, how won -- der -- ful thou art,
  Thy ma -- jes -- ty how bright,
  How -- beau -- ti -- ful thy mer -- cy -- seat,
  In depths of burn -- ing light!
}

verseTwo = \lyricmode {
  \vTwo
  How dread are thine e -- ter -- nal years,
  O ev -- er -- last -- ing Lord,
  By pros -- trate spir -- its day and night
  In -- ces -- sant -- ly a -- dored!
}

verseThree = \lyricmode {
  \vThree
  How won -- der -- ful, how beau -- ti -- ful,
  The sight of thee must be,
  Thine end -- less wis -- dom, bound -- less power.
  And aw -- ful pur -- i -- ty!
}

verseFour = \lyricmode {
  \vFour
  O, how I fear thee, liv -- ing God,
  With deep -- est, tend -- 'rest fears,
  And wor -- ship thee with tremb -- ling hope,
  And pen -- i -- ten -- tial tears!
}

extraVerses =
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
            "Yet I may love thee, too, O Lord,"
            "  Almighty as thou art,"
            "For thou hast stooped to ask of me"
            "  The love of my poor heart."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "No earthly father loves like thee,"
            "  No mother, e'er so mild,"
            "Bears and forbears as thou hast done"
            "  With me thy sinful child."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "Father of Jesus, love's reward,"
            "  What rapture will it be"
            "Prostrate before thy throne to lie,"
            "  And gaze and gaze on thee."
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
    %  \new Lyrics \lyricsto soprano \verseFive
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
      \new Lyrics \lyricsto "tune" { \verseOne }
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
  % \bottom
  \refs
}
