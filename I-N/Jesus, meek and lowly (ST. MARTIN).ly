\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Henry Collins (1827-1919)
      }
      \wordwrap {
        Music: ST. MARTIN 66 66, C. Ett in \italic "Cantica Sacra," Munich, 1840
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {ST. MARTIN  66 66}
    }
    \right-column{
      \line {C. Ett in \italic "Cantica Sacra," Munich, 1840}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Henry Collins (1827-1919)}
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

melody = \relative c'' {
  \global
  bf4 g af g |
  f2 ef |
  ef4 g bf bf |
  c2 bf |
  
  c4 d ef d |
  c2 bf |
  bf4 c af g |
  f2 ef

\bar "|."
}

alto = \relative c' {
  \global
  ef4 ef ef ef |
  ef( d) ef2 |
  ef4 ef f d |
  f2 d |
  
  f4 f ef f |
  ef2 d |
  f4 g c,8[ d] ef4 |
  ef( d) ef2
}

tenor = \relative c' {
  \global
  g4 bf c bf |
  bf2 g |
  g4 bf bf bf |
  bf( a) bf2 |
  
  a4 bf g bf |
  g( a) bf2 |
  bf4 g af bf |
  bf2 g
}

bass = \relative c {
  \global
   ef4 ef af, ef' |
   bf2 ef |
   ef4 ef d g |
   f2 bf, |
   
   f'4 d c d |
   ef( f) g2 |
   d4 e f g8[ af] |
   bf4( bf,) ef2
}

verseOne = \lyricmode {
  \vOne
  Je -- sus, meek and low -- ly,
Sa -- vior pure and ho -- ly,
On thy love re -- ly -- ing
Hear me hum -- bly cry -- ing.
}

verseTwo = \lyricmode {
  \vTwo
Prince of life and pow -- er,
My sal -- va -- tion’s tow -- er,
On the Cross I view thee
Call -- ing sin -- ners to thee.
}

verseThree = \lyricmode {
  \vThree
There be -- hold me gaz -- ing
At the sight a -- maz -- ing;
Bend -- ing low be -- fore thee,
Help -- less, I a -- dore thee.
}

verseFour = \lyricmode {
  \vFour
By thy red wounds stream -- ing,
With thy life -- blood gleam -- ing,
Blood for sin -- ners flow -- ing,
Par -- don free be -- stow -- ing;
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}