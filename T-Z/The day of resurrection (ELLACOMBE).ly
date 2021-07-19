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
          \line {ELLACOMBE 76 76 D}
      }
      \column{
      \line {Mainz \italic "Gesangbuch," 1833}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {Greek, St. John of Damascus, c. 750}
     \line {Tr. John Mason Neale, 1853}
   }
  } 
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	\partial 4
	f4 |
	bf4 a8[ g] f4 bf |
	d,( ef) f4 
		
		f4 |
	g8[ a] bf4 c c |
	d2.
		
		f,4 |
	bf4 a8[ g] f4 bf |
	d,( ef) f4 
		
		f4 |
	g8[ a] bf4 bf a |
	bf2.

		bf8[ c] |
	d4 c d ef |
	c( a8[ bf]) c4 

		bf8[ c] |
	d4 c d ef |
	c2. 

		f,4 |
	bf a8[ g] f4 bf |
	d,( ef) f 

		f4 |
	g8[ a] bf4 bf a |
	bf2. \bar "|."
	
}

alto = \relative c' {
	\global
	\partial 4
	f4 |
	bf4 a8[ g] f4 f | 
	bf,2 c4 

		d4 |
	ef f g f |
	f2.
	
		f4 |
	bf4 a8[ g] f4 f |
	bf,2 c4 
			
		d4 |
	ef d8[ ef] f4 f |
	f2.
		
		d8[ ef] |
	f4 f f g |
	f2 f4 

		bf8[ f] |
	f4 f f g |
	f2. 

		f4 |
	bf a8[ g] f4 f |
	bf,2 c4 
		
		d4 |
	ef d8[ ef] f4 f |
	f2.
}

tenor = \relative c {
	\global
	\partial 4	
	f4 |
	bf4 a8[ g] f4 bf |
	bf2 a4 

		bf4 |
	bf bf bf a |
	bf2.

		f4 |
	bf4 a8[ g] f4 bf |
	bf2 a4 

		bf4 |
	bf bf c c |
	d2.
	
		bf4 |
	bf c bf bf |
	a( f8[ g]) a4

		d8[ c] |
	bf4 c bf bf |
	a2.

		f4 |
	bf4 a8[ g] f4 bf |
	bf2 a4 

		bf4 |
	bf bf c c |
	d2.
}

bass = \relative c {
	\global
	\partial 4
	f4 |
	bf4 a8[ g] f4 d4 |
	g2 f4 

		bf,4 |
	ef d ef f |
	bf,2.

		f'4 |
	bf4 a8[ g] f4 d4 |
	g2 f4 

		bf,4 |
	ef g f f |
	bf,2.

		bf4 |
	bf' a bf ef, |
	f2 f4 

		g8[ a] |
	bf4 a bf ef, |
	f2.

		f4 |
	bf a8[ g] f4 d |
	g2 f4 
		
		bf, |
	ef g f f |
	bf,2.
	
}

verseOne = \lyricmode {
  \set stanza = "1."
  The day of re -- sur -- rec -- tion!
  Earth, tell it out a -- broad;
  The Pass -- o -- ver of glad -- ness,
  The Pass -- o -- ver of God.
  From death to life e -- ter -- nal,
  From earth un -- to the sky,
  Our Christ hath brought us o -- ver
  With hymns of vic -- to -- ry.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Our hearts be pure form e -- vil,
  That we may see a -- right
  The Lord in rays e -- ter -- nal 
  Of re -- sur -- rec -- tion light;
  And, list -- 'ning to his ac -- cents,
  May hear so calm and plain
  His own “All hail!” and, hear -- ing,
  May raise the vic -- tor strain.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Now let the heav'ns be joy -- ful,
  Let earth her song be -- gin,
  The round world keep high tri -- umph,
  And all that is there -- in;
  Let all things seen and un -- seen
  Their notes to -- geth -- er blend,
  For Christ the Lord is ris -- en,
  Our joy that hath no end.
}

verseFour = \lyricmode {
  \set stanza = "4."

}

verseFive = \lyricmode {
  \set stanza = "5."

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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
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
