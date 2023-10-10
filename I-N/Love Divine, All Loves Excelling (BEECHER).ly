%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/
%}

\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Charles Wesley (1707-88), 1747
      }
      \wordwrap {
        Music: BEECHER, 87 87 D, John Zundel (1815-82), 1870
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {BEECHER 87 87 D}
    }
    \right-column{
      \line {John Zundel, 1870}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Charles Wesley, 1747}
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
	f4 f g f |
	d' c8[ d] c4 bf |
	a g bf g |
	f ef8[ f] d2 |
	
	f4 f g f |
	d' c8[ d] c4 bf |
	g ef' d bf |
	a g8[ a] bf2 |
	
	bf4 bf bf a |
	g a8[ g] fs4 d |
	d' d ef d |
	c c8[ d] c2 |
	
	f,4 f g f |
	d' c8[ d] c4 bf |
	g ef' d bf |
	a g8[ a] bf2 \bar "|."
}

alto = \relative c' {
	\global
	d4 d ef d |
	f ef8[ f] ef4 d |
	f ef g ef |
	d c bf2 |
	
	d4 d ef d |
	f ef8[ f] ef4 d |
	ef g f f |
	ef ef d2 |
	
	d4 g g fs |
	g d d d |
	d f g f |
	f e f( ef) |
	
	d d ef d |
	f ef8[ f] ef4 d |
	ef4 g f f |
	ef ef d2 %\bar "|."
}

tenor = \relative c {
	\global
	f4 f g bf |
	bf a a bf |
	bf bf bf bf |
	bf a f2 |
	
	f4 f g bf |
	bf a a bf |
	bf bf bf d |
	c f, f2 |

	g4 d' d c |
	bf c8[ bf] a4 d, |
	f bf bf bf |
	a bf a2 |

	f4 f g bf |
	bf a a bf |
	bf bf bf d |
	c f, f2 %\bar "|."
}

bass = \relative c {
	\global
	bf4 bf bf bf |
	bf f f bf |
	ef ef ef ef |
	f f, bf2 |

	bf4 bf bf bf |
	bf f' fs g |
	ef ef f f |
	f f, bf2 |

	g4 bf d d |
	d d d d |
	bf bf bf bf |
	c c f2 |
	
	bf,4 bf bf bf |
	bf f' fs g |
	ef ef f f |
	f f, bf2 %\bar "|."
}

verseOne = \lyricmode {
	\vOneL
	Love di -- vine, all loves ex -- cel -- ling,
	Joy of heav'n to earth come down;
	Fix in us thy hum -- ble dwel -- ling;
	All thy faith -- ful mer -- cies crown!
	Je -- sus, thou art all com -- pas -- sion,
	Pure un -- bound -- ed love thou art;
	Vis -- it us with thy sal -- va -- tion;
	En -- ter ev' -- ry tremb -- ling heart.
	}

verseTwo = \lyricmode {
	\vTwoL
	Come, Al -- migh -- ty to de -- liv -- er,
	Let us all thy life re -- ceive;
	Sud -- den -- ly re -- turn and nev -- er,
	Nev -- er more thy tem -- ples leave.
	Thee we would be al -- ways bles -- sing,
	Serve thee as thy hosts a -- bove,
	Pray and praise thee with -- out ceas -- ing,
	Glo -- ry in thy per -- fect love.
}

verseThree = \lyricmode {
	\vThreeL
	Fin -- ish, then, thy new cre -- a -- tion;
	Pure and spot -- less let us be.
	Let us see thy great sal -- va -- tion
	Per -- fect -- ly re -- stored in thee;
	Changed from glo -- ry in -- to glo -- ry,
	Till in heav'n we take our place,
	Till we cast our crowns be -- fore thee,
	Lost in won -- der, love, and praise.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
  \score { %\transpose c bf,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
     % \new Lyrics \lyricsto soprano \verseFour
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
  % \bottom
  \refs
}

%%%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 16)
#(define output-suffix "Hymnal")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  %\top
  \score { %\transpose c bf,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
     % \new Lyrics \lyricsto soprano \verseFour
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
    \include "hymn_hymnal_layout.ly"
  }    
  \refs
  %\bottom
}
%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  %  \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
     % \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}