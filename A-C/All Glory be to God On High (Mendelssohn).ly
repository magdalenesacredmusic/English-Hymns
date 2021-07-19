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
          \line {ALLEIN GOTT IN DER HÖH' SEI EHR   87 87 887}
      }
      \column{
      \line {Leipzig, 1539; arr. Felix Mendelssohn, 1863}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {\italic "Allein Gott in der Höh sei Ehr"}
     \line {"Nikolaus Decius, 1525; tr. C. Winkworth, 1863, alt."}
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
	f8[ g] |
	a4 bf c bf |
	a g a a |
	a g8[ a] bf4 g |
	f( g) f4 \bar "|"
	
	  f8[ g] |
	a4 bf c bf |
	a g a a |
	g g8[ a] bf4 g |
	f( g) f \bar "|"
	
	  f4 |
	g a bf a |
	g fs g g |
	a bf c bf |
	a g a a |
	a g8[ a] bf4 g |
	f( g) f \bar "|."
}

alto = \relative c' {
	\global
	\partial 4
         f4 |
         f f e f8[ g] |
         f4 e8[ d] c4 f |
         e g g d |
         f( e) f 
         
           f4 |
         f f f8[ e] f8[ g] |
         a4 e e f |
         e8[ f] g4 g d8[ e] |
         f4( e) f 
         
           f4 |
          f ef d c |
          ef d d ef8[ d] |
          c4 f e f8[ g] |
          g8[ f] e4 e f |
          e g g d |
          f( e) f
}

tenor = \relative c' {
	\global
	\partial 4
	a8[ bf] |
	c4 bf bf8[ a] d[ c] |
	c4 bf a d |
	cs d d bf |
	a( bf) a 
	
	  a8[ bf] | 
	c4 bf g d'8[ c] |
	c8[ f] c[ bf] cs4 d |
	cs d d d |
	c4.( bf8) a4 
	
	  f4 |
	bf c bf c |
	c8[ bf] a4 bf c |
	c bf g d' |
	c e8[ d] cs4 d |
	cs d d c8[ bf] |
	a4( bf) a  
}

bass = \relative c {
	\global
	\partial 4
	f4 |
	f8[ e] d4 c d8[ e] |
	f4 c f d |
	a' bf8[ a] g4 bf, |
	c2 f4 
	
	  f4 |
	e d c d8[ e] |
	f4 bf a f8[ g] |
	a4 bf8[ a] g4 bf, |
	a8[( bf] c4) f4 
	
	  d4 |
	ef c g' ef |
	c d g c, |
	f8[ ef] d4 c d8[ e] |
	f4 bf a f8[ g] |
	a4 bf8[ a] g4 bf, |
	c2 f4
}


verseOne = \lyricmode {
	\set stanza = "1."
        All glo -- ry be to God on high,
        Who hath our race be -- friend -- ed!
        To us no harm shall now come nigh,
        The strife at last is end -- ed;
        God show -- eth His good -- will to men,
        And peace shall reign on earth a -- gain;
        O thank Him for His good -- ness!
}

verseTwo = \lyricmode {
	\set stanza = "2."
	We praise, we wor -- ship Thee, we trust
        And give Thee thanks for -- ev -- er,
        O fa -- ther, that Thy rule is just
        And wise, and chang -- es nev -- er;
        Thy bound -- less grace o’er all things reigns,
        Thou dost what -- e’er Thy will or -- dains;
        ’Tis well Thou art our Rul -- er!
}

verseThree = \lyricmode {
	\set stanza = "3."
	O Je -- sus Christ, our God and Lord,
        Be -- got -- ten of the Fa -- ther,
        O Thou who hast our peace re -- stored,
        And the lost sheep dost gath -- er,
        Thou Lamb of God, en -- throned on high
        Be -- hold our need and hear our cry;
        Have mer -- cy on us, Je -- sus!
}

verseFour = \lyricmode {
	\set stanza = "4."
	O Ho -- ly Spir -- it, pre -- cious Gift,
        Thou Com -- for -- ter un -- fail -- ing,
        Do Thou our trou -- bled souls up -- lift,
        A -- gainst the foe pre -- vail -- ing;
        A -- vert our woes and calm our dread:
        For us the Sav -- ior’s blood was shed;
        Do Thou in faith sus -- tain us!
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
