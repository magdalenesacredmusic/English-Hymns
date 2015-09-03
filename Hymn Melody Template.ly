\version "2.16.0-1"
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
   poet = \markup{ \fontsize #4 \smallCaps "O God, Almighty Father"  }
    meter = \markup { \small { Music: GOTT VATER SEI GEPRIESEN, 7.6.7.6 with refrain; \italic harm. H. Willan, 1858} }
    piece = \markup { \small {Text: \italic "Gott Vater! sei gepriesen," Anon.; \italic tr. Edward C. Currie, 1958 }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key g \major
	\time 4/4
	\autoBeamOff
	%\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
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

\score {
	<<
		\context Voice = melody { \melody }
		\context Lyrics = one \lyricsto melody \verseOne
	  	\context Lyrics = two \lyricsto melody \verseTwo
	  	\context Lyrics = three \lyricsto melody \verseThree
	>>
%\midi { 
 %  \context {
  %     \Score 
   %    tempoWholesPerMinute = #(ly:make-moment 69 2)
    %        }
     %  }
  \layout {
    \context {
      \Score
      % **** Turns off bar numbering
      \remove "Bar_number_engraver"
    }

%	\context {
%		\Staff
%		\remove "Time_signature_engraver"
%		 }
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