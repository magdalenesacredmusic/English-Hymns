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
      \line {RANDOLPH  98 98}
    }
    \right-column{
      \line {R. Vaughan Williams, 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Jeremiah E. Rankin (1828-1904)}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 4/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  fs2 a b4 a g fs |
  e2. d4 d1 |
  fs2 gs a2. a4 |
  b2 cs4( d) d2 cs |
  
  d2. cs4 b2 a |
  g a4( b) a2 g |
  fs a b4 a g fs |
  e2. d4 d1
  \bar "|."
}

alto = \relative c' {
  \global
  d1^\markup {\italic Unison} d1~ |
  d2 cs d1 |
  d2^\markup {\italic Harmony} e e cs |
  fs e e e |
  d2. d4 d2 d |
  e e e cs |
  <<{d1}\\{d2^\markup {\italic Unison} c}>> <b d>1~ |
  d2 cs a1
}

tenor = \relative c' {
  \global
  a1 b |
  e,2 g fs1 |
  a2 b a a |
  a gs a a |
  a2. a4 b2 b |
  b g a a |
  a1 g1 |
  a2 g fs1
}

bass = \relative c {
  \global
  d2 fs g e |
  a,1 d |
  d2 d cs f |
  d e a a4( g) |
  fs2. fs4 g2 fs |
  e d cs a |
  d fs g e |
  a,1 d
}

verseOne = \lyricmode {
  \set stanza = "1. "
  God be with you till we meet a -- gain;
  By his coun -- sels guide, up -- hold you,
  With his sheep se -- cure -- ly fold you:

}

verseTwo = \lyricmode {
  \set stanza = "2. "
  God be with you till we meet a -- gain;
  'Neath his wings pro -- tect -- ing hide you,
  Dai -- ly man -- na still pro -- vide you:
  
  	\override LyricText.extra-offset = #'(0 . -1.3)
    \override LyricExtender.extra-offset = #'(0 . -1.3)
    \override LyricHyphen.extra-offset = #'(0 . -1.3) 
  God be with you till we meet a -- gain.
}

verseThree = \lyricmode {
  \set stanza = "3. "
  God be with you till we meet a -- gain;
  When life's per -- ils thick con -- found you,
  Put his arms un -- fail -- ing round you:
}

verseFour = \lyricmode {
  \set stanza = "4. "
  God be with you till we meet a -- gain;
  Keep love's ban -- ner float -- ing o'er you,
  Smite death's threat -- 'ning wave be -- fore you:
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
