%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
   poet = \markup{ \fontsize #4 \smallCaps "Come, Ye Faithful, Raise The Strain"  }
    meter = \markup { \small { Music: GAUDEAMUS PARITER, 7.6.7.6. D, J. Roh; adapt. J. Leisentrit, \italic "Leisentrit's Gesangbuch," 1854 } }
    piece = \markup { \small {Text: \italic "ασωμεν παντες λαοι," St. John Damascene, 780; tr. J.M Neale, 1862 }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key f \major
	\time 4/4
	%\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	f4 f c c |
	f g a2 |
	\time 6/4 d2 c bf4 a |
	\time 4/4 g2 f \bar "||"

	f4 f c c |
	f g a2 |
	\time 6/4 d2 c bf4 a |
	\time 4/4 g2 f \bar "||"

	\time 6/4 c'2 d c4 bf |
	\time 4/4 a4 a g2 |
	\time 6/4 a2 g4 f2 e4 |
	\time 4/4 d2 c2 \bar "||"

	f4 f c c |
	f g a2 |
	\time 6/4 d2 c bf4 a |
	\time 4/4 g2 f \bar "||"
}

alto = \relative c' {
	\global
	c4 c c c |
	d e f2 |
	f e f4 f |
	e2 f |

	c4 c c c |
	d e f2 |
	f f d4 f |
	d( e) f2 |

	f2 f e4 f |
	f f e2 |
	c2 c4 a2 c4 |
	a( b) c2 |

	a4 a c c |
	d e f2 |
	f f bf,4 c |
	d( c) a2 |
}

tenor = \relative c' {
	\global
	a4 a g g |
	a c c2 |
	bf g bf4 c |
	c2 a |

	a4 a g g |
	a c c2 |
	bf a bf4 c |
	d( c) a2 |

	a bf g4 bf |
	c c c2 |
	f,2 e4 f2 a4 |
	a( g) e2 |
	
	f4 f g g |
	a c c2 |
	bf c f,4 f |
	f( e) f2 |
}

bass = \relative c {
	\global
	f4 f e e |
	d c f2 |
	bf,2 c d4 f |
	c2 f2 |

	f4 f e e |
	d c f2 |
	bf, f g4 a |
	bf( c) f2 |

	f bf, c4 d |
	f a, c2 |
	f2 c4 d2 a4 |
	f( g) c2 |
	
	d4 d e e |
	d c f2 |
	bf, a d4 c |
	bf( c) f,2 |	
}

verseOne = \lyricmode {
	\set stanza = "1."
	Come, ye faith -- ful, raise the strain
	Of tri -- um -- phant glad -- ness!
	God hath brought His Is -- ra -- el
	In -- to joy from sad -- ness
	Loosed from Pha -- raoh’s bit -- ter yoke
	Ja -- cob’s sons and daugh -- ters;
	Led them with un -- moist -- ened foot
	Through the Red Sea wa -- ters.
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	’Tis the Spring, of souls to -- day;
	Christ hath burst His pris -- on;
	And from three days’ sleep in death,
	—As a sun, hath ris -- en.
	All the win -- ter of our sins,
	Long and dark, is fly -- ing
	From His Light, to Whom we give
	Laud and praise un -- dy -- ing.
}

verseThree = \lyricmode {
	\set stanza = "3."
	Now the Queen of Sea -- sons, bright
	With the day of Splen -- dour,
	With the roy -- al Feast of feasts,
	Comes its joy to ren -- der;
	Comes to glad Je -- ru -- sa -- lem,
	Who with true af -- fec -- tion
	Wel -- comes, in un -- wea -- ried strains,
	Je -- su’s Res -- ur -- rec -- tion.
}

verseFour = \lyricmode {
	\set stanza = "4. "
	Nei -- ther might the gates of death,
	Nor the tomb’s dark por -- tal,
	Nor the watch -- ers, nor the seal,
	Hold Thee as a mor -- tal:
	But to -- day a -- midst the Twelve
	Thou didst stand, be -- stow -- ing
	That Thy peace, which ev -- er -- more
	Pass -- eth hu -- man know -- ing.
}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Voice =
         altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
	  \context Lyrics = two \lyricsto sopranos \verseTwo
	  \context Lyrics = three \lyricsto sopranos \verseThree
	  \context Lyrics = four \lyricsto sopranos \verseFour
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
        tenors { \voiceOne << \tenor >> }
      \context Voice =
        basses { \voiceTwo << \bass >> }
    >>
  >>
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 96 4)
            }
       }
  \layout { }
}


