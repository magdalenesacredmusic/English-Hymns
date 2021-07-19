\version "2.16.2-1"
\include "english.ly"
\layout { indent = 0.0\cm }

%#(set-default-paper-size "letter")
#(set-global-staff-size 18)
#(ly:set-option (quote no-point-and-click))
#(set! paper-alist (cons '("ustrade" . (cons (* 6 in) (* 9 in))) paper-alist))

\paper {
	#(set-paper-size "ustrade") 
}

\header {
   poet = \markup{ \fontsize #4 \smallCaps "Title"  }
    meter = \markup { \small { Music: ANGERS, 11.11.11.5.; \italic "Angers Church Melody," \italic "The English Hymnal"} }
    piece = \markup { \small {Text: \italic "source," Author (xxxx-xxxx) Tr. Traditional adapt. by A.B.C }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key g \major
	\time 4/4
	%\autoBeamOff
	%\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	d2 g4 fs |
	e2 d |
	g4. fs8 g4 a |
	b2 b \bar "||"
	
	d2 d4 b |
	c2 b |
	g4. a8 b4 c |
	d2 d \bar "||"
	
	d, e4 fs |
	g2 g |
	b4. c8 d4 c |
	b2 a \bar "||"

	b2 c4 b |
	a2 g \bar "|."
}

alto = \relative c' {
	\global
	<g b>2 <b d>4 <b d> |
	c2 a |
	d4. d8 b4 <d fs> |
	<d g>2 <d g> |

	<d fs> <d fs>4 <d g> |
	<e g>2 <d g> |
	<b e>4. <d fs>8 <d g>4 <e g> |
	<fs a>2 <fs a> |

	b,2 <g b>4 <a d> |
	<b d>2 <b d> |
	<e g>4. <e g>8 <d g>4 <e g> |
	<d g>2 <d fs> |
	
	<d g> <c e>4 <d g> |
	e <d fs> <b d>2 \bar "|."
}

tenor = \relative c {
	\global
	g2 g4 b |
	g'2 fs |
	g4. a8 g4 s4 |
	s1

	b,2 b4 g |
	s1 |
	s1 |
	s1 |
	
	s1 |
	s1 |
	s4. c8 b4 c |
	g b d2 |

	g,2 a4 b |
	c d g,2 \bar "|." 
}

bass = \relative c {
	\global
	s1 |
	c2 d |
	b4. d8 e4 d |
	g2 g |
	
	s1 |
	c,2 g |
	e'4. d8 g4 e |
	d2 d |

	g e4 d |
	g2 g |
	e4. s8 s2 |
	s1 |

	s1 |
	s1 \bar "|."
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
	  %%% if more verses are needed, uncomment the following:
	  %\context Lyrics = four \lyricsto sopranos \verseFour
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

