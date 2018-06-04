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
  poet = \markup{ \fontsize #4 \smallCaps "O Worship the Lord"  }
  meter = \markup { \small { Music: WAS LEBET, WAS SCHWEBET, 13 10.13 10.; Üttingen, 1754  } }
  piece = \markup { \small {Text: J.S.B. Monsell, 1863 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}


global = {
  \key d \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  \teeny a4 |
  \normalsize d, d e |
  fs fs a |
  g4. fs8 e4 |
  fs4. fs8 fs4 \bar "||" \break

  e4 d e |
  fs gs a |
  a b gs |
  a2 \bar "||" \break

  \teeny cs4 |
  \normalsize d4 d c |
  b b a |
  g a fs |
  e4. e8 e4 \bar "||" \break

  a4 a fs |
  b cs d |
  d e cs |
  d2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  \teeny e4 |
  \normalsize a, b cs |
  d d e |
  d4. d8 cs4 |
  d4. d8 d4 |

  b8[ cs] d4 cs |
  d b a
  fs' fs e |
  e2

  \teeny e4 |
  \normalsize
  d4 fs8[ g] a4 |
  a g fs |
  e e d |
  cs4. cs8 cs4 |

  d e d |
  d g fs |
  g g e |
  fs2
}

tenor = \relative c' {
  \global
  \partial 4
  \teeny a4 |
  \normalsize fs4 g g |
  a a a |
  b4. a8 a4 |
  a4. a8 a4 |

  g4 a g |
  a d cs |
  d d b |
  cs2

  \teeny a4 |
  \normalsize a4 a d |
  d d d |
  b a a |
  a4. a8 a4 |

  a4 a a |
  g e' d |
  b b a |
  a2
}

bass = \relative c {
  \global
  \partial 4
  \teeny cs4 |
  \normalsize d4 g8[ fs] e4 |
  d d cs |
  b4. d8 a4 |
  d4. d8 d4 |

  g fs e |
  d4 e fs |
  d b e |
  a2

  \teeny a4 |
  \normalsize fs d8[ e] fs4 |
  g g d |
  e cs d |
  a4. a'8 g4 |
  fs cs d |
  g a b |
  g e a |
  d,2
}

verseOne = \lyricmode {
  \set stanza = "1."
  O wor -- ship the Lord in the beau -- ty of ho -- li -- ness!
  Bow down be -- fore him, his glo -- ry pro -- claim;
  With gold of o -- be -- dience, and in -- cense of low -- li -- ness,
  Kneel and a -- dore him: the Lord is his Name!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  _ Low at his feet lay thy bur -- den of care -- ful -- ness,
  High on his heart he will bear it for thee,
  _ Com -- fort thy sor -- rows, and an -- swer thy prayer -- ful -- ness,
  Guid -- ing thy steps as may best for thee be.
}

verseThree = \lyricmode {
  \set stanza = "3."
  _ Fear not to en -- ter his courts in the slen -- der -- ness
  Of the poor wealth thou wouldst reck -- on as thine;
  _ Truth in its beau -- ty, and love in its ten -- der -- ness,
  These are the of -- f'rings to lay on his shrine.
}

verseFour = \lyricmode {
  \set stanza = "4."
  _ These, though we bring them in trem -- bling and fear -- ful -- ness,
  He will ac -- cept for the Name that is dear;
  _ Morn -- ings of joy give for ev -- 'nings of tear -- ful -- ness,
  Trust for our trem -- bling and hope for our fear.
}

verseFive = \lyricmode {
  \set stanza = "5."
  O wor -- ship the Lord in the beau -- ty of ho -- li -- ness!
  Bow down be -- fore him, his glo -- ry pro -- claim;
  With gold of o -- be -- dience, and in -- cense of low -- li -- ness,
  Kneel and a -- dore him: the Lord is his Name!
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
      tempoWholesPerMinute = #(ly:make-moment 96 4)
    }
  }
  \layout { }
}
