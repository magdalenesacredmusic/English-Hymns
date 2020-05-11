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
      \line {HAMBURG LM}
    }
    \right-column{
      \line {Lowell Mason, 1824}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Isaac Watts, 1707}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 2/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f2 f4 g |
  a2 g4( a) |
  bf2 a4( g) |
  a1 \bar "||"
  
  a2 a4 a |
  bf2 a4( g) |
  f2 e4( f) |
  g1 \bar "||"
  
  f2 f4 g |
  a2 g4( a) |
  bf2 a4( g) |
  a1 \bar "||"
  
  a2 a4 a |
  g2 f |
  g a4( g) |
  f1 \bar "|."
}

alto = \relative c' {
  \global
  c2 c4 e |
  f2 g4( fs) |
  g2 f4( e) |
  f1 |
  f2 f4 f |
  f2 f4( e) |
  f2 c |
  e1 |
  c2 c4 e |
  f2 g4( fs) |
  g2 f4( e)
  f1 |
  f2 f4 f |
  e2 f |
  f e |
  c1 \bar "|."
}

tenor = \relative c' {
  \global
  a2 a4 c |
  c2 d4( c) |
  d2 c |
  c1 |
  c2 c4 c |
  d2 c |
  c bf4( a) |
  c1 |
  a2 a4 c |
  c2 d4( c) |
  d2 c |
  c1 |
  c2 c4 c |
  c( bf) a2 |
  d2 c4( bf) |
  a1 \bar "|."
}

bass = \relative c {
  \global
  f2 f4 c |
  f2 bf4( a) |
  g2 c, |
  f1 |
  f2 f4 f |
  f2 f4( bf) |
  a2 g4( f) |
  c1 |
  f2 f4 c |
  f2 bf4( a) |
  g2 c, |
  f1 |
  f2 f4 f |
  c2 d |
  bf c |
  f1 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  When I sur -- vey the won -- drous cross
  On which the Prince of glo -- ry died,
  My rich -- est gain I count but loss,
  And pour con -- tempt on all my pride.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  For -- bid it, Lord, that I should boast,
  Save in the death of Christ my God!
  All the vain things that charm me most,
  I sac -- ri -- fice them to His blood.
}

verseThree = \lyricmode {
  \set stanza = "3."
  See from His head, His hands, His feet,
  Sor -- row and love flow min -- gled down!
  Did e’er such love and sor -- row meet,
  Or thorns com -- pose so rich a crown?
}

verseFour = \lyricmode {
  \set stanza = "4."
  Were the whole realm of na -- ture mine,
  That were a pre -- sent far too small;
  Love so a -- maz -- ing, so di -- vine,
  De -- mands my soul, my life, my all.
}

verseFive = \lyricmode {
  \set stanza = "5."
  To Christ, who won for sin -- ners grace
  By bit -- ter grief and an -- guish sore,
  Be praise from all the ran -- somed race
  For -- ev -- er and for -- ev -- er -- more.
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
        tempoWholesPerMinute = #(ly:make-moment 92 4)
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