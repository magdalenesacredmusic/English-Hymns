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
      \line {SWABIA  SM}
    }
    \right-column{
      \line {J.M. Spiess, 1745; arr. W.H. Havergal, 1847}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Anonymous}
      \line {\italic "Hymns for the Bestivals and SAints' Days of the Church of England," 1846}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  a4 |
  fs g e e |
  d2. e4 |
  fs8[ gs] a4 a gs |
  a2. \bar "||" \break

  a4 |
  b a b cs |
  d d d \breathe a4 |
  g fs e e |
  d2. \bar "||"
  \cadenzaOn
  d2 d2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  fs4 |
  d d d cs |
  d2. cs4 |
  d e8[ fs] e4 e |
  e2.

  fs4 |
  g fs g g |
  fs g fs fs |
  e d d cs |
  d2.
  b2 a2
}

tenor = \relative c' {
  \global
  \partial 4
  d4 |
  a b a a |
  fs2. a4 |
  a cs b b |
  cs2.

  d4 |
  d4 d d e |
  d b a d |
  b8[ cs] d4 a a |
  fs2.
  g2 fs2
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  d g, a a |
  b2. a4 |
  d cs8[ d] e4 e |
  a,2.

  d4 |
  g4 d g e |
  b' g d d |
  e fs8[ g] a4 a, |
  d2.
 g,2 d'2
}

verseOne = \lyricmode {
  \set stanza = "1."
Praise we the Lord this day,
This day so long fore -- told,
Whose prom -- ise shone with cheer -- ing ray
On wait -- ing saints of old.
}

verseTwo = \lyricmode {
  \set stanza = "2."
The pro -- phet gave the sign
For faith -- ful men to read;
A vir -- gin born of Da -- vid's line
Shall bear the prom -- ised seed.
}

verseThree = \lyricmode {
  \set stanza = "3."
Ask not how this sould be,
But wor -- ship and a -- dore,
Like her whom hea -- ven's Ma -- jes -- ty
Came down to sha -- dow o'er.
}

verseFour = \lyricmode {
  \set stanza = "4."
Meek -- ly she bowed her head
To hear the gra -- cious word,
Ma -- ry, the pure and low -- ly maid,
The fa -- vored of the Lord.
}

verseFive = \lyricmode {
  \set stanza = "5."
Bless -- ed shall be her name
In all the Church on earth,
Through whom that won -- drous mer -- cy came,
The_in -- car -- nate Sa -- vior's birth.
}

verseSix = \lyricmode {
  \set stanza = "6."
  Je -- sus, the Vir -- gin's Son,
  We priase thee and a -- dore,
  Who art with God the Fa -- ther One
  And Spir -- it ev -- er -- more.
  A -- men.
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