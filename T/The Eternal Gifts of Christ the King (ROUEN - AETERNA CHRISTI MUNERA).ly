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
      \line {AETERNA CHRISTI MUNERA (ROUEN)  LM}
    }
    \right-column{
      \line {Rouen Church Melody}
      \line {harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Aeterna Christi munera"}
      \line {Ambrose of Milan (340-397); tr. J.M. Neale, 1851}
    } 
  }
}


global = {
	\key g \major
	\time 3/4
	%\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	\partial 4 
	d'4 ^\markup { \italic "To be sung in unison."} | 
	c( b) a | 
	b( g) a | 
	b( a4.) g8 | 
	g2 
	
	b4 | 
	d2 d4 | 
	b2 g4 | 
	c( b) a | 
	a2 
  
	a4 |
	b2 g4 |
	e2 a4 |
	g( fs) e  | 
	d2 
	
	d'4 | 
	a4( b) g | 
	c( b) a | 
	b( a4.) g8 | 
	g2 \bar "|"
}

soprano = \relative c' {
	\global
	\partial 4 
	d'4 | 
	c( b) a | 
	b( g) a | 
	b( a4.) g8 | 
	g2 \bar "||" 
	
	b4 | 
	d2 d4 | 
	b2 g4 | 
	c( b) a | 
	a2 \bar "||" \break
  
	a4 | 
	b2 g4 | 
	e2 a4 | 
	g( fs) e  | 
	d2 \bar "||" 
	
	d'4 | 
	a4( b) g | 
	c( b) a | 
	b( a4.) g8 | 
	g2 \bar "||"
}

alto = \relative c' {
	\global
	\partial 4 <g' b>4 | 
	<e a> <d g> <d fs> | 
	<d fs> <b e> <d fs> | 
	<d g> <d fs>4. <b d>8 | 
	<b d>2

    <d g>4 | 
	<g b>2 <g b>4 | 
	<d fs>2 <b e>4 | 
	<<{ \voiceTwo g'2 } \\ { e4 d4} >> <c e>4 | 	
	<d fs>2 
	
	<d fs>4 | 
	<d fs>2 <b e>4 | 
	<c e>2 <c e>4 | 
	<b d>2 <g c>4 | 
	s2 
	
    <fs' b>4 | 
	<< { \voiceTwo d2 } \\ { fs4 g4 } >> <c, e> | 
	<e a>  <<{ \voiceTwo d2 } \\ { g4 fs4 } >> | 
	<d fs>4 <d fs>4. <b d>8 | 
	<b d>2
}

tenor = \relative c {
	\global
	g4 | 
	a b d | 
	b s4 s4 | 
	g4 s4 s4 | 
	s2  

	s4 | 
	g2 g4 | 
	b2 s4 | 
	c4 g a | 
	s2  
  
	d4 | 
	b2 g'4 | 
	g2 a,4 | 
	b2 c4 | 
	<fs a>2 
	
	b,4 | 
	d g, c | 
	a b d | 
	b s4 s4 | 
	s2 
}

bass = \relative c {
	\global
	s4 | 
	s2. | 
	s4 e4 d4 | 
	s4 d4. g8 | 
	g2  
	
	g4 | 
	s2. | 
	s2 e4 | 
	s2. | 
	d2 
	
	s4 | 
	s2 e4 | 
	c2 s4 | 
	s2. | 
	d2  
	
	s4 | 
	s2. | 
	s2. | 
	s4 d4. <g g,>8 | 
	<g g,>2
}


verseOne = \lyricmode {
	\set stanza = "1."
	Th'e -- ter -- nal gifts of Christ the King,
	Th'A -- pos -- tles' glo -- rious deeds we sing:
	And while due hymns of praise we pay,
	Our thank -- ful hearts cast grief a -- way.
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	The Church in these her prin -- ces boasts,
	These vic -- tor chiefs of war -- rior hosts:
	The sol -- diers of the heav' -- nly hall,
	The lights that rose on earth for all.
}

verseThree = \lyricmode {
	\set stanza = "3."
	'Twas thus the yearn -- ing faith of Saints,
	Th'un -- con -- quer'd hope that nev -- er faints,
	The love of Christ that knows not shame,
	The Prince of this world o -- ver -- came.
}

verseFour = \lyricmode {
  \set stanza = "4."
     In these the Fa -- ther's glo -- ry shone,
	In these the will of God the Son:
	In these ex -- ults the Ho -- ly Ghost,
	Through these re -- joice the Heav'n -- ly host.
}

verseFive = \lyricmode {
  \set stanza = "5."
  	Re -- deem -- er, hear us of Thy love,
	That with this glo -- rious band a -- bove,
	Here -- aft -- er, of Thine end -- less grace,
	Thy ser -- vants al -- so may have place.
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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 112 4)
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
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}


