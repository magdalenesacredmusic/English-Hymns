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
   poet = \markup{ \fontsize #4 \smallCaps "GOD OF OUR FATHERS"  }
    meter = \markup { \small { Music: NATIONAL HYMN, 10.10.10.10.; George W. Warren, 1892 } }
    piece = \markup { \small {Text: Daniel C. Roberts, 1876 }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key f \major
	\time 2/2
	%\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	s1 |
	s1 \bar "||"
	
	\normalsize f2 f4. g8 | 
	a2. bf4 |
	a f f e |
	f2. s4 |

	a2 a4. a8 |
	c2. d4 |
	e c c b |
	c2. s4 \bar "||" \break 

	c2 c4. c8 |
	c2. c4 |
	ef4 c c b |
	c2. s4 \bar "||" \break 

	f2 e4. d8 |
	c2. c4 |
	bf a g g |
	f1 \bar "|."
}

	
alto = \relative c'' {
	\global
	<< {\voiceThree 
			\teeny <a c>2_\markup \italic "Trumpets, before each verse." 
			b4\rest \times 2/3 {<a c>8 <a c> <a c> } } 
	 \\ {\voiceFour 
			\teeny f2 s4 \times 2/3 {f8 f f} } >> |
	<< {\voiceThree 
				<a c>4 <a c>4 <a c>4 <a c>4} \\ 
			{\voiceFour 
				f4 f f f} >> |
	
	\normalsize c2 d4. e8 |
	f2. f4 |
	f f c c 
	<< {\voiceTwo c2. \teeny r4} \\ {\voiceThree \teeny c''4\rest \times 2/3 {<f,, a c>8 <f a c> <f a c> } <f a c>4 <f a c>4 } >> |

	f2 f4. f8 |
	e2. fs4 |
	g4 g g g |
	<<{\voiceTwo g2. \teeny r4} \\ {\voiceThree \teeny c'4\rest \times 2/3 {<c,, c'>8 <c c'>8 <c c'>8} <c c'>4 <c c'>4 }>> |
	
	c'2 c4. c8 |
	<< { \voiceTwo c2. c4 } \\ 
			{ \voiceFour \teeny \once \override NoteColumn #'force-hshift = #0.6 <c, ef af>2. \once \override NoteColumn #'force-hshift = #1 <ef fs>4 } >> |
	g4 g g f |
	<< {\voiceTwo e2. \teeny r4} \\ {\voiceThree \teeny c''4\rest \times 2/3 {<c,, c'>8 <c c'>8 <c c'>8} <c c'>4 <c c'>4 }>> |

	f2 f4. f8 |
	f2. a4 |
	g f f e |
	f1 |
}

tenor = \relative c {
	\global
	\override MultiMeasureRest #'staff-position = #2
  	R1 |
	R1 |
	
	a'2 a4. c8 |
	c2. d4 |
	c a g g |
	a2. d,4\rest |
	
	c'2 d4. d8 |
	a2. c4 |
	c e d d |
	e2. d,4\rest

	c'2 c4. c8 |
	c2. c4 |
	c ef d d |
	c2. d,4\rest
	
	c'2 bf4. bf8 |
	a2. ef'4 |
	d c c bf |
	a1 |
}

bass = \relative c {
	\global
	s1 |
	s1 |
	
	f2 d4. c8 |
	f2. bf,4 |
	c c c c |
	f2. s4 |
	f2 d4. d8 |
	a'2. a4 |
	g g g g |
	c,2. s4 |
	
	c'2 c4. c8 |
	<< {\voiceTwo c2. c4} \\ { \voiceFour \teeny \once \override NoteColumn #'force-hshift = #0.6 <af, af'>1 } >> |
	g'4 g g g |
	c,2. s4 |

	a'2 bf4. bf8 |
	f2. fs4 |
	g a8 bf c4 c,4 |
	<f, f'>1 |
}

verseOne = \lyricmode {
	\set stanza = "1."
	God of our fath -- ers, whose al -- migh -- ty hand
	Leads forth in beau -- ty all the star -- ry band
	Of shin -- ing worlds in splen -- dor through the skies
	Our grate -- ful songs be -- fore Thy throne a -- rise.
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	Thy love di -- vine hath led us in the past,
	In this free land by Thee our lot is cast,
	Be Thou our Rul -- er, Guard -- ian, Guide and Stay,
	Thy Word our law, Thy paths our cho -- sen way.
}

verseThree = \lyricmode {
	\set stanza = "3."
	From war’s a -- larms, from dead -- ly pes -- ti -- lence,
	Be Thy strong arm our ev -- er sure de -- fense;
	Thy true re -- li -- gion in our hearts in -- crease,
	Thy boun -- teous good -- ness nour -- ish us in peace.
}

verseFour = \lyricmode {
	\set stanza = "4."
	Re -- fresh Thy peo -- ple on their toil -- some way,
	Lead us from night to nev -- er end -- ing day;
	Fill all our lives with love and grace di -- vine,
	And glo -- ry, laud, and praise be ev -- er Thine.
}

\score { \transpose c' bf
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
       tempoWholesPerMinute = #(ly:make-moment 96 4 )
            }
       }
  \layout {}
}

