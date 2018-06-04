%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup{ \fontsize #4 \smallCaps "Songs of Thankfulness and Praise"  }
  meter = \markup { \small { Music: SALZBURG, 7.7.7.7. D; Jakob Hintze, 1678; harm. J.S. Bach } }
  piece = \markup { \small {Text: Christopher Wordsworth, 1862}}
  %breakbefore
  %copyright = ""
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
  a4 d a b |
  a4. g8 fs2 |
  a4 a g fs |
  e e d2 \bar "||"
  a'4 d a b |
  a4. g8 fs2 |
  a4 a g fs |
  e e d2 \bar "||"
  e4 e fs8[ gs] a4 |
  a4 gs a2 |
  b4. cs8 d4 d |
  cs4 cs b2 |
  fs4 fs b a |
  a gs a2 |
  b4 a g fs |
  e e d2 \bar"|."
}

alto = \relative c' {
  \global
  d4 d d d |
  d cs d2 |
  d4 d8[ cs] b[ cs] d4 |
  d cs d2 |
  d4 d d d |
  d cs d2 |
  d4 d8[ cs] b[ cs] d4 |
  d cs d2 |
  cs4 cs d cs |
  fs e8[ d] cs2 |
  e8[ fs] g4 fs fs |
  fs fs8[ e] d2 |
  d4 d d cs |
  d d cs2 |
  d4 d8[ cs] b[ cs] d4 |
  d cs d2 |
}

tenor = \relative c {
  \global
  fs4 fs8[ g] a4 g8[ fs] |
  e[ d] e4 d2 |
  fs4 fs g a |
  b a fs2 \bar "||"
  fs4 fs8[ g] a4 g8[ fs] |
  e[ d] e4 d2 |
  fs4 fs g a |
  b a fs2 \bar "||"
  a4 a a a |
  b b a2 |
  g4. a8 b4 b |
  b as b2 \bar "||"
  a4 a g8[ fs] e4 |
  d8[ fs] e[ d] e2 |
  g4 fs g a |
  b a8[ g] fs2 \bar "||"
}

bass = \relative c {
  \global
  d4 b fs g |
  a a d2 |
  d4 d e fs |
  g a d,2 |
  d4 b fs g |
  a a d2 |
  d4 d e fs |
  g a d,2 |
  a4 a d fs8[ e] |
  d4 e a,2 |
  e'4 e b8[ cs] d[ e] |
  fs4 fs b,2 |
  d4 d g, a |
  b b a2 |
  g4 d' e fs |
  g \once \override NoteColumn #'force-hshift = #1.0 a d,2 |
}

verseOne = \lyricmode {
  \set stanza = "1."
  Songs of thank -- ful -- ness and praise,
  Je -- su, Lord, to Thee we raise,
  Man -- i -- fest -- ed by the star
  To the sa -- ges from a -- far;
  Branch of roy -- al Da -- vid's stem
  In Thy birth at Beth -- le -- hem.
  An -- thems be to Thee ad -- dressed,
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Man -- i -- fest at Jor -- dan's stream,
  Proph -- et, Priest, and King su -- preme;
  And at Ca -- na, wed -- ding -- guest,
  In Thy God -- head man -- i -- fest;
  Man -- i -- fest in pow'r di -- vine,
  Chang -- ing wa -- ter in to wine;
  An -- thems be to Thee ad -- dressed,
}

verseThree = \lyricmode {
  \set stanza = "3."
  Man -- i -- fest in mak -- ing whole
  Pal -- sied limbs and faint -- ing soul;
  Man -- i -- fest in val -- iant fight,
  Quel -- ling all the de -- vil's might;
  Man -- i -- fest in gra -- cious will
  Ev -- er bring -- ing good from ill;
  An -- thems be to Thee ad -- dressed,
  God in Man made man -- i -- fest.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Sun and moon shall dark -- ened be,
  Stars shall fall, and heav'ns shall flee;
  Christ will then like light -- ning shine,
  All will see His glo -- rious sign:
  All will then the trum -- pet hear;
  All will see the Judge ap -- pear,
  Who by all will be con -- fessed,
}

verseFive = \lyricmode {
  \set stanza = "5."
  Grant us grace to see Thee, Lord,
  Mir -- ror'd in Thy ho -- ly Word;
  May we im -- i -- tate Thee now,
  And be pure, as pure art Thou;
  That we like to Thee may be
  At Thy great E -- piph -- an -- y;
  And may praise Thee, ev -- er blest,
}


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
      tempoWholesPerMinute = #(ly:make-moment 88 4)
    }
  }
  \layout { }
}
