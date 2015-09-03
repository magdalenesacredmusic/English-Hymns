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
   poet = \markup{ \fontsize #4 \smallCaps "In the Bleak Midwinter"  }
    meter = \markup { \small { Music: CRANHAM, Irreg.; G. Holst, 1906 } }
    piece = \markup { \small {Text: C.G. Rossetti, 1872 }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

textrest = \lyricmode {
  \once \override LyricText #'Y-offset = #'0.7  
  \markup { \tiny \musicglyph #"rests.2" } 
}

global = {
	\key f \major
	\time 4/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
	
}

melody = \relative c'' {
	\global
	\partial 4

	\slurDashed
	\tieDashed

	\teeny a4 |
	\normalsize a4.( bf8) c4 a |
	g2 f4 b4\rest
	g4.( a8) g4 d |
	g2. b4\rest

	a4. bf8 c4 a |
	g4.( g8) f4 b4\rest
	g4( a) g4. f8 |
	f2. b4\rest

	bf4. a8 bf4 c |
	\time 5/4 d4~ d a b4\rest \teeny a4 |
	\time 4/4 c4( a) g( f) |
	\time 5/4 e2. \bar "" \break

		b'4\rest \teeny a4 |
	\time 4/4 \normalsize a4.( bf8) c4 a |
	g2 f4 b4\rest |
	\slurSolid g( a) g4.( f8) |
	f1 \bar "|."
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
      tempoWholesPerMinute = #(ly:make-moment 66 2)
    }
  }
  \layout { }
}

