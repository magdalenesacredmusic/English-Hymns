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
      \line {SCHMUEKE DICH  88 88 88 88}
    }
    \right-column{
      \line {Johann Crüger (1598-1662), 1649}
      \line {harm. \italic "The English Hymnal"}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Schmücke dich, o liebe Seele"}
      \line {Johann Franck, 1649; tr. Catherine Winkworth, 1858}
    }
  } 
}

\header {
  tagline = ""
}


global = {
	\key ef \major
	\time 4/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"

}

melody = \relative c'' {
	\global
	g2 f2 |
	ef4 f g bf |
	af2 g2 |
	bf g |
	af4 g8[ f] ef4 g |
	f2 ef2 \bar "||"
	
	g2 f2 |
	ef4 f g bf |
	af2 g2 |
	bf g |
	af4 g8[ f] ef4 g |
	f2 ef2 \bar "||"

	\time 8/4 bf'2 c4 
	%\time 5/4 
	ef2 ef4 d bf |
	\time 4/4 c2 bf |
	\time 8/4 bf c4 
	%\time 5/4 
	ef2 ef4 d bf | 
	\time 4/4 c2 bf \bar "||"
	
	\time 4/4 f2 g2 |
	af4 af g f |
	f( e) f2 |
	g bf |
	af4 g f ef |
	f2 ef \bar "|."
}

alto = \relative c' {
	\global
	ef2. d4 |
	c f ef ef |
	ef( d) ef2 |
	d ef |
	ef4 d c ef |
	ef( d) ef2 |

	ef2. d4 |
	c f ef ef |
	ef( d) ef2 |
	d ef |
	ef4 d c ef |
	ef( d) ef2 |

	ef2 af4 bf2 g4 
	af4 bf bf( af) g2 
	ef2 af4 g2 g4 
	f d f4.( ef8) d2 
	
	d e |
	f4 f df af8[ bf] |
	c2 c |
	c bf |
	c4 bf c ef |
	ef4( d) ef2 |
}

tenor = \relative c' {
	\global
	g4( af) bf2 |
	g4 bf bf bf |
	f2 g |
	g g |
	c4 bf8[ af] g4 bf |
	bf2 g \bar "||"

	g4( af) bf2 |
	g4 bf bf bf |
	f2 g |
	g g |
	c4 bf8[ af] g4 bf |
	bf2 g \bar "||"

	bf2 ef4 ef2 bf4 
	d ef ef2 ef 
	ef c4 c2 g4 
	bf4 bf bf( a) bf2 
	
	d c4( bf) 
	af c bf f | 
	g2 af2 |
	ef ef |
	ef4 g af g |
	bf2 g |
}

bass = \relative c {
	\global
	ef2 bf |
	c4 d ef g, |
	bf2 ef |
	g, c |
	f,4 bf c g |
	bf2 ef |
	
	ef2 bf |
	c4 d ef g, |
	bf2 ef |
	g, c |
	f,4 bf c g |
	bf2 ef |

	g2 af4 g2 ef4 
	f g af2 ef2 
	g2 f4 c2 c4 
	d g f2 bf,2 

	bf' af4( g) |
	f f bf, df |
	c2 f, |
	c' g |
	c4 ef af, c |
	bf2 ef |
}

verseOne = \lyricmode {
	\set stanza = "1."
	\tagIt Deck thy -- self, my soul, with glad -- ness,
	Leave the gloom -- y haunts of sad -- ness,
	Come in -- to the day -- light's splen -- dour,
	There with joy thy prais -- es rend -- er
	Un -- to Him whose grace un -- bound -- ed
	Hath this wond -- rous ban -- quet found -- ed,
	High o'er all the heav'ns he reign -- eth,
	Yet to dwell with thee He deign -- eth.
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	Sun, who all my life dost bright -- en,
	Light, who dost my soul en -- light -- en,
	Joy, the sweet -- est man e'er know -- eth,
	Fount, whence all my be -- ing flow -- eth,
	At Thy feet I cry, my Ma -- ker,
	Let me be a fit par -- ta -- ker
	Of this bles -- sed food from hea -- ven,
	For our good, Thy glo -- ry, giv -- en.
}

verseThree = \lyricmode {
	\set stanza = "3."
	Je -- sus, Bread of Life, I pray Thee,
	Let me glad -- ly here o -- bey Thee,
	Nev -- er to my hurt in -- vit -- ed,
	Be Thy love with love re -- quit -- ed;
	From this ban -- quet let me mea -- sure,
	Lord, how vast and deep its trea --  -- sure;
	Through the gifts Thou here dost give me
	As Thy guest in heav'n re -- ceive me.
}

%%%%%%%
%{verseTwo = \lyricmode {
	\set stanza = "2."
	Hast -- en as a Bride to meet Him,
	And with lov -- ing rev' -- rence greet Him,
	For with words of life im -- mor -- tal
	Now He knock -- eth at thy por -- tal;
	Haste to ope the gates be -- fore Him,
	Say -- ing, while thou dost a -- dore Him,
	"\"Suf" -- fer, Lord, that I re -- ceive Thee,
	And I nev -- er more will leave "Thee.\""
}

verseThree = \lyricmode {
	\set stanza = "3."
	Ah how hung -- ers all my spi -- rit
	For the love I do not mer -- it!
	Oft have I, with sighs fast throng -- ing,
	Thought up -- on this food with long -- ing,
	In the bat -- tle well- -- nigh worst -- ed,
	For this cup of life have thirst -- ed,
	For the Friend, who here in -- vites us,
	And to God Him -- self u -- nites us.
} %}
%%%%%%%%
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

%%%%%%%%%%
%{ \markup { 
	\normalsize {
	\fill-line {
	\hspace #1.0
	\column {
		\line { \bold "4. "
		\column {
		"Now I sink before Thee lowly,"
		"Fill'd with joy most deep and holy,"
		"As with trembling awe and wonder"
		"On Thy mighty works I ponder,"
		"Now, by mystery surrounded,"
		"Depths no man hath ever sounded,"
		"None may dare to pierce unbidden"
		"Secrets that with Thee art hidden."

		}
		}
		\vspace #0.5
		\line { \bold "5."
		\column {
		"Sun, who all my life dost brighten,"
		"Light, who dost my soul enlighten,"
		"Joy, the sweetest man e'er knoweth,"
		"Fount, whence all my being floweth,"
		"At Thy feet I cry, my Maker,"
		"Let me be a fit partaker"
		"Of this blessed food from heaven,"
		"For our good, Thy glory, given."
		}	
		}
		\vspace #0.5
		\line { \bold "6. "
		\column {
		"Jesus, Bread of Life, I pray Thee,"
		"Let me gladly here obey Thee,"
		"Never to my hurt invited,"
		"Be Thy love with love requited;"
		"From this banquet let me measure,"
		"Lord, how vast and deep its treasure;"
		"Through the gifts Thou here dost give me"
		"As Thy guest in heaven receive me."
  		}	
		}
		}
	\hspace #1.0

	}
  }
} %}
%%%%%%%%%

%see, for other text, the nine verses appearing in The Lutheran Hymnal, %Concordia Publishing House, 1941, attributed to Catherine Winkworth.
