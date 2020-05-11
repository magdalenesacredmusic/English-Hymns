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
      \line {WINKWORTH}
    }
    \right-column{
      \line {Joseph Barnby, 1869}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Richard Frederick Littledale, 1864}
    }
  } 
}

\header {
  tagline = ""
}

global = {
	\key g \minor
	\cadenzaOn
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	d4 \bar "|"
	d4. e8 fs4 g \bar "|"
	g fs g g \bar "|"
	f4. g8 a4 bf \bar "|"
	bf a bf2 \bar "|" \break
	
	  bf4 \bar "|"
	  a g fs g \bar "|"
	  f ef d d \bar "|"
	  ef f g8[ a] bf4 \bar "|"
	  bf a bf2 \bar "|" \break
	  
	  fs4^\markup {\italic Refrain} \bar "|"
	  g4 a bf8[ c] d4 \bar "|"
	  d c d \bar ""
	  d \bar "|"
	  c8[ bf] a4 bf a8[ g] \bar "|"
	  fs[ g] a4 g2 \bar "|."
}

alto = \relative c' {
	\global
	a4
	d d d d 
	ef d d ef 
	d f f f 
	g f f2 
	
	f4
	f d d d 
	c c c b 
	c d ef f 
	g f f2
	
	d4 
	d d d d 
	g g fs 
	  g8[ f]
	ef8[ d] c4 d8[ f] ef4 
	d e8[ fs] g2
	
}

tenor = \relative c {
	\global
	fs4
	g bf a g 
	a a bf c 
	a d c bf 
	ef8[ d] c4 d2
	
	d4
	c bf a bf
	a g a g 
	g bf bf8[ c] d4 
	ef8[ d] c4 d2
	
	a4
	bf a g a 
	bf8[ a] g4 a
	  b
	c8[ d] ef4 d c8[ bf] 
	a8[ bf] c4 bf2
}

bass = \relative c {
	\global
	d4
	bf g d'8[ c] bf4 
	c4 d g, c 
	d bf f'8[ ef] d4
	c f bf,2
	
	bf'4
	f g d bf 
	c c fs, g 
	c bf ef d
	c f bf,2
	
	  d4
	bf' fs g f
	ef ef d
	g,
	c f bf, c 
	d d g,2
	
}

verseOne = \lyricmode {
	\set stanza = "1."
	O Lord, to whom the spi -- rits live
	Of all the faith -- ful passed a -- way,
	Un -- to their path that bright -- ness give
	Which shin -- eth to the per -- fect day.
	
	O Lamb of God, Re -- deem -- er blest,
	Grant them e -- ter -- nal light and rest.
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	Bless thou the dead who dies in thee,
	As thou hast giv -- en them re -- lease,
	So quick -- en them thy face to see,
	And give them ev -- er -- last -- ing peace.
}

verseThree = \lyricmode {
	\set stanza = "3."
	In thy gree, plea -- sant pas -- tures feed 
	The sheep that thou hast sum -- moned hence;
	And by the still, cool wa -- ters lead
	Thy flock in lov -- ing prov -- i -- dence.
}

verseFour = \lyricmode {
	\set stanza = "4."
	Dir -- ect us with thine arm of might,
	And bring us, per -- fect -- ed, with them
	to dwell with -- in thy cit -- y bright,
	the heav -- en -- ly Je -- ru -- sa -- lem.
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}


