\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {BELMONT  CM}
    }
    \right-column{
      \line {adapted from W. Gardiner's \italic "Sacred Melodies," 1812}
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
  \key g \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  b'2 a4 |
  g2 fs4 |
  fs( e) g |
  d2 d'4 |
  d( c) b |
  b( a) g |
  g4( fs) \bar "" \break
  
  d4 |
  b'2 a4 |
  g2 fs4 |
  fs4( e) g |
  d2 d'4 |
  d( c) a |
  g( b) a |
  g2

\bar "|."
}

alto = \relative c' {
  \global
  d4 |
  g2 fs4 |
  g2 d4 |
  c2 c4 |
  b2 d4 |
  g( fs) g |
  e2 e4 |
  d2 
  
  d4 |
  d2 c4 |
  b2 d4 |
  c2 c4 |
  d2 f4 |
  e2 e4 |
  d4( g) fs |
  g2
}

tenor = \relative c' {
  \global
  b4 |
  d2 c4 |
  b2 b4 |
  g2 g4 |
  g2 b4 |
  b( c) d |
  c2 a4 |
  b( a) 
  
  a4 |
  g2 fs4 |
  g2 g4 |
  g2 g4 |
  b2 g4 |
  g( a) c |
  b( d) c |
  b2
}

bass = \relative c {
  \global
 g'4 |
 g2 d4 |
 e2 b4 |
 c2 e4 |
 g2 g4 |
 g,( a) b |
 c2 c4 |
 d2 
 
 fs4 |
 g( b,) d |
 e2 b4 |
 c2 e4 |
 g2 b,4 |
 c2 c4 |
 d2 d4 |
 g2
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
