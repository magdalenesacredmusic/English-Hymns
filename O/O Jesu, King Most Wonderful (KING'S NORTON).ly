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
   poet = \markup{ \fontsize #4 \smallCaps "O Jesu, King Most Wonderful"  }
    meter = \markup { \small { Music: KING'S NORTON, C.M.; J. Clark; arr. \italic "The English Hymnal"} }
    piece = \markup { \small {Text: \italic "Jesu, Rex admirabilis," St. Bernard; tr. E. Caswall }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key f \minor
	\time 3/2
	%\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
	\global
	af2 f2. g4 |
	e2 c1 |
	f4.( g8 af2) bf |
	c1. \bar "||" \break

	c2 df4( c) bf( af) |
	af1 g2 |
	af1 \bar "||"

	c2 |
	ef2( bf4 c) df2 |
	df2( af4 bf) c2 | \break
	bf4.( af8 g4 af) g( f) |
	e1 \bar "||"

	e'2 |
	f4.( ef8 df2) df4( c) |
	af1 g4( f) |
	f1. \bar "|."
}

alto = \relative c' {
	\global
	c2 df df |
	c c1 |
	af2( df) f |
	e1. |

	ef2 f c |
	ef1 ef2 |
	ef1 

		af2 |
	bf1 bf2 |
	af1 f2 |
	c1 b2 |
	c1 

		g'2 |
	af1 f2 |
	c1 c2 |
	af1.
	
}

tenor = \relative c' {
	\global
	af2 af bf |
	g e1 |
	f f2 |
	g1. |

	af2 af f |
	bf1 bf2 |
	c1 

		ef2 |
	ef1 ef2 |
	af,1 af2 |
	c1 f,2 |
	g1 

		c2 |
	c( df) f, |
	f1 e4( f) |
	f1.
}

bass = \relative c {
	\global
	f2 df bf |
	c c1 |
	df df2 |
	c2.( df4 c bf) |
	af2 df f |
	ef1 ef2 |
	af,1 

		af'2 |
	g1 g2 |
	f1 f2 |
	e( f) df |
	c1 

		c2 |
	f,1 af2 |
	c1 c2 |
	f,1.
}

verseOne = \lyricmode {
	\set stanza = "1."
	O Je -- su, King most won -- der -- ful,
		Thou Con -- quer -- or re -- nowned,
	Thou sweet -- ness most in -- ef -- fa -- ble,
		In whom all joys are found!
}

verseTwo = \lyricmode {
	\set stanza = "2."
	Where once Thou vis -- it -- est the heart,
		Then truth be -- gins to shine;
	Then earth -- ly van -- i -- ties de -- part;
		Then kin -- dles love di -- vine.
}

verseThree = \lyricmode {
	\set stanza = "3."
	O Je -- su! Light of all be -- low! 
		Thou Fount of life and fire,
	Sur -- pas -- sing all the joys we know,
		And all we can de -- sire:
}

verseFour = \lyricmode {
	\set stanza = "4."
	May ev' -- ry heart con -- fess Thy name,
		And ev -- er Thee a -- dore:
	And, seek -- ing Thee, it -- self in -- flame
		To seek Thee more and more.
}


verseFive = \lyricmode {
	\set stanza = "5."
	Thee may our tongues for -- ev -- er bless,
		Thee may we love a -- lone;
	And ev -- er in our lives ex -- press
		The i -- mage of Thine own.
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
      tempoWholesPerMinute = #(ly:make-moment 80 2)
    }
  }
  \layout { }
}

