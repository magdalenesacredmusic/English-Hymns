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
   poet = \markup{ \fontsize #4 \smallCaps "Thy Hand, O God Hath Guided"  }
    meter = \markup { \small { Music: THORNBURY, 76.76 D, Basil Harwood, 1898 } }
    piece = \markup { \small {Text: R. H. Plumptre }}
    %breakbefore
    %copyright = ""
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
	d,2 cs4 \bar "||"

	e |
	a b g8[ fs] e4 |
	fs2. \bar "||" \break

	a4 |
	fs4 cs d b' |
	d,2 cs4 \bar "||"

	e |
	a b g8[ fs] e4 |
	d2. \bar "||" \break

	fs4 |
	fs8[ gs] a4 gs fs |
	fs( es) fs \bar "||"

	gs |
	a8[ b] cs4 fs, es |
	fs2. \bar "||" \break

	a4 |
	a b8[ cs] d4 fs, |
	g( a) b \bar "||"

	a |
	d2. a4 |
	d,2 b' |
	a1~ |
	a2. \bar "|."
}

soprano = \relative c' {
	\global
	\partial 4
	<d a'>4 |
	<d fs> cs d <b d b'> |
	d2 <a cs>4 <a cs e> |
	<a a'> <b b'> g'8[ fs] <g, cs e>4 |
	<a a'>2. 

	<a d a'>4 |
	<d fs> cs d <b d b'> |
	d2 <a cs>4 <a cs e> |
	<a a'> <b b'> g'8[ fs] <g, cs e>4 |
	<a d>2. 

	<d fs>4 |
	fs8[ gs] <fs a>4 <d gs> fs |
	fs es fs <cs gs'> |
	a'8[ b] <fs cs'>4 <d fs> gs |
	fs2. 

	<cs e a>4 |
	<d a'> b'8[ cs] <fs, d'>4 <d fs> |
	g a b <cs, e a> |

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
	Our fa -- thers owned Thy good -- ness,
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


\score { <<
	 \new Voice = "melody" {\melody }
	\new Lyrics \lyricsto "melody" \verseOne
	  \new Lyrics \lyricsto "melody" \verseTwo
	  \new Lyrics \lyricsto "melody" \verseThree 
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \soprano >> }
      \context Voice =
         altos { \voiceTwo << \alto >> }
      
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
        tenors { \voiceOne << \tenor >> }
      \context Voice =
        basses { \voiceTwo << \bass >> }
    >>
  >>
>>
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 112 4)
            }
       }
  \layout {}
}

\markup { 
	\large {
	\fill-line {
	\hspace #1.0
	\column {
		\line { \bold "*4. "
		\column {
		"And we, shall we be faithless?"
		"  Shall hearts fail, hands hang down?"	
		"Shall we evade the conflict,"
		"  And cast away our crown?"
		"Not so: in God's deep counsels"
		"  Some better thing is stored;"
		"We will maintain, unflinching,"
		"  One Church, one Faith, one Lord."
		}
		}
		\vspace #0.5
		\line { \bold "5. "
		\column {
		"Thy mercy will not fail us,"
		"  Nor leave Thy work undone;"
		"With Thy right hand to help us,"
		"  The victory shall be won;"
		"And then, by men and angels,"
		"  Thy name shall be adored,"
		"And this shall be their anthem,"
		"  One Church, one Faith, one Lord."
  		}	
		}
		}
	\hspace #1.0

	}
  }
}



