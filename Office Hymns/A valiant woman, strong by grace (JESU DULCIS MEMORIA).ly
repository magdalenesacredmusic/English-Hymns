\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {JESU DULCIS MEMORIA, LM}
    }
    \right-column{
      \line {Mode I chant}
      \line {Harm. Achille Bragers}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Fortem virili pectore"}
      \line {Tr. St. Cecilia's Abbey, Ryde}
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
  b8\rest a8 a a a d, f e d \bar "'"
  a'8 a b g a c b a4 \bar "'" 
    a8 
  b8 c d c a c b[ a g] \bar "'"
  a8 a b g e g a a4 \bar "||" \break
  
  a8[ b a] g4( a) \bar "||"
}

melodya = \relative c'' {
  \global
  \override Stem #'length = #0
  a4 a a a d, f e d \bar "'"
  a'4 a b g a c b a2 \bar "'" 
    a4 
  b4 c d c a c b( a g) \bar "'"
  a4 a b g e g a a2 \bar "||" \break
  
  a4( b a) g2( a) \bar "||"
}

alto = \relative c' {
  \global
  c4\rest d8[ c] bf4~ bf a
  f' e2 e4~
  e8
  e4 d2.~ d4~ d4 e d c
  
  c4. d4 c
}

tenor = \relative c {
  \global
  s4 f2 g4 f
  d'8[ c] b2 c4~
  c8
  b4 a2~ a4 b4 g2~ g4 e
  
  e4.~ e4~ e4
}

bass = \relative c {
  \global
 d4\rest d2~ d4~ d4~ 
 d4 e g a4~
 a8
 g4 f2 c4 b~ 
 b c b a
 
 a4. b4 a
}

verseOne = \lyricmode {
  \vOne
  A val -- iant wo -- man, strong by grace,
  U -- nites us all in praise this day,
  The glo -- ry of her ho -- li -- ness
  Sheds far and wide its sa -- cred ray.
}

verseTwo = \lyricmode {
  \vTwo
  Her heart a -- glow with ho -- ly love,
  The glam -- or of this earth she spurned,
  And chose the hard and nar -- row way
  To reach the home for which she yearned.
}

verseThree = \lyricmode {
  \vThree
  By fasts and prayer she o -- ver -- came
  Our fall -- en na -- ture's down -- ward trend,
  She fed her soul with con -- stant prayer
  That heav -- en -- wards her mind should tend.
}

verseFour = \lyricmode {
  \vFour
  O Je -- sus, King and Source of strength,
  Great things are done by you a -- lone,
  So to her sup -- pli -- ca -- tion's praise
  We hum -- bly strive to join our own.
}

verseFive = \lyricmode {
  \vFive
  All glo -- ry, Je -- sus, be to you, 
  For through your ho -- ly hand -- maid's love,
  You give us hope for our re -- ward
  And ev -- er -- last -- ing joy a -- bove.
  
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
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour}
      \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
