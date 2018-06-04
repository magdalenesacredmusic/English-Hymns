%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}


\version "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
   poet = \markup{ \fontsize #4 \smallCaps "Praise the Lord of Heaven"  }
    meter = \markup { \small { Music: LAUS TIBI CHRISTE, 65.65. D.; \italic "source;" harm. Composer (xxxx-xxxx)} }
    piece = \markup { \small {Text: \italic Ps. 148 \italic "Laudate Dominum;" T.B. Browne }}
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

melody = \relative c'' {
	\global
	a4 a a a |
	b2 a |
	g4 fs e e |
	d1 \bar "||"

	a'4 a a a |
	b2 g |
	b4 b c b |
	a1 \bar "||"

	a4 a a a |
	d2 a |
	b4 b a a |
	g1 \bar "||"

	a4 a a a |
	a2 fs |
	g4 fs e4. d8 |
	d1 \bar "|."
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

