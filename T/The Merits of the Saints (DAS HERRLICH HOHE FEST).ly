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
   poet = \markup{ \fontsize #4 \smallCaps "The Merits of the Saints"  }
    meter = \markup { \small { Music: DAS HERRLICH HOHE FEST, 66.66.668., C. Peter, c. 1674; \italic "The English Hymnal"} }
    piece = \markup { \small {Text: \italic "Sanctorum meritis," Common of Martyrs; tr. J.M. Neale, original v.3 ommitted }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key c \major
	\time 3/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	c4 e g |
	a2 b4 |
	c2. \bar "||"

	c4 e c |
	b2 a4 |
	b2. \bar "||"

	d4 d d |
	e2 e4 |
	d2. \bar "||"

	e4 c c |
	b2 b4 |
	a2. \bar "||"

	e4 e g |
	g2 fs4 |
	g2. \bar "||" \break

	a4 a c |
	c2 b4 |
	c2. \bar "||"

	b4 d g, |
	\cadenzaOn c4.( d8 \bar "dashed"
	e4) e4 \bar "dashed"
	d4 d \bar "|" 
	c2. \bar "|."
}

alto = \relative c' {
	\global
	c4 c d |
	f2 f4 |
	e2. \bar "||"

	e4 e a |
	g2 fs4 |
	g2. \bar "||"

	f4 a f |
	e2 g4 |
	g2. \bar "||"
	
	e4 e e |
	f2 e4 |
	c2. \bar "||"

	c4 c d |
	e2 d4 |
	d2. \bar "||"

	c4 f4 g |
	a2 g4 |
	g2. \bar "||"

	g4 d d |
	\cadenzaOn g4.( f8 \bar "dashed"
	e4) g \bar "dashed"
	a g \bar "|"
	e2. \bar "|." 
}

tenor = \relative c' {
	\global
	c4 c b |
	c2 d4 |
	g,2. \bar "||"

	a4 a c |
	d2 d4 |
	d2. \bar "||"

	d4 a b |
	c2 c4 |
	b2. \bar "||"

	b4 c a |
	a2 gs4 |
	a2. \bar "||"

	g4 g g |
	c2 c4 |
	b2. \bar "||"

	a4 c c |
	f2 f4 |
	e2. \bar "||"

	d4 b b |
	\cadenzaOn c4.( b8 \bar "dashed"
	c4) c4 \bar "dashed"
	c b \bar "|"
	c2. \bar "||"
}

bass = \relative c' {
	\global
	c4 a g |
	f( e) d |
	c2. \bar "||"

	a4 c a |
	b4.( c8) d4 |
	g,2. \bar "||"

	d'4 f d |
	c2 e4 |
	g2. \bar "||"

	gs4 a c, |
	d2 e4 |
	a,2. \bar "||"

	c4 c b |
	a2 d4 |
	g,2. \bar "||"

	f'4 f e |
	d2 g4 |
	c,2. \bar "||"

	g'4. a8 g8[ f] |
	\cadenzaOn e4.( d8 \bar "dashed"
	c4) e \bar "dashed"
	f g \bar "|"
	c,2. \bar "|."
}

verseOne = \lyricmode {
	\set stanza = "1."
	The mer -- its of the saints,
	  Bles -- sèd for ev -- er -- more,
	Their love that nev -- er faints,
	  The toils they brave -- ly bore—
	For these the Church to -- day
	Pours forth her joy -- ous lay—
	These vic -- tors win the nobl -- est bay.	
}

verseTwo = \lyricmode {
	\set stanza = "2."
	They, whom the world of ill,
	  While it yet held, ab -- horred;
	Its with' -- ring flow'rs that still
	  They spurned with one ac -- cord—
	They knew them short -- lived all,
	And fol -- lowed at Thy call,
	King Je -- su, to Thy heav' -- nly hall.
}

verseThree = \lyricmode {
	\set stanza = "3."
	Like sheep their blood they poured,
	  And with -- out groan or tear,
	They bent be -- fore the sword,
	  For that their King most dear:
	Their souls, ser -- ene -- ly blest,
	In pa -- tience they pos -- sessed,
	And looked in hope to -- wards their rest.
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
  \layout { }
}

\markup { 
	\large {
	\fill-line {
	\hspace #1.0
	\column {
		\line { \bold "4. "
		\column {
		"What tongue may here declare,"
		"  Fancy or thought descry,"
		"The joys Thou dost prepare"
		"  For these Thy saints on high!"
		"Empurpled in the flood"
		"Of their victorious blood,"
		"They won the laurel from their God."
		}
		}
}
		\hspace #0.1
	\column {	
	\line { \bold "5. "
		\column {
		"To Thee, O Lord most high,"
		"  One in three Persons still,"
		"To pardon us we cry,"
		"  And to preserve from ill:"
		"Here give Thy servants peace,"
		"Hereafter glad release,"
		"And pleasures that shall never cease."
  		}	
		}
		}
	\hspace #1.0

	}
  }
}

