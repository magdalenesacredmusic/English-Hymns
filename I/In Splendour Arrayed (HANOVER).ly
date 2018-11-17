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
      \line {HANOVER 10 10 11 11}
    }
    \right-column{
      \line {William Croft, 1708}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Anonymous}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  g g a |
  b2 d4 |
  g, a fs |
  g2 \bar "||" \break

  a4 |
  b a g |
  fs2 g4 |
  a g8[ fs] e4 |
  d2 \bar "||" \break

  fs4 |
  g a b |
  g e c' |
  b a g |
  d'2 \bar "||" \break

  d,4 |
  e fs g |
  a d, b' |
  e, a fs |
  g2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  b4 |
  b d d |
  d2 d4 |
  e e d |
  d2

  d4 |
  d d d8[ e] |
  a,2 b4 |
  d e8[ d] cs4 |
  d2

  ds4 |
  e e ds |
  b b d |
  d d g |
  fs2

  d4 |
  d c d |
  d b d |
  c e d |
  d2
}

tenor = \relative c' {
  \global
  \partial 4
  g4 |
  g g fs |
  g2 a4 |
  b c a |
  b2

  fs4 |
  g a b8[ cs] |
  d2 d4 |
  a b e, |
  fs2

  b4 |
  b e, fs |
  g g a |
  g d'4. cs8 |
  d2

  g,4 |
  g c b |
  a fs g |
  g c a |
  b2
}

bass = \relative c {
  \global
  \partial 4
  g4 |
  g b d |
  g2 fs4 |
  e c d |
  g,2

  d'4 |
  g fs e |
  d2 b4 |
  fs g a |
  d2

  b4 |
  e c b |
  e e fs |
  g fs e |
  d2

  b4 |
  c a g |
  fs b g |
  c a d |
  g,2
}

verseOne = \lyricmode {
  \set stanza = "1."
  In splen -- dour ar -- rayed,
  In ves -- ture of gold,
  The Moth -- er of God
  In glo -- ry be -- hold!
  O Daugh -- ter of Da -- vid,
  Thou dwell -- est on high,
  Ex -- cel -- ling in bright -- ness
  The hosts of the sky.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  O Mai -- den thou art
A Moth -- er re -- nowned;
  A Moth -- er who yet
As Vir -- gin art crowned;
  The Lord of the An -- gels,
  God high and su -- preme,
  Took flesh of thy sub -- stance,
  The world to re -- deem.
}

verseThree = \lyricmode {
  \set stanza = "3."
  All kin -- dreds and tongues
  Thine Off -- spring a -- dore,
  Cre -- a -- tion must bow
His foot -- stool be -- fore;
  At thy gen -- tle plead -- ings
  May he from his height
  Dis -- perse all our sha -- dows
  And fill us with light.
}

verseFour = \lyricmode {
  \set stanza = "4."
  The Fa -- ther we praise,
  Who chose for his Son
  A Moth -- er all -- pure,
  Th’im -- ma -- cu -- late one.
  All praise to her off -- spring
  Who sav -- eth our race;
  Like praise to the Spir -- it,
Who filled her with grace.
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

