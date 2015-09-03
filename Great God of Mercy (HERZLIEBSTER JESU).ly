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
  poet = \markup{ \fontsize #4 \smallCaps "Great God of Mercy"  }
  meter = \markup { \small { "Music: HERZLIEBSTER JESU, 11.11.11.5.; Johann Crüger, 1640" } }
  piece = \markup { \small {Text: James Quinn, SJ, ©1980, ICEL }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key g \minor
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g2 g4 g4 |
  f2 d2 |
  
  g4 a bf bf |
  c2 a |
  
  a bf4 c |
  d2 bf |
  ef4 ef d d |
  c2 bf2 |
  bf a4 g |
  f2 d |
  f4 f g f |
  ef2 d |
  d' c4 bf |
  a2 g \bar "|."
}

alto = \relative c' {
  \global
  d2 ef4 ef |
  c2 d2 |
  d4 d g f |
  ef2 d |
  d d4 f |
  f2 g2 |
  g4 g f f |
  f2 d |
  g f4 ef |
  d2 bf |
  d4 c d d |
  c2 bf |
  d ef4 d |
  d4.( c8) bf2 |
}

tenor = \relative c' {
  \global
  bf2 bf4 c |
  a2 f |
  bf4 a g bf |
  g2 fs |
  fs g4 a |
  bf2 g2 |
  c4 g8[ a] bf4 bf |
  bf( a) bf2 |
  d d4 bf |
  bf2 f |
  f4 a bf bf |
  g2 g |
  f4( bf) g g |
  g( fs) g2 \bar "|."
}

bass = \relative c' {
  \global
  g2 ef4 c |
  f2 bf, |
  g'4 f ef d |
  c2 d |
  d g4 f |
  bf,2 ef |
  c4 c d4. ef8 |
  f2 bf, |
  g d'4 ef |
  bf2 bf |
  bf4 a g bf |
  c2 g |
  bf c4 g |
  d'2 g, |

}

verseOne = \lyricmode {
  \set stanza = "1."
  Great God of mer -- cy, God of con -- so -- la -- tion,
  Look on your peo -- ple, gath -- ered here to praise you:
  Pi -- ty our weak -- ness, come in pow'r to aid us,	Source of all bless -- ing.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Je -- sus Re -- deem -- er, Lord of all cre -- a -- tion,
  Come as our Sav -- ior, Je -- sus, friend of sin -- ners:
  Grant us for -- give -- ness, lift our down -- cast spir -- it,
  Heal us and save us.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Joy -- giv -- ing Spir -- it, be our light in dark -- ness,
  Come to be -- friend us, help us bear our bur -- dens:
  Give us true cour -- age, breathe your peace a -- round us,
  Stay with us al -- ways.
}

verseFour = \lyricmode {
  \set stanza = "4."
  God in three per -- sons, Trin -- i -- ty e -- ter -- nal,
  Come to re -- new us, fill your Church with glo -- ry:
  Grant us your heal -- ing, pledge of res -- ur -- rec -- tion,
  Fore -- taste of heav -- en.
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
      \context Lyrics = four \lyricsto sopranos \verseFour
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenor >> }
      \context Voice =
      basses { \voiceTwo << \bass >> }
    >>
  >>  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 84 4)
    }
  }
  \layout { }
}






