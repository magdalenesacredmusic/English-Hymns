\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \tiny {
  \fill-line {
    \column {
      \line {SPLENDOR PATERNAE, LM}
    }
    \right-column{
      \line {Sarum Plainsong, Mode I}
      \line {Harm. \italic "Hymnal, 1940"}
    }
  }
}
}

bottom = \markup  {
  \tiny {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Splendor paternae gloriae"}
      \line {Ambrose of Milan (340-397); Tr. Robert Bridges, 1899}
    }
  }
}
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f8 f g a bf a g a4 \bar "'"
  a8 g c c g \bar "" \break a bf a4( g) \hb
  a8 a g a g f e f4 \bar "'"
  g8 a g f e f[ g] e d4 \bar "||"
  
  d8[ e d] c4( d) \bar "||"
}

alto = \relative c' {
  \global
  s4. f4 e f
  c8~ c2~ c8 d e2
  c8 d4 e s s
  c8~ c2 d4 c8 a4
  
  bf4. a2
}

tenor = \relative c' {
  \global
  a8~ a4 s s s4. 
  s2 s4 s2
  s8 s4 s a8[ g] a4
  s8 s4 s bf4 g8 f4
  
  g4. e4 f4
}

bass = \relative c {
  \global
 f8 d2 c4 f4.
 e2 f4 c2
 a8 bf4 c d2
 e8 f4 c bf c8 d4
 
 g,4. a4 d
}

verseOne = \lyricmode {
  \vOne
  O Splen -- dor of God's glo -- ry bright,
  O thou that bring -- est light from light,
  O Light of Light, light's liv -- ing spring,
  O Day, all days il -- lu -- min -- ing:
}

verseTwo = \lyricmode {
  \vTwo
  O thou true Sun, on us thy glance
  Let fall in roy -- al ra -- di -- ance,
  The Spir -- it's sanc -- ti -- fy -- ing beam
  Up -- on our earth -- ly sens -- es stream.
}

verseThree = \lyricmode {
  \vThree
  The Fa -- ther, too, our prayers im -- plore,
  Fa -- ther of glo -- ry ev -- er -- more,
  The Fa -- ther of all grace and might,
  To ban -- ish sin from our de -- light:
}

verseFour = \lyricmode {
  \vFour
  To guide what -- e'er we no -- bly do,
  With love all en -- vy to sub -- due,
  To make ill -- for -- tune turn to fair,
  And give us grace our wrongs to bear.
}

verseFive = \lyricmode {
  \set stanza = "5."
  All laud to God the Fa -- ther's be;
  All praise, e -- ter -- nal Son to thee;
  All glo -- ry, as is ev -- er meet,
  To God the ho -- ly Par -- a -- clete.
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
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
