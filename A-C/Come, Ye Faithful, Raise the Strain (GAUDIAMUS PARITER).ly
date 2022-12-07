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
        Text: \italic "ασωμεν παντες λαοι," St. John Damascene, 780; Tr. John Mason Neale (1818-66), 1862
      }
      \wordwrap {
        Music: GAUDEAMUS PARITER, 76 76 D, Jan Roh (1487-1547); adapt. \italic "Leisentrit's Gesangbuch," 1854
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {GAUDEAMUS PARITER  76 76 D}
    }
    \right-column{
      \line  {J. Roh; adapt. \italic "Leisentrit's Gesangbuch," 1854}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "ασωμεν παντες λαοι,"}
      \line {St. John Damascene, 780; tr. J.M Neale, 1862}
    }
  } 
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
	\time 4/4 g2 f \bar "|"

	f4 f c c |
	f g a2 |
	\time 6/4 d2 c bf4 a |
	\time 4/4 g2 f \bar "|"

	\time 6/4 c'2 d c4 bf |
	\time 4/4 a4 a g2 |
	\time 6/4 a2 g4 f2 e4 |
	\time 4/4 d2 c2 \bar "|"

	f4 f c c |
	f g a2 |
	\time 6/4 d2 c bf4 a |
	\time 4/4 g2 f \bar "|."
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
	\vOne
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
	\vTwo
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
	\vThree
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
	\vFour
	Nei -- ther might the gates of death,
	Nor the tomb’s dark por -- tal,
	Nor the watch -- ers, nor the seal,
	Hold Thee as a mor -- tal:
	But to -- day a -- midst the Twelve
	Thou didst stand, be -- stow -- ing
	That Thy peace, which ev -- er -- more
	Pass -- eth hu -- man know -- ing.
}
verseFive = {}

\include "hymn_scores.ly"