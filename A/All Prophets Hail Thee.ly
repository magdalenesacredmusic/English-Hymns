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
   poet = \markup{ \fontsize #4 \smallCaps "All Prophets Hail Thee"  }
    meter = \markup { \small { Music: DIVA SERVATRIX, 11.11.11.5.; Baueux Church Melody, arr. R. Vaughan Williams, 1906} }
    piece = \markup { \small {Text: \italic "Quod chorus vatum," Rabanus Maurus, 9th cent.; tr. T.A. Lacy}}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key g \major
	\time 4/4
	%\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
	\global
	b2 b4 c |
	b2 g |
	a4. g8 a4 b |
	a2 g \bar "||"

	b b4 d |
	c2 b |
	a4. g8 fs4 g |
	e2 d \bar "||"

	b' a4 g |
	c2 b |
	g4. a8 b4 c |
	d2 d |
	b a4 g |
	a2 g \bar "|."
}

alto = \relative c' {
	\global
	<d g>2 <d g>4 <e g> |
	<d g>2 <b d> |
	<d fs>4. <b e>8 <d fs>4 <d g> |
	<d fs>2 <b d>

	<d g> <d g>4 <d g> |
	<e g>2 <d g> |
	<d fs>4. <b e>8 <b d>4 <b d> |
	cs2 a |

	<d g>2 <d fs>4 <b e> |
	<e g>2 <d g> |
	<b d>4. d8 <d g>4 g|
	<d g>2 <d fs> |
	<d g> <c e>4 <b e> |
	<d fs>2 <b d>
	
}

tenor = \relative c' {
	\global
	s1 |
	s1 |
	s1 |
	s1 

	s1 
	s1 
	s1
	a2 fs 

	s1 
	s1 
	s1 
	a2 a |
	g s2 
	s1 \bar "|."
}

bass = \relative c' {
	\global
	g2 g4 \stemUp c, |
	\stemDown g'2 g |
	d4. e8 d4 \stemUp b |
	d2 g,

	\stemDown g' g4 \stemUp b, |
	c2 g |
	\stemDown d'4. e8 \stemUp b4 g |
	\stemDown a2 d |

	g2 d4 e |
	\stemUp c2 g |
	\stemDown g'4. fs8 g4 e |
	d2 d |
	g c,4 e |
	\stemUp d2 g, \bar "|."
	
}

verseOne = \lyricmode {
	\set stanza = "1."
	All pro -- phets hail thee, from of old an -- noun -- cing,
	By the in -- breath -- èd Spi -- rit of the Fa -- ther,
	God's Mo -- ther, bring -- ing pro -- phe -- cies to full -- ness,
	Mar -- y the maid -- en.
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	Thou the true Vir -- gin Mo -- ther of the High -- est,
	Bear -- ing in -- car -- nate God in awed o -- be -- dience,
	Meek -- ly ac -- cept -- est for a sin -- less off -- spring
	Pu -- ri -- fi -- ca -- tion.
}

verseThree = \lyricmode {
	\set stanza = "3."
	In the high tem -- ple Sim -- e -- on re -- ceives thee,
	Takes to his bent arms with a ho -- ly rap -- ture
	That pro -- mised Sa -- vior, vi -- sion of re -- demp -- tion,
	Christ long a -- wait -- ed.
}

verseFour = \lyricmode {
	\set stanza = "4."
	Now the fair realm of Pa -- ra -- dise at -- tain -- ing,
	And to thy Son's throne, Mo -- ther of the_E -- ter -- nal,
	Rais -- èd all glo -- rious, yet in earth's de -- vo -- tion
	Join with us al -- ways.
}

verseFive = \lyricmode {
	\set stanza = "5."
	Glo -- ry and wor -- ship to the Lord of all things
	Pay we un -- rest -- ing, who a -- lone a -- dor -- èd,
	Fa -- ther and Son and Spi -- rit, in the high -- est
	Reign -- eth e -- ter -- nal.
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

