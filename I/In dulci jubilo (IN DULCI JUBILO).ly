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
      \line {IN DULCI JUBILO  Irreg.}
    }
    \right-column{
      \line {German, harm. Bartholemew Gesius, 1601}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Latin/German macaronic carol}
      \line {Heinrich Suso, 14th cent. tr. Robert Louis de Pearsall, 1837}
    }
  } 
}

\header {
  tagline = ""
}

global = {
	\key g \major
	\time 6/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melodyOne = \relative c'' {
	\global
	\partial 4
	g4 |
	g2 g4 b2 c4 |
	d2( e4 d2) d4 |
	g,2 g4 b2 c4 |
	d2( e4 d2.) \bar "||" \break

	d2 e4 d2 c4 |
	b2. 
	\set melismaBusyProperties = #'()
	\slurDashed g2( g4) \unset melismaBusyProperties |
	a2 a4 b2 a4 |
	\slurSolid g2( a4 b2) \bar "" \break
	  b4 |
	d2 e4 d2 c4 |
	b2. g2 g4 |
	a2 a4 b2 a4 |
	g2( a4 b2.) \bar "||" \break 

	e,2 e4 fs2 fs4 |
	g2.( d'2.) |
	b2 b4 a2 a4 |
	g2.~ g2 \bar "||"
}

altoOne = \relative c' {
	\global
	\partial 4
	d4 |
	d2 d4 d2 g4 |
	fs2( e4 fs2) g4 |
	d2 d4 g2 g4 |
	fs2( e4 fs2.) |
	
	g2 g4 fs2 e4 |
	ds2. \tieDashed e2~ e4 |
	fs2 fs4 g2 fs4 |
	e2( fs4 g2) g4 |
	g2 g4 d2 a'4 |
	fs2. e2 e4 |
	e2 fs4 g2 e4 |
	e2( fs4 g2.) |
	
	g,2 c4 a2 a4 |
	e'2( \tieSolid g4~ g2 fs4) |
	g2 fs4 e2 d4 d2.~ d2 \bar "||"
}

tenorOne = \relative c' {
	\global
	\partial 4	
	b4 |
	b2 b4 b2 g4 |
	a4.( b8 cs4 d2) b4 |
	b2 b4 d2 e4 |
	a,4.( b8 cs4 d2.) |
	
	b2 c4 a2 a4 |
	fs2. \slurDashed e2( b'4) |
	d2 d4 d2 d4 |
	\slurSolid b2( c4 d2) d4 |
	b2 c4 b2 e4 |
	ds2. e2 b4 |
	c2 d4 d2 c4 |
	b2( c4 d2.) \bar "||"

	c2 g4 d'2 d4 |
	b4.( a8 g4 a2.) |
	e'2 d4 c4.( b8) a4 |
	g2.~ g2 \bar "||"
}

bassOne = \relative c' {
	\global
	\partial 4
	g4 |
	g2 g4 g2 e4 |
	d2( a'4 d,2) g4 |
	g2 g4 g2 e4 |
	d2( a'4 d,2.) |
	
	g2 c,4 d2 a4 |
	b2. \tieDashed e2~ e4 |
	d2 d4 g2 d4 |
	e2( a4 g2) g4 |
	g2 c,4 g'2 a4 |
	b2. e,2 e4 |
	a2 d,4 g2 a4 |
	e2( a4 g2.) |

	c,2 c4 d2 d4 |
	e2.( d2.) |
	e2 b4 c2 d4 |
	\tieSolid g,2.~ g2 \bar "||"
}

verseOne = \lyricmode {
	\set stanza = "1."
	\override LyricText #'font-shape = #'italic
		In dul -- ci ju -- bi -- lo	 \revert LyricText #'font-shape
	Let us our ho -- mage show:
	Our heart's joy re -- clin -- eth _
	\override LyricText #'font-shape = #'italic
		In prae -- se -- pi -- o; 	 \revert LyricText #'font-shape
	And like a bright star shin -- eth
	\override LyricText #'font-shape = #'italic
		Ma -- tris in gre -- mi -- o,
		Al -- pha es et O!
		Al -- pha es et O! 	
}

verseTwo = \lyricmode {
	\set stanza = "2."
	\override LyricText #'font-shape = #'italic
		O Je -- su par -- vu -- le,  \revert LyricText #'font-shape
	My heart is sore for Thee!
	Hear me, I be -- seech Thee,
	\override LyricText #'font-shape = #'italic
		O pu -- er op -- ti -- me;  \revert LyricText #'font-shape
	My pray -- ing let it reach Thee,
	\override LyricText #'font-shape = #'italic
		O prin -- ceps glo -- ri -- ae.
		Tra -- he me post te.
		Tra -- he me post te.
}

verseThree = \lyricmode {
	\set stanza = "3."
	\override LyricText #'font-shape = #'italic
		O pa -- tris ca -- ri -- tas!
		O Na -- ti len -- i -- tas!  \revert LyricText #'font-shape
	Deep -- ly were we stain -- èd.
	\override LyricText #'font-shape = #'italic
		Per nos -- tra cri -- mi -- na:  \revert LyricText #'font-shape
	But Thou for us hast gain -- èd
	\override LyricText #'font-shape = #'italic 
		Coe -- lo -- rum gau -- di -- a,
		Qua -- lis glo -- ri -- a!
		Qua -- lis glo -- ri -- a!
}

verseFour = \lyricmode {
	\set stanza = "4."
	\override LyricText #'font-shape = #'italic
		U -- bi sunt gau -- di -- a,  \revert LyricText #'font-shape
	If that they be not there?
	There are An -- gels sing -- ing
	\override LyricText #'font-shape = #'italic 
		_ No -- va can -- ti -- ca;  \revert LyricText #'font-shape
	And there the bells are ring -- ing
	\override LyricText #'font-shape = #'italic 
		In Re -- gis cu -- ri -- a.  \revert LyricText #'font-shape
	O that we were there!
	O that we were there!
}


melodyBach = \relative c'' {
	\global
	\partial 4
	g4^\markup { \italic "alternate harmonization by J.S. Bach, BWV 368" } |
	g2 g4 b2 c4 |
	d2( e4 d2)\fermata d4 |
	g,2 g4 b2 c4 |
	d2( e4 d2.)\fermata \bar "||" \break

	d2 e4 d2 c4 |
	b4.( c8 b[ a]) g2\fermata g4( |
	a2) a4 b2 a4 | \break
	g2( a4 b2)\fermata b4 |
	d2 e4 d2 c4 |
	b4.( c8 b[ a]) g2\fermata g4 |
	a2 a4 b2 a4 |
	g2( a4 b2.)\fermata \bar "||"

	e,2 e4 fs2 fs4 |
	g8[( fs g a b c] d2.)\fermata |
	b2 b4 a2 a4 |
	g2.~ g2\fermata \bar "|."
}

altoBach = \relative c' {
	\global
	\partial 4
	d4 |
	e2 e4 fs2 fs4 |
	g2.~ g2 g4 |
	g( fs) e d2 e4 |
	d( fs a fs2.) |

	g2 g4 fs( g) a |
	ds,( e fs) g2 g4~( |
	g4 fs8[ e]) fs4 g2 fs4 |
	g4.( a8 g[ fs] g2) g4 |
	g2 g4 a( g) a |
	a( g fs) e2 g4~ |
	g4 fs8[ e] fs4 g2 fs4~ |
	fs4 b,( e ds2.) |

	e2 e4~ e4 d8[ e] fs4~ |
	fs4 e2( d2.) |
	d4( g8[ fs]) g4 g2 fs4 |
	g8[( f e d e c] d2) \bar "|."
}
	
tenorBach = \relative c' {
	\global
	\partial 4
	b4 |
	b2 c4 d2 c4 |
	b2 c4 b2 b4 |
	b2 c4 b( a) g |
	a( d cs a2.) |

	b2 c4 d( e) fs |
	b,( cs ds) e2 d4( |
	e c) d d2 d4 |
	d( b d~ d2) d4 |
	b2 c4 a2 fs'4 |
	fs( e ds) b2 d4 |
	e( c) d d2 d4 |
	b2( e4 fs,2.) |
	
	r8 g( a[ b]) c[ b] a4( b8[ c]) d[ c] |
	b4.( a8 g4 a2.) |
	b4( c) d e( c) d4~ |
	d4 c8[( b c a] b2) \bar "|."
}

