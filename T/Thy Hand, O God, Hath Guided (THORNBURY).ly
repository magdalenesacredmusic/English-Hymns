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
      \line {THORNBURY  76 76 D}
    }
    \right-column{
      \line {Basil Harwood, 1898}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {R. H. Plumptre}
      \line {}
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

melody = \relative c'' {
	\global
	\partial 4
	a4 |
	fs cs d b' |
	d,2 cs4

	e |
	a b g8[ fs] e4 |
	fs2.

	a4 |
	fs4 cs d b' |
	d,2 cs4 

	e |
	a b g8[ fs] e4 |
	d2.

	fs4 |
	fs8[ gs] a4 gs fs |
	fs( es) fs

	gs |
	a8[ b] cs4 fs, es |
	fs2.

	a4 |
	a b8[ cs] d4 fs, |
	g( a) b

	a |
	d2. a4 |
	d,2 b' |
	a1~ |
	a2. \bar "|."
}

soprano = \relative c' {
	\global
	\partial 4
	<d a'>4^\markup {\italic "To be sung in unison"} |
	<d fs> cs d <b d b'> |
	d2 <a cs>4 <a cs e> |
	<a a'> <b b'> g'8[ fs] <g, cs e>4 |
	<a a'>2. \bar "" \break

	<a d a'>4 |
	<d fs> cs d <b d b'> |
	d2 <a cs>4 <a cs e> |
	<a a'> <b b'> g'8[ fs] <g, cs e>4 |
	<a d>2.  \bar "" \break

	<d fs>4 |
	fs8[ gs] <fs a>4 <d gs> fs |
	fs( es) fs <cs gs'> |
	a'8[ b] <fs cs'>4 <d fs> gs |
	fs2.  \bar "" \break

	<cs e a>4 |
	<d a'> b'8[ cs] <fs, d'>4 <d fs> |
	g( a) b <cs, e a> |

	<d d'>2. <a cs a'>4 |
	d2 b'2 |
	a1~ |
	a2. \bar "|."
}

alto = \relative c' {
	\global
	\partial 4
	s4 |
	s1
	a4 <gs b> s2 |
	d'2 <b d>4 s4 |
	e cs d s |
	s1 |
	a4 gs s2 |
	fs' <b, d>4 s |
	s1 |
	cs4 s2 a8[ b] |
	cs2. s4 |
	cs s2 cs8[ b] |
	cs4 d cs s |
	s4 g' s2 |
	d2. s4 |
	<a' d>4 <a cs>8[ <g b>] <fs a>4 fs8[ e] |
	d4 cs <b d> <cs e> |
	<d fs> d <b g'> <cs fs>8[ <cs e>] |
	<d fs>2. \bar "|."
}

tenor = \relative c' {
	\global
	\partial 4
	s4 |
	s4 a8[ g] s2 |
	s1 |
	s1 |
	s1 |
	s4 a8[ g] s2 |
	s1 |
	s1 |
	g4 e fs s |
	s2. fs8[ gs] |
	a4 gs8[ b] s2 |
	s2 cs8[ b] a[ gs] |
	a4 b a s |
	a2. s4 |
	s1 |
	d,1 |
	<d fs>2 d4 e |
	fs4 fs e <<{\voiceOne a4~} \\ { \voiceFour a8[ g]}>> |
	<fs a>2. \bar "|."
}

bass = \relative c {
	\global
	\partial 4
	<d fs>4 |
	<d a'> <a e'> <b d fs> <g g'> |
	<fs fs'> \tieUp <e e'>~ <a e'> <g! e'> |
	<fs fs'> <g g'> <e e'> <a e'> |
	<d, d'>2. <d' fs>4 |
	<d a'> <a e'> <b d fs> <g g'> |
	<fs fs'> <b e>~ <a e'> <g! e'> |
	<fs fs'> <g g'>8[ <fs fs'>] <e e'>4 a |
	<d, d'>2. <d' a'>4 |
	<fs a> <a, cs'> <b b'> d |
	cs2 <fs a>4 es |
	fs <a, cs'> b cs |
	fs2. <g a>4 |
	fs e d <cs a'> |
	<b g'> <a fs'> <gs e'> <a e' a> |
	<fs a'> <g b'> <a fs' a> <a e' g> |
	b a <g g'>2 |
	\tieDown <d d'>1~ |
	<d d'>2. \bar "|."
}


verseOne = \lyricmode {
	\set stanza = "1."
	Thy hand, O God, has guid -- ed
	Thy flock, from age to age;
	The wond -- rous tale is writ -- ten,
	Full clear, on ev' -- ry page;
	Our fa -- thers owned thy good -- ness,
	And we their deeds re -- cord;
	And both of this bear wit -- ness,
	One Church, one Faith, one Lord.
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	Thy her -- alds brought glad ti -- dings
	To great -- est and to least;
	They bade men rise, and has -- ten
	To share the great King's feast;
	And this was all their teach -- ing,
	In ev' -- ry deed and word,
	To all a -- like pro -- claim -- ing
	One Church, one Faith, one Lord.
}

verseThree = \lyricmode {
	\set stanza = "*3."
	Through ma -- ny_a day of dark -- ness,
	Through ma -- ny_a scene of strife,
	The faith -- ful few fought brave -- ly
	To guard the na -- tion's life.
	Their Gos -- pel of re -- demp -- tion,
	Sin par -- doned, man re -- stored,
	Was all in this en -- fold -- ed,
	One Church, one Faith, one Lord.
}

verseFour = \lyricmode {
  \set stanza = "*4."
  And we, shall we be faith -- less?
		  Shall hearts fail, hands hang down?
		Shall we e -- vade the con -- flict,
		  And cast a -- way our crown?
		Not so: in God's deep coun -- sels
		  Some bet -- ter thing is stored;
	      We will main -- tain, un -- flinch -- ing,
		  One Church, one Faith, one Lord.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Thy mer -- cy will not fail us,
		  Nor leave thy work un -- done;
		With thy right hand to help us,
		  The vic -- t'ry shall be won;
		And then, by men and an -- gels,
		  Thy name shall be a -- dored,
		And this shall be their an -- them,
		  One Church, one Faith, one Lord.
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
        \new Voice = "soprano" { \voiceOne \soprano }
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
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}