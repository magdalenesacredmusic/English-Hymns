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
  poet = \markup{ \fontsize #4 \smallCaps "And Now, O Father, Mindful of the Love"  }
  meter = \markup { \small { Music: UNDE ET MEMORES, 10 10.10 10.10 10.; W.H. Monk, 1875 } }
  piece = \markup { \small {Text: W. Bright, 1874 }}
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

melody = \relative c' {
  \global
  \partial 4
  fs4 |
  fs4. d8 d4 e |
  fs4. fs8 fs4 g |
  a2. fs4 | \noBreak
  e fs g4. g8 | \break
  g4 fs a fs |
  e2. \bar "||"

  fs4 |
  fs4. d8 d4 e |
  fs4. fs8 fs4 g |
  a2. \bar "" \break
  fs4 |
  b a gs4. gs8 |
  a4 b cs b |
  a2. \bar "||"

  a4 |
  d a g fs | \break
  b b d b | \noBreak
  a2. a4 | \noBreak
  g fs e d | \noBreak
  b'4. g8 fs4 e | \noBreak
  d2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  d4. d8 d4 d |
  d4. d8 d4 cs |
  d2. d4 |
  cs d e4. e8 |
  e4 d d d |
  cs2.

  d4 |
  d4. d8 d4 d |
  d4. d8 d4 d |
  d2. d4 |
  d4 d d4. d8 |
  cs4 fs e d |
  cs2.

  cs4 |
  d d cs d |
  d4 d d g |
  fs2. d4 |
  cs d cs d |
  d4. e8 d4 cs |
  d2.
}

tenor = \relative c' {
  \global
  \partial 4
  a4 |
  a4. fs8 fs4 g |
  a4. a8 a4 a |
  a2. a4 |
  a a b4. b8 |
  a4 a a a |
  a2.

  a4 |
  a4. fs8 fs4 g4 |
  a4. d,8 d4 e |
  fs2. a4 |
  g a b4. b8 |
  a4 a a gs |
  a2.

  a4 |
  a a a a |
  g g g d' |
  d2. a4 |
  a a g fs |
  g4. b8 a4 g |
  fs2.
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  d4. d8 d4 d |
  d4. d8 d4 e |
  fs2. d4 |
  g fs e4. d8 |
  cs4 d fs,4. g8 |
  a2.

  d4 |
  d4. d8 d4 d |
  d4. b8 b4 b |
  fs2. d'4 |
  g fs e4. e8 |
  fs4 d e e |
  a,2.

  g'4 |
  fs4 fs e d |
  g, g b g |
  d'2. fs4 |
  e d a b |
  g4. g8 a4 a |
  d2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  And now, O Fa -- ther, mind -- ful of the love
  That bought us, once for all, on Cal -- v'ry's tree,
  And hav -- ing with us Him that pleads a -- bove,
  We here pre -- sent, we here spread forth to Thee,
  That on -- ly of -- f'ring per -- fect in Thine eyes,
  The one true, pure, im -- mor -- tal sac -- ri -- fice.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Look, Fa -- ther, look on His a -- noint -- ed face,
  And on -- ly look on us as found in Him;
  Look not on our mis -- us -- ings of Thy grace,
  Our prayer so lan -- guid, and our faith so dim;
  For lo! be -- tween our sins and their re -- ward,
  We set the pas -- sion of Thy Son our Lord.
}

verseThree = \lyricmode {
  \set stanza = "3."
  And then for those, our dear -- est and our best,
  By this pre -- vail -- ing pres -- ence we ap -- peal;
  O fold them clos -- er to Thy mer -- cy's breast!
  O do Thine ut -- most for their soul's true weal!
  From taint -- ing mis -- chief keep them white and clear,
  And crown Thy gifts with strength to per -- se -- vere.
}

verseFour = \lyricmode {
  \set stanza = "4."
  And so we come; O draw us to Thy feet,
  Most pa -- tient Sa -- viour, who canst love us still!
  And by this food, so aw -- ful and so sweet,
  De -- li -- ver us from ev -- 'ry touch of ill;
  In Thine own ser -- vice make us glad and free,
  and grant us nev -- er -- more to part with Thee.
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
      tempoWholesPerMinute = #(ly:make-moment 96 4)
    }
  }
  \layout {}
}

