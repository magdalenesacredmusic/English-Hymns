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
  poet = \markup{ \fontsize #4 \smallCaps "Virgin-born, We Bow Before Thee"  }
  meter = \markup { \small { Music: MON DIEU, PRÊTE-MOI L'OREILLE, 88.77. D; L. Bourgeois; \italic "The English Hymnal" } }
  piece = \markup { \small {Text: R. Herber, 1827 }}
  %breakbefore
  %copyright = ""
  tagline = ""

}

global = {
  \key bf \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g2^\markup {Voices in Unison} g |
  f4 g a bf |
  a2 g \bar "||"

  g2 g |
  f4 g a bf |
  a2 <<
    {
      \voiceOne
      \once \override NoteColumn #'force-hshift = #1.8 g2
    }
    \new Voice = "alternative" {
      \voiceTwo
      g4 g4
    }
  >>
  \oneVoice \bar "||"

  bf2 a |
  g4 bf a g |
  <<
    {
      \voiceOne
      \once \override NoteColumn #'force-hshift = #1.9 f1
    }
    \new Voice = "alternative" {
      \voiceTwo
      f2. f4
    }
  >>
  \oneVoice \bar "||"

  f2 e |
  d4 g g f |
  g1 \bar "||"

  bf2 c |
  d4 d c bf |
  c2 bf \bar "||"

  bf2 c |
  d4 d c bf |
  c2 bf \bar "||"

  bf2 a |
  g4 bf a g |
  <<
    {
      \voiceOne
      \once \override NoteColumn #'force-hshift = #1.9 f1
    }
    \new Voice = "alternative" {
      \voiceTwo
      f2. f4
    }
  >>
  \oneVoice \bar "||"

  f2 e2 |
  d4 g g f |
  g1 \bar "|."
}

soprano = \relative c'' {
  \global
  g2 g |
  f4 g a bf |
  a2 g \bar "||"

  g2 g |
  f4 g a bf |
  a2 g2 \bar "||"

  bf2 a |
  g4 bf a g |
  f1 \bar "||"

  f2 e |
  d4 g g f |
  g1 \bar "||"

  bf2 c |
  d4 d c bf |
  c2 bf \bar "||"

  bf2 \once \override NoteColumn #'force-hshift = #0.8 c |
  <bf d>4 <bf d> c bf |
  <af c>2 bf \bar "||"

  bf2 a |
  g4 bf a g |
  f1 \bar "||"

  f2 e2 |
  d4 g g f |
  g1 \bar "|."
}

alto = \relative c' {
  \global
  d2 d |
  d4 e f f |
  f ef! d2 \bar "||"

  d2 ef |
  bf4 ef ef f |
  f2 ef \bar "||"

  f2 f |
  ef4 g f e |
  c1 \bar "||"

  d2 c |
  bf4 bf d2 |
  d1 \bar "||"

  g2 a |
  bf4 bf a g |
  a2 f \bar "||"

  <d g>2 << { \voiceTwo g4 f } \\ { \voiceFour \once \override NoteColumn #'force-hshift = #0.8 c2 } >> |
  f4 f g g |
  <c, ef> <d f> <ef g>2 \bar "||"

  f2 f |
  ef4 g f e |
  c1 \bar "||"

  d2 c |
  d4 d bf d |
  d1 \bar "|."

}

tenor = \relative c' {
  \global
  bf2 bf |
  a4 c c d |
  c2 bf \bar "||"

  bf2 bf4 a |
  bf bf c d |
  d c bf2 \bar "||"

  d2. c4 |
  bf d c4. bf8 |
  a1 \bar "||"

  a2 a4 g |
  f g a2 |
  bf1 \bar "||"

  d4 ef ef2 |
  f4 f f d |
  f ef d2 \bar "||"

  bf2 bf4 a |
  bf f' ef d |
  af2 bf4 c \bar "||"

  <bf d>2. c4 |
  bf4 d c4. bf8 |
  a1 \bar "||"

  a2 a4 g |
  f bf bf bf |
  bf1 \bar "|."
}

bass = \relative c {
  \global
  g4 a bf g |
  d' c f d |
  f2 g \bar "||"

  g4 f ef c |
  d ef c bf |
  d2 ef \bar "||"

  bf4 c d2 |
  ef4 g, a8 bf c4 |
  f2. e4

  d4 f a a, |
  bf g d'2 |
  g1 \bar "||"

  g4 ef d c |
  bf d f g |
  f2 bf \bar "||"

  g4 f ef f |
  bf, d ef g |
  af2 ef \bar "||"

  bf4 c <d f>2 |
  ef4 g, a8 bf c4 |
  f2. e4 \bar "||"

  d4 f a a, |
  bf g ef' bf |
  g1 \bar "|."
}


verseOne = \lyricmode {
  \set stanza = "1."
  Vir -- gin -- born, we bow be -- fore thee:
  Bless -- èd was the womb that bore thee;
  Ma -- ry, Mo -- ther meek and mild,
  Bless -- èd was she in her Child.

  Bless -- èd was the breast that fed thee;
  Bless -- èd was the hand that led thee;
  Bless -- èd was the par -- \set associatedVoice = alternative ent's eye \set associatedVoice = melody That
  watched thy slumb' -- ring in -- fan -- cy.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Bless -- èd she by all cre -- a -- tion,
  Who brought forth the world's sal -- \set associatedVoice = alternative va -- tion, \set associatedVoice = melody And
  bless -- èd they- for ev -- \set associatedVoice = alternative er blest, \set associatedVoice = melody Who
  love thee most and serve thee best.
  Vir -- gin -- born, we bow be -- fore thee:
  Bless -- èd was the womb that bore thee;
  Ma -- ry, Mo -- ther meek and mild,
  Bless -- èd was she in her Child.
}

verseThree = \lyricmode {
  \set stanza = "3."

}


\score {
  <<
    \new Voice = "melody" {\melody }
    \new Lyrics \lyricsto "melody" \verseOne
    \new Lyrics \lyricsto "melody" \verseTwo
    \new Lyrics \lyricsto "melody" \verseThree

    \context ChoirStaff <<
      \context Staff = upper <<
        \context Voice =
        sopranos { \voiceOne << \soprano >> }
        \context Voice =
        altos { \voiceTwo << \alto >> }

      >>
      \context Staff = lower <<
        \clef bass
        \context Voice =
        tenors { \voiceOne << \tenor >> }
        \context Voice =
        basses { \voiceTwo << \bass >> }
      >>
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 80 4)
    }
  }
  \layout {}
}
