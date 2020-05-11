%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {TALLIS'S ORDINAL  CM}
    }
    \right-column{
      \line {Thomas Tallis}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "O fons amoris, Spiritus"}
      \line {Charles Coffin, 1736; tr. John Chandler, 1837}
    }
  } 
}

\header {
  tagline = ""
}


global = {
	\key d \major
	\time 4/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	\partial 4
	d4 |
	fs g a a |
	b b a \bar "||"

	a |
	d cs b b |
	a2. \bar "||" \break

	d,4 |
	fs g a a |
	b b a \bar "||"

	d,4 |
 	g fs e e |
	d2. \bar "|."
}

alto = \relative c' {
	\global
	\partial 4
	d4 |
	d d e fs |
	g g fs 

	fs |
	fs e e e |
	cs2. 

	d4 |
	d d cs a |
	d d d 

	d |
	d d d cs |
	d2. \bar "|."
}

tenor = \relative c {
	\global
	\partial 4	
	fs4 |
	a b cs a |
	d d d 

	d, |
	fs a a gs |
	a2. 

	fs4 |
	a d, e fs |
	g g fs

	fs |
	b a a a |
	fs2. \bar "|."
}

bass = \relative c {
	\global
	\partial 4
	d4 |
	d b a d |
	g, g d' 

	d |
	d a e' e |
	a,2.

	d4 |
	d  b a d |
	g, g d'

	d |
	g, d' a a |
	d2. \bar "|."
}

verseOne = \lyricmode {
	\set stanza = "1."
	O Ho -- ly Spi -- rit, Lord of grace,
	E -- ter -- al source of love,
	In -- flame, we pray, our in -- most hearts
	With fire from heav'n a -- bove.
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	As Thou dost join with ho -- liest bonds
	The Fa -- ther and the Son,
	So fill Thy saints with mu -- tual love
	And link their hearts in one.
}

verseThree = \lyricmode {
	\set stanza = "3."
	To God the Fa -- ther God the son,
	and God the Ho -- ly Ghost,
	E -- ter -- nal glo -- ry be from man,
	And from the An -- gel -- host.
}

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score {
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 84 4)
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
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}