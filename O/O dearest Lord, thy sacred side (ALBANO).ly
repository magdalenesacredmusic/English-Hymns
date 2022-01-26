\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {ALBANO  CM}
    }
    \right-column{
      \line {Vincent Novello (1781-1861)}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Father Andrew (1869-1946)}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  f4 |
  c' bf a g |
  f g e e |
  f f g g |
  a2. \bar "" \break
  
  a4 |
  d c bf a |
  g f e g |
  c f, f e |
  f2.
\bar "|."
}

alto = \relative c' {
  \global
  f4 |
  f g f e |
  d d c c |
  c f f e |
  f2. 
  
  ef4 |
  d f g f |
  d a8[ bf] c4 c |
  c d d c |
  c2.
}

tenor = \relative c' {
  \global
  c4 |
  c c c bf |
  a bf g g |
  f a d c |
  c2. 
  
  c4 |
  bf c c c |
  bf f g e |
  f a g bf |
  a2.
}

bass = \relative c {
  \global
 f4 |
 a e f c |
 d bf c bf |
 a d bf c |
 f,2.
 
 f'4 |
 bf a e f |
 bf, d c bf |
 a d bf c |
 f,2.
}

verseOne = \lyricmode {
  \vOne
O dear -- est Lord, thy sac -- red head
With thorns was pierced for me;
O pour thy bless -- ing on my head
That I may think for thee.
}

verseTwo = \lyricmode {
  \vTwo
O dear -- est Lord, thy sac -- red hands
With nails were pierced for me;
O shed thy bless -- ing on my hands
That they may work for thee.
}

verseThree = \lyricmode {
  \vThree
O dear -- est Lord, thy sac -- red feet
With nails were pierced for me;
O pour thy bless -- ing on my feet
That they may fol -- low thee.
}

verseFour = \lyricmode {
  \vFour
O dear -- est Lord, thy sac -- red heart
With spear was pierced for me;
O pour thy Spir -- it in my heart
That I may live for thee.
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
  \bottom
}
