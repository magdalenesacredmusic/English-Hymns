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
   poet = \markup{ \fontsize #4 \smallCaps "Title"  }
    meter = \markup { \small { Music: ROUEN, 11.11.11.5.; \italic "Rouen Church Melody;" \italic "The English Hymnal"} }
    piece = \markup { \small {Text: \italic "source," Author (xxxx-xxxx) Tr. Traditional adapt. by A.B.C }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key d \minor
	\time 4/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	d2 <e a>4 <d f> |
	g2 a |
	d,4. e8 f4 g |
	f( e) d2 \bar "||"

	d <e a>4 f |
	g2 a |
	a4. g8 a4 b |
	<e, c'>( <g b>) a2 \bar "||"

	d2 c4 d |
	<e, c'>( bf') a2 |
	c4. bf8 a4 bf |
	<f a>( <e g>) f2 \bar "||"

	a2 d,4 e |
	f2( e) |
	d1 \bar "|."
}

alto = \relative c' {
	\global
	a2 a4~ a |
	d2 c |
	a4. c8 c4 d |
	c2 a |
	
	a2 a4~ a |
	c2 c |
	c f4 f |
	e2 <c e> |

	d <c f>4 <d f> |
	c f <c f>2 |
	<c e>4. f8 <c f>4 <bf d> |
	c2 <a d> |
	
	<a d> d4 g, |
	<a c>1 |
	<f a> 
}

tenor = \relative c {
	\global
	f2 e4 f |
	d2 e |
	f4. g8 a4 bf |
	a g f2 |
	
	f e4 d |
	g2 f |
	f4. g8 c4 d |
	g,2 a |

	<< {\voiceOne bf2 a4 } \\ { \voiceFour \shiftOff \stemUp f2~ \stemDown f4} >> 
		bf |
	g f a2 |
	g4. f8 a4 g |
	f g d2 |
	
	f2. c4 |
	c1 |
	d1  
}

bass = \relative c {
	\global
	d2 c4 d |
	bf2 a |
	d4. c8 a4 g |
	a c d2 |

	d c4 d |
	c2 f, |
	f'4. e8 f4 d |
	c e a2 |

	bf, s4 bf |
	c d f2 |
	<< {\voiceTwo \override Stem #'length-fraction = #(magstep -3) c4. d8 f4} 		\\ { \voiceFour 
 				%\override NoteColumn #'force-hshift = #0.3 
					\shiftOff
				\override NoteHead #'font-size = #-3 
											c,4. d8 f4} >> 
		g4 |
	a c d2 |

	f,2 bf4 c |
	f,2( a) |
	d,1
}

verseOne = \lyricmode {
	\set stanza = "1."
	
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	
}

verseThree = \lyricmode {
	\set stanza = "3."
	
}

%%% if more verses are needed in between the musical staves, uncomment this section
%{
verseFour = \lyricmode {
	\set stanza = "4."
	
}
%}

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
  \layout { }
}

%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%

melodyb = \relative c' {
	\global
	d2 a'4 f |
	g2 a |
	d,4. e8 f4 g |
	f( e) d2 \bar "||"

	d2 a'4 f |
	g2 a |
	a4. g8 a4 b |
	c( b) a2 \bar "||"

	d2 c4 d |
	c( bf) a2 |
	c4. bf8 a4 bf |
	a( g) f2 \bar "||"

	a2 d,4 e |
	f2( e) |
	d1 \bar "|."
}

altob = \relative c' {
	\global
	a2 e'4 d |
	d2 cs |
	d4. cs8 d4 d |
	d( cs) d2 |
	
	d2 e4 d |
	d2 cs |
	c4. c8 c4 f |
	e2 c |
	
	f2 a4 f |
	g2 f |
	e4. f8 f4 g |
	f( e) d2 |
	
	c2 d4 d | 
	d2( cs) |
	d1
}

tenorb = \relative c {
	\global
	f2 a4 a |
	g2 e |
	a4. g8 a4 bf |
	a( g) f2 |

	f a4 a |
	g2 e |
	f4. e8 f4 a |
	a( gs) a2 |

	bf2 f'4 d |
	d2 d |
	g,4. d'8 c4 d |
	c2 a |
	
	a bf4 bf |
	a2.( g4) |
	f1 
}

bassb = \relative c {
	\global
	d2 cs4 d |
	bf2 a |
	f'4. e8 d4 g, |
	a2 d |

	d cs4 d |
	bf2 a |
	f'4. c8 f4 d |
	e2 a |

	bf2 f4 bf |
	g2 d|
	c4. d8 f4 g, |
	a( c) d2 |

	f,2 bf4 g |
	a1 |
	d
}

\score {
  \new ChoirStaff <<
    \new Staff  <<
      \new Voice = "soprano" { \voiceOne \melodyb }
      \new Voice = "alto" { \voiceTwo \altob }
    >>
    \new Lyrics  \lyricsto soprano \verseOne
    \new Lyrics  \lyricsto soprano \verseTwo
    \new Lyrics  \lyricsto soprano \verseThree
    \new Lyrics \lyricsto soprano \verseFour
    \new Staff  <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenorb }
      \new Voice = "bass" { \voiceTwo \bassb }
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

