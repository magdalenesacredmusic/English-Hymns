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
      \line {ST. FLAVIAN  CM}
    }
    \right-column{
      \line { \italic "Day's Psalter," 1563}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Claudia F. Hernaman, 1873}
    }
  } 
}

\header {
  tagline = ""
}


global = {
	\key f \major
	\time 4/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	\partial 4
	f4 |
	f e f a |
	g g f \bar ""
	f4 |
	bf a f g |
	a2. \bar "" \break
	a4 |
	a bf c a |
	f g a \bar ""
	a |
	g f f e |
	f2. \bar "|."
}

alto = \relative c' {
	\global
	\partial 4
	c4 |
	c c c f |
	f e f
		f |
	f f f e |
	e2.
		f4 |
	f f e e |
	d e f
		f |
	e d d c |
	c2.
}

tenor = \relative c' {
	\global
	\partial 4
	a4 |
	g g a d |
	d c a 
		a |
	bf c d d |
	cs2.
		c!4 |
	c bf g a |
	a c c 
		c |
	c a g g | 
	a2.
}

bass = \relative c {
	\global
	\partial 4
	f4 |
	c c f d |
	bf c f
		f |
	d f bf bf |
	a2.
		f4 |
	f d c c |
	d c f 
		f |
	c d bf c |
	f2.
}

sopranoa = \relative c'' {
  \global 
  \partial 4
  a4 |
  bf g a4. c8 |
  bf4 g a d |
  bf c d4. d8 |
  cs2. \bar "" \break
  c4 |
  c d g, a |
  bf4. c8 d4 c |
  c a bf a8[ g] |
  f2. \bar "|."
}

altoa = \relative c' {
  \global
  c4 |
  d c c c |
  d c c d |
  g f d g |
  e2. 
  
  f4 |
  f f e c |
  d g fs4 f |
  e d d c |
  c2.
}

tenora = \relative c {
  \global
  f4 |
  f e f a |
  g g f f |
  bf a f g |
  a2. 
  
  a4 |
  a bf c a f g a a |
  g f f e |
  f2.
}

bassa = \relative c { 
  \global
  f4 |
  bf, c8.[ bf16] a4 f |
  bf c f, bf |
  g a bf bf |
  a2. 
  
  f4 |
  f'4 d e f |
  d ef d4 f |
  c d bf c |
  f,2.
}

verseOne = \lyricmode {
	\set stanza = "1."
	Lord, who through -- out these for -- ty days
	For us didst fast and pray,
	Teach us with thee to mourn our sins
	And close by thee to stay.
}

verseTwo = \lyricmode {
	\set stanza = "2."
	As thou with Sa -- tan didst con -- tend,
	And didst the vic -- t'ry win,
	O give us strength in thee to fight,
	In thee to con -- quer sin.
}

verseThree = \lyricmode {
	\set stanza = "3."
	As thou didst hun -- ger bear, and thirst,
	So teach us, gra -- cious Lord,
	To die to self, and chief -- ly live
	By thy most ho -- ly Word.
}

verseFour = \lyricmode {
	\set stanza = "4."
	And through these days of pen -- i -- tence,
	And through thy pas -- sion -- tide,
	Yea, ev -- er -- more in life and death,
	Je -- sus, with us a -- bide.
}

verseFive = \lyricmode {
	\set stanza = "5."
	A -- bide with us, that so, this life
	Of suf -- f'ring o -- ver past,
	An Eas -- ter of un -- end -- ing joy
	We may at -- tain at last.
}


\book {
  \include "hymn_paper_multipage.ly"
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
      \new Lyrics \lyricsto soprano \verseFour
      \new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 80 4)
      }
    }
    \include "hymn_layout.ly"
  }
  \bottom


%%%%%
%%%%%
%%%%%
%\pageBreak
%%%%%%%%%%%%%%%%
%% score 2 %%%%%
%%%%%%%%%%%%%%%%
\markup {
  \vspace #2
\fill-line {
      \column {
          \line {\caps "Alternative Version" - \small "Melody in Tenor"}
      }
      \column{
      \line {Harmized by T. Ravenscroft in his \italic Psalter, 1621 (rhythm altered)}
      }
}
}
\score { <<
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \sopranoa >> }
      \context Voice =
         altos { \voiceTwo << \altoa >> }
      
    >>
    \new Lyrics  \lyricsto sopranos \verseFive
    \context Staff = lower <<
      \clef bass
      \context Voice =
        tenors { \voiceOne << \tenora >> }
      \context Voice =
        basses { \voiceTwo << \bassa >> }
    >>
  >>
>>
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 84 4)
            }
       } 
    \include "hymn_layout.ly"
}
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
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}


