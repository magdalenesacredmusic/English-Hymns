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
          \line {ORIEL 87 87 87}
      }
      \right-column{
      \line {Tune as set to \italic "Pange lingua"}
      \line {in C. Ett's \italic "Cantia Sacra," Munich, 1840}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {\italic "Gloriosi Salvatoris," 15th cent.}
     \line {tr. \italic "Hymns Ancient and Modern," 1861}
   }
  } 
}

global = {
	\key g \major
	\time 4/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
	\global
	g4 g g g |
	a b c b |
	b b a g | 
	fs e d2 \bar "||"
	
	g4 g g g |
	a b c b |
	b b a g |
	fs e d2 \bar "||"
	
	fs4 fs b fs |
	fs g a g |
	c c b a |
	g fs g2 \bar "|."
}

alto = \relative c' {
	\global
	d4 e d b |
	d d e8[ d] d4 |
	d e fs e |
	d cs d2 |
	
	d4 e d b |
	d d e d |
	d d8[ e] fs4 e |
	d cs d2 |
	
	d4 e d cs |
	d b d b |
	e e d e |
	d d d2
}

tenor = \relative c' {
	\global
	b4 g g g |
	fs g g8[ fs] g4 |
	b cs d b |
	a4. g8 fs2 |
	
	g4 g g g |
	fs g g g |
	g8[ a] b[ cs] d4 b |
	a4. g8 fs2 |
	
	a4 as b cs |
	b g fs g |
	g8[ fs] g[ a] b4 c |
	b a b2
}

bass = \relative c {
	\global
	g4 c b e |
	d b a g |
	g' g fs g |
	a4 a, d2 |
	
	b4 c b e |
	d g c, g |
	g'4 g fs g |
	a a, d2 |
	
	d4 cs b as |
	b e d e |
	c8[ d] e[ fs] g4 c, |
	d d g,2
}


verseOne = \lyricmode {
	\set stanza = "1."
        To the Name of our sal -- va -- tion
        Laud and hon -- or let us pay,
        Which for many_a generation
        Hid in God's fore -- knowl -- edge lay;
        But with ho -- ly ex -- ul -- ta -- tion 
        We may sing a -- loud to -- day.
}

verseTwo = \lyricmode {
	\set stanza = "2."
	Je -- sus is the Name we trea -- sure;
	Name be -- yond what words can tell;
	Name of glad -- ness, Name of plea -- sure,
	Ear and heart de -- light -- ing well;
	Name of sweet -- ness, pass -- ing meas -- ure,
	Sav -- ing us from sin and hell.
}

verseThree = \lyricmode {
	\set stanza = "3."
	'Tis the Name that who -- so preach -- eth
	Speaks like mu -- sic to the ear;
	Who in prayer this Name be -- seech -- eth
	Sweet -- est com -- fort find -- eth near;
	Who its per -- fect wis -- dom reach -- eth,
	Heav'n -- ly joy pos -- sess -- eth here.
}

verseFour = \lyricmode {
	\set stanza = "4."
	There -- fore we, in love a -- dor -- ing,
	This most bless -- ed Name re -- vere,
	Ho -- ly Je -- sus, thee im -- plor -- ing
	So to write it in us here
	That here -- af -- ter, heav'n -- ward soar -- ing,
	We may sing with an -- gels there.
}


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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
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
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
