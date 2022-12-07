\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {ST. AMBROSE, LB}
    }
    \right-column{
      \line {From La Feillée}
      \line {\italic "Méthode du plain-chant," 1782}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Fortem, virili pectore"}
      \line {Silvio Antoniano, b. 1540; Tr. Athelstan Riley}
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
  f g a bf
  a g f c'
  c d c a 
  c bf a \bar ""
  
  bf4 
  a g f e |
  f g a c
  bf g a bf
  \time 3/4 a g f \bar "||"
  
  \time 4/4 f2 f \bar "||"
}

alto = \relative c' {
  \global
  c4
  d e f f 
  f e f f
  e f g f 
  f f f
  
  f |
  f e d c 
  d e f e
  f g f d 
  f e f \break
  
  d2 c
}

tenor = \relative c' {
  \global
  a4 |
  a c c d
  c c a a 
  c a g c 
  a d c
  
  d4 |
  c c a a 
  a c c c
  d c c d 
  c c a
  
  bf2 a
}

bass = \relative c {
  \global
 f4 |
 d c f bf, 
 f' c f f
 a d, e f
 f bf, f'
 
 bf, |
 f' c d a |
 d c f a, |
 d e f g, |
 a8[ bf] c4 f,
 
 bf2 f
}

verseOne = \lyricmode {
  \vOne
  The prais -- es of that Saint we sing,
  To whom all lands their tri -- bute bring,
  Who with in -- dom -- it -- a -- ble heart
  Bore through -- out life true wo -- man's part.
}

verseTwo = \lyricmode {
  \vTwo
  Re -- strain -- ing ev -- 'ry fro -- ward sense
  By gen -- tle bonds of ab -- stin -- ence,
  With prayer her hun -- gry soul she fed,
  And thus to heav'n -- ly joys hath sped.
}

verseThree = \lyricmode {
  \vThree
  King Christ, from whom al vir -- tue springs,
  Who on -- ly do -- est won -- drous things,
  As now to thee she kneels in prayer,
  In mer -- cy our pet -- i -- tions hear.
}

verseFour = \lyricmode {
  \vFour
  All praise to God the Fa -- ther be,
  All praise, e -- ter -- nal Son, to thee;
  Whom with the Spir -- it we a -- dore
  For ev -- er and for ev -- er -- more.
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
