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
  poet = \markup{ \fontsize #4 \smallCaps "Wake, Awake, for Night is Flying"  }
  meter = \markup { \small { Music: WACHET AUF!, Irregular; Philipp Nicolai; harm. J.S. Bach } }
  piece = \markup { \small {Text: Philipp Nicolai, 1599; trans. Catherine Winkworth }}
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

melody = \relative c' {
  \global
  d4 fs a a |
  a a b2 |
  a2. \bar "||"

  a4 |
  d a d8[ e] fs4 |
  e d cs( b) |
  a2. \bar "||"

  a4 |
  d a b fs |
  g8[ fs] e4 d2 \bar "||"

  %%repeat
  d4 fs a a |
  a a b2 |
  a2. \bar "||"

  a4 |
  d a d8[ e] fs4 |
  e d cs( b) |
  a2. \bar "||"

  a4 |
  d a b fs |
  g8[ fs] e4 d \bar "||" \break

  %%b section
  a'4 |
  a4. g8 fs4 e |
  d2. \bar "||"

  a'4 |
  a4. g8 fs4 e |
  d2 \bar "||"

  e4 fs |
  g2 fs4 \bar "||"

  a4 |
  b cs d d8[ e] |
  fs4 e d \bar "||"

  a4 |
  d a b fs |
  g8[ fs] e4 d2 \bar "|."
}

alto = \relative c' {
  \global
  a4 d fs e |
  fs e fs( e) |
  e2.

  e4 |
  a4. g8 fs8[ g] a4 |
  a b b8( a4 gs8) |
  e2.

  fs4 |
  g fs d d |
  d cs a2 \bar "||"

  %%repeat
  a4 d fs e |
  fs e fs( e) |
  e2.

  e4 |
  a4. g8 fs8[ g] a4 |
  a b b8( a4 gs8) |
  e2.

  fs4 |
  g fs d d |
  d cs a \bar "||"

  %% b section
  e'4 |
  fs4. e8 a,[ b] cs4 |
  b2.

  cs8[ d] |
  e4 e e8( d4 cs8) |
  a2

  cs4 d |
  d( cs) d

  fs |
  fs8[ e] e[ fs] fs4 fs8[ g] |
  a4. g8 fs4

  fs8[ g] |
  a[ g] a[ fs] g4 d |
  d cs a2 \bar "|."
}

tenor = \relative c {
  \global
  fs4 a d cs |
  d a a( gs) |
  cs2.

  cs4 |
  d d a d |
  e e e4.( b8) |
  cs2.

  d4 |
  d d8[ c] b4 b |
  b8[ a] g4 fs2 |

  %% repeat
  fs4 a d cs |
  d a a( gs) |
  cs2.

  cs4 |
  d d a d |
  e e e4.( b8) |
  cs2.

  d4 |
  d d8[ c] b4 b |
  b8[ a] g4 fs

  %% b section
  a4 |
  d8[ cs] b[ cs] d4 a8[ g] |
  fs2.

  a4 |
  a8[ b] cs4 a8( b4 a8) |
  fs2

  a4 a |
  b( g) a

  d4 |
  d cs b d |
  d cs d

  d |
  a d d4. b8 |
  b[ a] g4 fs2 \bar "|."
}

bass = \relative c {
  \global
  d4 d d8[ fs] a[ g] |
  fs[ e] d[ cs] d[ b] e4 |
  a,2.

  a'8[ g] |
  fs[ g] fs[ e] d4 d'4 |
  cs8[ b] a[ gs] a4( e) |
  a,2.

  d8[ c] |
  b[ cs!] d4 g8[ a] b4 |
  e, a, d2 |

  %% repeat
  d4 d d8[ fs] a[ g] |
  fs[ e] d[ cs] d[ b] e4 |
  a,2.

  a'8[ g] |
  fs[ g] fs[ e] d4 d'4 |
  cs8[ b] a[ gs] a4( e) |
  a,2.

  d8[ c] |
  b[ cs!] d4 g8[ a] b4 |
  e, a, d

  %% b section
  cs4 |
  d e fs8[ g] a[ a,] |
  b2.

  fs'4 |
  cs8[ b] a4 d8[ b] g[ a] |
  d2

  a'8[ g] fs4 |
  e2 d4

  d'4 |
  gs, as b b |
  fs8[ g] a4 b,

  d8[ e] |
  fs[ e] fs[ d] g,[ a] b4 |
  e a, d2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  Wake, a -- wake, for night is fly -- ing,
  The watch -- men on the heights are cry -- ing;
  A -- wake, Je -- ru -- sa -- lem, at last!
  Mid -- night hears the wel -- come voic -- es,
  And at the thril -- ling cry re -- joi -- ces:
  Come forth, ye vir -- gins, night is past.
  The Bride -- groom comes, a -- wake,
  Your lamps with glad -- ness take
  Hal -- le -- lu -- jah!
  And for His mar -- riage -- feast pre -- pare,
  For ye must go to meet Him there.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Zi -- on hears the watch -- men sing -- ing,
  And all her heart with joy is spring -- ing,
  She wakes, she ris -- es from her gloom;
  For her Lord comes down all -- glo -- rious,
  The strong in grace, in truth vic -- to -- rious,
  Her Star is ris'n, her Light is come!
  Ah come, Thou bles -- sed One,
  God's own Be -- lov -- èd Son,
  Hal -- le -- lu -- jah!
  We fol -- low till the halls we see
  Where Thou hast bid us sup with Thee!
}

verseThree = \lyricmode {
  \set stanza = "3."
  Now let all the heav'ns a -- dore Thee,
  And men and an -- gels sing be -- fore Thee
  With harp and cym -- bal's clear -- est tone;
  Of one pearl each shin -- ing por -- tal,
  Where we are with the choir im -- mor -- tal
  Of an -- gels round Thy dazz -- ling throne;
  Nor eye hath seen, nor ear
  Hath yet at -- tain'd to hear
  What there is ours,
  But we re -- joice, and sing to Thee
  Our hymn of joy e -- ter -- nal -- ly.
}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranos { \voiceOne << \melody >> }
      \context Voice =
      altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
      \context Lyrics = two \lyricsto sopranos \verseTwo
      \context Lyrics = three \lyricsto sopranos \verseThree
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenor >> }
      \context Voice =
      basses { \voiceTwo << \bass >> }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 60 4)
    }
  }

  \layout { }
}


