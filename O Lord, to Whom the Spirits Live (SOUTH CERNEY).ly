%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
   poet = \markup{ \fontsize #4 \smallCaps "O Lord, to Whom the Spirits Live"  }
    meter = \markup { \small { Music: SOUTH CERNEY, 88.88.88.; W.H. Hadow} }
    piece = \markup { \small {Text: R.F. Littledale}}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key g \minor
	\time 4/4
	%\autoBeamOff
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

%%% if more verses are needed in between the musical staves, uncomment this section
%{
verseFour = \lyricmode {
	\set stanza = "4."
	
}
%}

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
      tempoWholesPerMinute = #(ly:make-moment 72 4)
    }
  }
  \layout { }
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
a


