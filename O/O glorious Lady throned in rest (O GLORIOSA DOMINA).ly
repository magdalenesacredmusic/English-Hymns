\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \tiny {
  \fill-line {
    \column {
      \line {O GLORIOSA DOMINA, LM}
    }
    \right-column{
      \line {Gregorian, Mode II}
      \line {Harm. David O'Donnell, 2022}
    }
  }
  }
}

bottom = \markup  {
  \tiny {
  \fill-line {
    \null
    \right-column {
      \line {\italic "O gloriosa domina"}
      \line {Tr. John Mason Neale}
    }
  }
  }
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g8 g8[ f] d[ c] f g[ bf] bf[ a] g a8 \hb 
  g8[ c] c a bf[ a] g a[ g] f g4 \bar "|"
  c8 c a c c8[ d c] bf[ a] g[ a] a[ g f] \hb
  bf8[ a] bf[ c] a bf[ a] g a[ g] f g4 \bar "||"
  
  g8[ a g] f4( g) \bar "||"
}

alto = \relative c' {
  \global
  d4.~ d8[ c]~ c8 d4~ d2
  c2 d4 bf8 d4.~ d4
  f2~ f4. d4~ d~ d4.
  d4 c4~ c8 d4.~ d4.~ d4
  
  ef4. d4~ d
}

tenor = \relative c' {
  \global
  bf4. a4. g4 f2
  ef2 f4 ef8 f8[ g a] bf4
  a4 c8[ a]~ a4.  g4~ g f8[ g a]
  bf4 g4 a8 g4. f8[ g a] bf4
  
  c4. a4 bf
}

bass = \relative c' {
  \global
 g4. f4. bf,4 d2
 c2 d4 ef8 d4. g4
 f2~ f4. g4 bf,4 d4.
 g4 ef4 f8 g4 bf,8 d4. g4
 
 c,4. d4 g
}

verseOne = \lyricmode {
  \vOne
  O glo -- rious Lad -- y throned in rest,
  A -- midst the star -- ry hosts a -- bove,
  Who gav -- est nur -- ture from thy breast
  To God, with pure ma -- ter -- nal love.
}

verseTwo = \lyricmode {
  \vTwo
  What we had lost through hap -- less Eve
  The Blos -- som sprung from thee re -- stores,
  And, grant -- ing bliss to souls that grieve,
  Un -- bars the ev -- er -- last -- ing doors.
}

verseThree = \lyricmode {
  \vThree
  O Gate, through which hath passed the King,
  O Hall, whence Light shone through the gloom;
  The ran -- somed na -- tions praise and sing
  Life giv -- en from the Vir -- gin womb.
}

verseFour = \lyricmode {
  \vFour
  All hon -- or, laud and glo -- ry be,
  O Je -- sus, Vir -- gin -- born, to thee!
  All glo -- ry, as is ev -- er meet,
  To Fa -- ther, and to Par -- a -- clete.
  
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
