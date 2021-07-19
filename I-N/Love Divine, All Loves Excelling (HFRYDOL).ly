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
      \line {HYFRYDOL 87 87 D}
    }
    \right-column{
      \line {Rowland H. Prichard, 1830}
      \line {harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Charles Wesley, 1747}
    }
  } 
}

\header {
  tagline = ""
}

global = {
	\key f \major
	\time 3/4
	%\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	f2 g4 |
	f4.( g8) a4 |
	bf2 a4 |
	g( f) g |
	c2 bf4 |
	a2 a4 |
	g( f) g |
	f2. \bar "||"

	f2 g4 |
	f4.( g8) a4 |
	bf2 a4 |
	g( f) g |
	c2 bf4 |
	a2 a4 |
	g( f) g |
	f2. \bar "||"
	
	c'2 c4 |
	c( bf) a |
	bf2 bf4 |
	bf( a) g |
	a2 a4 |
	a( bf) c |
	c( bf) a |
	g2. \bar "||"

	c4( a) c |
	bf( g) bf |
	a( f) a |
	g8[( a] bf[ a]) g4 |
	c2 c4 |
	d( c) bf |
	a2 g4 |
	f2. \bar "|."
}

alto = \relative c' {
	\global
	c2 e4 |
	f2 f4 |
	g2 f4 |
	e( d) e |
	f( c) d8[ e] |
	f2 f8[ e] |
	d2 e4 |
	f2. |

	c2 e4 |
	f2 f4 |
	g2 f4 |
	e( d) e |
	f( c) d8[ e] |
	f2 f8[ e] |
	d2 e4 |
	f2. |

	e2 e4 |
	f2 f4 |
	f( e) d |
	e( f) c |
	c2 f4 |
	f( g) a |
	a( g) f |
	f2( e4) |
	
	f2 a4 |
	g2 g4 |
	f( c) f |
	g8[ e] f4 c |
	c( f) ef |
	d( f) f |
	f2 e4 |
	f2. \bar "|." 
}

tenor = \relative c' {
	\global
	a2 g4 |
	a4.( bf8) c4 |
	d( c) c |
	c( a) c |
	c2 c4 |
	c2 c4 |
	bf( a) c |
	a2. |

	a2 g4 |
	a4.( bf8) c4 |
	d( c) c |
	c( a) c |
	c2 c4 |
	c2 c4 |
	bf( a) c |
	a2. |

	c2 c4 |
	f,( g) a |
	g2 g4 |
	g( c) bf |
	a2 c4 |
	d2 c4 |
	d2 d4 |
	g,2. |
	c2 d4 |
	d2 c4 |
	c( a) b |
	c bf bf |
	a2 c4 |
	bf( c) d |
	c2 bf4 |
	a2. \bar "|."
}

bass = \relative c, {
	\global
	f4( a) c |
	f2 f4 |
	f( e) f |
	c( d) c |
	a'2 g4 |
	f2 a,4 |
	bf( d) c |
	f2. |

	f,4( a) c |
	f2 f4 |
	f( e) f |
	c( d) c |
	a'2 g4 |
	f2 a,4 |
	bf( d) c |
	f2. |

	a2 a4 |
	d,2 d4 |
	g2 g4 |
	c,( d) e |
	f2 e4 |
	d2 a4 |
	g2 bf4 |
	c2. |
	
	a'2 f4 |
	f( e8[ d]) e4 |
	f( e) d |
	e8[ c] d4 e |
	f2 a,4 |
	bf( a) bf |
	c2 c4 |
	f2. \bar "|."
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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
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
