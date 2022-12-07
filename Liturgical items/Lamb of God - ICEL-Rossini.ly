\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {AGNUS DEI XVIII}
    }
    \right-column{
      \line {\italic "The Roman Missal"}
      \line {Harm. Carlo Rossini, adapt. David O'Donnell, 2022}
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
	\key bf \major
	\cadenzaOn
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
        \global
        f8 f f4(  g4) \bar "'"
	g8 g g g f g ef f g4 \bar "'"
	g8 f[ g] a f g4( f4) \bar "||"
	
	f8 f f4(  g4) \bar "'"
	g8 g g g f g ef f g4 \bar "'"
	g8 f[ g] a f g4( f4) \bar "||"
	
	f8 f f4(  g4) \bar "'"
	g8 g g g f g ef f g4 \bar "'"
	f8[ g] a[ f] g4( f4) \bar "||"
}

alto = \relative c' {
  \global
  d4 c d~ d4. 
  ef4.~ ef4 d~
  d8~ d4~ d~ d c
  
  d4~ d~ d
  ef4.~ ef4.~ ef4 d~
  d8 c4~ c d c
  
  d4 c d~
  d4. ef4.~ ef4 d~
  d4~ d~ d c
}

tenor = \relative c' {
  \global
 bf4 a bf~
 bf4.~ bf4. c4 bf~
 bf8 a4 bf~ bf a
 
 bf4~ bf4~ bf4
 bf4.~ bf4. c4 d~
 d8 c4 f,~ f a
 
 bf4 a bf~
 bf4.~ bf4. c4 bf 
 a4 bf~ bf a
}

bass = \relative c {
  \global
 bf'4 a g~
 %g8 
 g8 f4 ef4. c4 g ~
 g8 d'4 bf ef f
 
 bf4 a g
 ef4. d4. c4 bf~
 bf8 a4~ a bf f' 
 
 bf4 a g~ 
 g8 f4 ef4. c4 g
 d'4 bf ef f
}

verseOne = \lyricmode {
	Lamb of God, 
	you take a -- way the sins of the world,
	have mer -- cy on us.
	
	Lamb of God, 
	you take a -- way the sins of the world,
	have mer -- cy on us.
	
	Lamb of God,
	you take a -- way the sins of the world,
	grant us peace.
}


\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { %\transpose c bf,
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
  \score { %\transpose c bf,
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
   % \transpose c bf,
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
