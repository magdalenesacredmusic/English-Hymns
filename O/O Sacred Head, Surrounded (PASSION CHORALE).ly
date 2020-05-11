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
      \line {PASSION CHORALE  76 76 D}
    }
    \right-column{
      \line {Hans Leo Hassler}
      \line {arr. J.S. Bach}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Salve caput cruentatum"}
      \line {Bernard of Clairvaux; Tr. H.W. Baker}
      %translation in Hymns Ancient and Modern
    }
  } 
}

\header {
  tagline = ""
}

global = {
	\key d \minor
	\time 4/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
	\global
	\partial 4
	a4 |
	d c bf a |
	g2 a4 e' |
	f f e8[ d] e4 |
	d2. \bar "" \break

	a4 |
	d c bf a |
	g2 a4 e' |
	f f e8[ d] e4 |
	d2. \bar "" \break

	f4 |
	e8[ d] c4 d e |
	f2 f4 c |
	d c bf8[ a] bf4 |
	a2. \bar "" \break

	f'!4 |
	e8[ f] g4 f e |
	d2 e4 a, |
	bf a g c |
	a2. \bar "|."
}

alto = \relative c' {
	\global
	\partial 4
	f4 |
	f8[ g] a4 d,8[ e] f4 |
	f( e) f a |
	a a a a8[ g] |
	f2. 

	f4 |
	f8[ g] a4 d,8[ e] f4 |
	f( e) f a |
	a a a a8[ g] |
	f2.

	a4 |
	g g8[ f] f4 bf |
	bf( a8[ g]) a4 

	a4 |
	a8[ g] a4 g8[ fs] g4 |
	fs2. 

	g4 |
	g c c c |
	c( b) c4 

	f,8[ e] |
	d8[ e] f4 f e |
	f2.
}

tenor = \relative c' {
	\global
	\partial 4
	d4 |
	d8[ e] f4 g c, |
	d( c) c e |
	e d d cs |
	a2.

	d4 |
	d8[ e] f4 g c, |
	d( c) c e |
	e d d cs |
	a2.

	d8[ c!] |
	bf4 c c bf8[ c] |
	d4( c8[ bf]) c4 

	f8[ ef] |
	d4 d d d |
	d2. 

	d4 |
	c8[ d] e4 f g |
	a( g) g 

	c, |
	bf c c8[ bf16 a] g8[ c] |
	c2.
}

bass = \relative c' {
	\global
	\partial 4
	d8[ c] |
	bf4 a g f |
	bf,( c) f4 cs |
	d8[ e] f[ g] a4 a, |
	d2. 

	d'8[ c] |
	bf4 a g f |
	bf,( c) f4 cs |
	d8[ e] f[ g] a4 a, |
	d2. 
	
	d4 |
	g a bf8[ a] g4 |
	f2 f4 

	f4 |
	bf fs g g, |
	d'2. 

	b4 |
	c c'8[ b] a4 g |
	f g c, 

	f4 |
	g a8[ bf] c4 c, |
	f2.
}

verseOne = \lyricmode {
	\set stanza = "1."
	O Sa -- cred Head, sur -- round -- ed
		By crown of pierc -- ing thorn!
	O bleed -- ing Head, so wound -- ed,
		Re -- viled, and put to scorn!
	Death's pal -- lid hue comes o'er Thee,
		The glow of life de -- cays,
	Yet An -- gel -- hosts a -- dore Thee,
		And trem -- ble as they gaze.
}

verseTwo = \lyricmode {
	\set stanza = "2."
	I see Thy strength and vi -- gour
		All fad -- ing in the strife,
	And death with cru -- el ri -- gour
		Be -- reav -- ing Thee of life;	
	O a -- gon -- y and dy -- ing!
		O love to sin -- ners free!
	Je -- sus, all grace sup -- ply -- ing,
		O turn Thy face on me.
}

verseThree = \lyricmode {
	\set stanza = "3."
	In this Thy bit -- ter Pas -- sion,
		Good Shep -- herd, think of me
	With Thy most sweet com -- pas -- sion,
		Un -- wor -- thy though I be:
	Be -- neath Thy Cross a -- bid -- ing
		For ev -- er would I rest,
	In Thy dear love con -- fid -- ing,
		And with Thy pre -- sence blest.
}

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { \transpose c g,
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
    \transpose c g,
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



