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
  poet = \markup{ \fontsize #4 \smallCaps "As with Gladness Men of Old"  }
  meter = \markup { \small { Music: DIX, 77.77.77.; C. Kocker; arr. W.H. Monk, 1861} }
  piece = \markup { \small {Text: W. Chatterton Dix, 1861 }}
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

melody = \relative c'' {
  \global
  g4 fs8[ g] a4 g |
  c c b2 |
  e,4 fs g e |
  d d d2 \bar "||"

  g4 fs8[ g] a4 g |
  c c b2 |
  e,4 fs g e |
  d d d2 \bar "||"

  b'4 a g b |
  d4. c8 b2 |
  e,4 fs g c |
  b a g2 \bar "|."
}

alto = \relative c' {
  \global
  d4 d d d |
  g d d2 |
  c4 d d c |
  b a b2 \bar "||"

  d4 d d d |
  g d d2 |
  c4 d d c |
  b a b2 \bar "||"

  d4 d d d |
  d d d2 |
  c4 d d c |
  d4. c8 b2 \bar "|."
}

tenor = \relative c' {
  \global
  b4 c8[ b] a4 b |
  c a g2 |
  g4 a g g |
  g fs g2 \bar "||"

  b4 c8[ b] a4 b |
  c a g2 |
  g4 a g g |
  g fs g2 \bar "||"

  g4 d'8[ c] b4 g |
  a fs g2 |
  g4 a g g |
  g fs g2 \bar "|."
}

bass = \relative c' {
  \global
  g4 a8[ g] fs4 g |
  e fs g2 |
  c,4 c b c |
  d d g,2 \bar "||"

  g'4 a8[ g] fs4 g |
  e fs g2 |
  c,4 c b c |
  d d g,2 \bar "||"

  g'4 fs g g |
  fs d g2 |
  c,4 c b e |
  d d g,2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  As with glad -- ness, men of old
  Did the guid -- ing star be -- hold,
  As with joy they hailed its light,
  Lead -- ing on -- ward, beam -- ing bright
  So, most glo -- rious Lord, may we
  Ev -- er -- more be led to Thee.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  As with joy -- ful steps they sped,
  To that low -- ly man -- ger bed,
  There to bend the knee be -- fore
  Him Whom Heav'n and earth a -- dore;
  So may we with will -- ing feet
  Ev -- er seek Thy mer -- cy seat.
}

verseThree = \lyricmode {
  \set stanza = "3."
  As they of -- fered gifts most rare
  At that man -- ger rude and bare;
  So may we with ho -- ly joy,
  Pure and free from sin's al -- loy,
  All our cost -- liest trea -- sures bring,
  Christ, to Thee our heav'n -- ly King.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Ho -- ly Je -- sus, ev' -- ry day
  Keep us in the nar -- row way;
  And, when earth -- ly things are past,
  Bring our ran -- somed souls at last
  Where they need no star to guide,
  Where no clouds Thy glo -- ry hide.
}

verseFive = \lyricmode {
  \set stanza = "5."
  In the heav'n -- ly coun -- try bright
  Need they no cre -- at -- ed light;
  Thou its Light, its Joy, its Crown,
  Thou its Sun which goes not down;
  There for ev -- er may we sing
  Al -- le -- lu -- ias to our King.
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
      tempoWholesPerMinute = #(ly:make-moment 96 4)
    }
  }

  \layout { }
}

