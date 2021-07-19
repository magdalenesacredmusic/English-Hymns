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
      \line {GARTAN  88 88}
    }
    \right-column{
      \line {From the Petrie \italic "Collection of Irish Music"} 
      \line {edited by C.V. Stanford (1852-1924)}
      \line {Melody attr. to J. Mease of Fresford, Donegal}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {From \italic "St. Patrick's Breastplate"}
      \line {Tr. Mrs. Cecil Frances Alexander (1818-95)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \time 4/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
g2. a4 b2 e |
d2. d4 d2 b |
d2. d4 d( b) a( b) |
d2. d4 d( b) a( b) |
g2. a4 b2 e2 |
d2. d4 d2 b |
d2. d4 d b a b |
g1 b
\bar "|."
}

alto = \relative c'' {
  \global
  g2. g4 g2 g |
  fs2. fs4 fs2 fs |
  fs2. fs4 g2 g |
  a2. a4 g2 fs |
  g2. fs4 g2 e |
  fs2. fs4 fs2 fs |
  fs2. fs4 g g fs fs |
  e1 g
}

tenor = \relative c' {
  \global
  b2. c4 d2 c |
  a2. a4 b2 d |
  d2. c4 b( d) c( d) |
  d2. c4 b( d) c( d) |
  b2. e4 b2 c |
  a2. a4 b2 d |
  c2. c4 b d c d |
  b2( c) d1
}

bass = \relative c' {
  \global
 g2. g4 g2 c, |
 d2. d4 b2 b' |
 a2. a4 g2 g |
 fs2. fs4 g2 d |
 e2. e4 e2 a, |
 c2. c4 b2 b' |
 a2. a4 g g d d |
 e2( c) g1
}

verseOne = \lyricmode {
  \set stanza = "6."
  Christ be with me, Christ with -- in me,
  Christ be -- hind me, Christ be -- fore me,
  Christ be -- side me, Christ to win me,
  Christ to com -- fort and re -- store me.
}

verseTwo = \lyricmode {
  \set stanza = "7."
  Christ be -- neath me, Christ a -- bove me,
  Christ in qui  -- et, Christ in dan -- ger,
  Christ in hearts of all who love me,
  Christ in mouth of friend and stran -- ger.
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
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
