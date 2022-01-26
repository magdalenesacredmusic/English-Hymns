\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {TE LUCIS, LM}
    }
    \right-column{
      \line {Sarum Plainsong, Mode VIII}
      \line {Harm. \italic "The Hymnal 1940"}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Te lucis ante terminum"}
      \line {Tr. John Mason Neale}
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
  g8 bf bf bf bf c bf a4 \bar "'"
  g8 g g g a \bar "" \break
    a8 g f4 \hb
  a8 a g f d f g g4 \bar "'"
  bf8 bf bf bf g a g f4 \bar "||"
  
  f8[ g f] ef4( f) \bar "||"
}

alto = \relative c' {
  \global
  d8~ d4 f~ f2
  d8 ef2 f
  c8 d2~ d4 ef
  g8 f4 d ef c
  
  d4 c8 bf4 c
}

tenor = \relative c' {
  \global
  bf8~ bf4~ bf4 a8[ bf] c4
  bf8~ bf4 c~ c8[ bf] a4
  f8~ f[ g] a[ bf]~ bf2
  bf8~ bf2 c4 a
  
  f4. g4 a
}

bass = \relative c' {
  \global
 bf8 g4 d f2
 g8 ef4 c f2 
 f8 bf,4 d bf ef
 ef8 d4 g c, f
 
 bf,4 a8 g4 f
}

verseOne = \lyricmode {
  \vOne
  Be -- fore the end -- ing of the day,
  Cre -- a -- tor of the world, we pray
  That with thy wont -- ed fa -- vor thou
  Wouldst be our Guard and Keep -- er now.
}

verseTwo = \lyricmode {
  \vTwo
  From all ill dreams de -- fend our eyes,
  From night -- ly fears and fan -- ta -- sies;
  Tread un -- der foot our ghost -- ly foe,
  That no pol -- lu -- tion we may know.
}

verseThree = \lyricmode {
  \vThree
  O Fa -- ther, that we ask be done,
  Through Je -- sus Christ, thine on -- ly Son;
  Who, with the Ho -- ly Ghost and thee,
  Doth live and rein e -- ter -- nal -- ly.
  
  A -- men.
}

verseFour = \lyricmode {
  \vFour

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
