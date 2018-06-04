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
  poet = \markup{ \fontsize #4 \smallCaps "What Child is This?"  }
  meter = \markup { \small { Music: GREENSLEEVES, 87.87.68.67.; \italic "English," 16th cent.; harm. J. Stainer, 1871 } }
  piece = \markup { \small {Text: W.C. Dix, 1871 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key e \minor
  \time 6/8
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 8
  e8 |
  g4 a8 b8.[ c16] b8 |
  a4 fs8 d8.[ e16] fs8 |
  g4 e8 e8.[ ds16] e8 |
  fs4. b,4 \bar "" \break
  e8 |
  g4 a8 b8.[ c16] b8 |
  a4 fs8 d8.[ e16] fs8 |
  g8.[ fs16] e8 ds8.[ cs16] ds8 |
  e4. e4. \bar "||" \break

  d'4.^\markup {\small \caps Chorus} d8.[ cs16] b8 |
  a4 fs8 d8.[ e16] fs8 |
  g4 e8 e8.[ ds16] e8 |
  fs4 ds8 b4. |
  d'4. d8.[ cs16] b8 |
  a4 fs8 d8.[ e16] fs8 |
  g8.[ fs16] e8 ds8.[ cs16] ds8 |
  e4. e4 \bar "|."
}

alto = \relative c' {
  \global
  \partial 8
  \mergeDifferentlyDottedOn
  b8 |
  e4 d8 d4 g8 |
  fs4 d8 d4 c8 |
  b4 b8 a4 e'8 |
  ds4. b4 b8 |
  e4 d8 d4 g8 |
  fs4 d8 d4 c8 |
  b4 c8 b4 b8 |
  b4. b4.

  fs'4. b8.[ a16] g8 |
  fs4 d8 d4 c8 |
  b4 b8 a4 e'8 |
  ds4 b8 b4. |
  fs'4. b8.[ a16] g8 |
  fs4 d8 d4 c8 |
  b4 c8 b4 b8 |
  b4. b4
}

tenor = \relative c' {
  \global
  \partial 8
  g8 |
  b4 a8 g4 b8 |
  d4 a8 fs4 a8 |
  g4 g8 e4 e8 |
  b'4. b4 g8 |
  b4 a8 g4 b8 |
  d4 a8 fs4 a8 |
  g4 a8 fs4 fs8 |
  g4. g4.

  b4. d4 d8 |
  d4 a8 fs4 a8 |
  g4 g8 a4 e8 |
  b'4 fs8 b4. |
  b4. d4 d8 |
  d4 a8 fs4 a8 |
  g4 a8 fs4 fs8 |
  g4. g4
}

bass = \relative c {
  \global
  \partial 8
  e8 |
  e4 fs8 g4 g8 |
  d4 d8 d4 ds8 |
  e4 e8 c4 c8 |
  b4. b'4 e,8 |
  e4 fs8 g4 g8 |
  d4 d8 d4 ds8 |
  e4 a,8 b4 b8
  e4. e4.

  b'4. g4 g8 |
  d4 d8 d4 ds8 |
  e4 e8 c4 c8 |
  b4 b8 b4. |
  b'4. g4 g8 |
  d4 d8 d4 ds8 |
  e4 a,8 b4 b8 |
  e4. e4
}

verseOne = \lyricmode {
  \set stanza = "1."
  What Child is this, who, laid to rest,
  On Mar -- y's lap is sleep -- ing?
  Whom An -- gels greet with an -- thems sweet,
  While shep -- herds watch are keep -- ing?

  This, this is Christ the King;
  Whom shep -- herds guard and An -- gels sing:
  Haste, haste, to bring Him laud,
  The Babe, the Son of Mar -- y.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Why lies He in such mean es -- tate,
  Where ox and ass are feed -- ing?
  Good Chris -- tian, fear, for sin -- ners here
  The si -- lent Word is plead -- ing:

  Nails, spear shall pierce Him through,
  The cross be borne for me, for you:
  Hail, hail the Word made Flesh,
  The Babe, the Son of Mar -- y!
}

verseThree = \lyricmode {
  \set stanza = "3."
  So bring Him in -- cense, gold and myrrh,
  Come pea -- sant, king, to own Him:
  The King of kings sal -- va -- tion brings,
  Let lov -- ing hearts en -- throne Him.

  Raise, raise a song on high,
  The Vir -- gin sings her lul -- la -- by:
  Joy, joy for Christ is born,
  The Babe, the Son of Mar -- y!
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
  \layout {}
}


