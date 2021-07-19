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
      \line {IN DIR IST FREUDE, Irreg.}
    }
    \right-column{
      \line {Giovanni G. Gastoldi, 1593}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "In dir ist Freude"}
      \line {Johann LIndemann( 1549-c.1631), 1598; tr. Catherine Winkworth (1827-78) 1858}
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

melody = \relative c'' {
	\global
	c4 c bf |
	a2 f4 |
	c' c bf |
	a2 f4 |
	c'2 bf4 |
	a4.( g8) f4 |
	g2 g4 |
	f2. \bar "||" \break
	
	c'4 c bf |
	a2 f4 |
	c' c bf |
	a2 f4 |
	c'2 bf4 |
	a4.( g8) f4 |
	g2 g4 |
	f2. \bar "||" \break
	
	a4 bf c |
	d2 bf4 |
	d ef c |
	d2 bf4 |
	c a bf |
	c2 c4 |
	bf4 g a |
	bf2 bf4 |
	bf bf a |
	g4.( f8) e4 |
	f f e |
	f2. \bar "||" \break
	
	a4 bf c |
	d2 bf4 |
	d ef c |
	d2 bf4 |
	c a bf |
	c2 c4 |
	bf4 g a |
	bf2 bf4 |
	bf bf a |
	g4.( f8) e4 |
	f f e |
	f2. \bar "|."
}

alto = \relative c' {
	\global
	f4 f f |
	f2 c4 |
	f f f |
	f2 c4 |
	f2 f4 |
	f4.( e8) d4 |
	d2 c4 |
	a2. |
	
	f'4 f f |
	f2 c4 |
	f f f |
	f2 c4 |
	f2 f4 |
	f4.( e8) d4 |
	d2 c4 |
	a2. |
	
	f'4 f f |
	f2 f4 |
	g g f |
	f2 f4 |
	f f f |
	e2 e4 |
	d g fs |
	g2 g4 |
	f4 f f |
	e4.( d8) cs4 |
	d d c |
	c2. |
	
	f4 f f |
	f2 f4 |
	g g f |
	f2 f4 |
	f f f |
	e2 e4 |
	d g fs |
	g2 g4 |
	f4 f f |
	e4.( d8) cs4 |
	d d c |
	c2.
}

tenor = \relative c' {
	\global
	a4 c d |
	c2 a4 |
	a c d |
	c2 a4 |
	c2 d4 |
	c2 a4 |
	g2 e4 |
	f2. |
	
	a4 c d |
	c2 a4 |
	a c d |
	c2 a4 |
	c2 d4 |
	c2 a4 |
	g2 e4 |
	f2. |
	
	f4 f a |
	bf2 bf4 |
	bf c a |
	bf2 d4 |
	a c d |
	g,2 g4 |
	bf4 d d |
	d2 d4 |
	d d c |
	c4.( a8) a4 |
	a bf g |
	a2. |
	
	f4 f a |
	bf2 bf4 |
	bf c a |
	bf2 d4 |
	a c d |
	g,2 g4 |
	bf4 d d |
	d2 d4 |
	d d c |
	c4.( a8) a4 |
	a bf g |
	a2.
}

bass = \relative c {
	\global
	f4 a bf |
	  f2 f4 |
	  f a bf |
	  f2 f4 |
	  a2 bf4 |
	  c4.( c,8) d4 |
	  bf2 c4 |
	  f2. |
	  
	  f4 a bf |
	  f2 f4 |
	  f a bf |
	  f2 f4 |
	  a2 bf4 |
	  c4.( c,8) d4 |
	  bf2 c4 |
	  f2. |
	  
	  f4 d c |
	  bf2 d4 |
	  g4 c, f |
	  bf,2 bf4 |
	  f'4 f d |
	  c2 c4 |
	  g'4 bf a |
	  g2 g4 |
	  bf4 bf f |
	  c4.( d8) a4 |
	  d4 bf c |
	  f2. |
	  
	    f4 d c |
	  bf2 d4 |
	  g4 c, f |
	  bf,2 bf4 |
	  f'4 f d |
	  c2 c4 |
	  g'4 bf a |
	  g2 g4 |
	  bf4 bf f |
	  c4.( d8) a4 |
	  d4 bf c |
	  f2.
}

verseOne = \lyricmode {
	\set stanza = "1."
  In Thee is glad -- ness, a -- mid all sad -- ness,
  Je -- sus, sun -- shine of my heart.
  By Thee are giv -- en the gifts of Heav -- en,
  Thou the true Re -- deem -- er art.
  Our souls Thou mak -- est, our bonds Thou break -- est;
  Who trusts Thee sure -- ly hath built se -- cure -- ly,
  And stands for -- ev -- er. Al -- le -- lu -- ia!
  Our hearts are pin -- ing
  To see Thy shin -- ing, 
  Dy -- ing our liv -- ing
  To Thee are cleav -- ing,
  Naught can us sev -- er:
  Al -- le -- lu -- ia!
}

verseTwo = \lyricmode {
	\set stanza = "2."
  If God be ours, _ we fear no pow -- ers,
  Not of earth or sin or death.
  God sees and bless -- es in worst dis -- tress -- es,
  And can change them in a breath.
  Where -- fore the sto -- ry tell of God’s glo -- ry
  With heart and voic -- es; all Heav'n re -- joic -- es,
  Sing -- ing for -- ev -- er: Al -- le -- lu -- ia!
  We shout for glad -- ness,
  Tri -- umph o'er sad -- ness,
  Love Him and praise Him,
  And still shall raise Him,
  Glad hymns for -- ev -- er:
  Al -- le -- lu -- ia!
}


\book {
  \include "hymn_paper_multipage.ly.ly"
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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 108 4)
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
