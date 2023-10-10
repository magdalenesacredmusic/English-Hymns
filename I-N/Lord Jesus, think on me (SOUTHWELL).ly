\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Μνώεο Χριτέ," Greek, Synesius of Cyrene (375-430); Tr. Allen William Chatfield (1808-96)
      }
      \wordwrap {
        Music: SOUTHWELL, SM, Adapted from \italic "The Psalmes in English Metre," 1579 by William Daman (1540-91)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {SOUTHWELL  SM}
    }
    \right-column{
      \line {Adapted from \italic "The Psalmes in English Metre," 1579}
      \line {by William Daman (1540-91)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Μνώεο Χριτέ"}
      \line {Greek, Synesius of Cyrene (375-430)}
      \line {Tr. A.W. Chatfield (1808-96)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 2
  e2 \bar "|"
  g4 g fs fs \bar "|"
  e2 e \bar "|"
  g4 g a a \bar "|"
  b2 \bar "" \break
  
  b2 \bar "|"
  d4 d c c \bar "|"
  b b a2 
  b2 \bar "|"
  a4 g fs fs \bar "|"
  e2 \bar "|."
}

alto = \relative c' {
  \global
  e2 
  e4 e e ds 
  e2 e
  e4 g g fs 
  g2
  
  g 
  g4 fs e d 
  d d d2 g 
  fs4 e e ds 
  e2
}

tenor = \relative c' {
  \global
  g2 
  b4 b b b 
  g2 g2 
  b4 b d d 
  d2
  
  b2 
  a4 a g a 
  g g fs2
  
  d'2
  d4 b b b 
  g2
  
}

bass = \relative c {
  \global
 e2 
 e4 e b b 
 e2 e 
 e4 e d d 
 g2
 
 g2 
 d4 d e fs 
 g b, d2 g,2
 d'4 e b b 
 e2
}

verseOne = \lyricmode {
  \vOne
  Lord Je -- sus, think on me,
  And purge a -- way my sin;
  From earth -- born pas -- sions set me free,
  And make me pure with -- in.
}

verseTwo = \lyricmode {
  \vTwo
  Lord Je -- sus, think on me,
  With care and woe op -- prest;
  Let me thy lov -- ing ser -- vant be,
  And taste thy prom -- ised rest.
}

verseThree = \lyricmode {
  \vThree
  Lord Je -- sus, think on me,
  A -- mid the bat -- tle's strife;
  In all my pain and mis -- er -- y
  Be thou my health and life.
}

verseFour = \lyricmode {
  \vFour
  Lord Je -- sus, think on me,
  Nor let me go a -- stray;
  Through dark -- ness and per -- plex -- i -- ty
  Point thou the heav'n -- ly way.
}

extraVerses = 
     \markup {
    \vspace #2.0
  \fontsize #0.2 {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "  Lord Jesus, think on me,"
            "  When flows the tempest high:"
            "When on doth rush the enemy"
            "  O Savior, be thou nigh."
          }
        }
        \vspace #0.5
        \line {
          \bold "6. "
          \column {
            "  Lord Jesus, think on me,"
            "  That, when the flood is past,"
            "I may the eternal brightness see,"
            "  And share thy joy at last."
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