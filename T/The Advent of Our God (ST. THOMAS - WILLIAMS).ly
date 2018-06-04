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
  poet = \markup { \fontsize #4 \smallCaps "The Advent of Our God"  }
  meter = \markup { \small { Music: ST. THOMAS (WILLIAMS), 66.86; \italic "Williams' Psalmody," 1770; \italic "The English Hymnal," 1906 } }
  piece = \markup { \small {Text: \italic "Instantis adventum Dei," C. Coffin; tr. Harriett Packer, 1906 }}
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

melody = \relative c' {
  \global
  \partial 4
  c4 |
  f f a g8[ f] |
  g2. \bar "||"

  a8[ bf]  |
  c4 bf8[ a] bf4 a |
  g2. \bar "||" \break

  c4 |
  a f g c, |
  f a8.[ bf16] c4 \bar "||"

  c4 |
  d c8[ bf] a4 g |
  f2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  c4 |
  c d c c8[ b] |
  c2.

  c4 |
  f e8[ f] d[ e] f4 |
  e2.

  g4 |
  f f e c |
  c d e

  ef |
  d f f e |
  f2. \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4
  c4 |
  f, f f g |
  e2.

  c'4 |
  c c bf c |
  c2.

  c4 |
  c c c c8[ bf] |
  a4 f g

  f |
  f c'8[ d] c4. bf8 |
  a2. \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  c4 |
  a bf f8[ f'] e[ d] |
  c2.

  f8[ g]  |
  a4 g8[ f] g4 f |
  c2.

  e4 |
  f a c8[ bf] a[ g]  |
  f4 d c

  a |
  bf a8[ bf] c4 c |
  f2. \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  The ad -- vent of our God
  With ea -- ger prayers we greet,
  And sing -- ing haste up -- on his road
  His glo -- rious gift to meet.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  The ev -- er -- last -- ing Son
  Scorns not a Vir -- gin's womb;
  That we from bon -- dage may be won
  He bears a bonds -- man's doom.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Daugh -- ter of Si -- on, rise
  To meet thy low -- ly king;
  Let not thy stub -- born heart de -- spise
  The peace he deigns to bring.
}

verseFour = \lyricmode {
  \set stanza = "4."
  In clouds of aw -- ful light,
  As Judge he comes a -- gain,
  His scat -- tered peo -- ple to u -- nite,
  With them in heav'n to reign.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Let e -- vil flee a -- way
  Ere that dread hour shall dawn,
  Let this old A -- dam day by day
  God's i -- mage still put on.
}

verseSix = \lyricmode {
  \set stanza = "6."
  Praise to the_In -- car -- nate Son,
  Who comes to set us free,
  With God the Fa -- ther, ev -- er one,
  To all e -- ter -- ni -- ty.
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
      \context Lyrics = six \lyricsto sopranos \verseSix
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
      tempoWholesPerMinute = #(ly:make-moment 72 4)
    }
  }
  
  \layout {}
}