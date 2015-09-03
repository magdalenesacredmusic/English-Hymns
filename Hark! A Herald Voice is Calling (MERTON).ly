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
  poet = \markup{ \fontsize #4 \smallCaps "Hark! A Herald Voice is Calling"  }
  meter = \markup { \small { Music: MERTON, 8.7.8.7.; W.H. Monk, 1850} }
  piece = \markup { \small {Text: \italic "Vox clara ecce intonat," 6th c.; tr. E. Caswall; alt. \italic "The English Hymnal" }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key e \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  e4 gs b b |
  a cs cs b \bar "||"

  gs as b b |
  cs cs b2 \bar "||"

  b4 a gs b |
  a gs fs e \bar "||"

  fs4 gs a gs |
  fs fs e2 \bar "|."
}

alto = \relative c' {
  \global
  b4 b b ds |
  e e e e \bar "||"

  e e ds fs |
  gs fs8 e ds2 \bar "||"

  ds4 e8 fs e4 fs |
  e e ds e \bar "||"

  cs es fs e |
  e ds e2 \bar "|."
}

tenor = \relative c' {
  \global
  gs4 b fs fs |
  e a a gs \bar "||"

  b e, fs b |
  b as b2 \bar "||"

  ds4 cs8 b b4 b |
  cs b b8 a gs4 \bar "||"

  a b cs b |
  cs b8 a gs2 \bar "|."
}

bass = \relative c {
  \global
  e4 e ds b |
  cs a8 b cs ds e4 \bar "||"

  e cs b ds |
  e fs b,2 \bar "||"

  b4 cs8 ds e4 ds |
  cs e b cs \bar "||"

  a gs fs gs |
  a b \ignore << {\stemDown \override Stem #'length = #4.0  e2} \\ {\teeny \override Stem #'length = #5.6 e,2 } >> \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  Hark! a her -- ald voice is cal -- ling:
  'Christ is nigh,' it seems to say;
  'Cast a -- way the dreams of dark -- nes,
  O ye chil -- dren of the day!'
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Star -- tled at the sol -- emn warn -- ing
  Let the earth -- bound soul a -- rise;
  Christ, her Sun, all sloth dis -- pel -- ling,
  Shines up -- on the morn -- ing skies.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Lo! the Lamb, so long ex -- pect -- ed,
  Comes with par -- don down from heav'n;
  Let us hast, with tears of sor -- row,
  One and all to be for -- giv'n;
}

verseFour = \lyricmode {
  \set stanza = "4."
  So when next he comes with glo -- ry,
  Wrap -- ping all the earth in fear,
  May he then as our de -- fend -- er
  On the clouds of heav'n ap -- pear.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Ho -- nour, glo -- ry, vir -- tue, me -- rit,
  To the Fa -- ther and the Son,
  With the co -- e -- ter -- nal Spir -- it,
  While un -- end -- ing a -- ges run.
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
      \context Lyrics = five \lyricsto sopranos \verseFive
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