bassBach = \relative c' {
	\global
	\partial 4 
	g4 |
	e( d) c b( c8[ b]) a[ b] |
	g[( g' f e d c]	g'2)_\fermata g4 |
	e( d) c g'( fs) e |
	fs( d a d2.)_\fermata |

	g2 c4~ c4 b a~ |
	a4 g( fs) e2_\fermata b4( |
	c a) d g,8[ a b c] d[ c] |
	b4( g d g2)_\fermata g4 |
	g'( fs) e fs( e) d |
	g8[( a] b4 b,) e2_\fermata b4 |
	c( a) d g,8[ a b c] d[ c] |
	e4( d c b2.)_\fermata |
	
	c4( b) a d( c) b |
	e8[ d e fs g e] fs2._\fermata |
	g,4( a) b c( a) d|
	b( c2 g2)_\fermata \bar "|."
}

verseSoprano = \lyricmode {
	_ _ _ _ _ _
	_ _ _ _ _ _
	_ _ _ _ _ _
	_ _ _ _ _ _
	_ _ _ _ _ _
	_ \override LyricText #'font-shape = #'italic 
		Re -- gis cu -- ri -- a.  \revert LyricText #'font-shape
	O that we were there!
}

verseAlto = \lyricmode {
	\set stanza = "4."
	\override LyricText #'font-shape = #'italic
		U -- bi sunt gau -- di -- a,  \revert LyricText #'font-shape
	If that they be not there?
	There are An -- gels sing -- ing
	\override LyricText #'font-shape = #'italic 
		No -- va can -- ti -- ca;  \revert LyricText #'font-shape
	And there the bells are ring -- ing
	\override LyricText #'font-shape = #'italic 
		In Re -- gis cu -- ri -- a.  \revert LyricText #'font-shape
	O that we were there!
	O that we were there!
}

