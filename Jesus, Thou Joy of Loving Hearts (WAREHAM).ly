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
  poet = \markup{ \fontsize #4 \smallCaps "Jesus, Thou Joy of Loving Hearts"  }
  meter = \markup { \small { Music: WAREHAM, L.M.; adapt. from W. Knapp; harm. \italic "The English Hymnal," 1906} }
  piece = \markup { \small {Text: \italic "Jesu dulcis memoria," St. Bernard, 11th cent.; tr. Ray Palmer, 1858 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key bf \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  bf4 |
  bf( a) g |
  f2 bf4 |
  c( bf) a |
  bf2 \bar "||"

  c4 |
  d( c) bf |
  a( bf) c |
  bf( a) g |
  f2 \bar "||"

  f4 |
  g( f) g8[ a] |
  bf2 a4 |
  bf2 c4 |
  d2 \bar "||"

  c8[ d] |
  ef4( d) c |
  bf( a) bf |
  c( bf) a |
  bf2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  d2 ef4 |
  f2 d4 |
  g( f) f |
  f2
  f4 |
  f2 f8[ e] |
  f2 f4 |
  f2 e4 |
  f2
  f4 |
  ef4( f) ef |
  f2 f4 |
  d2 g4 |
  fs2

  g8[ f!] |
  ef4 ( f) g |
  g( fs) g |
  g( f) f |
  f2
}

tenor = \relative c' {
  \global
  \partial 4
  bf4 |
  f2 a4 |
  bf2 bf4 |
  ef4( d) c |
  d2
  a4 |
  bf( c) d8[ bf] |
  c4( d) c |
  d( c) c8[ bf] |
  a2
  bf4 |
  bf2 ef4 |
  d2 c4 |
  bf( a) g |
  a2

  g8[ b] |
  c4( b) c |
  d2 d4 |
  ef( d) c |
  d2
}

bass = \relative c {
  \global
  \partial 4
  bf4 |
  bf2 c4 |
  d2 g4 |
  ef( f) f, |
  bf2
  f'4 |
  bf( a) g |
  f( d) a |
  bf( c) c |
  f2
  d4 |
  ef( d) c |
  bf( d) f |
  g( f) ef |
  d2
  ef8[ d] |
  c4( d) ef |
  g( d) g |
  ef( f) f |
  bf,2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Je -- sus, Thou joy of lov -- ing hearts!
  Thou Fount of life! Thou Light of men!
  From the best bliss that earth im -- parts
  We turn un -- filled to Thee a -- gain.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Thy truth un -- changed hath ev -- er stood;
  Thou sav -- est those that on Thee call;
  To them that seek Thee, Thou art good,
  To them that find Thee, all in all.
}

verseThree = \lyricmode {
  \set stanza = "3."
  We taste Thee, O Thou liv -- ing Bread!
  And long to feast up -- on Thee still;
  We drink of Thee, the Foun -- tain Head,
  And thirst from Thee our souls to fill.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Our rest -- less spi -- rits yearn for Thee,
  Wher -- e'er our change -- ful lot is cast;
  Glad when Thy gra -- cious smile we see,
  Blest when our faith can hold Thee fast.
}


verseFive = \lyricmode {
  \set stanza = "5."
  O Je -- sus, ev -- er with us stay!
  Make all our mo -- ments calm and bright!
  Chase the dark night of sin a -- way!
  Shed o'er the world Thy ho -- ly light!
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
      tempoWholesPerMinute = #(ly:make-moment 84 4)
    }
  }
  \layout { }
}

