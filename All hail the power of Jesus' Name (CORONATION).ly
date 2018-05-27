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
          \line {CORONATION   86 86 86}
      }
      \column{
      \line {Oliver Holden (1765-1844), 1793}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {"Edward Perronet (1726-1792), 1779, alt."}
   }
  } 
}

global = {
	\key f \major
	\time 4/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	\partial 4
	c4 |
	f f a a |
	g f g a |
	g f a g |
	f2. \bar "||" \break
	
	g4 |
	a g f a |
	c8[ bf] a[ g] a4 c |
	c2 c |
	d c4( b) |
	c2. \bar "||" \break
	
	a4 |
	c a f a |
	g8[ f] g[ a] g4 f |
	c'2 bf |
	a4.( bf8 g4) g |
	f2. \bar "|."
}

alto = \relative c' {
	\global
	\partial 4
	c4 |
	a c c f |
	e f e f |
	e f f e |
	f2. c4 |
	f c a f' |
	a8[ g] f[ e] f4 e|
	f2 g |
	f e4( d) |
	e2. f4 |
	c f c f |
	e8[ d] e[ f] e4 f |
	f2 f |
	f2. e4 |
	f2.
}

tenor = \relative c {
	\global
	\partial 4
	c4 |
	f a c c |
	c a c c |
	bf a c bf |
	a2. g4 |
	a g f a |
	c8[ bf] a[ g] a4 g |
	a2 g |
	a g |
	g2. f4 |
	a c c c |
	c g c a |
	c2 d |
	c2. bf4 |
	a2.
}

bass = \relative c {
	\global
	\partial 4
	c4 |
	f4 f f f |
	c d c a |
	c d c c |
	f2. c4 |
	f c a f' |
	a8[ g] f[ e] f4 c |
	f2 e |
	d g, |
	c2. f4 |
	f f a f |
	c c c d |
	a2 bf |
	c2. c4 |
	f2.
}


verseOne = \lyricmode {
	\set stanza = "1."
        All hail the pow'r of Je -- sus' Name!
        Let an -- gels pros -- trate fall;
        Bring forth the roy -- al di -- a -- dem,
        And crown him Lord of all!
        Bring forth the roy -- al di -- a -- dem,
        And crown him Lord of all!
}

verseTwo = \lyricmode {
	\set stanza = "2."
	Crown him, ye mar -- tyrs of our God, 
	Who from his al -- tar call:
	Praise him whose way of pain ye trod,
	And crown him Lord of all!
	Praise him whose way of pain ye trod,
	And crown him Lord of all!
}

verseThree = \lyricmode {
	\set stanza = "3."
	Hail him, the Heir of Da -- vid's line,
	Whom Da -- vid Lord did call,
	The God in -- car -- nate, Man di -- vine,
	And crown him Lord of all!
	The God in -- car -- nate, Man di -- vine,
	And crown him Lord of all!
}

verseFour = \lyricmode {
	\set stanza = "4."
	Ye seed of Is -- rael's cho -- sen race,
	Ye ran -- somed of the fall,
	Hail him who saves you by his grace,
	And crown him Lord of all!
	Hail him who saves you by his grace,
	And crown him Lord of all!
}

verseFive = \lyricmode {
  \set stanza = "5."
  Sin -- ners, whose love can ne'er for -- get
  The worm -- wood and the gall,
  Go, spread your tro -- phies at his feet,
  And crown him Lord of all!
   Go, spread your tro -- phies at his feet,
  And crown him Lord of all!
}

verseSix = \lyricmode {
  \set stanza = "6."
  Let ev -- 'ry kind -- red, ev -- 'ry tribe,
  On this ter -- res -- trial ball,
  To him all ma -- jes -- ty as -- cribe,
  And crown him Lord of all!
    To him all ma -- jes -- ty as -- cribe,
  And crown him Lord of all!
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
      \new Lyrics \lyricsto soprano \verseFour
      \new Lyrics \lyricsto soprano \verseFive
      \new Lyrics \lyricsto soprano \verseSix
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
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive}
      \new Lyrics \lyricsto "tune" { \verseSix}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
