\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: William Romanis (1824-99)
      }
      \wordwrap {
        Music: CHRISTUS DER IST MEIN LEBEN, 76 76, Melchior Vulpius (1560-1616); Harm. J.S. Bach (1685-1750)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {CHRISTUS DER IST MEIN LEBEN}
    }
    \right-column{
      \line {Melchior Vulpius (1560-1616)}
      \line {Harm. J.S. Bach (1685-1750)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {William Romanis (1824-99)}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key ef \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  ef4 |
  g f g af |
  bf2 g4 c |
  bf af g f |
  g2.  \bar "" \break
  
  bf4 |
  c d ef d |
  c2 bf4 g |
  af g f f |
  ef2.

\bar "|."
}

melodya = \relative c' {
  \global
  \partial 4
  ef4 |
  g f g af |
  b2 g4 c |
  bf af g f |
  g2.  \bar "" %\break
  
  bf4 |
  c d ef d |
  c2 bf4 g |
  a g f f |
  ef2.

\bar "|."
}

alto = \relative c' {
  \global
  bf4 |
  ef f ef ef |
  d8[ ef f d] ef4 ef |
  ef4. d8 ef4. d8 |
  ef2. 
  
  g4 |
  g8[ f] f[ bf] g4 g |
  g( f) f ef |
  ef8[ d] ef4 ef d4 |
  ef2.
}

tenor = \relative c' {
  \global
  g4 |
  bf bf bf c |
  f,( bf) bf af |
  bf c8[ af] bf4 bf |
  bf2. 
  
  ef4 |
  ef d d8[ c] bf4 |
  bf( a) d bf |
  af! bf c bf |
  g2.
}

bass = \relative c {
  \global
 ef4 |
 ef d df c |
 bf8[ c d bf] ef4 af |
 g f ef8[ g] bf4 |
 ef,2. 
 
 ef4 |
 a, bf c8[ ef] g[ f] |
 ef[( c] f4) bf, ef |
 f g af bf |
 ef,2.
}

verseOne = \lyricmode {
  \vOne
  Lord, who shall sit be -- side thee,
  En -- throned on eith -- er hand,
  When clouds no long -- er hide thee,
  'Mid all thy faith -- ful band?
}

verseTwo = \lyricmode {
  \vTwo
  Who drinks the cup of sor -- row
  Thy Fa -- ther gave to thee
  'Neath shad -- ows of the mor -- row
  In dark Geth -- se -- ma -- ne;
}

verseThree = \lyricmode {
  \vThree
  Who o thy Pas -- sion think -- ing
  Can find in loss a gain,
  And dare to meet un -- shrink -- ing
  Thy bap -- ti -- sm of pain.
}

verseFour = \lyricmode {
  \vFour
  O Je -- sus, form with -- in us
  Thy like -- ness clear and true;
  By thine ex -- am -- ple win us
  To suf -- fer or to do.
}

verseFive = \lyricmode {
  \vFive
  This law itself ful -- fill -- eth,-
  Christ -- like to Christ is nigh,
  And, where the Fa -- ther will -- eth,
  Shall sit wiht Christ on high.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
  \score { %\transpose c bf,
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
  \score { %\transpose c bf,
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
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}