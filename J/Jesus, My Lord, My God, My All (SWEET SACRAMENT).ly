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
  poet = \markup{ \fontsize #4 \smallCaps "Jesus, My Lord, My God, My All"  }
  meter = \markup { \small { Music: SWEET SACRAMENT, L.M., with refrain; \italic "Romischkatholishes Gesangbuchlein," 1862} }
  piece = \markup { \small {Text: St. 1-2, F.W. Faber; St. 3, \italic "Mediator Dei Hymnal," ©1955 GIA }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key ef \major
  \time 3/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  bf4 g ef |
  ef( d) ef |
  f( bf) af |
  af( g2)  |
  g4 f ef |
  af2 f4 |
  ef2 d4 |
  ef2. |

  bf'4 g ef |
  ef( d) ef |
  f( bf) af |
  af( g2)  |
  g4 f ef |
  af2 f4 |
  ef2 d4 |
  ef2. \bar "||"

  bf'4^\markup { \italic Refrain} bf bf |
  c2 c4 |
  d2 d4 |
  ef2. |
  bf4 af g |
  c2 af4 |
  f( bf) af |
  af( g2) |
  g4 f ef |
  af2 f4 |
  ef2 d4 |
  ef2. \bar "|."
}

alto = \relative c' {
  \global
  ef4 ef ef |
  bf2 bf4 |
  bf( d) f |
  f( ef2) |
  ef4 d c |
  c2 c4 |
  bf( c) bf |
  bf2. |
  ef4 ef ef |
  bf2 bf4 |
  bf( d) f |
  ef2. |
  ef4 d ef |
  c2 c4 |
  bf( c) bf |
  bf2. |

  ef4 d ef |
  ef2 f4 |
  af( g) f |
  ef2. |
  ef4 f ef |
  ef2 f4 |
  ef( d) f |
  f( ef2) |
  ef4 d c |
  c2 c4 |
  c( bf) bf |
  bf2. \bar "|."
}

tenor = \relative c' {
  \global
  g4 bf bf |
  af2 g4 |
  bf2 bf4 |
  bf2. |
  bf4 bf g |
  f( g) af |
  g( af) f |
  g2. |

  g4 bf af |
  bf( af) g |
  bf2 bf4 |
  bf2. |
  bf4 af bf |
  af2 af4 |
  g( af) f |
  g2. |

  g4 af bf |
  af( bf) af |
  c( bf) af |
  g( c2) |
  bf4 bf bf |
  af( bf) c |
  bf2 bf4 |
  bf2. |
  bf4 bf g |
  f( g) af |
  af( g) f |
  g2. \bar "|."
}

bass = \relative c {
  \global
  ef4 ef g |
  f2 ef4 |
  d( bf) d |
  ef2. |
  ef4 bf c |
  f2 af,4 |
  bf2 bf4 |
  ef2. |

  ef4 ef f |
  g( f) ef |
  d( bf) d |
  ef2. |
  ef4 f g |
  f( f,) af |
  bf2 bf4 |
  ef2. |

  ef4 f g |
  af( g) f |
  bf,2 bf4 |
  c2. |
  g'4 d ef |
  af( g) f |
  bf( bf,) d |
  ef2. |
  ef4 bf c |
  f2 af,4 |
  bf2 bf4 |
  ef2. \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  \tagIt Je -- sus, my Lord, my God, my All,
  How can I love Thee as I ought?
  And how re -- vere this won -- drous gift,
  So far sur -- pass -- ing hope or thought?
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Had I but Mar -- y's sin -- less heart,
  To love Thee with, my dear -- est King;
  O! with what bursts of fer -- vent praise,
  Thy good -- ness, Je -- sus would I sing.

  Sweet Sac -- ra -- ment, we Thee a -- dore!
  O make us love Thee more and more!
  O make us love Thee more and more.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O! see up -- on the al -- tar placed
  The vic -- tim of di -- vin -- est love!
  Let all the earth be -- low a -- dore,
  And join the choirs of heav'n a -- bove.
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
    \new Staff  <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 100 4)
    }
  }
  \layout { }
}


