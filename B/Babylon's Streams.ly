\version "2.16.2-1"
\include "english.ly"
\layout { indent = 0.0\cm }

%#(set-default-paper-size "letter")
#(set-global-staff-size 16)
#(ly:set-option (quote no-point-and-click))
#(set! paper-alist (cons '("ustrade" . (cons (* 6 in) (* 9 in))) paper-alist))

\paper {
	#(set-paper-size "ustrade") 
}

\header {
   poet = \markup{ \fontsize #4 \smallCaps "Title"  }
    meter = \markup { \small { Music: BABYLON'S STREAMS, L.M.; \italic "English Hymnal;" Thomas Campion, (1575-1619) } }
    piece = \markup { \small {Text: \italic "source," Author (xxxx-xxxx) Tr. Traditional adapt. by A.B.C }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key e \minor
	\time 2/2
}

melody = \relative c' {
	\global
	\partial 2
	e2 |
	g a |
	\time 4/2 b1. b2 |
	\time 2/2 a g |
	\time 4/2 fs1. \bar "||" fs2 |
	\time 2/2 g a |
	b2. b4 |
	a2 a2 |
	\time 4/2 g1. \bar "||" b2 |
	\time 2/2 d b |
	a fs |
	g a |
	b2. \bar "||" b4 | 
	b2. b4 |
	b2 a4 g |
	fs2 fs2 |
	\time 4/2 e1. \bar "|."
}

alto = \relative c' {
	\global
	\partial 2
	b2 |
	e e |
	ds1. e2 |
	e e |
	ds1. ds2 |
	e fs |
	g2. g4 |
	g2 fs |
	g1. g2 |
	g g |
	fs fs |
	e e |
	ds2. ds4 |
	e2 fs2 |
	e e |
	e ds |
	e1. 
}

tenor = \relative c' {
	\global
	\partial 2
	g2 |
	b e, |
	fs1. g2 |
	c b |
	b1. \bar "||" b2 |
	b d |
	d2. d4 |
	e2 d4 c4 |
	b1. \bar "||" d2 |
	b g |
	a b |
	b e, |
	fs2. fs4 |
	g2 fs |
	g c |
	fs, b |
	g1. \bar "|."
}

bass = \relative c {
	\global
	\partial 2
	e2 |
	e c |
	b1. e2 |
	a, e' |
	b1. b2 |
	e2 d |
	g2. b,4 |
	c2 d |
	g1. g2 |
	g g |
	d d |
	e c |
	b2. b4 |
	e2 ds |
	e a, |	
	b b |
	e1.
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
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Voice =
         altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
	  \context Lyrics = two \lyricsto sopranos \verseTwo
	  \context Lyrics = three \lyricsto sopranos \verseThree
	  %%% if more verses are needed, uncomment the following:
	  %\context Lyrics = four \lyricsto sopranos \verseFour
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
        tenors { \voiceOne << \tenor >> }
      \context Voice =
        basses { \voiceTwo << \bass >> }
    >>
  >>
%{\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 69 2)
            }
       }
%}
  \layout {
    \context {
      \Score
      % **** Turns off bar numbering
      \remove "Bar_number_engraver"
    }
%{	\context {
		\Staff
		\remove "Time_signature_engraver"
		 }
%}
    \context {
      \Lyrics
      % **** Prevents lyrics from running too close together
      \override LyricSpace #'minimum-distance = #0.6
      % **** Makes the text of lyrics a little smaller
      \override LyricText #'font-size = #-1
      % **** Moves lines of lyrics closer together
      \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 1)
    }
  }
}

\markup { 
	\normalsize {
	\fill-line {
	\hspace #1.0
	\column {
		\line { \bold "4. "
		\column {
		""
		""
		""
		""
		}
		}
		\vspace #0.5
		\line { \bold "5. "
		\column {
		""
		""
		""
		""
  		}	
		}
		}
	\hspace #1.0

	}
  }
}

