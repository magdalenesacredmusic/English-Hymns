\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
  \left-column {
  \line {
    Text: \italic "Puer natus in Bethlehem," 14th cent.; Tr. Richard Frederick Littledale, alt
  }
  \wordwrap {
    Music: PUER NATUS IN BETHLEHEM, 88 with alleluias and refrain; Benedictine plainsong, Harm. Achille P. Bragers
  }
}
  }
}
                

top = \markup {
  \fill-line {
    \column {
      \line {PUER NATUS IN BETHLEHEM}
    }
    \right-column{
      \line {Benedictine plainsong}
      \line {Harm. Achille P. Bragers} %copyright McLaughin and Reilly
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Puer natus in Bethlehem"}
      \line {14th cent.; Tr. Richard Frederick Littledale}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key af \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f8 af af g af bf af g f af g f4 \hb 
  f8 \bar "" \break af bf c \bar ""
  bf8 c bf af4 \hb
  af8 af af af c bf af g4 \bar "||" \break
  
  f8^\markup {\smallCaps Refrain.} af bf \bar ""
  c df ef4 \hb
  ef8 af, af \bar "" \break af c bf af g4 \hb 
  f8 af af g g f4 \bar "||"
}

melodya = \relative c' {
  \global
  f8 af af g af bf af g f af g f4 \mhb  %\break
  f8 \bar "" \break af bf c \bar ""
  bf8 c bf af4 \mhb
  af8 af af af c bf af g4 \bar "||" \break
  
  f8^\markup {\smallCaps Refrain.} af bf \bar ""
  c df ef4 \mhb
  ef8 af, af \bar "" \break af c bf af g4 \mhb 
  f8 af af g g f4 \bar "||"
}

alto = \relative c' {
  \global
  f8~^\markup {\italic Unison.} f2~ f2 ef4 c4~ 
  c8 f4.~ f4. ef4~ 
  ef8 df4 ef2~ ef4
  
  f8 ef4~
  ef4 ef4~
  ef8 f4~ f4~ f4 ef4
  s8 df2 c4
}

tenor = \relative c' {
  \global
  af8 c2 df bf4 af~
  af8 c4.~
  c4.~ c4~
  c8 bf4 c2~ c4~
  c4.~
  c4 bf4~
  bf8 c4~ c4 df4 bf4~
  bf8~ bf2 af4
}

bass = \relative c {
  \global
 f8~ f2 df2 ef4 f4~
 f8~ f4 g8~ 
 g8 af4~ af4~
 af8~ af4~ af2 c4
 
 af4.~
 af4 g4~
 g8 f4 ef4 df ef4~
 ef8 f2~ f4
}

verseOne = \lyricmode {
  \vOne
  A child is born in Beth -- le -- hem, 
  al -- le -- lu -- ia: 
  And joy -- ful is Je -- ru -- sa -- lem, 
  al -- le -- lu -- ia, al -- le -- lu -- ia.
}

verseTwo = \lyricmode {
  \vTwo
He lies with -- in a low -- ly stall, 
al -- le -- lu -- ia: 
The king who reign -- eth o -- ver all.
}

verseThree = \lyricmode {
  \vThree
That he might bring our mor -- tal race,
al -- le -- lu -- ia: 
Back to the im -- age of his face,
al -- le -- lu -- ia, al -- le -- lu -- ia.
}

verseFour = \lyricmode {
  \vFour
The Wise Men has -- ten to their King,
al -- le -- lu -- ia: 
And gold, and myrrh, and in -- cense bring.
al -- le -- lu -- ia, al -- le -- lu -- ia.
}


verseSix = \lyricmode {
  _ _ _ _ _ _ _ _ 
  _ _ _ _
  _ _ _ _ _ _ _ _ 
  _ _ _ _ _ _ _ _
    Our joy -- ful hearts we raise,
  Christ is born, let us a -- dore him
  With new -- found songs of praise.
}

extraVerses =     \markup {
    \vspace #0.5
  \fontsize #1 {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "Upon his festive natal day, alleluia,"
"Unto our Infant Lord we pray, alleluia, alleluia."
          }
        }

 \vspace #1
        \line {
          \bold "6. "
          \column {
            "And to the holy One in Three, alleluia,"
            "Give praise and thanks eternally, alleluia, alleluia."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}

%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  %\top
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
     % \new Lyrics \lyricsto soprano \verseFive
      \new Lyrics \lyricsto soprano \verseSix
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
\extraVerses
\markup {
    \vspace #0.5
}
  \refs
}

%%%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 16)
#(define output-suffix "Hymnal")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  \score { \transpose c a,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics   \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      \new Lyrics \lyricsto soprano \verseFour
            %\new Lyrics \lyricsto soprano \verseFive
            \new Lyrics \lyricsto soprano \verseSix
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
 \extraVerses
\markup {
    \vspace #0.5
}
  \refs
}

%%%%%%
%%%%%%
%%%%%%
%#(set-global-staff-size 20)
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  \score {
    \transpose c a,
    <<
      \new Voice = "tune" {
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour}
            %\new Lyrics \lyricsto "tune" { \verseFour}
            %\new Lyrics \lyricsto "tune" { \verseFive }
            \new Lyrics \lyricsto "tune" { \verseSix }
    >>
    \include "hymn_layout.ly"
  }
    \markup {
    \vspace #0.5
  }
  \extraVerses
  \markup {
    \vspace #0.5
  }
  \refs
}
