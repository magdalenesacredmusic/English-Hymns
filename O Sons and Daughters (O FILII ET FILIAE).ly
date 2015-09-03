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
   poet = \markup{ \fontsize #4 \smallCaps "O Sons and Daughters"  }
    meter = \markup { \small { Music: O FILII ET FILIAE, 888. and Alleluias; Solesmes, harm. E.W. Goldsmith } }
    piece = \markup { \small {Text:  }}
    %breakbefore
    %copyright = ""
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
	g4 \bar "|"
	g2 a4 \bar "|"
	g4( f) g \bar "|"
	bf( a) g \bar "|"
	d2 \bar "|"
	<c a'>4 <d bf'> a'2 \bar "|"
	<d, g>2 \bar "||"
	
	g4 \bar "|"
	bf2 c4 \bar "|"
	d( c) bf \bar "|"
	c( bf) a \bar "|"
	g2 \bar "||"
	
	g4 \bar "|"
	bf2 c4 \bar "|"
	d( c) bf \bar "|"
	c( bf) a \bar "|"
	g2 \bar "||"
	
	g4 \bar "|"
	g2 a4 \bar "|"
	g( f) g \bar "|"
	bf( a) g \bar "|"
	d2 \bar "|"
	a'4 bf <d, a'>2 \bar "|"
	<b d g>2 \bar "||"
	
}

alto = \relative c' {
	\global
	s4 
	d2. 
	d2 s4 
	d2. 
	s2
	f2 f4 e
	s2

	
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
