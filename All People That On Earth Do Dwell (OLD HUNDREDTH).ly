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
   poet = \markup{ \fontsize #4 \smallCaps "All People That On Earth Do Dwell"  }
    meter = \markup { \small { Music: OLD HUNDREDTH, L.M.; Louis Bourgeois, \italic "Genevan Psalter," 1551} }
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
	\partial 2
	g2 |
	g4 fs e d |
	g2 a |
	b2 \bar "||"

	b2 |
	b4 b a g |
	c2 b |
	a2 \bar "||"

	g2 |
	a4 b a g |
	e2 fs |
	g2 \bar "||"

	d'2 |
	b4 g a c |
	b2 a |
	g \bar "|."
}

alto = \relative c' {
	\global
	\partial 2
	d2 |
	d4 d b b |
	b2 d |
	d

	d |
	d4 d d b |
	e2 d |
	d 

	g |
	d4 d d d |
	c2 c |
	d

	d |
	d4. cs8 d4 e |
	d2 d4( c) |
	b2
}

tenor = \relative c' {
	\global
	\partial 2
	b2 |
	b4 a g fs |
	g2 fs |
	g

	g |
	g4 g fs g |
	g2 g |
	fs

	b |
	a4 g fs g |
	g2 a |
	b

	a |
	g4 g fs e |
	g2 fs |
	g2	
}

bass = \relative c {
	\global
	\partial 2
	<<{\tiny \stemDown g2}\\{\override Stem #'length = #4 g'2}>> |
	g4 d e b |
	e2 d |
	g,

	g' |
	g4 g d e |
	c2 g |
	d'

	e |
	fs4 g d b |
	c2 a |
	g

	fs' |
	g4 e d a |
	b( c) d2 |
	g
}

verseOne = \lyricmode {
	\set stanza = "1."
	All peo -- ple that on earth do dwell,
	Sing to the Lord with cheer -- ful voice.
	Him serve with fear, His praise forth tell;
	Come ye be -- fore Him and re -- joice.
}

verseTwo = \lyricmode {
	\set stanza = "2."
	The Lord, ye know, is God in -- deed;
	With -- out our aid He did us make;
	We are His folk, He doth us feed,
	And for His sheep He doth us take.
}

verseThree = \lyricmode {
	\set stanza = "3."
	O enter then His gates with praise;
	Ap -- proach with joy His courts un -- to;
	Praise, laud, and bless His Name al -- ways,
	For it is seem -- ly so to do.
}


verseFour = \lyricmode {
	\set stanza = "4."
	For why? the Lord our God is good;
	His mer -- cy is for ev -- er sure;
	His truth at all times firm -- ly stood,
	And shall from age to age en -- dure.
}

verseFive = \lyricmode {
	\set stanza = "5."
	To Fa -- ther, Son and Ho -- ly Ghost,
	The God Whom Heav'n and earth a -- dore,
	From men and from the an -- gel host
	Be praise and glo -- ry ev -- er -- more.
}

%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%

melodya = \relative c'' {
	\global
	\partial 2
	g2^\markup { \small \caps "People's Part" } |
	g4 fs e d |
	g2 a |
	b2 \bar "||"

	b2 |
	b4 b a g |
	c2 b |
	a2 \bar "||" \break

	g2 |
	a4 b a g |
	e2 fs |
	g2 \bar "||"

	d'2 |
	b4 g a c |
	b2 a |
	g \bar "|."
}

sopranoa = \relative c'' {
	\global
	\partial 2
	b2^\markup { \small \caps "Choir or Organ" } |
	c4 a c b |
	b8[( a] g2) fs4 |
	g2
		d' |
	d,4 g fs e |
	e8[( fs] g2) g4 |
	fs2 
		e |
	fs4 g fs b |
	b8[( a] g4) d'4.( c8) |
	b2 
		fs |
	g4. fs8 e4 a~( |
	a8[ g]) g2 fs4 |
	g2
}

altoa = \relative c' {
	\global
	\partial 2
	d2 |
	e4 d e8[ fs] g4 |
	g( d) d2 |
	d 
		g |
	g4 d d b8[ c] |
	c[( e] e4) d2 |
	d
		b |	
	d4 d d d |
	c4.( b8) a2 |
	e' 
		a,4.( d8) |
	d8( e4) b8 c4 e |
	d2. d4 |
	<<{\voiceTwo d2}\\{\voiceFour \shiftOff \tiny b2}>>
}

