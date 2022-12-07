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
        g8 g g4(  a4) \bar "'"
	a8 a a a g a f g a4 \bar "'"
	a8 g[ a] b g a4( g4) \bar "||"
	
	 g8 g g4(  a4) \bar "'"
	a8 a a a g a f g a4  \bar "'"
	a8 g[ a] b g a4( g4) \bar "||"
	
	 g8 g g4(  a4) \bar "'"
	a8 a a a g a f g a4 \bar "'"
	g8[ a] b[ g] a4( g4) \bar "||"
}

alto = \relative c' {
	\global
	e4~ e2 
	f8~ f2 f4. e4.
	e4~ e4~ e2
	
	e4~ e2 
	f8~ f2 f4. e4.
	e4~ e4~ e2
	
	e4~ e2 
	f8~ f2 f4. e4
	e4~ e4~ e4 d
}

tenor = \relative c' {
	\global
	b4~ b4 c4~
	c8~ c2 b4. c4.
	b4 g c4 b
	
	b4~ b4 c4~
	c8~ c2 b4. c4.
	b4 g c4 b
	
	b4~ b4 c4~
	c8~ c2 b4. c4
	b4 c~ c4 b
}

bass = \relative c {
	\global
	e4 a2 
	f8~ f2 d4. a'4. 
	e4~ e~ e2
	
	e4 a2 
	f8~ f2 d4. a'4.
	e4~ e~ e2
	
	e4 a2 
	f8~ f2 d4. a'4
	e4 c g'2
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
