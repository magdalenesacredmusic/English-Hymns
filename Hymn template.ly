\version "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
   poet = \markup{ \fontsize #4 \smallCaps ""  }
    meter = \markup { \small { Music:  } }
    piece = \markup { \small {Text:  }}
    %breakbefore
    %copyright = ""
    tagline = ""
}


global = {
	\key c \major
	\cadenzaOn
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	%\partial 4
	
}

alto = \relative c' {
	\global
	%\partial 4

	
}

tenor = \relative c' {
	\global
	%\partial 4
}

bass = \relative c {
	\global
	%\partial 4
	
}

verseOne = \lyricmode {
	\set stanza = "1."

}

verseTwo = \lyricmode {
	\set stanza = "2."
	
}

verseThree = \lyricmode {
	\set stanza = "3."
	
}

%{

verseFour = \lyricmode {
	\set stanza = "4."
	
}

verseFive = \lyricmode {
	\set stanza = "5."
	
}

verseSix = \lyricmode {
	\set stanza = "6."
	
}

%}


\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Voice =
         altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
	  \context Lyrics = two \lyricsto sopranos \verseTwo
	  \context Lyrics = three \lyricsto sopranos \verseThree
	  %{\context Lyrics = four \lyricsto sopranos \verseFour
	  \context Lyrics = five \lyricsto sopranos \verseFive
	  \context Lyrics = six \lyricsto sopranos \verseSix %}

    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
        tenors { \voiceOne << \tenor >> }
      \context Voice =
        basses { \voiceTwo << \bass >> }
    >>
  >>
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 69 2)
            }
       }
	\layout {}
}
