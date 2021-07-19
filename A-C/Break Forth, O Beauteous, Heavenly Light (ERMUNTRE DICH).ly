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
          \line {ERMUNTRE DICH  87 87 88 77}
      }
      \right-column{
      \line {J. Schop, 1641;}
             \line { arr. J.S. Bach, \italic "Weihnachts-Oratorium," 1734}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {\italic "Brich an, o schönes Morgenlicht"}
     \line {J. von Rist, 1641; tr. J. Troutbeck, 1873}
   }
  } 
}

\header {
  tagline = ""
}


global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4

  g4 |
  g a b8[ cs] d4 |
  d cs d\fermata

  b |
  c b a b |
  a2 g4 \bar ""

  g4 |
  g a b8[ cs] d4 |
  d cs d\fermata

  b |
  c b a b |
  a2 g4  \bar "" 

  a4 |
  a b c c |
  b8[ a] b4 a\fermata

  b |
  b b c8[ d] e4 |
  e ds e\fermata  \bar "" 

  fs |
  g b, c b |
  a2 a4\fermata

  d |
  e d c b8[ c] |
  a2 g4 \bar "|."


}

alto = \relative c' {
  \global
  \partial 4

  d4 |
  e fs d8[ e] fs4 |
  e8[ fs] g4 fs  fs |
  e d8[ e] fs4 g |
  g( fs) d

  d4 |
  e fs d8[ e] fs4 |
  e8[ fs] g4 fs  fs |
  e d8[ e] fs4 g |
  g( fs) d

  fs8[ g] |
  a4. gs8 a[ gs] a4 |
  a gs e

  e8[ ds] |
  e4 e e8[ fs] g![ fs] |
  fs8[ g] a4 g

  a |
  g8[ a] b4 b8[ a] a[ g] |
  g2 fs4

  g8[ fs] |
  e4 fs g8[ a] d,4 |
  e( d) d
}

tenor = \relative c' {
  \global
  \partial 4
  b4 |
  b8( c4) d8 b8[ a] a4 |
  a a a

  b8[ a] |
  g8[ a] b[ c] d4 d |
  d4.( c8) b4

  b4 |
  b8( c4) d8 b8[ a] a4 |
  a a a

  b8[ a] |
  g8[ a] b[ c] d4 d |
  d4.( c8) b4

  d8[ e] |
  fs[ e] d4 e fs |
  b, e8[ d] c4

  g8[ a] |
  b8[ c] d[ e] c4 cs |
  b b b

  d |
  d g g,8[ a] b4 |
  e8[ d e cs] d4

  d |
  d8[ c!] c[ b] b[ a] g4 |
  g8[( fs16 e] fs4) b4
}

bass = \relative c' {
  \global
  \partial 4
  g8[ fs] |
  e4 d g fs8[ g] |
  a4 a, d\fermata

  ds |
  e8[ fs] g[ c,] c'[ b] a[ g] |
  d'4( d,) g\fermata

  g8[ fs] |
  e4 d g fs8[ g] |
  a4 a, d\fermata

  ds |
  e8[ fs] g[ c,] c'[ b] a[ g] |
  d'4( d,) g\fermata

  d4 |
  d'8[ c] b4 a ds, |
  e e a,\fermata

  e'8[ fs] |
  g4 gs a as |
  b b, e\fermata

  d'8[ c] |
  b8[ a] g8[ fs] e8[ fs] g8[ e] |
  cs[ b cs a] d4\fermata

  b4 |
  c! d e8[ fs] g4 |
  c,( d) g,
}

verseOne = \lyricmode {
  Break forth, O beau -- t'ous heav'n -- ly light
  And ush -- er in the morn -- ing;
  Ye shep -- herds, shrink not with af -- fright,
  But hear the an -- gel's warn -- ing.
  This Child, now weak in in -- fan -- cy,
  Our con -- fi -- dence and joy shall be,
  The pow'r of Sa -- tan break -- ing,
  Our peace e -- ter -- nal mak -- ing.
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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 74 4)
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}


