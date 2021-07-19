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
      \line {WEIMAR (VULPIUS) 7676}
    }
    \right-column{
      \line {melody, Melchior Vulpius 1609 }
      \line {harm. \italic "The Hymnal," 1940}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Joseph Simpson Cook, (1859-1933) 1919}
    }
  } 
}

\header {
  tagline = ""
}


global = {
	\key f \major
	\cadenzaOn
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
	\global
	a2 g4 f2 g4 \bar "|"
	a4 bf c2 \bar "|"
	d2 c4 bf2 a4 \bar "|"
	g2 f \bar "||" \break

	a2 c4 bf2 a4 \bar "|"
	g f e2 \bar "|"
	f2 g4 a2 a4 \bar "|"
	bf2 a \bar "||" \break

	a2 bf4 c2 bf4 \bar "|"
	a g a2 \bar "|"
	g2 g4 a c \bar "|"	
	b2 c \bar "||" \break

	c2 a4 d2 c4 \bar "|"
	\orAcc bf a g2 \bar "|" 
	a2 c4 bf2 a4 \bar "|"
	g2 f \bar "|."
}

alto = \relative c' {
	\global
	f2 e4 d2 d4 
	f f e2 
	f2 f4 f2 f4 
	e2 f

	f2 f4 f2 f4 
	e d cs2
	d e4 f2 f4 
	g2 fs

	\orAcc d2 d4 f2 d4 \revAcc
	f d e2
	d2 d4 f e
	g2 e 

	e2 f4 f2 f4 
	f f e2
	f2 g4 f2 f4 
	f( e) f2	
}

tenor = \relative c' {
	\global
	c2 c4 a2 bf4 
	c f, g2 
	bf c4 d2 c4 
	c2 a
	
	c2 a4 d2 c4 
	c a a2
	a2 c4 c2 d4 
	d2 d

	fs,2 g4 a2 bf4 
	c d cs2 
	\orAcc		d bf4 c c 
	d2 c
	\revAcc

	g2 f4 bf2 c4 
	d c c2 
	c2 c4 d2 c4 
	c2 a
}

bass = \relative c {
	\global
	f2 c4 d2 g4 
	f d c2 
	bf2 a4 bf2 f4 
	c'2 f, 

	f'2 f4 bf,2 f'4 
	c d a2 
	d2 c4 f2 d4 
	g2 d
	
	d2 g4 f2 g4 
	a bf a2 
	bf g4 f a 
	g2 c, 
	
	c2 d4 bf2 a4
	bf f' c2 
	f2 e4 d2 f4 
	c2 f
}

verseOne = \lyricmode {
	\set stanza = "1."
	Gen -- tle Ma -- ry laid her child
	Low -- ly in a man -- ger;
	There He lay, the un -- de -- filed, 
	To the world a stran -- ger.
	Such a babe in such a place,
	Can He be the Sa -- viour?
	Ask the saved of all the race
	Who have found His fa -- vor.
}

verseTwo = \lyricmode {
	\set stanza = "2."
	An -- gels sang a -- bout His birth;
	Wise men sought and found Him;
	Hea -- ven's star shone bright -- ly forth,
	Glo -- ry all a -- round Him.
	Shep -- herds saw the won -- drous sight,
	Heard the an -- gels sing -- ing;
	All the plains were lit that night, 
	All the hills were ring -- ing.
}

verseThree = \lyricmode {
	\set stanza = "3."
	Gen -- tle Ma -- ry laid her child
	Low -- ly in a man -- ger;
	He is still the un -- de -- filed,
	But no more a stran -- ger.
	Son of God, of hum -- ble birth,
	Beau -- ti -- ful the sto -- ry;
	Praise His Name in all the earth,
	Hail the King of glo -- ry!
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
        tempoWholesPerMinute = #(ly:make-moment 63 2)
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


