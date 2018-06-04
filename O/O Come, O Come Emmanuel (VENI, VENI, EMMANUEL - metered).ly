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
  poet = \markup{ \fontsize #4 \smallCaps "O Come, O Come Emmanuel"  }
  meter = \markup { \small { Music: VENI, VENI, EMMANUEL, 8.8.8.8. with Refrain; arr. Thomas Helmore, 1854 }}
  piece = \markup { \small {Text: \italic "Veni, veni, Emmanuel," Latin, 12th c.; tr. J.M. Neale, 1859 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key e \minor
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  e4 |
  g b b b |
  a( c b) a |
  g2.

  a4 |
  b g e g | \break
  a( fs e) d |
  e2.

  a4 |
  a e e fs |
  g2( fs4) e |
  d2. \bar "" \break

  g4 |
  a b b b |
  a( c b) a |
  g2. \bar "||"

  d'4^\markup {Refrain} |
  d2. b4 |
  b2. b4 |
  a( c b) a |
  g2.

  a4 |
  b g e g |
  a( fs e) d |
  e2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  b4 |
  e b d g |
  e2( g4) fs4 |
  d2.

  d4 |
  d d c d |
  c2( b4) a |
  b2.

  e8[ d] |
  c4 c e d |
  e2( d4) c |
  d2.

  b4 |
  d d d g |
  e2( g4) fs |
  d2.

  g4 |
  fs2. g4 |
  fs2. g4 |
  e2( g4) fs |
  e2.

  d4 |
  d d c d |
  c2( b4) a |
  b2. \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4
  g4 |
  b fs g d' |
  c( e d) d |
  b2.

  fs4 |
  fs g g g |
  e( fs g) fs |
  g2.

  e4 |
  e a b a |
  b2. g4 |
  fs2.

  g4 |
  fs fs g d' |
  c( e d) d |
  b2.

  b4 |
  a2. e'4 |
  d2. d4 |
  c( e d) d |
  b2.

  a4 |
  g g g d |
  e( fs g) fs |
  g2. \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  e4 |
  e d b g |
  c( a b) d |
  g2.

  d4 |
  b b c b|
  a2( b4) b |
  e2.

  c8[ b] |
  a4 a' g fs |
  e2( b4) c |
  d2. e4 |
  d b g b |
  c( a b) d |
  g2.

  g4 |
  d2. e4 |
  b2. g4 |
  c( a b) d |
  e2. fs4 |
  g b, c b |
  a2( b4) b |
  e2. \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  O come, O come, Em -- man -- u -- el,
  And ran -- som cap -- tive Is -- ra -- el,
  That mourns in lone -- ly ex -- ile here
  Un -- til the Son of God ap -- pear.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  O come, Thou Rod of Jes -- se, free
  Thine own from Sa -- tan's ty -- ran -- ny;
  From depths of hell Thy peo -- ple save,
  And give them vic -- t'ry o'er the grave.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O come, Thou Day -- Spring, come and cheer
  Our spi -- rits by Thine ad -- vent here;
  Dis -- perse the gloom -- y clouds of night
  And death's dark shad -- ows put to flight!

  Re -- joice! Re -- joice! Em -- man -- u -- el
  Shall come to thee, O Is -- ra -- el.
}

verseFour = \lyricmode {
  \set stanza = "4."
  O come, Thou Key of Da -- vid, come,
  And o -- pen wide our heav'n -- ly home;
  Make safe the way that leads on high,
  And close the path to mi -- se -- ry.
}

verseFive = \lyricmode {
  \set stanza = "5."
  O come, O come, Thou Lord of Might,
  Who to Thy tribes on Si -- nai's height
  In an -- cient times didst give the law
  In cloud, and ma -- jes -- ty, and awe.
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
    \new Staff  <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 94 4)
    }
  }
  \layout { }
}

