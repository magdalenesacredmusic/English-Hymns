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
      \line {LAMBILLOTTE  L M with repeat}
    }
    \right-column{
      \line {Louis Lambillotte}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Veni Creator Spiritus"}
      \line {Rabanus Maurus, 8th cent.; tr. E. Caswall, alt. traditional}
    }
  } 
}


global = {
  \key g \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d4 d d |
  g2. |
  a4 a a |
  b2. |
  b4 a b |
  d( c) b |
  b( c) b |
  a2. |
  d,4 d d |
  g2. |
  a4 a a |
  b2. |
  d4 d d |
  e2 d8[ c] |
  b2 a4 |
  d2. |
  d4 d d |
  e2 d8[ c] |
  b2 a4 |
  g2. \bar "|."
}

alto = \relative c' {
  \global
  b4 b b |
  d2. |
  fs4 fs fs |
  g2. |
  g4 g g |
  g( fs) g |
  g2 g4 |
  fs2. |
  d4 d d |
  d2. |
  d4 d fs |
  g2. |
  g4 g g |
  g2 a4 |
  g2 fs4 |
  g2. |
  g4 g g |
  g2 a4 |
  g2 fs4 |
  d2.
}

tenor = \relative c' {
  \global
  g4 g g |
  b2. |
  d4 d d |
  d2. |
  d4 c d |
  d2 d4 |
  d( e) d |
  d2. |
  b4 b b |
  b2. |
  d4 d d |
  d2. |
  b4 b b |
  c2 e4 |
  d2 d4 |
  d2. |
  b4 b b |
  c2 e4 |
  d2 c4 |
  b2.
}

bass = \relative c' {
  \global
  g4 g g |
  g2. |
  d4 d d |
  g2. |
  g4 g g |
  b( a) g |
  g2 g4 |
  d2. |
  g4 g g |
  g2. |
  fs4 fs d |
  g2. |
  g4 g g |
  c,2 a4 |
  d2 c4 |
  b2. |
  g'4 g g |
  c,2 a4 |
  d2 d4 |
  g,2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Come, Ho -- ly Ghost, Cre -- a -- tor blest,
  And in our hearts take up Thy rest;
  Come with Thy grace and heav'n -- ly aid,
  To fill the hearts which Thou hast made,
  To fill the hearts which Thou hast made.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  O Com -- for -- ter to Thee we cry,
  Thou heav'n -- ly Gift of God Most High;
  Thou Fount of life and fire of love,
  And sweet a -- noint -- ing from a -- bove,
  And sweet a -- noint -- ing from a -- bove.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O Ho -- ly Ghost, through Thee a -- lone,
  Know we the Fa -- ther and the Son,
  Be this our ne -- ver chang -- ing creed,
  That Thou dost from them both pro -- ceed,
  That Thou dost from them both pro -- ceed.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Praise we the Fa -- ther and the Son,
  And Ho -- ly Spi -- rit with them One;
  And may the Son on us be -- stow
  The gifts that from the Spi -- rit flow,
  The gifts that from the Spi -- rit flow.
}


\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { \transpose c bf,
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
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

