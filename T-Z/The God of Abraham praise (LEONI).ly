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
      \line {LEONI 66 84 d}
    }
    \right-column{
      \line {Hebrew Melody, adapt. Meyer Lyon}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Yigdal Elohim Hai"}
      \line {attr. Daniel ben Judah; para. T. Olivers, 1770, alt.}
    }
  } 
}



global = {
	\key af \major
	\time 4/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	\partial 4
	c4 |
	f g af bf |
	c2. af4 |
	bf c df ef |
	c2. \bar "||" \break

		g4 |
	af bf c df |
	ef g, af df |
	c2 bf |
	af2. \bar "||" \break

	af4 |
	c c c c |
	bf2. af8[ g] |
	f[ g] af[ bf] c4 f, |
	f( e2) \bar "||" \break

		c4 |
	f g af bf |
	c bf8[ c] df4 c8[ bf] |
	af2 g |
	f2. \bar "|."
}

alto = \relative c' {
	\global
	\partial 4 
	c4 |
	c c c f |
	e2. c4 |
	f ef f ef |
	ef2. 

		ef4 |
	ef df c f |
	ef df c f |
	ef2 ef4( df) |
	c2. 

		ef4 |
	ef c8[ df] ef4 f |
	g2. ef4 |
	df df c df |
	c2. 

		c4 |
	c c c ef |
	ef f f g |
	f2 e |
	f2.
}

tenor = \relative c {
	\global
	\partial 4
	c4 |
	f e f f |
	g2. af4 |
	f af af g |
	af2. 

		bf4 |
	af g af af |
	af bf af af |
	af2 g |
	af2.

		c8[ bf] |
	af4 af af af |
	g2. af4 |
	af f af af |
	g2.

		e4 |
	f e f g |
	af af bf df |
	c2 c4( bf) |
	af2.
}

bass = \relative c {
	\global
	\partial 4 
	c4 |
	af c f df |
	c2. f4 |
	df c bf ef |
	af,2.

		ef'8[ df] |
	c4 bf af df |
	c ef f bf, |
	ef2 ef |
	af,2.

		af'4 |
	af af,8[ bf] c4 d |
	ef2. c4 |
	df df af bf |
	c2. 

		c8[ bf] |
	af4 c f ef |
	af df,8[ c] bf4 bf |
	c2 c |
	f2.
}

verseOne = \lyricmode {
	\set stanza = "1."
	 The God of A -- braham praise,
	 Who reigns en -- throned a -- bove;
	An -- cient of ev -- er -- last -- ing days,
	 And God of love;
	To him up -- lift your voice,
	At whose su -- preme com -- mand
	From earth we rise, and seek the joys 
	 At his right hand.
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	He by him -- self has sworn;
	I on his oath de -- pend;
	I shall, on ea -- gle -- wings up -- borne
	To heav'n as -- cend:
	I shall be -- hold his face,
	I shall his pow'r a -- dore,
	And sing the won -- ders of his grace
	For ev -- er -- more.
}

verseThree = \lyricmode {
	\set stanza = "3."
	There dwells the Lord, our King,
	The Lord, our Right -- eous -- ness,
	Tri -- umph -- ant o'er the world and sin,
	The Prince of Peace,
	On Zi -- on's sa -- cred height
	His king -- dom he main -- tains,
	And, glo -- rious with his saints in light,
	For ev -- er reigns.
}

verseFour = \lyricmode {
	\set stanza = "4."
	The God who reigns on high
	The great arch -- an -- gels sing,
	And ‘Ho -- ly, Ho -- ly, Ho -- ly,’ cry, 
	‘Al -- might -- y King!
	Who was, and is, the same,
	For all e -- ter -- ni -- ty,
	Im -- mor -- tal Fa -- ther, great I AM,
	All glo -- ry be.’
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
            \new Lyrics  \lyricsto soprano \verseFour
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 84 2 )
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}