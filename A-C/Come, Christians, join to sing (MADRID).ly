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
      \line {MADRID  66 66 D}
    }
    \column{
      \line {Spanish Melody, arr. David Evans, 1927}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Chrisian H. Bateman, 1843}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key af \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  af2 g4 af |
  f af ef2 |
  c'4 af df bf |
  af( g) af2 | \break
  
  af2 g4 af | 
  f af ef2 |
  c'4 af df bf |
  af( g) af2 | \break
  
  c2 bf4 c |
  df c bf2 |
  c2 bf4 c |
  df c bf2 |
  
  af2 g4 af |
  f af ef2 |
  c'4 af df bf |
  af( g) af2  \bar "|."
}

alto = \relative c' {
  \global
  ef2 ef4 ef |
  df df c2 |
  ef4 ef f f |
  ef( df) c2 |
  ef2 ef4 ef |
  df df c2 |
  ef4 ef f f |
  ef( df) c2 |
  ef2 ef4 ef |
  f ef ef2 |
  ef2 ef4 ef |
  df ef ef2 |
  ef4( af,) bf ef |
  f df ef2 |
  ef4 f f f |
  ef( df) c2
}

tenor = \relative c' {
  \global
  c2 bf4 af |
  af af af2 |
  af4 c bf df |
  c4( bf) af2 |
  c2 bf4 af |
  af af af2 |
  af4 c bf df |
  c( bf) af2 |
  
  af2 df4 c |
  af af g2 |
  af2 g4 af |
  f af g2 |
  c4( ef) df c |
  af af bf( g) |
  af c bf df |
  c( bf) af2
}

bass = \relative c {
  \global
 af2 ef'4 c |
 df4 f af2 |
 af4 af df, df |
 ef2 af, |
 
 af2 ef'4 c |
 df f af2 |
 af4 af df, df |
 ef2 af, |
 
 af'2 g4 af |
 f af ef2 |
 af,2 ef'8[ df] c4 |
 bf c8[ df] ef2 |
 af,4( c) bf af |
 df f g( ef) |
 af4 f df df |
 ef2 af,
}

verseOne = \lyricmode {
  \set stanza = "1."
  Come, Chris -- tians, join to sing
    _ _ _ _ _ _
  
  Loud praise to Christ our King;
    _ _ _ _ _ _
  Let all, with heart and voice,
  Be -- fore his throne re -- joice;
  Praise is his gra -- cious choice.
  _ _ _ _ _ _
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Come, lift your hearts on high,
	  \override Lyrics.LyricText.font-shape = #'italic  
	    Al -- le -- lu -- ia! A -- men!
	     \revert Lyrics.LyricText.font-shape
  Let praise -- es fill the sky;
	  \override Lyrics.LyricText.font-shape = #'italic   
	  Al -- le -- lu -- ia! A -- men!
	   \revert Lyrics.LyricText.font-shape
  He is our Guide and Friend; 
  To us he'll con -- de -- scend;
  His love shall nev -- er end.
	  \override Lyrics.LyricText.font-shape = #'italic   
	  Al -- le -- lu -- ia! A -- men!
}

verseThree = \lyricmode {
  \set stanza = "3."
  Praise yet our Christ a -- gain,
    _ _ _ _ _ _
    Life shall not end the strain;
      _ _ _ _ _ _
      On heav -- en's bliss -- ful shore, 
      His good -- ness we'll a -- dore,
      Sing -- ing for -- ev -- er -- more,
        _ _ _ _ _ _
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
