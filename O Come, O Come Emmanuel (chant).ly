\version "2.16.2-1"
\include "english.ly"
\layout { indent = 0.0\cm }

%#(set-default-paper-size "letter")
#(set-global-staff-size 16)
#(ly:set-option (quote no-point-and-click))
#(set! paper-alist (cons '("ustrade" . (cons (* 6 in) (* 9 in))) paper-alist))

\paper {
	#(set-paper-size "ustrade") 
}

\header {
   poet = \markup{ \fontsize #4 \smallCaps "O Come, O Come Emmanuel"  }
    meter = \markup { \small { Music: composer \italic "Veni Emmanuel" } }
    piece = \markup { \small {Text: author, date  }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key d \major
	\time 4/4
	%\autoBeamOff
	%\set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
	\global
}

soprano = \relative c' {
	\global
	
}

alto = \relative c' {
	\global
	%\partial 4
}

tenor = \relative c {
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

verseFour = \lyricmode {
	\set stanza = "4."
	
}


\score { <<
	 \new Voice = "melody" {\melody }
	\new Lyrics \lyricsto "melody" \verseOne
	  \new Lyrics \lyricsto "melody" \verseTwo
	  \new Lyrics \lyricsto "melody" \verseThree
	  \new Lyrics \lyricsto "melody" \verseFour	 
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \soprano >> }
      \context Voice =
         altos { \voiceTwo << \alto >> }
      
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
        tenors { \voiceOne << \tenor >> }
      \context Voice =
        basses { \voiceTwo << \bass >> }
    >>
  >>
>>
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 144 4)
            }
       }
  \layout {
    \context {
      \Score
      % **** Turns off bar numbering
      \remove "Bar_number_engraver"
    }
	\context {
		\Staff
		\remove "Time_signature_engraver"
		 }
    \context {
      \Lyrics
      % **** Prevents lyrics from running too close together
      \override LyricSpace #'minimum-distance = #0.6
      % **** Makes the text of lyrics a little smaller
      \override LyricText #'font-size = #-1
      % **** Moves lines of lyrics closer together
      \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 1)
    }
  }
}

\markup { 
	\normalsize {
	\fill-line {
	\hspace #1.0
	\column {
		\line { \bold "4. "
		\column {
		""
		""	
		""
		""
		}
		}
		\vspace #0.5
		\line { \bold "5. "
		\column {
		""
		""
		""
		""
  		}	
		}
		}
	\hspace #1.0

	}
  }
}



