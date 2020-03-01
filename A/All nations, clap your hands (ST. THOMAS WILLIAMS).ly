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
      \line {ST. THOMAS (WILLIAMS)  66 86}
    }
    \right-column{
      \line {\italic "Williams' Psalmody," 1770}
      \line {\italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Psalm 47"}
      \line {para. anon., \italic "The Psalter," 1912}
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
  c4 |
  f f a g8[ f] |
  g2. 

  a8[ bf]  | \break 
  c4 bf8[ a] bf4 a | 
  g2.

  c4 |
  a f g c, | \break
  f a8.[ bf16] c4 

  c4 |
  d c8[ bf] a4 g |
  f2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  c4 |
  c d c c8[ b] |
  c2.

  c4 |
  f e8[ f] d[ e] f4 |
  e2.

  g4 |
  f f e c |
  c d e

  ef |
  d f f e |
  f2. \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4
  c4 |
  f, f f g |
  e2.

  c'4 |
  c c bf c |
  c2.

  c4 |
  c c c c8[ bf] |
  a4 f g

  f |
  f c'8[ d] c4. bf8 |
  a2. \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  c4 |
  a bf f8[ f'] e[ d] |
  c2.

  f8[ g]  |
  a4 g8[ f] g4 f |
  c2.

  e4 |
  f a c8[ bf] a[ g]  |
  f4 d c

  a |
  bf a8[ bf] c4 c |
  f2. \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
All na -- tions, clap your hands,
Let shouts of tri -- umph ring,
For might -- y ov -- er all the lands
The Lord Most High is King.
}

verseTwo = \lyricmode {
  \set stanza = "2."
A -- bove our might -- y foes
He gave us pow -- er to stand,
And as our her -- itage He chose
The good -- ly pro -- mised land.
}

verseThree = \lyricmode {
  \set stanza = "3."
With shouts as -- cends our King,
With trum -- pet's stir -- ring call;
Praise God, praise God, His prais -- es sing,
For God is Lord of all.
}

verseFour = \lyricmode {
  \set stanza = "4."
O sing in joy -- ful strains,
And make His glo -- ry known;
God ov -- er all the na -- tions reigns,
And ho -- ly is His throne.
}

verseFive = \lyricmode {
  \set stanza = "5."
Our fa -- thers' God to own
The kings of earth draw nigh,
For none can save but God a -- lone,
He is the Lord Most High.
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