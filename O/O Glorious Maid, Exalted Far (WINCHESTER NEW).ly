\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {WINCHESTER NEW  LM}
    }
    \right-column{
      \line {\italic "Musikalisches Hand-buch," 1690; \italic "The English Hymnal," 1906}
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
  \key bf \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  f4 |
  bf f g g |
  f ef d 

  d |
  ef d c f |
  f e f \bar ""

  f |
  bf c d bf |
  ef d c 

  d |
  bf g f bf |
  \time 3/4 bf a bf \bar "||" \break
  
  \time 4/4 bf2 bf \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  f d ef ef8[ d] |
  c4 a bf

  bf |
  bf bf c d |
  d c c

  f |
  f ef d g8[ f] |
  ef4 f f

  f |
  f ef f d |
  g f f 
  
  g2 f
}

tenor = \relative c' {
  \global
  \partial 4
  bf4 |
  bf bf bf ef, |
  f f f

  f |
  g f8[ g] a4 a |
  bf8[ a] g4 a

  a |
  bf g8[ a] bf4 bf |
  bf8[ a] bf4 a

  bf |
  bf bf bf bf |
  c c d 
  
  ef2 d
}

bass = \relative c {
  \global
  \partial 4
  bf4 |
  d bf ef c8[ bf] |
  a4 f bf

  bf |
  g bf f d' |
  bf c f,

  f'8[ ef] |
  d4 c bf ef8[ d] |
  c4 d8[ ef] f4

  bf, |
  d ef d g |
  ef f bf, 
  
  ef2 bf2
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
        tempoWholesPerMinute = #(ly:make-moment 84 4)
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
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}