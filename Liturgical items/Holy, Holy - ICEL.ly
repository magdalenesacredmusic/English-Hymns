\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {SANCTUS XVIII}
    }
    \right-column{
      \line {\italic "The Roman Missal"}
      \line {Harm. ICEL}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
   b8 b4( a4)  \bar "'"
  b8 b4( a4) \bar "'"
  g8 a b4 b8 a b4 \bar "|"
  g8 a b b4 a8 \bar "" \break
  
  c8 b b a g4 \bar "|"
  g8 a b b b a b4 \bar "|"
  g8 a b b4 \bar "" \break
  a8 c b a b a g g4 \bar "|"
  e8 g[ a] a a b a[ g] g4( a4) \bar "||"
}

alto = \relative c'' {
  \global
  g4. e4
  g4. e4 
  d4 g4 e4 g
  d4. d4.
  
  e4.~ e4. 
  d4. g4 e8 g4
  d4. e4~
  
  e8~ e4.~ e4.~ e4
  e4.~ e4. d4~ d4 e4
}

tenor = \relative c' {
  \global
  d4. c4
  d4. c4
  b4 d4~ d8 c d4
  b4. g4.
  
  a4. b4.
  b4. d4 c8 d4
  b4. g4~
  
  g8 a4. a4. b4
  b4. c4. b4~ b c
}

bass = \relative c' {
  \global
  g4.~ g4
  g4.~ g4~ g4~ g4 a g
  b4. g4.
  
  a4. e4.
  g4.~ g4~ g8~ g4 
  b4. g4~
  
  g8 a4. c,4. e4
  e4. a4. a4~ a~ a4
}

verseOne = \lyricmode {
  Ho -- ly, Ho -- ly, Ho -- ly
  Lord God of hosts,
  Heav -- en and earth are full of your glo -- ry.
  Ho -- san -- na in the high -- est.
  Bless -- ed is he who comes in the name of the Lord.
  Ho -- san -- na in the high -- est.
}

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { \transpose c bf,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
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
  \score { \transpose c bf,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
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
    \transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
