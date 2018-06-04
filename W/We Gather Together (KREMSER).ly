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
  poet = \markup{ \fontsize #4 \smallCaps "We Gather Together to Ask the Lord's Blessing"  }
  meter = \markup { \small { Music: KREMSER, 12.11.12.11.; \italic "Nederlandtsch Gedenckclanck;" arr. Edward Kremser, 1877 } }
  piece = \markup { \small {Text: Anon.; tr. Theodore Baker }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key d \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  a4 |
  a4. b8 a4 |
  fs g a |
  g4. fs8 e4 |
  fs d \bar "||" \break

  a' |
  a4. b8 cs4 |
  d4. e8 cs4 |
  b4. a8 b4 |
  a2 \bar "||" \break

  a4 |
  a4. b8 cs4 |
  d a a |
  a4.( b8) g a |
  fs4 d \bar "||" \break

  d |
  g4. a8 b g |
  a4.( g8) \set melismaBusyProperties = #'() \slurDashed fs8( fs8) \unset melismaBusyProperties |
  g4 e4. d8 |
  d2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  d4. d8 d4 |
  d4 d d |
  d4. d8 cs4 |
  d4 d4 \bar "||"

  fs |
  e4. e8 e4 |
  fs4 e e |
  fs4. fs8 gs4 |
  e2 \bar "||"

  e4 |
  e4. e8 e4 |
  d d d |
  d2 cs8 cs |
  d4 d \bar "||"

  d4 |
  d4. d8 d4 |
  e4.( e8) \tieDashed d[~ d] |
  b4 cs4. d8 |
  a2 \bar "|."
}

tenor = \relative c {
  \global
  \partial 4
  fs4 |
  fs4. g8 fs4 |
  a a a |
  b4. b8 a4 |
  a fs \bar "||"

  a |
  a4. a8 a4 |
  a gs a |
  d4. d8 d4 |
  cs2 \bar "||"

  cs4 |
  cs4. b8 a4 |
  a a a |
  b2 a8 a |
  a4 fs \bar "||"

  fs4 |
  g4. fs8 g4 |
  e( a) \tieDashed a8[~ a] |
  g4 g4. fs8 |
  fs2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  d4. d8 d4 |
  d e fs |
  e4. e8 a4 |
  d, d \bar "||"

  d |
  cs4. cs8 cs4 |
  b e a |
  b,4. b8 e4 |
  a2 \bar "||"

  a4 |
  g4. g8 g4 |
  fs fs fs |
  e2 a8 a |
  d,4 d d |
  b4. a8 g b |
  cs2 \tieDashed d8[~ d] |
  e4 a,4. d8 |
  d2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  We gath -- er to -- ge -- ther to ask the Lord's bles -- sing;
  He chas -- tens and has -- tens His will to make known;
  The wick -- ed op -- pres -- sing now cease from dis -- tres -- sing:
  Sing prais -- es to His name, He for -- gets not his own.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Be -- side us to guide us, our God with us join -- ing,
  Or -- dain -- ing, main -- tain -- ing His king -- dom di -- vine;
  So from the be -- gin -- ning the fight we were win -- ning:
  Thou, Lord, wast at our side: all _ glo -- ry be Thine!
}

verseThree = \lyricmode {
  \set stanza = "3."
  We all do ex -- tol Thee, Thou lead -- er tri -- um -- phant,
  And pray that Thou still our de -- fend -- er wilt be.
  Let Thy con -- gre -- ga -- tion es -- cape tri -- bu -- la -- tion:
  Thy Name be ev -- er praised! O _ Lord, make us free!
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
      tempoWholesPerMinute = #(ly:make-moment 84 4)
    }
  }
  \layout { }
}