tenora = \relative c' {
	\global
	\partial 2
	g2 |
	g4 fs e d |
	g2 a |
	b2 \bar "||"

	b2 |
	b4 b a g |
	c2 b |
	a2 \bar "||"

	g2 |
	a4 b a g |
	e2 fs |
	g2 \bar "||"

	d'2 |
	b4 g a c |
	b2 a |
	g \bar "|."
}

bassa = \relative c {
	\global
	\partial 2
	g2 |
	c4 d a b |
	g2 d' |
	g,
		g |
	g'4 g d e |
	c2 g' |
	d2
		e |
	d4 b d g, |
	c2 d |
	e
		d |
	g8.[ fs16] e8.[ d16] c8.[ b16] a4 |
	b4.( c8) d2 |
	g,
}
%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%

melodyb = \relative c'' {
	\global
	\partial 2
	g2^\markup { \small \caps "People's Part" } |
	g4 fs e d |
	g2 a |
	b2 \bar "||"

	b2 |
	b4 b a g |
	c2 b |
	a2 \bar "||" \break

	g2 |
	a4 b a g |
	e2 fs |
	g2 \bar "||"

	d'2 |
	b4 g a c |
	b2 a |
	g \bar "|."
}

sopranob = \relative c'' {
	\global
	\partial 2
	b2^\markup { \small \caps "Choir or Organ" } |
	b4 a c b |
	b2 d |
	d 
		d |
	d4 d d b |
	e2 d |
	d2 
		b |
	a4 g fs d' |
	c2 a |
	b 
		b |
	g4. g8 d'4 e |
	d2 d4.( c8) |
	b2
}

altob = \relative c' {
	\global
	\partial 2
	d2 |
	d4 d e8[ f] g4 |
	g2 fs |
	g
		g |
	g4 g fs e |
	g2 g |
	fs 
		d |
	fs4 d d4. d8 |
	e2 d |
	d 
		g2 |
	d4 g fs g |
	g2 fs |
	g
}

tenorb = \relative c' {
	\global
	\partial 2
	g2 |
	g4 fs e d |
	g2 a |
	b2 \bar "||"

	b2 |
	b4 b a g |
	c2 b |
	a2 \bar "||"

	g2 |
	a4 b a g |
	e2 fs |
	g2 \bar "||"

	d'2 |
	b4 g a c |
	b2 a |
	g \bar "|."
}

bassb = \relative c {
	\global
	\partial 2
	g2 |
	c4 d a b |
	g2 d' |
	g,
		g' |
	g4 g d e |
	c2 g' |
	d2
		g, |
	d'4 g, d' b |
	c2 d |
	g,
		g' |
	g4 e d c |
	g2 d' |
	g,
}

%%%%%%%%%%%%%%%%
%% score 1 %%%%%
%%%%%%%%%%%%%%%%

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
\header {
	piece = \markup { \small {Text: Psalm 100, \italic "Daye's Psalter," W. Kethe, 1561 }}
}
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 84 4)
            }
       }
	\layout {}
}

%%%%%%%%%%%%%%%%
%% score 2 %%%%%
%%%%%%%%%%%%%%%%
\markup { \caps "Alternative Version" - \small "Melody in Tenor" }

\score { <<
	 \new Voice = "melodya" {\melodya }
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \sopranoa >> }
      \context Voice =
         altos { \voiceTwo << \altoa >> }
      
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
        tenors { \voiceOne << \tenora >> }
      \context Voice =
        basses { \voiceTwo << \bassa >> }
    >>
  >>
>>
\header {
	piece = \markup { \small {Music: Harmony by J. Dowland in \italic "Ravencroft's Psalter," 1621 }}
}
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 84 4)
            }
       } 
  \layout {}
} 

%%%%%%%%%%%%%%%%
%% score 3 %%%%%
%%%%%%%%%%%%%%%%
\markup { \caps "A Simpler Alternative Version" - \small "Melody in Tenor" }
\score { <<
	 \new Voice = "melodyb" {\melodyb }
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \sopranob >> }
      \context Voice =
         altos { \voiceTwo << \altob >> }
      
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
        tenors { \voiceOne << \tenorb >> }
      \context Voice =
        basses { \voiceTwo << \bassb >> }
    >>
  >>
>>
\header {
	piece = \markup { \small {Music: Harmony by J. Dowland }}
}
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 84 4)
            }
       } 
  \layout { }
}

