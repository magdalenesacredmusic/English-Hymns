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
   poet = \markup{ \fontsize #4 \smallCaps "Immaculate Mary"  }
    meter = \markup { \small { Music: LORDES HYMN, 11.11. with refrain; Grenoble, 1882 } }
    piece = \markup { \small {Text: Anonymous }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key g \major
	\time 3/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	\partial 4
	d4 |
	g g b |
	g g b |
	a a b8[ a] | 
	g2 \bar "" \break

	d4 |
	g g b |
	g g b|
	a a b8[ a] |
	g2. \bar "||" \break

	c2^\markup {\caps Refrain.} c4 |
	b2 b4 |
	a a a |
	d2 g,4 | \break
	c2 c4 |
	b b b |
	a2( b8[ a]) |
	g2 \bar "|."
}

alto = \relative c' {
	\global
	\partial 4
	b4 |
	d d d |
	e e fs |
	g g fs |
	d2

	d4 |
	e e fs |
	e d g8[ fs] |
	e4 g fs |
	d2. 

	e4( g) a4 |
	g( a) g8[ fs] |
	e4 g fs |
	g( fs) d4 |
	e( g) fs8[ e] |
	ds8[ e] fs4 g8[ fs] |
	e4( g fs) |
	d2
}

tenor = \relative c' {
	\global
	\partial 4	
	g4 |
	b b b |
	b b d |
	e c d |
	b2

		a4 |
	b b d |
	c b d |
	c c d |
	b2. 

		c2 d4 |
	d2 d4 |
	c c d |
	d( c) b |
	c( b) a8[ g] |
	fs4 b b |
	c( e d8[ c]) |
	b2
}

bass = \relative c {
	\global
	\partial 4
	g4 |
	g' g fs |
	e e d |
	c e d |
	g2

		fs4 |
	e e b |
	c g' g |
	a a d, |
	g2. \bar "||"

	c,4( e) fs4 |
	g2 b,4 |
	c e d |
	b'( a) g |
	a2 a,4 |
	b ds e |
	c2( d4) |
	g2
}

verseOne = \lyricmode {
	\set stanza = "1."
	Im -- mac -- lu -- late Ma -- ry, thy prais -- es we sing, 
	Who reign -- est in splen -- dor with Je -- sus our King.
	
	\override Lyrics.LyricText.font-shape = #'italic
	A -- ve, a-- ve, a -- ve Ma -- ri -- a,
	a -- ve, a -- ve, Ma -- ri -- a.
}

verseTwo = \lyricmode {
	\set stanza = "2."
	In heav -- en, the bles -- sed thy glo -- ry pro -- claim;
	On earth, we thy chil -- dren in -- voke thy fair name.
}

verseThree = \lyricmode {
	\set stanza = "3."
	Thy name is our pow -- er, thy vir -- tues our light,
	Thy love is our com -- fort, thy plead -- ing our might.
}


verseFour = \lyricmode {
	\set stanza = "4."
	We pray for our moth -- er, the Church up -- on earth;
	And bless, dear -- est La -- dy, the land of our birth.
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



