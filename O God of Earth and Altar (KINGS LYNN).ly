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
  poet = \markup{ \fontsize #4 \smallCaps "O God of Earth and Altar"  }
  meter = \markup { \small { Music: KINGS LYNN, 7.6.7.6, R.V. Williams, \italic "The English Hymnal," 1906} }
  piece = \markup { \small {Text: G.K. Chesterton, \italic "The English Hymnal" }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key d \minor
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  a4 ^\markup {\italic "To be sung in unison."} |
  g a d, e |
  f( g) c bf8[ a]	|
  g4. f8 d4 c |
  d2. \bar "||" \break

  d8[ e] |
  f4 g a c8[ a] |
  d2 d4 c |
  a c a g |
  a2. \bar "||" \break

  d,8[ e] |
  f4 g a c8[ a] |
  d2 c4 a |
  c c a g |
  a2. \bar "||"

  a4 |
  g a d, e |
  f( g) c bf8[ a]	|
  g4. f8 d4 c |
  d2. \bar "|."
}


alto = \relative c' {
  \global
  \partial 4
  d4 |
  d <d f> d2 |
  \ignore c4( d) << { \voiceTwo c2 } \\ { g'4 f4 } >> |
  d4. c8 bf4 a |
  a2.

  d4 |
  d e f e |
  f( g) f c |
  c <c f> d e |
  f2.

  d4 |
  d e f f |
  f2 f4 e |
  f <f a> f e |
  e2.

  f4 |
  e2 a,4 c |
  \ignore c( d) << { \voiceTwo c2 } \\ { g'4 f4 } >> |
  d4. c8 bf4 a |
  a2.
}

tenor = \relative c {
  \global
  \partial 4
  f4 |
  bf a bf g |
  c( bf) c f, |
  bf4. a8 f2 |
  f2.

  f8[ g] |
  a4 c c2 |
  a4( bf) a g |
  f f2 c'4 |
  c2.

  f,8[ g] |
  a4 c c c |
  bf2 a4 c |
  a c c c |
  c2.

  b4 |
  b c f, g |
  c( bf) c f, |
  bf4. a8 f2 |
  f2.
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  g, d' bf2 |
  a4( g8[ f]) e4 f |
  g4. a8 bf4 f <d d'>2.

  d'4 |
  d c f8[ g] a4 |
  d,2 d4 e |
  f a, bf c |
  f2.

  d4 |
  d c f a, |
  bf( d) f a |
  f f,8[ g] a4 c |
  a4.( b8 c4)

  d4 |
  e a, d c |
  a4( g8[ f]) e4 f4 |
  g4. a8 bf4 f |
  <d d'>2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  O God of earth and al -- tar,
  Bow down and hear our cry,
  Our earth -- ly rul -- ers fal -- ter,
  Our peo -- ple drift and die;
  The walls of gold en -- tomb us,
  The swords of scorn di -- vide,
  Take not Thy thun -- der from us,
  But take a -- way our pride.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  From all that ter -- ror teach -- es,
  From lies of tongue and pen,
  From all the eas -- y speech -- es
  That com -- fort cru -- el men,
  For sale and pro -- fan -- a -- tion
  Of hon -- our and the sword,
  From sleep and from dam -- na -- tion,
  De -- li -- ver us, good lord.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Tie in a liv -- ing teth -- er
  The prince and priest and thrall,
  Bind all our lives to -- ge -- ther,
  Smite us and save us all;
  In ire and ex -- ul -- ta -- tion
  A -- flame with faith, and free,
  Lift up a liv -- ing na -- tion,
  A sin -- gle sword to thee.
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

