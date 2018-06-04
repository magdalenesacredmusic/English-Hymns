%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup{ \fontsize #4 \smallCaps "O Christ, Our Joy, To Whom is Given"  }
  meter = \markup { \small { Music: GONFALON ROYAL, L.M.; P.C. Buck, 1918} }
  piece = \markup { \small {Text: \italic "Christe nostrum gaudium," c. 5th cent., tr. L. Housman, 1906 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}


global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4^\markup { \italic "Unison."} |
  e g c b8[ a] |
  b4 g e2~ |
  e4 e a fs | \break
  d g c8[ b] a[ g] |
  a2. \bar "||"

  a4 |
  d b g4. g8 |
  c4 a fs \bar "" \break

  e8[ fs] |
  g[ a] b[ a] c4 b |
  a e d2 \bar "||" \break

  \time 1/4
  d4 |
  \time 4/4
  e4 g a2 |
  g2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  b4 |
  b c e d |
  d2 c4 d |
  c2. d4 |
  d2. cs4 |
  d2.

  f4 |
  f2 e |
  e ds4 cs8[ ds] |
  e4 f e d |
  e c a2

  b4 |
  b e8[ d] c4 a |
  b2
}

tenor = \relative c' {
  \global
  \partial 4
  g4 |
  g e g fs |
  g2. gs4 |
  a2 d,4 a' |
  a g2 g4 |
  g( fs f)

  d'8[ c] |
  b8[( c] d4) d( c8[ b]) |
  a8[( b] c4) b2 |
  b4 f a fs8[ gs] |
  a4 g2 fs4 |

  b4 |
  g2. fs4 |
  g2
}

bass = \relative c' {
  \global
  \partial 4
  g4 |
  e c a d |
  g, b c b |
  a g fs c' |
  b2 e,4 e' |
  d2.

  d4 |
  g,2 c |
  fs, b |
  e4 d a b |
  c a d2

  g4 |
  e c8[ b] a4 d |
  g,2
}

verseOne = \lyricmode {
  \set stanza = "1."
  O Christ, our joy, to whom is giv'n
  A throne o'er all the thrones of heav'n,
  In thee, whose hand all things o -- bey,
  The world's vain plea -- sures pass a -- way.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  So, sup -- pliants here, we seek to win
  Thy par -- don for thy peo -- ple's sin,
  That, by thine all -- pre -- vail -- ing grace,
  Up -- lift -- ed, we may seek thy face.
}

verseThree = \lyricmode {
  \set stanza = "3."
  And when, all heav'n be -- neath thee bowed,
  Thou com'st to judge -- ment throned in cloud,
  Then from our guilt wash out the stain
  And give us our lost crowns a -- gain.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Be thou our joy and strong de -- fense,
  Who art our fu -- ture re -- com -- pense:
  So shall the light that springs from thee
  Be ours through all e -- ter -- ni -- ty.
}

verseFive = \lyricmode {
  \set stanza = "5."
  O ri -- sen Christ, as -- cend -- ed -- Lord,
  All praise to thee let earth ac -- cord,
  Who art, while end -- less a -- ges run,
  With Fa -- ther and with Spir -- it One.

  A -- _ _ _ men.
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
      tempoWholesPerMinute = #(ly:make-moment 120 4)
    }
  }
  \layout {
    ragged-last = ##t
  }
}