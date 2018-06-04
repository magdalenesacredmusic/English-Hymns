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
  poet = \markup{ \fontsize #4 \smallCaps "Soul of my Saviour"  }
  meter = \markup { \small { Music: DOBICI, 76.76. D.; L. Dobici, arr. N.A. Montani, \italic "The Saint Gregory Hymnal," 1920 } }
  piece = \markup { \small {Text: \italic "Anima Christi," Anon., 14th cent.; tr. Traditional }}
  %breakbefore
  %copyright = ""
  tagline = ""
}


global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a2 bf4 a |
  g2 g |
  g4 a f g |
  a1 |
  c2 d4 c |
  bf2 a |
  a4 g f a |
  g1 |
  g2 a4 g |
  f2 f |
  a4 a bf a |
  g1 |
  d'2 c4 bf |
  bf2 a |
  g4 a bf g |
  f1
}

alto = \relative c' {
  \global
  f2 f4 f |
  d2 d |
  c4 e d e |
  f1 |
  f2 f4 f |
  f( e) f2 |
  f4 f f f |
  f2( e) |
  e e4 e |
  e( d) d2 |
  ef4 ef d c |
  bf2( d) |
  e2 e4 e |
  f2 ef |
  d4 c bf bf |
  a1
}

tenor = \relative c' {
  \global
  c2 d4 c |
  bf2 bf |
  c4 c bf bf |
  a2( c) |
  c f4 c |
  d( c) c2 |
  b4 b a b |
  c1 |
  d2 cs4 a |
  a2 a |
  a4 g fs fs |
  g2( bf2) |
  bf a4 g |
  f2 fs |
  g4 fs g8[ f] e4 |
  f1
}

bass = \relative c {
  \global
  f2 f4 f |
  f2 f |
  e4 c c c |
  f1 |
  a2 bf4 a |
  g2 f |
  d4 d d g, |
  c1 |
  bf2 a4 cs |
  d2 d |
  c4 c d d |
  g,2( g') |
  g c,4 cs |
  d2 c |
  bf4 a g c |
  f1
}


verseOne = \lyricmode {
  \set stanza = "1."
  \tagIt Soul of my Sa -- vior sanc -- ti -- fy my breast,
  \tagIt Bod -- y of Christ, be Thou my sav -- ing guest,
  \tagIt Blood of my Sa -- vior, bathe me in Thy tide,
  \tagIt Wash me, ye wa -- ters flow -- ing from His side.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Strength and pro -- tec -- tion may thy pas -- sion be,
  O bles -- sèd Je -- sus, hear and an -- swer me;
  Deep in Thy wounds, Lord, hide and shel -- ter me,
  So shall I nev -- er, nev -- er part from Thee.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Guard and de -- fend me from the foe ma -- lign,
  In death's dread mo -- ments make me on -- ly Thine;
  Call me and bid me come to Thee on high
  Where I may praise Thee with Thy saints for aye.
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
      tempoWholesPerMinute = #(ly:make-moment 88 4)
    }
  }
  \layout { }
}

