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
  poet = \markup{ \fontsize #4 \smallCaps "Hail, True Victim, Life and Light"  }
  meter = \markup { \small { Music: WEIMAR (VULPIUS), 76.76. D.; melody, M. Vulpius 1609; harm. \italic "The Hymnal," 1940 } }
  piece = \markup { \small {Text: \italic "Ave vivens Hostia," J. Peckham, d. 1294; tr. R.A. Knox, d. 1957 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}


global = {
  \key f \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a2 g4 f2 g4 \bar "|"
  a4 bf c2 \bar "|"
  d2 c4 bf2 a4 \bar "|"
  g2 f \bar "||"

  a2 c4 bf2 a4 \bar "|"
  g f e2 \bar "|"
  f2 g4 a2 a4 \bar "|"
  bf2 a \bar "||"

  a2 bf4 c2 bf4 \bar "|"
  a g a2 \bar "|"
  g2 g4 a c \bar "|"
  b2 c \bar "||"

  c2 a4 d2 c4 \bar "|"
  \orAcc bf a g2 \bar "|"
  a2 c4 bf2 a4 \bar "|"
  g2 f \bar "|."
}

alto = \relative c' {
  \global
  f2 e4 d2 d4
  f f e2
  f2 f4 f2 f4
  e2 f

  f2 f4 f2 f4
  e d cs2
  d e4 f2 f4
  g2 fs

  \orAcc d2 d4 f2 d4 \revAcc
  f d e2
  d2 d4 f e
  g2 e

  e2 f4 f2 f4
  f f e2
  f2 g4 f2 f4
  f( e) f2
}

tenor = \relative c' {
  \global
  c2 c4 a2 bf4
  c f, g2
  bf c4 d2 c4
  c2 a

  c2 a4 d2 c4
  c a a2
  a2 c4 c2 d4
  d2 d

  fs,2 g4 a2 bf4
  c d cs2
  \orAcc		d bf4 c c
  d2 c
  \revAcc

  g2 f4 bf2 c4
  d c c2
  c2 c4 d2 c4
  c2 a
}

bass = \relative c {
  \global
  f2 c4 d2 g4
  f d c2
  bf2 a4 bf2 f4
  c'2 f,

  f'2 f4 bf,2 f'4
  c d a2
  d2 c4 f2 d4
  g2 d

  d2 g4 f2 g4
  a bf a2
  bf g4 f a
  g2 c,

  c2 d4 bf2 a4
  bf f' c2
  f2 e4 d2 f4
  c2 f
}

verseOne = \lyricmode {
  \set stanza = "1."
  \tagIt Hail, true Vic -- tim, life and light
  Un -- to sin -- ners lend -- ing,
  \tagIt Ev -- 'ry old -- er form and rite
  Hath in Thee its end -- ing.

  \tagIt Spot -- less in the Fa -- ther's sight
  Ev -- er -- more as -- cend -- ing,
  \tagIt Ho -- ly Church in bit -- ter fight
  Ev -- er -- more be -- friend -- ing.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Je -- sus, tru -- ly in this place
  God and man re -- sid -- eth;
  Him no shad -- ow doth re -- place,
  Him no rent di -- vid -- eth,

  Ve -- ry flesh, al -- though His face,
  Glo -- ri -- fied, He hid -- eth;
  Gar -- nered in this lit -- tle space
  All of Christ a -- bid -- eth.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Plead, true Vic -- tim, in our stead
  To the Fa -- ther cry -- ing,
  Thou, Thy chil -- dren's dai -- ly bread,
  Dai -- ly health sup -- ply -- ing;

  Ban -- quet for the ex -- ile spread,
  Grant us life un -- dy -- ing:
  May our love from Thine be fed,
  Self and sense de -- ny -- ing!
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
      tempoWholesPerMinute = #(ly:make-moment 63 2)
    }
  }
  \layout {}
}

