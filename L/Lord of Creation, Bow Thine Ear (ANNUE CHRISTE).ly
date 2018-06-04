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
  poet = \markup{ \fontsize #4 \smallCaps "Lord of Creation, Bow Thine Ear"  }
  meter = \markup { \small { Music: ANNUE CHRISTE, 1212.1212.; from La Feillée, \italic "Méthode du plain-chant;" harm. \italic "The English Hymnal"} }
  piece = \markup { \small {Text: \italic "Annue Christ, saeculorum Domine," before 11th cent.; tr. T.A. Lacy }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

ignore = \override NoteColumn #'ignore-collision = ##t

global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g2^\markup { \italic "To be sung in unison."} g4 a |
  b2 b |
  b4 a b c |
  <g b>2 a4.( g8) |
  g1 \bar "||" \break

  b2 b4 c |
  d2 d |
  g,4 e fs g |
  fs2 e4.( d8) |
  d1 \bar "||" \break

  g2 e4 fs |
  g2 g |
  a4 g a b |
  c2 b4.( a8) |
  a1 \bar "||"

  d2 b4 g |
  c2 b |
  g4 a b c |
  b2 a4.( g8) |
  g1 \bar "|."
}

alto = \relative c' {
  \global
  <b d>2 << \ignore {\stemDown b4 c}\\{\stemDown \once \override NoteColumn #'force-hshift = #0.5 g'2}>> |
  <d g>2 <d g>~ |
  <c g'> <d g>4 <e g> |
  d4 e fs2 |
  d1 |

  g2 g4 g8[ a]
  <fs b>2~ <fs a> |
  d2 d4 d |
  d2 cs |
  s1 |

  d2 d4 c |
  d2 d |
  e fs4 gs |
  a2 gs |
  e1 |

  <g b>2 fs4 e |
  g2 fs |
  e4 c e <e a> |
  g2 <d fs> |
  d1
}

tenor = \relative c' {
  \global
  g1~ |
  g1~ |
  g1 |
  d'2 c |
  b1 |

  d2 d4 c |
  b2 a |
  g2 a4 b |
  a b <g cs>2 |
  <fs a>1 |

  g2 g4 a |
  c2 b |
  b d |
  e2. d4 |
  c1 |
  g2 d'4 b |
  e2 d |
  b4 a gs a |
  d e a, c |
  b1
}

bass = \relative c {
  \global
  g1~ |
  g2 g'4 fs |
  e2 d4 c |
  d1 |
  g |

  g2 fs4 e |
  d2 c |
  b a4 g |
  a1 |
  d |

  b2 b4 a |
  g2 g'4 fs |
  e4. d8 c4 b |
  a c e2 |
  a,1 |

  b2 d4 e |
  a a, b c8[ d] |
  e4 f e a, |
  b c d2 |
  g,1

}

verseOne = \lyricmode {
  \set stanza = "1."
  Lord of Cre -- a -- tion, bow Thine ear, O Christ, to hear
  The in -- ter -- ces -- sion of Thy ser -- vant true and dear,
  That we un -- wor -- thy, who have tres -- passed in Thy sight,
  May live be -- fore Thee where he dwells in glo -- rious light.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  O God our Sa -- viour, look on Thine in -- her -- i -- tance,
  Sealed by the fa -- vour shin -- ing from Thy coun -- te -- nance;
  That no false spir -- it bring to nought the souls of price
  Bought by the me -- rit of Thy per -- fect Sac -- ri -- fice.
}

verseThree = \lyricmode {
  \set stanza = "3."
  We bear the bur -- den of our guilt and en -- mi -- ty,
  Un -- til Thy par -- don lift the heart from sla -- ve -- ry;
  Then through the spend -- ing of Thy life -- blood, King of grace,
  Grant us un -- end -- ing tri -- umph in Thy ho -- ly place.
}

verseFour = \lyricmode {
  \set stanza = "4."
  To Thee the glo -- rious Christ, our Sa -- viour man -- i -- fest,
  All wreath vic -- to -- rious, praise and wor -- ship be ad -- drest,
  Whom with the liv -- ing Fa -- ther hum -- bly we a -- dore,
  And the life -- giv -- ing Spir -- it, God for ev -- er -- more.
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
    \new Staff  <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
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