verseTenor = \lyricmode {
	_ _ _ _ _ _
	_ _ _ _ _ _
	_ _ _ _ _ _
	_ _ _ _ _
	_ _ _ _ _ _ _
	_ _ _ \override LyricText #'font-shape = #'italic 
		Re -- gis cu -- ri -- a.  \revert LyricText #'font-shape
	O that we were there!
	O that we were there!
}

verseBass = \lyricmode {
	_ _ _ _ _ _
	_ _ _ _ _ _
	There are An -- gels sing -- ing
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
        \new Voice = "soprano" { \voiceOne \melodyOne }
        \new Voice = "alto" { \voiceTwo \altoOne }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      \new Lyrics \lyricsto soprano \verseFour
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenorOne }
        \new Voice = "bass" { \voiceTwo \bassOne }
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

  
  \score {
  \context ChoirStaff <<
	\new Lyrics = sopranos
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melodyBach >> }
      \context Voice =
         altos { \voiceTwo << \altoBach >> }
      \new Lyrics = altos
	  \context Lyrics = sopranos \lyricsto sopranos \verseSoprano
	  \context Lyrics = altos \lyricsto altos \verseAlto
    >>
\new Lyrics = tenors
    \context Staff = lower <<
      \clef bass
      \context Voice =
        tenors { \voiceOne << \tenorBach >> }
      \context Voice =
        basses { \voiceTwo << \bassBach >> }

	\context Lyrics = tenors \lyricsto tenors \verseTenor
	\context Lyrics = basses \lyricsto basses \verseBass
    >>
  >>
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 55 2)
            }
       }

    \include "hymn_layout.ly"
}
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
        \melodyOne
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
