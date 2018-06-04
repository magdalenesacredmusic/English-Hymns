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
   poet = \markup{ \fontsize #4 \smallCaps "Faith of our Fathers"  }
    meter = \markup { \small { Music: ST. CATHERINE, 88.88.88.; H.F. Hemy, 1864; arr. J.G. Walton, 1870, harm. various } }
    piece = \markup { \small {Text: F. W. Faber, v. 3 alt. }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key g \major
	\time 3/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
	\global
	b4 a g |
	g( fs) g |
	a( e) fs |
	g2. |

	g4 fs e |
	d2 g4 |
	g( fs) g |
	a2. |

	b4 a g |
	g( fs) g |
	a( e) fs |
	g2. |

	g4 fs e |
	d2 b'4 |
	a( b) a |
	g2. \bar "||"

	c4 c c |
	b2 b4 |
	a2 a4 |
	b2. |

	b4 a g |
	e2 g4 | 
	a2 a4 |
	g2. \bar "|."
}

alto = \relative c' {
	\global
	d4 d d |
	d2 d4 |
	e2 d4 |
	d2. |

	e4 d c |
	b2 d4 |
	cs2 cs4 |
	d2. |

	d4 d d |
	d2 d4 |
	e2 d4 |
	b2. |

	e4 d c |
	b2 d4 |
	e2 c4 |
	b2. |

	g'4 g g |
	g2 g4 |
	g( e) fs4 |
	g2. |

	b,4 c d |
	c2 b4 |
	g'4( e) fs4 |
	d2.
}

tenor = \relative c' {
	\global
	d4 c b |
	b( c) b |
	c2 a4 |
	b2. |

	g4 g g |
	b2 b4 |
	a2 g4 |
	fs2. |

	g4 c b |
	b( a) g |
	c2 a4 |
	g2. |

	g4 g g |
	g2 g4 |
	g2 fs4 |
	g2. |

	e'4 c e |
	d2 d4 |
	d2 d4 |
	d2. |
	
	g,4 g g |	
	g( a) g  |
	d'2 c4 |
	b2.
}

bass = \relative c' {
	\global
	g4 g g |
	g( a) g |
	c,2 d4 |
	g,2. |

	c4 c e |
	g2 g4 |
	e2 e4 |
	d2. |

	g4 g g |
	d( c) b |
	a2 d4 |
	e2. |

	c4 c c |
	g2 b4 |
	a2 d4 |
	g,2. |

	c4 e c |
	g'2 g4 |
	d2 d4 |
	g,2.|

	g4 a b |
	c2 e4 |
	d2 d4 |
	g,2.
}

verseOne = \lyricmode {
	\set stanza = "1."
	Faith of our Fath -- ers! liv -- ing still
	In spite of dun -- geon, fire and sword:
	Oh, how our hearts beat high with joy
	When -- e'er we hear that glo -- rious word.
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	Our Fath -- ers, chained in pris -- ons dark,
	Were still in heart and con -- science free:
	How sweet would be their chil -- dren's fate,
	If they, like them, could die for thee!
	
	\override LyricText.extra-offset = #'(0 . -1.2)
    \override LyricExtender.extra-offset = #'(0 . -1.2)
    \override LyricHyphen.extra-offset = #'(0 . -1.2) 
		Faith of our fa -- thers 

	\override LyricText.extra-offset = #'(0 . 0)
    \override LyricExtender.extra-offset = #'(0 . 0)
    \override LyricHyphen.extra-offset = #'(0 . 0)			ho -- ly faith!
	We will be true to thee till death.
}

verseThree = \lyricmode {
	\set stanza = "3."
	Faith of our Fath -- ers! Ma -- ry's prayers
	Shall win all na -- tions back to thee;
	And through the truth that comes from God
	All men shall then in -- deed be free.
}

verseFour = \lyricmode {
	\set stanza = "4."
	Faith of our Fath -- ers! we will love
	Both friend and foe in all our strife:
	And preach thee too, as love knows how
	By kind -- ly words and vir -- tuous life:	
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
       tempoWholesPerMinute = #(ly:make-moment 88 4)
            }
       }
  \layout {}
}


