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
  poet = \markup{ \fontsize #4 \smallCaps "Joy and Triumph Everlasting"  }
  meter = \markup { \small { Music: PSALM 42, 87.87.77.88; L. Bourgeois, 1551; harm. \italic "The English Hymnal," 1906 } }
  piece = \markup { \small {Text: \italic "Supernae matris gaudia," Adam of St. Victor, c. 1150; tr. R. Bridges, 1899 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

\paper {
  page-count = 1
}

global = {
  \key g \major
  \time 3/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g2 a4 b2 a4 |
  g fs e2 d |
  g a4 b2 c4 |
  \time 4/2 b2 a g1 \bar "||" \break

  \time 3/2 g2 a4 b2 a4 |
  g fs e2 d |
  g a4 b2 c4 |
  \time 4/2 b2 a g1 \bar "||" \break

  \time 3/2 b2 b4 d2 c4 | \noBreak
  b a b1 | \noBreak
  d2 d4 e2 d4 | \noBreak
  c b a1 \bar "||" \break

  b2 d4 c2 b4 | \noBreak
  g a b2 g | \noBreak
  b2 b4 c2 b4 | \noBreak
  a g fs2 g \bar "|."

}

alto = \relative c'' {
  \global
  g2 fs4 g2 d4 |
  e d d( c) b2 |
  e d4 g2 e4 |
  g2 fs g1 |

  e2 d4 d2 d4 |
  b d d( cs) d2 |
  e2 fs4 g2 g4 |
  g2. fs4 g1 |

  g2 g4 g2 e4 |
  g fs g1 |
  f2 f4 e2 fs4 |
  g g g2( fs) |

  g2 fs4 e2 d4 |
  g e fs2 g |
  gs2 gs4 a2 g4 |
  e e a,2 b
}

tenor = \relative c' {
  \global
  b2 d4 d2 d4 |
  b b g2 g |
  b2 d4 d2 c4 |
  d2. c4 b1 |

  b2 a4 g2 fs4 |
  g a b( a) fs2 |
  g c4 b2 e4 |
  e2. d4 b1 |

  d2 d4 b2 a4 |
  d d d1 |
  a2 b4 c2 b4 |
  g d' d1 |

  d2 d4 g,( a) b |
  b e e( ds) e2 |
  e2 e4 e2 d4 |
  c b d2 d
}

bass = \relative c' {
  \global
  g2 d4 g2 fs4 |
  e b c2 g |
  e'2 fs4 g2 a,4 |
  b( c) d2 g,1 |

  e'2 fs4 g2 d4 |
  e fs g( a) d,2 |
  c a4 g2 c4 |
  e( d) c( d) g,1

  g'2 g4 g,2 a4 |
  b d g,1 |
  d'2 d4 c2 d4 |
  e g d1 |

  g2 b,4 e4( fs) g |
  e c b2 e |
  e e4 a,2 b4 |
  c e d2 g
}

verseOne = \lyricmode {
  \set stanza = "1."
  Joy and tri -- umph ev -- er -- last -- ing
  Hath the heav'n -- ly Church on high;
  For that pure im -- mor -- tal glad -- ness
  All our feast -- days mourn and sign:
  Yet in death's dark des -- ert wild
  Doth the mo -- ther aid her child,
  Guards ce -- les -- tial thence at -- tend us,
  Stand in com -- bat to de -- fend us.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Here the world's per -- pe -- tual war -- fare
  Holds from heav'n the soul a -- part;
  Le -- gioned foes in shad -- owy ter -- ror
  Vex the Sab -- bath of the heart.
  O how hap -- py that es -- tate
  Where de -- light doth not a -- bate;
  For that home the spir -- it yearn -- eth,
  Where none lan -- guish -- eth nor mourn -- eth.
}

verseThree = \lyricmode {
  \set stanza = "3."
  There the bo -- dy hath no tor -- ment,
  There the mind is free from care,
  There is ev' -- ry voice re -- joic -- ing,
  Ev' -- ry heart is lov -- ing there.
  An -- gels in that ci -- ty dwell;
  Them their King de -- light -- eth well:
  Still they joy and wear --  y nev -- er,
  More and more de -- sir -- ing, ev -- er.
}

verseFour = \lyricmode {
  \set stanza = "4."
  There the seers and fa -- thers ho -- ly,
  There the pro -- phets glo -- ri -- fied,
  All their doubts and dark -- ness end -- ed,
  In the Light of light a -- bide.
  There the Saints, whose mem' ries old
  We in faith -- ful hymns up -- hold,
  Have for -- got their bit -- ter sto -- ry
  In the joy of Je -- sus' glo -- ry.
}

verseFive = \lyricmode {
  \set stanza = "5."
  There from low -- li -- ness ex -- alt -- ed
  Dwell -- eth Ma -- ry, Queen of grace,
  Ev -- er with her pre -- sence plead -- ing
  'Gainst the sin of A -- dam's race.
  To that glo -- ry of the blest,
  By their prayers and faith con -- fest,
  Us, us too, when death hath freed us,
  Christ of His good mer -- cy lead us.
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
      tempoWholesPerMinute = #(ly:make-moment 120 4)
    }
  }
  \layout { }
}

