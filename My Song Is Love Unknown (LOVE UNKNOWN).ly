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
   poet = \markup{ \fontsize #4 \smallCaps "My Song Is Love Unknown"  }
    meter = \markup { \small { Music: LOVE UNKNOWN, 12.12.88; John Ireland, 1918 } }
    piece = \markup { \small {Text: Samuel Crossman, 1664 }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key d \major
	\time 3/2
	%\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	\partial 2
	fs2 |
	a4 b fs2 e |
	\time 2/2 d2. e4 |
	fs g a fs | 
	b2. b4 |
	cs b a a |
	d cs b a |
	a( fs2) gs4 |
	a2. a4 |
	\time 3/2 c b g2. g4 |
	b a d,2. e4 |
	\time 2/2 fs g a fs |
	fs2 e |
	d \bar "|."  
}

alto = \relative c' {
	\global
	\partial 2
	d2 |
	d4 b cs2 cs |
	b2. a4 |
	d d cs d |
	d2. d4 |
	g g cs, fs |
	d e fs cs |
	e2. e4 |
	e( d cs) d |
	e d b2 c |
	d4 c b2. a4 |
	a d d d |
	cs2 cs |
	d \bar "|."
}

tenor = \relative c' {
	\global
	\partial 2
	a2 |
	a4 fs a2. g4 |
	g2( fs4) e4 |
	a a a b |
	g2. g4 |
	g g a cs |
	b a fs a |
	b2.b 4 |
	a2. fs4 |
	g fs g2 e |
	g4 fs a2( g4) e |
	a g fs b |
	a2. g4 |
	fs2 \bar "|."	
}

bass = \relative c {
	\global
	\partial 2
	d2 |
	fs4 d a'2 a, |
	b2. cs4 |
	d e fs d |
	g2 fs |
	e4 e fs fs |
	b, cs d fs |
	e2 d |
	cs4( b a) d |
	c d e2 c |
	g4 a b2. cs4 |
	d b fs g |
	a2 a |
	d \bar "|."
}

verseOne = \lyricmode {
	\set stanza = "1."
	My song is love un -- known,
	My Sa -- viour’s love to me;
	Love to the love -- less shown,
	That they might love -- ly be.
	O who am I, that for my sake
	My Lord should take frail flesh and die?
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	He came from His blest throne
	  Sal -- va -- tion to be -- stow;
	But men made strange, and none
	  The longed -- for Christ would know:
	But O! my Friend, my Friend in -- deed,
	Who at my need His life did spend.
}

verseThree = \lyricmode {
	\set stanza = "*3."
	Some -- times they strew His way,
	  And His sweet prais -- es sing;
	Re -- sound -- ing all the day
	  Ho -- san -- nas to their King:
	Then “Cru -- ci -- fy!” is all their breath,
	And for His death they thirst and cry.
}

verseFour = \lyricmode {
	\set stanza = "*4."
	Why, what hath my Lord done?
	  What makes this rage and spite?
	He made the lame to run,
	  He gave the blind their sight,
	Sweet in -- ju -- ries! Yet they at these
	Them -- selves dis -- please, and ’gainst Him rise.
}

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

%{\markup { 
	\normalsize {
	\fill-line {
	\hspace #1.0
	\column {
		\line { \bold "*5. "
		\column {
		"They rise and needs will have"
		"  My dear Lord made away;"
		"A murderer they saved,"
		"  The Prince of life they slay,"
		"Yet cheerful He to suffering goes,"
		"That He His foes from thence might free."
		}
		}
		\vspace #0.5
		\line { \bold "*6. "
		\column {
		"In life, no house, no home"
		"  My Lord on earth might have;"
		"In death no friendly tomb"
		"  But what a stranger gave."
		"What may I say? Heav’n was His home;"
		"But mine the tomb wherein He lay."
  		}	
		}
		\vspace #0.5
		\line { \bold "7. "
		\column {
		"Here might I stay and sing,"
		"  No story so divine;"
		"Never was love, dear King!"
		"  Never was grief like Thine."
		"This is my Friend,in Whose sweet praise"
		"I all my days could gladly spend."
  		}	
		}
		}
	\hspace #1.0

	}
  }
} %}

\markup {
	\large {
  \fill-line {
    \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
     \column {
      \line { \bold "*5. "
		\column {
		"They rise and needs will have"
		"  My dear Lord made away;"
		"A murderer they saved,"
		"  The Prince of life they slay,"
		"Yet cheerful He to suffering goes,"
		"That He His foes from thence might free."
        }
      }
    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "*6. "
		\column {
		"In life, no house, no home"
		"  My Lord on earth might have;"
		"In death no friendly tomb"
		"  But what a stranger gave."
		"What may I say? Heav’n was His home;"
		"But mine the tomb wherein He lay."
        }
      }
    }
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
  }
}
}

\markup { 
	\large {
	\fill-line {
	\vspace #1.5
	\column {
		\line { \bold "7. "
		\column {
		"Here might I stay and sing,"
		"  No story so divine;"
		"Never was love, dear King!"
		"  Never was grief like Thine."
		"This is my Friend, in Whose sweet praise"
		"I all my days could gladly spend."
  		}	
		}
		}
	\hspace #1.0

	}
  }
} 
