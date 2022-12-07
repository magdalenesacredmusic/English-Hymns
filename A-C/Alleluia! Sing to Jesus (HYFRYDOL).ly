%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: William C. Dix (1837-98), 1866
      }
      \wordwrap {
        Music: HYFRYDOL, 87 87 D, Rowland H. Prichard (1811-87), 1830; Harm. \italic "The English Hymnal," 1906
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {HYFRYDOL 87 87 D}
    }
    \right-column{
      \line {Rowland H. Prichard, 1830}
      \line {harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {William C. Dix, 1866}
    }
  } 
}

\header {
  tagline = ""
}

global = {
	\key f \major
	\time 3/4
	%\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	f2 g4 |
	f4.( g8) a4 |
	bf2 a4 |
	g( f) g |
	c2 bf4 |
	a2 a4 |
	g( f) g |
	f2. |

	f2 g4 |
	f4.( g8) a4 |
	bf2 a4 |
	g( f) g |
	c2 bf4 |
	a2 a4 |
	g( f) g |
	f2. |
	
	c'2 c4 |
	c( bf) a |
	bf2 bf4 |
	bf( a) g |
	a2 a4 |
	a( bf) c |
	c( bf) a |
	g2.  |

	c4( a) c |
	bf( g) bf |
	a( f) a |
	g8[( a] bf[ a]) g4 |
	c2 c4 |
	d( c) bf |
	a2 g4 |
	f2. \bar "|."
}

alto = \relative c' {
	\global
	c2 e4 |
	f2 f4 |
	g2 f4 |
	e( d) e |
	f( c) d8[ e] |
	f2 f8[ e] |
	d2 e4 |
	f2. |

	c2 e4 |
	f2 f4 |
	g2 f4 |
	e( d) e |
	f( c) d8[ e] |
	f2 f8[ e] |
	d2 e4 |
	f2. |

	e2 e4 |
	f2 f4 |
	f( e) d |
	e( f) c |
	c2 f4 |
	f( g) a |
	a( g) f |
	f2( e4) |
	
	f2 a4 |
	g2 g4 |
	f( c) f |
	g8[ e] f4 c |
	c( f) ef |
	d( f) f |
	f2 e4 |
	f2. \bar "|." 
}

tenor = \relative c' {
	\global
	a2 g4 |
	a4.( bf8) c4 |
	d( c) c |
	c( a) c |
	c2 c4 |
	c2 c4 |
	bf( a) c |
	a2. |

	a2 g4 |
	a4.( bf8) c4 |
	d( c) c |
	c( a) c |
	c2 c4 |
	c2 c4 |
	bf( a) c |
	a2. |

	c2 c4 |
	f,( g) a |
	g2 g4 |
	g( c) bf |
	a2 c4 |
	d2 c4 |
	d2 d4 |
	g,2. |
	c2 d4 |
	d2 c4 |
	c( a) b |
	c bf bf |
	a2 c4 |
	bf( c) d |
	c2 bf4 |
	a2. \bar "|."
}

bass = \relative c, {
	\global
	f4( a) c |
	f2 f4 |
	f( e) f |
	c( d) c |
	a'2 g4 |
	f2 a,4 |
	bf( d) c |
	f2. |

	f,4( a) c |
	f2 f4 |
	f( e) f |
	c( d) c |
	a'2 g4 |
	f2 a,4 |
	bf( d) c |
	f2. |

	a2 a4 |
	d,2 d4 |
	g2 g4 |
	c,( d) e |
	f2 e4 |
	d2 a4 |
	g2 bf4 |
	c2. |
	
	a'2 f4 |
	f( e8[ d]) e4 |
	f( e) d |
	e8[ c] d4 e |
	f2 a,4 |
	bf( a) bf |
	c2 c4 |
	f2. \bar "|."
}

verseOne = \lyricmode {
	\vOne
	Al -- le -- lu -- ia! Sing to Je -- sus 
	His the scep -- tre, his the throne;
	Al -- le -- lu -- ia! His the tri -- umph,
	His the vic -- to -- ry a -- lone.
	Hark! The songs of peace -- ful Zi -- on 
	Thun -- der like a might -- y flood:
	'Je -- sus out of ev -- 'ry na -- tion
	Has re -- deemed us by his blood.'
	}

verseTwo = \lyricmode {
	\vTwo
	Al -- le -- lu -- ia! Bread of heav -- en,
	Here on earth our food, our stay;
	Al -- le -- lu -- ia! Here the sin -- ful 
	Flee to you from day to day.
	In -- ter -- ces -- sor, Friend of sin -- ners
	Earth's Re -- deem -- er, plead for me,
	Where the songs of all the sin -- less
	Sweep a -- cross the crys -- tal sea.
}

verseThree = \lyricmode {
	\vThree
	Al -- le -- lu -- ia! King e -- ter -- nal,
	You the Lord of lords we own:
	Al -- le -- lu -- ia! Born of Mar -- y, 
	Earth your foot -- stool, heav'n your throne.
	You with -- in the veil have en -- tered 
	Robed in flesh, our great High Priest,
	Here on earth both priest and vic -- tim 
	In the Eu -- cha -- ris -- tic feast.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
% \top
  \score {
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
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
  \score { %\transpose c d
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      %\new Lyrics \lyricsto soprano \verseFour
     % \new Lyrics \lyricsto soprano \verseFive
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
 % \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  %\bottom
  \refs
}
