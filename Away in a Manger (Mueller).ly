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
  poet = \markup{ \fontsize #4 \smallCaps "Away in a Manger"  }
  meter = \markup { \small { Music: MUELLER (AWAY IN A MANGER), 11.11.11.11.; James R. Murray (1887)} }
  piece = \markup { \small {Text: anon.; attr. Martin Luther }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key f \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  c4 |
  c4. bf8 a4 |
  a g f |
  f e d |
  c2 \bar "||" \break

  c4 |
  c4. d8 c4 |
  c g' e |
  d c f |
  a2 \bar "||" \break

  c4 |
  c4. bf8 a4 |
  \set melismaBusyProperties = #'()
  \slurDashed a( g) f \unset melismaBusyProperties |
  f e d |
  c2 \bar "||" \break

  c4 |
  bf'4. a8 g4 |
  a g f |
  g d e |
  f2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  f4 |
  f4. g8 f4 |
  f c c |
  d c bf |
  a2

  a4 |
  bf4. bf8 bf4 |
  bf bf bf |
  bf a a |
  f'2

  f4 |
  f4. g8 f4 |
  \slurDashed f( c) c |
  d c bf |
  a2

  c4 |
  e4. f8 e4 |
  f4 c c |
  d bf bf |
  c2 \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4
  a4 |
  a4. d8 c4 |
  c bf a |
  bf f f |
  f2

  f4 |
  e4. e8 e4 |
  e e g |
  f f a |
  c2

  a4 |
  a4. d8 c4 |
  \slurDashed c( bf) a |
  bf f f |
  f2

  f4 |
  g4. c8 c4 |
  c bf a |
  g g bf |
  a2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  f4 |
  f4. f8 f4 |
  f f f |
  bf, bf bf |
  f2

  f4 |
  c'4. c8 c4 |
  c c c |
  f f f |
  f2

  f4 |
  f4. f8 f4 |
  \tieDashed f4~ f4 f4 |
  bf, bf bf |
  f2

  a4 |
  c4. c8 c4 |
  f f f |
  bf, g c |
  f2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  A -- way in a man -- ger,
  No crib for His bed,
  The lit -- tle Lord Je -- sus
  Laid down His sweet head;
  The stars in the sky _
  Looked down where He lay,
  The lit -- tle Lord Je -- sus,
  a -- sleep on the hay.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  The cat -- tle are low -- ing,
  The poor ba -- by wakes,
  But lit -- tle Lord Je -- sus,
  No cry -- ing He makes.
  I love thee, Lord Je -- sus!
  Look down from the sky,
  And stay by my cra -- dle
  Till morn -- ing is nigh.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Be near me, Lord Je -- sus,
  I ask Thee to stay
  Close by me for -- ev -- er,
  And love me, I pray;
  Bless all the dear chil -- dren
  In Thy ten -- der care,
  And fit us for heav -- en,
  To live with Thee there.
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
  \layout {}
}


