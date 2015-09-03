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
  poet = \markup{ \fontsize #4 \smallCaps "At the Lamb's High Feast We Sing"  }
  meter = \markup { \small { Music: SALZBURG, 7.7.7.7.; Jakob Hintze, 1678; harm. J.S. Bach } }
  piece = \markup { \small {Text: \italic "Ad regias Agni dapes," Latin, 6th cent.; \italic tr. Robert Campbell, 1849; ad. \italic "Annus Sanctus," 1884 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"

}

melody = \relative c'' {
  \global
  a4 d a b |
  a4. g8 fs2 |
  a4 a g fs |
  e e d2 \bar "||"
  a'4 d a b |
  a4. g8 fs2 |
  a4 a g fs |
  e e d2 \bar "||"
  e4 e fs8[ gs] a4 |
  a4 gs a2 |
  b4. cs8 d4 d |
  cs4 cs b2 |
  fs4 fs b a |
  a gs a2 |
  b4 a g fs |
  e e d2 \bar "|."
}

alto = \relative c' {
  \global
  d4 d d d |
  d cs d2 |
  d4 d8[ cs] b[ cs] d4 |
  d cs d2 |
  d4 d d d |
  d cs d2 |
  d4 d8[ cs] b[ cs] d4 |
  d cs d2 |
  cs4 cs d cs |
  fs e8[ d] cs2 |
  e8[ fs] g4 fs fs |
  fs fs8[ e] d2 |
  d4 d d cs |
  d d cs2 |
  d4 d8[ cs] b[ cs] d4 |
  d cs d2 |
}

tenor = \relative c {
  \global
  fs4 fs8[ g] a4 g8[ fs] |
  e[ d] e4 d2 |
  fs4 fs g a |
  b a fs2 \bar "||"
  fs4 fs8[ g] a4 g8[ fs] |
  e[ d] e4 d2 |
  fs4 fs g a |
  b a fs2 \bar "||"
  a4 a a a |
  b b a2 |
  g4. a8 b4 b |
  b as b2 \bar "||"
  a4 a g8[ fs] e4 |
  d8[ fs] e[ d] e2 |
  g4 fs g a |
  b a8[ g] fs2
}

bass = \relative c {
  \global
  d4 b fs g |
  a a d2 |
  d4 d e fs |
  g a d,2 |
  d4 b fs g |
  a a d2 |
  d4 d e fs |
  g a d,2 |
  a4 a d fs8[ e] |
  d4 e a,2 |
  e'4 e b8[ cs] d[ e] |
  fs4 fs b,2 |
  d4 d g, a |
  b b a2 |
  g4 d' e fs |
  g \once \override NoteColumn #'force-hshift = #1.0 a d,2 |
}

verseOne = \lyricmode {
  \set stanza = "1."
  At the Lamb’s high feast we sing,
  Praise to our vic -- to -- rious King,
  Washed our gar -- ments in the tide
  Flow -- ing from his pierc -- èd side;
  Praise we Him, whose love di -- vine
  Gives the guests his blood for wine,
  Gives his bod -- y for the feast,
  Love the Vic -- tim, love the Priest.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Where the pas -- chal blood is poured,
  Death’s dark an -- gel sheathes his sword;
  Is -- rael’s hosts tri -- um -- phant go
  Through the wave that drowns the foe.
  Christ, the Lamb whose blood was shed,
  Pas -- chal vic -- tim, pas -- chal bread;
  With sin -- cer -- i -- ty and love
  Eat we man -- na from a -- bove.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Might -- y vic -- tim from the sky,
  Pow'rs of hell be -- neath Thee lie;
  Death is con -- quered in the fight,
  Thou hast brought us life and light.
  Now thy ban -- ner thou dost wave;
  Van -- quished Sa -- tan and the grave;
  An -- gels join his praise to tell-
  See o'er -- thrown the prince of hell.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Pas -- chal tri -- umph, pas -- chal joy,
  On -- ly sin can this de -- troy;
  From the death of sin set free
  Souls re -- born, dear Lord, in Thee.
  Hymns of glo -- ry, songs of praise,
  Fa -- ther, un -- to thee we raise;
  Ri -- sen Lord, all praise to Thee,
  Ev -- er with the Spi -- rit be.
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
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 84 4)
    }
  }
  \layout { }
}



