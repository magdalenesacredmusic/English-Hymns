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
      \line {WINCHESTER OLD  CM}
    }
    \right-column{
      \line {Este's Psalter, 1592}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Nahum Tate, 1700}
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
  a4. a8 g4 f |
  bf bf a g |
  a c c b c2. \bar "||"

  a4 |
  d4. c8 bf4 a |
  g f e a |
  g f f e |
  f2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  c4 |
  f4. f8 e4 d |
  d f f e |
  f e g g |
  e2.

  f4 |
  f4. f8 f4 f |
  e d cs4 c |
  e d d c |
  c2.
}

tenor = \relative c' {
  \global
  \partial 4
  a4 |
  c4. c8 c4 a |
  bf d c c |
  c c d d |
  c2.

  c4 |
  bf4. a8 bf4 c |
  c a a a |
  c a bf g |
  a2.
}

bass = \relative c {
  \global
  \partial 4
  f4 |
  f4. f8 c4 d |
  bf bf f' c4 |
  f a g g |
  c,2.

  f4 |
  bf4. f8 d4 f |
  c d a f' |
  c d bf c |
  f2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  While shep -- herds watched their flocks by night,
  All seat -- ed on the ground,
  The An -- gel of the Lord came down,
  And glo -- ry shone a -- round.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  “Fear not,” said he (for migh -- ty dread
  Had seized their troub -- led mind);
  “Glad ti -- dings of great joy I bring
  To you and all man -- kind.
}

verseThree = \lyricmode {
  \set stanza = "3."
  “To you, in Da -- vid's town, this day
  Is born of Da -- vid's line,
  The Sav -- iour, Who is Christ the Lord;
  And this shall be the sign:
}


verseFour = \lyricmode {
  \set stanza = "4."
  “The heav'n -- ly Babe you there shall find
  To hu -- man view dis -- played,
  All mean -- ly wrapped in swath -- ing bands,
  And in a man -- ger laid.”
}

verseFive = \lyricmode {
  \set stanza = "5."
  Thus spake the Ser -- aph, and forth -- with
  Ap -- peared a shin -- ing throng
  Of an -- gels prais -- ing God, who thus
  Ad -- dressed their joy -- ful song:
}

verseSix = \lyricmode {
  \set stanza = "6."
  “All glo -- ry be to God on high
  And on the earth be peace;
  Good will hence -- forth from heav'n to men
  Be -- gin and nev -- er cease.”
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
      \new Lyrics \lyricsto soprano \verseSix
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
      \new Lyrics \lyricsto "tune" { \verseFive}
      \new Lyrics \lyricsto "tune" { \verseSix }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

