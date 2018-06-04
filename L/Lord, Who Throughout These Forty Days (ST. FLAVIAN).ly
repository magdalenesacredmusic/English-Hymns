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
   poet = \markup{ \fontsize #4 \smallCaps "Lord, Who Throughout These Forty Days"  }
    meter = \markup { \small { Music: ST. FLAVIAN; \italic "Day's Psalter," 1563 } }
    piece = \markup { \small {Text: C. F. Hernaman, 1873 }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key f \major
	\time 4/4
	%\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	\partial 4
	f4 |
	f e f a |
	g g f \bar "||"
	f4 |
	bf a f g |
	a2. \bar "||"
	a4 |
	a bf c a |
	f g a \bar "||"
	a |
	g f f e |
	f2. \bar "|."
}

alto = \relative c' {
	\global
	\partial 4
	c4 |
	c c c f |
	f e f
		f |
	f f f e |
	e2.
		f4 |
	f f e e |
	d e f
		f |
	e d d c |
	c2.
}

tenor = \relative c' {
	\global
	\partial 4
	a4 |
	g g a d |
	d c a 
		a |
	bf c d d |
	cs2.
		c!4 |
	c bf g a |
	a c c 
		c |
	c a g g | 
	a2.
}

bass = \relative c {
	\global
	\partial 4
	f4 |
	c c f d |
	bf c f
		f |
	d f bf bf |
	a2.
		f4 |
	f d c c |
	d c f 
		f |
	c d bf c |
	f2.
}

verseOne = \lyricmode {
	\set stanza = "1."
	Lord, who through -- out these for -- ty days
	For us didst fast and pray,
	Teach us with Thee to mourn our sins
	And close by Thee to stay.
}

verseTwo = \lyricmode {
	\set stanza = "2."
	As Thou with Sa -- tan didst con -- tend,
	And didst the vic -- t'ry win,
	O give us strength in Thee to fight,
	In Thee to con -- quer sin.
}

verseThree = \lyricmode {
	\set stanza = "3."
	As Thou didst hun -- ger bear, and thirst,
	So teach us, gra -- cious Lord,
	To die to self, and chief -- ly live
	By Thy most ho -- ly Word.
}

verseFour = \lyricmode {
	\set stanza = "4."
	And through these days of pen -- i -- tence,
	And through Thy pas -- sion -- tide,
	Yea, ev -- er -- more in life and death,
	Je -- sus, with us a -- bide.
}

verseFive = \lyricmode {
	\set stanza = "5."
	A -- bide with us, that so, this life
	Of suf -- f'ring o -- ver past,
	An Eas -- ter of un -- end -- ing joy
	We may at -- tain at last.
}


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
    \new Lyrics \lyricsto soprano \verseFive
    \new Staff  <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 80 4)
    }
  }
  \layout { }
}


