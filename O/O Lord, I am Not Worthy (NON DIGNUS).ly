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
      \line {NON DIGNUS}
    }
    \right-column{
      \line {anon., \italic "Catholic Youth Hymnal," 1871}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Vs. 1,4, Anon.; Vs. 2,3, Irving Udulutsch, 1958}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key bf \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d8[ ef] |
  f4 g f bf |
  bf a2 a8[ bf] |
  c4 ef, g f |
  d2. \bar "" \break
  d8[ ef] |
  f4 f bf a |
  a g2 g4 |
  f bf a c |
  bf2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  bf8[ c] |
  d4 ef d f |
  ef ef2 ef4 |
  ef c ef c |
  bf2. bf4 |
  bf4 bf d f |
  ef ef2 cs4 |
  d f ef ef |
  d2.
}

tenor = \relative c {
  \global
  \partial 4
  f4 |
  bf bf bf bf |
  c c2 c8[ bf] |
  a4 a a a |
  f2. f4 |
  f f f bf |
  bf bf2 bf4 |
  bf d c a |
  bf2.
}

bass = \relative c {
  \global
  \partial 4
  bf4 |
  bf bf bf d |
  f f2 f4 |
  f f f f |
  bf,2. bf8[ c] |
  d4 d bf d |
  ef4 ef2 e4 |
  f f f f |
  bf,2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  O Lord, I am not wor -- thy
  That Thou should'st come to me,
  But speak the words of com -- fort,
  My spir -- it healed shall be.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Oh, come, all ye who la -- bor
  In sor -- row and in pain,
  Come, eat This Bread from hea -- ven;
  Thy peace and strength re -- gain.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O Je -- sus, we a -- dore Thee,
  Our Vic -- tim and our Priest,
  Whose pre -- cious Blood and Bo -- dy
  Be -- come our sa -- cred Feast.
}

verseFour = \lyricmode {
  \set stanza = "4."
  O Sa -- cra -- ment most ho -- ly,
  O Sa -- cra -- ment di -- vine!
  All praise and all thanks -- giv -- ing
  Be ev -- 'ry mo -- ment Thine.
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

