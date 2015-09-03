\version "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
   poet = \markup{ \fontsize #4 \smallCaps "Let This Our Solemn Feast"  }
    meter = \markup { \small { Music: SACRIS SOLEMNIIS, 66.66.66.8.; \italic "Gregorian;" adapt. D. O'Donnell } }
    piece = \markup { \small {Text: \italic "Sacris solemniis," Thomas Aquinas; tr. R.F. Littledale }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key d \major
	\time 4/4
	%\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	\partial 4
	d4 |
	fs g b g |
	a2.
		d,4 |
	e fs g e |
	d2. \bar "||"

		d4 |
	fs g b g |
	a2. 
		d,4 |
	e fs g e |
	d2. \bar "||"

		g4 | 
	a b d c |
	b2. \bar "||"
		d4 |
	c b a g |
	fs( e2.) \bar "||" 
	
	fs4( g) a e |
	d fs g e |
	d2. \bar "|."
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

%%% if more verses are needed in between the musical staves, uncomment this section
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
%{\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 69 2)
            }
       }
%}
	\layout {}
}


