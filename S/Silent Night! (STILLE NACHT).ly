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
  poet = \markup{ \fontsize #4 \smallCaps "Silent Night! Holy Night!"  }
  meter = \markup { \small { Music: STILLE NACHT, Irreg.; Franz Gruber, 1818 } }
  piece = \markup { \small {Text: \large \override #'(font-name . "CloisterBlack")  "Stille Nacht! Heilige Nacht!", J. Mohr, 1818; tr. ca. 1850 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}


global = {
  \key bf \major
  \time 6/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f4.( g8) f4 d2. |
  f4.( g8) f4 d2. |
  c'2 c4 a2. |
  bf2 bf4 f2. |
  g2 g4 bf4.( a8) g4 |
  \slurDashed \set melismaBusyProperties = #'() f4.( g8) f4 d2. |
  g2 g4 bf4.( a8) g4 |
  f4.( g8) f4 d2. |
  \unset melismaBusyProperties c'2 c4 ef4. c8 a4 |
  \slurSolid bf2.( d2.) |
  bf4( f) d f4. ef8 c4 |
  bf1. \bar "|."
}

alto = \relative c' {
  \global
  d4.( ef8) d4 bf2. |
  d4.( ef8) d4 bf2. |
  ef2 ef4 ef2. |
  d2 d4 d2. |
  ef2 ef4 g4.( f8) ef4 |
  \slurDashed d4.( ef8) d4 bf2. |
  bf2 ef4 g4.( f8) ef4 |
  d4.( ef8) d4 bf2. |
  ef2 ef4 c4. ef8 ef4 |
  \slurSolid d2.( f2.) |
  d2 bf4 a4. a8 a4 |
  bf1.
}

tenor = \relative c' {
  \global
  bf2 bf4 f2. |
  bf2 bf4 f2. |
  a2 a4 c2. |
  bf2 f4 bf2. |

  bf2 bf4 g4.( a8) bf4 |
  \tieDashed bf4.~ bf8 bf4 f2. |
  \slurDashed  ef2 bf'4 g4.( a8) bf4 |
  bf4.~ bf8 bf4 f2. |
  a2 a4 a4. a8 c4 |
  \tieSolid bf2.~ bf2. |
  f2 f4 f4. f8 ef4 |
  d1.
}

bass = \relative c {
  \global
  bf2 bf4 bf2. |
  bf2 bf4 bf2. |
  f'2 f4 f2. |
  bf,2 bf4 bf2. |

  ef2 ef4 ef4.~ ef8 ef4 |
  \tieDashed bf4.~ bf8 bf4 bf2. |
  ef2 ef4 ef4.~ ef8 ef4 |
  bf4.~ bf8 bf4 bf2. |
  f'2 f4 f4. f8 f4 |
  \tieSolid bf,2.~ bf2. |
  bf2 bf4 f4. f8 f4 |
  bf1.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Si -- lent night! Ho -- ly night!
  All is calm, all is bright
  Round yon vir -- gin moth -- er and child!
  Ho -- ly In -- fant so ten -- der and mild,
  Sleep in heav -- en -- ly peace,
  Sleep in heav -- en -- ly peace.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Si -- lent night! Ho -- ly night!
  Shep -- herds quake at the sight!
  Glo -- ries stream from heav -- en a -- far,
  Heav'n -- ly hosts _ sing al -- le -- lu -- ia;
  Christ the Sav -- iour is born!
  Christ the Sav -- iour is born!
}

verseThree = \lyricmode {
  \set stanza = "3."
  Si -- lent night! Ho -- ly night!
  Son of God, love's pure light
  Ra -- diant beams from Thy ho -- ly face,
  With the dawn of re -- deem -- _ ing grace,
  Je -- sus, Lord, at Thy birth,
  Je -- sus, Lord, at Thy birth.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Si -- lent night! Ho -- ly night!
  Won -- drous star, lend Thy light;
  With the an -- gels let _ us sing
  Al -- le -- lu -- _ ia to _ our King;
  Christ, the Sav -- iour is born!
  Christ the Sav -- iour is born!
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
      tempoWholesPerMinute = #(ly:make-moment 69 4)
    }
  }
  \layout { }
}

