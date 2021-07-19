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
      \line {UFFINGHAM  LM}
    }
    \column{
      \line {Jeremiah Clarke, 1673-1707}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Adoro te devote"}
      \line {Thomas Aquinas; Tr. Richard Crashaw, 1613-50}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key af \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f4 f8[ ef] df4 |
  c2 g'4 |
  af( g) f |
  e2. |
  c'4 c c |
  bf2 af4 |
  bf4 g2 |
  af2. |
  
  ef'4 ef df |
  c2 c4 |
  c( bf) af |
  g2 g4 |
  af( g) f |
  e2 c'4 |
  af2 g8[ f] |
  f2.
\bar "|."
}

alto = \relative c' {
  \global
  c4 c bf |
  af2 c4 |
  c2 c8[ bf] |
  c2. |
  c4 ef ef |
  ef( df) c |
  df4 bf2 |
  c2. |
  
  af'4 af g |
  af2 ef4 |
  ef2 ef8[ d] |
  ef2 e4 |
  f( c4.) bf8 |
  c2 c4 |
  c2 e8[ f] |
  c2.
}

tenor = \relative c' {
  \global
  af4 f f |
  af2 g4 |
  f( g) af8[ f] |
  g2. |
  
  af4 af af |
  g2 af4 |
  f ef2 |
  ef2. |
  
  c'4 af bf |
  c2 c4 |
  af( bf) c8[ af] |
  bf2 c4 |
  c2 f,4 |
  g2 f4 |
  f2 g4 |
  af2.
}

bass = \relative c {
  \global
 f4 af, bf |
 f'2 e4 |
 f( ef) df4 |
 c2. |
 
 af4 c af |
 ef'2 f4 |
 df ef2 |
 af,2. |
 
 af4 c ef |
 af2 af4 |
 af( g) f |
 ef2 c4 |
 f( ef) df |
 c2 af4 |
 c2 c4 |
 f2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  With all the powers my poor heart hath
Of hum -- ble love and loy -- al faith,
I come, dear Lord, to wor -- ship thee,
Whom so much Love bowed low for me.
}

verseTwo = \lyricmode {
  \set stanza = "2."
O dear me -- mor -- ial of that Death
Which still sur -- vives, and gives us breath!
Live ev -- er, Bread of Life, and be
My food, my joy, my all to me!
}

verseThree = \lyricmode {
  \set stanza = "3."
Come, glo -- rious Lord! My hopes in -- crease,
And mix my por -- tion with thy peace!
Come, and for ev -- er dwell in me,
That I may on -- ly live to thee.
}

verseFour = \lyricmode {
  \set stanza = "4."
Come, hid -- den Life, and that long day
For which I lan -- guish, come a -- way!
When this faint soul thy face shall see,
And drink the un -- sealed Source of thee:
}

verseFive = \lyricmode {
  \set stanza = "5."
  When glo -- ry's sun faith's shade shall chase,
And for thy veil, give me thy face,
Then shall my praise e -- ter -- nal be
To the E -- ter -- nal Tri -- ni -- ty!
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
      \new Lyrics \lyricsto "tune" { \verseFour}
      \new Lyrics \lyricsto "tune" { \verseFive } 
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
