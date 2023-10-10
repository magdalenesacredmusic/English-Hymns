\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: John Greenleaf Whittier (1807-92)
      }
      \wordwrap {
        Music: BISHOPTHORPE, CM, Jeremiah Clark (1670-1707)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {BISHOPTHORPE  CM}
    }
    \right-column{
      \line {Jeremiah Clark (1670-1707)}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {John Greenleaf Whittier (1807-92)}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  d8.[ c16] |
  b4.( a8) g4 |
  fs( e) c' |
  b( g) fs 
  g2 a4
  b4.( c8) d4 |
  d( c) b |
  b( a) \bar "" \break
  
  d |
  d( c) b |
  c2 c4 |
  c( b) a |
  b2 d8.[ c16] |
  b4.( a8) g4 |
  e8.[( a16] g4) fs |
  g2

\bar "|."
}

alto = \relative c' {
  \global
  g'4 |
  d2 d4 |
  c2 c4 |
  d2 d4 |
  d2 fs4 |
  g4.( a8) b4 |
  b( a) g |
  g( fs)
  
  a |
  gs( a) e |
  e2 e4 |
  fs4( g) d |
  d2 a'4 |
  g2 d4 |
  e( d) d |
  d2
}

tenor = \relative c' {
  \global
  b8.[ a16] |
  g2 g4 |
  g2 g4 |
  g( b) a |
  g2 c4 |
  b2 g4 |
  g( d') d |
  d2
  
  d4 |
  b( a) gs |
  a2 a4 |
  a( g) fs |
  g2 d'4 |
  d2 d4 |
  c( b) a |
  b2
}

bass = \relative c {
  \global
 g'4 |
 g2 b,4 |
 c2 e4 |
 d2 c4 |
 b2 a4 |
 g2 g'4 |
 e( fs) g |
 d2 
 
 f4 |
 e2 e4 |
 a,2 a4 |
 d2 d4 |
 g2 fs4 |
 g2 b,4 |
 c( d) d |
 g,2
}

verseOne = \lyricmode {
  \vOne
  Im -- mor -- tal love for ev -- er full,
  For ev -- er flow -- ing free,
  For ev -- er shared, for ev -- er whole,
  A nev -- er -- eb -- bing sea!
}

verseTwo = \lyricmode {
  \vTwo
  Our out -- ward lips con -- fess the name,
  All o -- ther names a -- bove;
  Love on -- ly know -- eth whence it came
  And com -- pre -- hend -- eth love.
}

verseThree = \lyricmode {
  \vThree
  We may not climb the heav'n -- ly steeps
  To bring the Lord Christ down;
  In vain we search the low -- est deeps,
  For him no depths can drown;
}

verseFour = \lyricmode {
  \vFour
  But warm, sweet, ten -- der, ev -- en yet
  A pre -- sent help is he;
  And faith has still its O -- li -- vet,
  And love its Ga -- li -- lee.
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
            "The healing of his seamless dress,"
            "  Is by our beds of pain;"
            "We touch him in life's throng and press,"
            "  And we are whole again."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "Through him the first fond prayers are said"
            "  Our lips of childhood frame;"
            "The last low whispers of our dead"
            "  Are burdened with his name."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "Alone, O Love ineffable,"
            "  Thy saving name is given"
            "To turn aside from thee is hell,"
            "  To walk with thee is heaven."
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