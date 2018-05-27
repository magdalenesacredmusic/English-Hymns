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
          \line {ILLSLEY  LM}
      }
      \column{
      \line {John Bishop, c. 1665-1737}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {\italic "Ave colenda Trinitas"}
     \line { "c. 10th century"}
     \line {"Tr. John Chambers (1805-93)"}
   }
  } 
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
	f c f8[ g] a4 |
	bf8[ a] g4 f f |
	f c f8[ g] a[ b] |
	c4 b c \bar "||" \break
	
	c4 |
	bf a d4. c8 |
	bf4 a g g |
	a8[ g] f4 c' g |
	a g f \bar "|."
}

alto = \relative c' {
	\global
	\partial 4 
	c4  |
	c c f8[ g] f4 |
	d e f c |
	c c d8[ e] f4 |
	g g g 
	
	f |
	f f f4. e8 |
	f8[ g] f4 e c |
	c d f f |
	f e f
}

tenor = \relative c' {
	\global
	\partial 4 
	a4 |
	a g a c |
	d8[ c] bf4 a a |
	a g a d |
	c d e
	
	a, |
	bf c bf4. g8 |
	d'4 c c c |
	a a8[ bf] c4 d |
	c4. bf8 a4
}

bass = \relative c {
	\global
	f4 |
	f e d a |
	g c f f |
	f e d d |
	e g c, 
	
	f |
	d f bf,4. c8 |
	d8[ e] f4 c e |
	f d a bf |
	c c f,
}


verseOne = \lyricmode {
	\set stanza = "1."
        All hail, a -- dor -- èd Trin -- i -- ty;
        All hail, e -- ter -- nal U -- ni -- ty;
        O God the Fath -- er, God the Son,
        And God the Spir -- it, ev -- er One.
}

verseTwo = \lyricmode {
	\set stanza = "2."
	Three Per -- sons praise we ev -- er -- more,
	One on -- ly God our hearts a -- dore;
	In thy sweet mer -- cy ev -- er kind
	May we our sure pro -- tec -- tion find.
}

verseThree = \lyricmode {
	\set stanza = "3."
	O Trin -- i -- ty, O U -- ni -- ty,
	Be pre -- sent as we wor -- ship thee;
	And with the songs that an -- gels sing
	U -- nite the hymns of praise we bring.
}

verseFour = \lyricmode {
	\set stanza = "4."
	
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
        tempoWholesPerMinute = #(ly:make-moment 84 4)
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
