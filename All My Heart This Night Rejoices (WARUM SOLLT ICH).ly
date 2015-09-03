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
   poet = \markup{ \fontsize #4 \smallCaps "All My Heart This Night Rejoices"  }
    meter = \markup { \small { Music: WARUM SOLLT ICH, 8.3.3.6.; Johann G. Ebeling, 1666; in \italic "The Chorale Book for England," 1865 } }
    piece = \markup { \small {Text: \large \override #'(font-name . "CloisterBlack") "Warum sollt' ich," Paul Gerhardt (1607-1676); \italic tr. Catherine Winkworth, \italic "The Chorale Book for England" }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key g \major
	\time 4/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
	\global
	g2 a |
	b2. a4 |
	b d e2 |
	d1 \bar "||"
	
	d4 e c2 \bar "||"
	c4 d b2 \bar "||"

	b4 d c b |
	a2 g \bar "||"
	
	d' c | 
	b2. a4 |
	g fs e2 |
	d1 \bar "||" \break

	d'4 e c2 \bar "||"
	c4 d b2 \bar "||"

	b4 a c b |
	a2 g2 \bar "|."
}

alto = \relative c' {
	\global	
	d2 fs |
	g2. a4 |
	g g g2 |
	g1 |

	g4 b a2 |
	e4 a g2 |
	
	g4 g g g |
	fs2 g |
	
	d2 e4( fs) |
	g2. a4 |
	d,4 d d( cs) |
	d1 |

	a'4 b a2 |
	g4 a g2 |
	
	g4 fs g g |
	g( fs) g2 |
}

tenor = \relative c' {
	\global
	b2 d |
	d2. d4 |
	d d c2 |
	d1 |
	
	d4 b e2 |
	c4 a d2 |
	
	d4 b c d |
	d2 b |

	b c |
	d2. d4 |
	b a a2 |
	fs1 |

	d'4 b e2 |
	c4 a d2 |
	
	d4 d e d |
	d2 b2 |
}

bass = \relative c' {
	\global
	g2 d |
	g2. fs4 |
	g b c2 |
	b1 |

	b4 g a2 |
	a4 fs g2 |
	
	g4 g e g |
	d2 g |

	b a g2. fs4 |
	g d a2 |
	d1 |

	fs4 g a2 |
	e4 fs g2 |

	g4 d c g' |
	d2 g |
}

verseOne = \lyricmode {
	\set stanza = "1."
	All my heart this night re -- joi -- ces,
	As I hear,
	Far and near,
	Sweet -- est an -- gel voi -- ces;
	"\"Christ" is "born,\"" their choirs are sing -- ing,
	Till the air
	Ev' -- ry -- where
	Now with joy is ring -- ing.
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	Hark! a voice from yon -- der man -- ger,
	Soft and sweet,
	Doth en -- treat,
	"\"Flee" from woe and dan -- ger;
	Breth -- ren, come, from all doth grieve you,
	You are freed,
	All you need
	I will sure -- ly give "you.\""
}

verseThree = \lyricmode {
	\set stanza = "3."
	Come then, let us has -- ten yon -- der;
	Here let all,
	Great and small,
	Kneel in awe and won -- der,
	Love Him who with love is yearn -- ing;
	Hail the Star
	That from far
	Bright with hope is burn -- ing!
}

verseFour = \lyricmode {
	\set stanza = "4."
	Ye who pine in wea -- ry sad -- ness,
		           Weep no more,
		           For the door
		Now is found of glad -- ness.
		Cling to Him, for He will guide you
		           Where no cross,
		           Pain or loss
		Can a -- gain be -- tide you.
}

verseFive = \lyricmode {
  \set stanza = "5."
  	Thee, dear Lord, with heed I'll cher -- ish,
	          Live to Thee,
	          And with Thee
	Dy -- ing, shall not per -- ish;
	But shall dwell with Thee for e -- er,
	          Far on high,
	          In the joy
	That can al -- ter nev -- er.
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
	  \context Lyrics = five \lyricsto sopranos \verseFive
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
       tempoWholesPerMinute = #(ly:make-moment 110 4)
            }
       }
  \layout {}
}

%{ The original verses 5 and 6 are found below. The verse 5 printed here was orginally verse 7.

\markup {
	\normalsize {
  \fill-line {
    \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
     \column {
      \line { \bold "*5. "
		\column {
		"Hither come, ye heavy-hearted,"
		"           Who for sin"
		"           Deep within,"
		"Long and sore have smarted;"
		"For the poison'd wounds you're feeling"
		"           Help is near,"
		"           One is here"
		"Mighty for their healing!"
        }
      }
    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "*6. "
		\column {
		"Hither come, ye poor and wretched!"
		"           Know His will"
		"           Is to fill"
		"Every hand outstretched;"
		"Here are riches without measure,"
		"           Here forget"
		"           All regret,"
		"Fill your hearts with treasure."
        }
      }
    }
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
  }
}
}

%}

