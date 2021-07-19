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
      \line {ABBOT'S LEIGH 87 87 D}
    }
    \right-column{
      \line {Cyril V. Tayler, 1941}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {John Newton, 1779}
    }
  } 
}

\header {
  tagline = ""
}


global = {
	\key c \major
	\time 3/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
	\global
	g2 e4 |
	c2 c4 |
	c'4( b) a |
	a g2 |
	a e4 |
	f4.( g8) a4 |
	g( f) e |
	d2. \bar "||"
	
	g2 e4 |
	c2 c4 |
	c'4( b) a |
	a g2 |
	a2 e4 |
	f4.( g8) a4 |
	g( f) e |
	d2. \bar "||"
	
	d2 e4 |
	f2 a4 |
	g4.( a8) bf4 |
	bf a2 |
	g a4 |
	b( c) d |
	c2 b4 |
	a2. \bar "||"
	
	c4( g) e |
	c2 c4 |
	bf'( a) g |
	a a2 |
	d4( c) b |
	c( g) a |
	c,2 d4 |
	c2. \bar "|."
}

alto = \relative c' {
	\global
	e4( c) b |
	a2 b4 |
	c( g') f |
	f e2 |
	c4( e) c |
	d( c) b |
	c( d) c |
	c( b2) |
	
	c2 b4 |
	a2 b4 |
	c( g') f |
	f e2 |
	c4( e) c |
	d( c) b |
	c( d) c |
	b2. |
	
	bf2 bf4 |
	d2 f4 |
	f( d) e |
	g f( e) |
	d2 g4 |
	f2 f4 |
	e( f) d |
	c2. |
	
	c2 b4 |
	c2 c4 |
	f2 c4 |
	e d g |
	f2 f4 |
	c2 c4 |
	c2 b4 |
	g2.
}

tenor = \relative c' {
	\global
	g2 <g, g'>4 |
	<a e'>2 <g e'>4
	<f a'>4. s8 s4 |
	s4 c''2 |
	<a, e'>4 s2 |
	a'4.( g8) s4 |
	s2. |
	g2. |
	
	s2 <g, g'>4 |
	<a e'>2 <g e'>4 |
	<f a'>4. s8 s4 |
	s4 c''2 |
	<a, e'>4 s2 |
	a'4.( g8) s4 |
	s2. |
	g2. |
	
	f2 <g, g'>4 |
	a'2 s4 |
	d2 s4 |
	s2. |
	b2 s4 |
	s2. |
	a2 s4 |
	s2. |
	
	s2 <g, g'>4 |
	<a e'>2 s4 |
	s2. |
	s2. |
	d'4( a) s4 |
	g( c) f,4 |
	e2 <g, f'>4 |
	s2.
}

bass = \relative c {
	\global
	c4( e) s4 |
	s2. |
	s4. <a, b'>8 <a c'>[ <b d'>] |
	<c c'>4 c( b) |
	s4 <c a'> <a a'> |
	d2 <d f>4 |
	<e g> <f a> <f a> |
	g2( f4) |
	
	<e g>2 s4 |
	s2. |
	s4. <a, b'>8 <a c'>[ <b d'>] |
	<c c'>4 c( b) |
	s4 <c a'> <a a'> |
	d2 <d f>4 |
	<e g> <f a> <f a> |
	g2. |
	
	bf,4( a) s4 |
	d( f) <d d'> |
	bf( g) <c c'> |
	<f c'>4 <f c'>2 |
	g4( f) <e c'> |
	<d d'> <c a'> <b a'> |
	c( d) <e gs>4 |
	<a, a'>2. |
	
	<e' g>2 s4 |
	s2 <c e>4 |
	<d f>2 <e c'>4 |
	<g a> <f a> <e cs'> |
	d2 <d f>4 |
	e2 f4 |
	g( g,) s4 |
	<c e>2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Glo -- rious things of thee are spo -- ken,
  Zi -- on, ci -- ty of our God!
  He, whose Word can -- not be bro -- ken,
  Formed thee for His own a -- bode.
  On the Rock of A -- ges found -- ed,
  What can shake thy sure re -- pose?
  With sal -- va -- tion’s walls sur -- round -- ed,
  Thou may’st smile at all thy foes.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  See! the streams of liv -- ing wa -- ters,
  Spring -- ing from e -- ter -- nal love;
  Well sup -- ply thy sons and daugh -- ters,
  And all fear of want re -- move:
  Who can faint while such a riv -- er
  Ev -- er flows their thirst t’as -- suage?
  Grace, which like the Lord, the giv -- er,
  Nev -- er fails from age to age.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Round each hab -- i -- ta -- tion hov -- 'ring,
  See the cloud and fire ap -- pear!
  For a glo -- ry and a cov -- 'ring
  Show -- ing that the Lord is near.
  Thus de -- riv -- ing from our ban -- ner
  Light by night and shade by day;
  Safe they feed up -- on the man -- na
  Which He gives them when they pray.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Sav -- ior, if of Zi -- on’s ci -- ty,
  I through grace a mem -- ber am,
  Let the world de -- ride or pi -- ty,
  I will glo -- ry in Thy name.
  Fad -- ing is the world -- ling’s plea -- sure,
  All his boast -- ed pomp and show;
  Sol -- id joys and last -- ing trea -- sure
  None but Zi -- on’s chil -- dren know.
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
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
