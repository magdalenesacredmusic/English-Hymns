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
  poet = \markup{ \fontsize #4 \smallCaps "O Christ, Our Joy, To Whom is Given"  }
  meter = \markup { \small { Music: DEUS TUORUM MILITUM, L.M.; Grenoble Church Melody, \italic "The English Hymnal" } }
  piece = \markup { \small {Text: \italic "Christe nostrum gaudium," c. 5th cent., tr. L. Housman, 1906 }}
  %breakbefore
  %copyright = ""
  tagline = ""

}

global = {
  \key c \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  \partial 4 c4^\markup { \italic "To be sung in unison." } |
  e2 g4 | c2 g4 |
  f4( e4) d4 |
  c2 \bar "||"

  c'4 |
  e2 c4 |
  a4( b) c |
  g2 fs4 |
  g2 \bar "||"

  g4 |
  a2 b4 |
  c2 g4 |
  f4( e) d |
  e2 \bar "||"

  g4 |
  a4( b) c |
  g( f) e |
  d2 c4 |
  c2 \bar "||"
}

soprano = \relative c' {
  \global
  \partial 4 c4 |
  e2 g4 | c2 g4 |
  f4( e4) d4 |
  c2 \bar "||"

  c'4 |
  e2 c4 |
  a4( b) c |
  g2 fs4 |
  g2 \bar "||" \break

  g4 |
  a2 b4 |
  c2 g4 |
  f4( e) d |
  e2 \bar "||"

  g4 |
  a4( b) c |
  g( f) e |
  d2 c4 |
  c2 \bar "||"
}

alto = \relative c' {
  \global
  \partial 4
  s4 |
  s2. |
  <c e>2 <c e>4 |
  s2. |
  s2 \bar "||"

  <e g>4 |
  <e a>2 <e a>4 |
  fs2 <e g>4 |
  b2 d4 |
  d2 \bar "||"

  <c e>4 |
  <c f>2 f4 |
  e2 c4 |
  c2 b4 |
  b2 \bar "||"

  c4 |
  <c e>4 \tieUp <d g ~>4 <e g>4 |
  <b d>4 c c |
  s2 c4 |
  c2 \bar "||"
}

tenor = \relative c {
  \global
  \partial 4
  <e g>4 |
  <g c>2 <g b>4 |
  s2. |
  <a c>4 g4 b4 |
  <e, g>2 \bar "||"

  c'4 |
  c2 a4 |
  d2 g,4 |
  g2 a4 |
  <g b>2 \bar "||"


  s4 |
  s2 b4 |
  a2 g4 |
  a g g |
  g2 \bar "||"

  e4 |
  s2. |
  s4 a4 g |
  <g b>2 <e g>4 |
  <e g>2 \bar "||"
}

bass = \relative c {
  \global
  \partial 4
  c4 |
  c2 e4 |
  a,2 c4 |
  f4 c4 g'4 |
  c,2 \bar "||"

  c'4 |
  a2 c,4 |
  d2 c4 |
  e2 d4 |
  g,2 \bar "||"

  c4 |
  f2 d4 |
  a2 e'4 |
  f c g' |
  e2 \bar "||"

  c4 |
  a g e |
  g a c |
  g2 <c, c'>4 |
  <c c'>2 \bar "||"
}


verseOne = \lyricmode {
  \set stanza = "1."
  O Christ, our joy, to whom is giv'n
  A throne o'er all the thrones of heav'n,
  In Thee, whose hand all things o -- bey,
  The world's vain plea -- sures pass a -- way.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  So, sup -- pliants here, we seek to win
  Thy par -- don for Thy peo -- ple's sin,
  That, by Thine all -- pre -- vail -- ing grace,
  Up -- lift -- ed, we may seek Thy face.
}

verseThree = \lyricmode {
  \set stanza = "3."
  And when, all heav'n be -- neath Thee bowed,
  Thou com'st to judge -- ment throned in cloud,
  Then from our guilt wash out the stain
  And give us our lost crowns a -- gain.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Be Thou our joy and strong de -- fence,
  Who art our fu -- ture rec -- om -- pense:
  So shall the light that springs from Thee
  Be ours through all e -- ter -- ni -- ty.
}


verseFive = \lyricmode {
  \set stanza = "5."
  O ri -- sen Christ, as -- cend -- ed LOrd,
  All praise to Thee let earth ac -- cord,
  Who art, while end -- less a -- ges run,
  With Fa -- ther, and with Spir -- it One.
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
      tempoWholesPerMinute = #(ly:make-moment 112 4)
    }
  }
  \layout { }
}