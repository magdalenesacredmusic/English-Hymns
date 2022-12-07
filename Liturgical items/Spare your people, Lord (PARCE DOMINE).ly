\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \tiny {
  \fill-line {
    \column {
      \line {PARCE DOMINE}
    }
    \right-column{
      \line {Gregorian, Mode I, \italic "Cantus Selecti," 1957}
      \line {Harm. David O'Donnell}
    }
  }
}
}

bottom = \markup  {
  \tiny {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Parce Domine"}
      \line {Tr. Refrain: cento;}
      \line {Vs. 1-2, 4-5: J.M. Neale, alt.;} 
      \line {V. 3 \italic "Primer of 1706," J. Dryden, alt.}
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

melody = \relative c'' {
  \global
  a8 a a g g4( f) \bar "'"
  a8 a a g g8[ f] g[ f] e4 d \hb
  f8 e f g a4 e8 f g f e f8[ e] d4 \bar "||"
  
  a'8 a g a bf a g[ f] f \bar "'"
  g8 bf bf a f g g g4( a) \hb
  c8 d a bf a g f f4 \bar "'"
  e8 f g a d, f f8[ e] d4 \bar "||"
}

alto = \relative c' {
  \global
  f4 e4 d2
  e4~ e4 d4~ d c4 a
  c4. d8 c4
    c4 d4. c4 a4
    
  d4.~ d4.~ d4~ d8~
  d8~ d2 bf4 c4~ c
  e4. d4 e d
  c4. d4 c4. a4
}

tenor = \relative c' {
  \global
  c4~ c4 bf4 a4
  c4~ c g4 bf g4 f
  a4. g8 e4 
    g4~ g4.~ g4 f
    
  %vs
  f4.~ f4. g4 a8~
  a8 g2~ g4 e4 f
  a4. g4~ g4 f4
  a4. f4~ f8 g4 f
  
}

bass = \relative c {
  \global
 f4 c d2
 a4 c bf~ bf  c4 d
 a4. bf8 c4
   c4 bf4. c4 d
   
 %vs
 d4. c4. bf4 d8~
 d8 bf2 g4 c f,
 a'4. g4 c,4 d4
 a4. bf4 a4. d4
}

verseOne = \lyricmode {
  Spare your peo -- ple, Lord,
  spare your peo -- ple here be -- fore you:
  Let not your an -- ger be up -- on us for -- ev -- er.
  
  \vOne
  In prayer to -- ge -- ther let us fall,
  And cry for mer -- cy one and all,
  And weep be -- fore the Ju -- dge's feet,
  And his a -- veng -- ing wrath en -- treat.
}

verseTwo = \lyricmode {
  _ _ _ _ _
  _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _ _ _ _ _
  \vTwo
  Thy grace have we of -- fend -- ed sore,
  By sins, O God which we de -- plore;
  But pour up -- on us from on high, 
  O par -- d'ning One thy clem -- en -- cy.
}

verseThree = \lyricmode {
  _ _ _ _ _
  _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _ _ _ _ _
  \vThree
  Now days of grace with mer -- cy flow,
  O Lord, the gift of tears be -- stow,
  To wash our stains in ev -- 'ry part,
  While heav'n -- ly fire con -- sumes the heart.
}

verseFour = \lyricmode {
  _ _ _ _ _
  _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _ _ _ _ _
  \vFour
  O kind Cre -- a -- tor bow thine ear
  To mark the cry, to know the tear
  Be -- fore thy throne of mer -- cy spent
  In this thy ho -- ly fast of Lent.
}

verseFive = \lyricmode {
  _ _ _ _ _
  _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _ _ _ _ _
  \vFive
  Our hearts are o -- pen, Lord, to thee:
  Thou know -- est our in -- firm -- i -- ty;
  Pour out on all who seek thy face
  A -- bund -- ance of thy par -- d'ning grace.
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
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
    \include "hymn_hymnal_layout.ly"
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
