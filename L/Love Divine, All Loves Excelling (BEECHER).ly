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
   poet = \markup{ \fontsize #4 \smallCaps "Love Divine, All Loves Excelling"  }
    meter = \markup { \small { Music: BEECHER, 8.7.8.7. D, John Zundel, 1870 } }
    piece = \markup { \small {Text: Charles Wesley, 1747 }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key bf \major
	\time 4/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	f4 f g f |
	d' c8[ d] c4 bf |
	a g bf g |
	f ef8[ f] d2 |
	
	f4 f g f |
	d' c8[ d] c4 bf |
	g ef' d bf |
	a g8[ a] bf2 |
	
	bf4 bf bf a |
	g a8[ g] fs4 d |
	d' d ef d |
	c c8[ d] c2 |
	
	f,4 f g f |
	d' c8[ d] c4 bf |
	g ef' d bf |
	a g8[ a] bf2 \bar "|."
}

alto = \relative c' {
	\global
	d4 d ef d |
	f ef8[ f] ef4 d |
	f ef g ef |
	d c bf2 |
	
	d4 d ef d |
	f ef8[ f] ef4 d |
	ef g f f |
	ef ef d2 |
	
	d4 g g fs |
	g d d d |
	d f g f |
	f e f( ef) |
	
	d d ef d |
	f ef8[ f] ef4 d |
	ef4 g f f |
	ef ef d2 \bar "|."
}

tenor = \relative c {
	\global
	f4 f g bf |
	bf a a bf |
	bf bf bf bf |
	bf a f2 |
	
	f4 f g bf |
	bf a a bf |
	bf bf bf d |
	c f, f2 |

	g4 d' d c |
	bf c8[ bf] a4 d, |
	f bf bf bf |
	a bf a2 |

	f4 f g bf |
	bf a a bf |
	bf bf bf d |
	c f, f2 \bar "|."
}

bass = \relative c {
	\global
	bf4 bf bf bf |
	bf f f bf |
	ef ef ef ef |
	f f, bf2 |

	bf4 bf bf bf |
	bf f' fs g |
	ef ef f f |
	f f, bf2 |

	g4 bf d d |
	d d d d |
	bf bf bf bf |
	c c f2 |
	
	bf,4 bf bf bf |
	bf f' fs g |
	ef ef f f |
	f f, bf2 \bar "|."
}

verseOne = \lyricmode {
	\set stanza = "1."
	Love di -- vine, all loves ex -- cel -- ling,
	Joy of heav'n to earth come down;
	Fix in us thy hum -- ble dwel -- ling;
	All thy faith -- ful mer -- cies crown!
	Je -- sus, Thou art all com -- pas -- sion,
	Pure un -- bound -- ed love Thou art;
	Vis -- it us with Thy sal -- va -- tion;
	En -- ter ev' -- ry tremb -- ling heart.
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	Come, Al -- migh -- ty to de -- liv -- er,
	Let us all Thy life re -- ceive;
	Sud -- den -- ly re -- turn and nev -- er,
	Nev -- er more Thy tem -- ples leave.
	Thee we would be al -- ways bles -- sing,
	Serve Thee as Thy hosts a -- bove,
	Pray and praise Thee with -- out ceas -- ing,
	Glo -- ry in Thy per -- fect love.
}

verseThree = \lyricmode {
	\set stanza = "3."
	Fin -- ish, then, Thy new cre -- a -- tion;
	Pure and spot -- less let us be.
	Let us see Thy great sal -- va -- tion
	Per -- fect -- ly re -- stored in Thee;
	Changed from glo -- ry in -- to glo -- ry,
	Till in heav'n we take our place,
	Till we cast our crowns be -- fore Thee,
	Lost in won -- der, love, and praise.
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
    \new Staff  <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 88 4)
    }
  }
  \layout { }
}
