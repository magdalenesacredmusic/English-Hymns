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
  poet = \markup{ \fontsize #4 \smallCaps "Shepherd of Souls, Refresh and Bless"  }
  meter = \markup { \small { Music: ST. AGNES, C.M.; J.B. Dykes, 1866 } }
  piece = \markup { \small {Text: Vs. 1,2,3, Anon.: vs. 4,5, J. Montgomery, 1825  }}
  %breakbefore
  %copyright = ""
  tagline = ""
}


global = {
  \key g \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  b4 b b |
  a2 b4 |
  c2 fs,4 |
  g2. |
  d4 d d |
  b'2 a4 |
  a2. \bar "||"

  c4 c b |
  a2 g4 |
  fs2 e4 |
  d2. |
  d4 e g |
  b2 a4 |
  g2. \bar "|."
}

alto = \relative c' {
  \global
  d4 d d |
  e2 d4 |
  c( e) d |
  d2. |
  d4 d d |
  d2 cs4 |
  d2. |

  c4 e d |
  c2 cs4 |
  d2 cs4 |
  d2. |
  d4 d c |
  b2 c4 |
  b2.
}

tenor = \relative c' {
  \global
  b4 b g |
  c2 g4 |
  a2 a4 |
  b2. |
  c4 b a |
  g2 g4 |
  fs2. |

  e4 fs gs |
  a2 a4 |
  a2 g4 |
  fs2. |
  g4 g g |
  g2 fs4 |
  g2.
}

bass = \relative c' {
  \global
  g4 g b, |
  c2 b4 |
  a2 d4 |
  g2. |
  a4 g fs |
  g2 e4 |
  d2. |

  a4 a a |
  a2 a4 |
  d2 d4 |
  d2( c4) |
  b4 c e |
  d2 d4 |
  g,2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  \tagIt Shep -- herd of souls, re -- fresch and bless
  Thy cho -- sen pil -- grim flock
  \tagIt With man -- na in the wil -- der -- ness,
  With wa -- ter from the rock.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Hun -- gry and thir -- sty, faint and weak,
  As Thou when here be -- low,
  Our souls the joys ce -- les -- tial seek
  Which from Thy sor -- rows flow.
}

verseThree = \lyricmode {
  \set stanza = "3."
  We would not live by bread a -- lone,
  But by that word of grace,
  In strength of which we tra -- vel on
  To our a -- bid -- ing -- place.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Be known to us in break -- ing bread,
  But do not then de -- part;
  Sa -- viour, a -- bide with us, and spread
  Thy ta -- ble in our heart.
}

verseFive = \lyricmode {
  \set stanza = "5."
  There sup with us in love Di -- vine;
  Thy Bo -- dy and Thy Blood,
  That liv -- ing bread, that heav -- 'nly wine,
  Be our im -- mor -- tal food.
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
    \new Lyrics \lyricsto soprano \verseFive
    \new Staff  <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 88 4)
    }
  }
  \layout { }
}

