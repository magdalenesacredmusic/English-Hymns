\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {IVYHATCH  LM}
    }
    \right-column{
      \line {Bertram Luard-Selby (1853-1919)}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "O gloriosa Femina," Venantius Fortunatus}
      \line {tr. Percy Dearmer, 1906}
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
  \partial 4
  b8[ c] |
  d4 d d g, |
  a b8[ c] b4 b | \break
  b a8[ g] fs[ g] a4 |
  g fs8[ e] d4 \bar "" 
  
  d8[ e] |
  f4 g e e8[ fs] |
  g4 a fs b |
  c e,8[ fs] g[ a] b[ c] |
  d4 a b2 \bar "||" \break
  
  g2 g \bar "|."
}

alto = \relative c'' {
  \global
  g4 |
  a a g g8[ fs] |
  e[ g] fs4 g d | 
  e e d d8[ cs] |
     b[ d] cs4 d 
     a |
     
     d8[ c] b4 c b |
     e8[ d] cs4 d g8[ f] |
     e4 e e8[ fs] g4 |
     g fs g2
     
     e2 d
}

tenor = \relative c' {
  \global
  d4 |
  c8[ b] a[ c] b4 b |
  a d d g, |
  g a a d, |
  d8[ b'] a[ g] fs4 
  
  f8[ e] |
  d4 g g g |
  e a a d |
  c e d8[ c] b[ g] |
  a[ b] c[ d] d2 |
  
  c2 b
}

bass = \relative c' {
  \global
 g4 |
 g fs g8[ fs] e[ d] |
 c4 d g, g'8[ fs] |
 e[ d] cs4 d fs, |
 g a d 
 
 d8[ c] | 
 b[ a] g4 c e8[ d] |
 cs[ b] a4 d g, |
 c c' d8[ a] g[ e] |
 d4 d g,2
 
 c2 g
}

verseOne = \lyricmode {
  \vOne
  O glor -- rious Maid, ex -- alt -- ed far
  Be -- yond the light of burn -- ing star,
  From Him who made thee thou has won
  Grace to be Mo -- ther of His Son.
}

verseTwo = \lyricmode {
  \vTwo
  That which was lost in hap -- less Eve
  Thy ho -- ly Sci -- on did re -- trieve:
  The tear -- worn sons of A -- dam's race
  Through thee have seen the heav'n -- ly place.
}

verseThree = \lyricmode {
  \vThree
  Thou wast the gate of heav'n's high Lord,
  The door through which the light hath poured.
  Chris -- tians re -- joice, for though a Maid
  To all man -- kind is life con -- veyed.
}

verseFour = \lyricmode {
  \vFour
  All ho -- nor, laud and glo -- ry be,
  O Je -- su, Vir -- gin -- born, to Thee!
  All glo -- ry, as is ev -- er meet,
  To Fa -- ther and to Par -- a -- clete.
  
  A -- men.
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
    \include "hymn_layout_ragged.ly"
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
  \score { \transpose c d
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
    \include "hymn_layout_ragged.ly"
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
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
