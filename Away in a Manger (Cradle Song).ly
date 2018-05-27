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
          \line {CRADLE SONG 11 11 11 11}
      }
      \column{
      \line {William J. Kirkpatrick, 1895}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {Anon.; attr. Martin Luther}
   }
  } 
}

\header {
  tagline = ""
}

global = {
	\key f \major
	\time 3/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	\partial 4
	c4 |
	f f g8[ a] |
	f4 f a8[ bf] |
	c4 c d |
	bf2 \bar "||" \break
	
	g8[ a] |
	bf4 bf c |
	a a f8[ a] |
	g4 d f |
	e2 \bar "||" \break

	c4 |
	f f g8[ a] |
	f4 f a8[ bf] |
	c4 c d |
	bf2 \bar "||" \break

	g8[ a] |
	bf4 bf c |
	a a f8[ a] |
	g4 d e |
	f2 \bar "|."
}

alto = \relative c' {
	\global
	\partial 4
	c4 |
	c c c |
	
	c c f |
	f f f |
	d2 

	g4 |
	g4. f8 e4 |
	f f f |
	d d b |
	c2 

	c4 |
	c c c |
	c c f |
	e e fs |
	d2 

	g4 |
	g4. f8 e4 |
	f f f |
	d d c8[ bf] |
	a2 \bar "|."
}

tenor = \relative c' {
	\global
	\partial 4	
	c8[ bf] |
	a4 a bf8[ c] |
	a4 a c |
	c c a |
	bf2 

	bf8[ c] |
	d4 d c |
	c c a8[ c] |
	b4 b g |
	g2 

	c8[ bf] |
	a4 a bf8[ c] |
	a4 a c |
	c c a |
	bf2 
	
	bf8[ c] |
	d4 d c |
	c c c |
	bf4. a8 g4 |
	f2 \bar "|."
}

bass = \relative c {
	\global
	\partial 4
	c4 |
	f f f |
	f f f8[ g] |
	a4 a d, |
	g2 

	g4 |
	g g c, |
	f f f |
	g g g, |
	c2

	c4 |
	f f f |
	f f f8[ g] |
	a4 a d, |
	g2 

	g4 |
	g g c, |
	f f a, |
	bf bf c |
	f2 \bar "|."
}

verseOne = \lyricmode {
	\set stanza = "1."
	A -- way in a man -- ger, 
	No crib for His bed,
	The lit -- tle Lord Je -- sus 
	Laid down His sweet head;
	The stars in the sky _
	Looked down where He lay,
	The lit -- tle Lord Je -- sus, 
	a -- sleep on the hay.
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	The cat -- tle are low -- ing, 
	The poor ba -- by wakes,
	But lit -- tle Lord Je -- sus, 
	No cry -- ing He makes.
	I love thee, Lord Je -- sus!
	Look down from the sky,
	And stay by my cra -- dle 
	Till morn -- ing is nigh.
}

verseThree = \lyricmode {
	\set stanza = "3."
	Be near me, Lord Je -- sus,
	I ask Thee to stay
	Close by me for -- ev -- er,
	And love me, I pray;
	Bless all the dear chil -- dren 
	In Thy ten -- der care,
	And fit us for heav -- en,
	To live with Thee there.
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
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