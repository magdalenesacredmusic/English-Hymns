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
  poet = \markup{ \fontsize #4 \smallCaps "Jesus, Name All Names Above"  }
  meter = \markup { \small { Music: WERDE MUNTER, 76.76.88.77.; mel., J. Schop, c. 1640; arr. \italic "The English Hymnal," 1906, after J.S. Bach} }
  piece = \markup { \small {Text: Ἰησοῠ γλκύτατε, Theoctistus, c. 890; tr. J.M. Neale, alt. (orig. "“Jesu”") }}
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

melody = \relative c'' {
  \global
  a4 bf c c |
  bf a g2 \bar "||"

  a4 bf c bf8[ a] |
  g2 f \bar "||"

  a4 bf c c |
  bf a g2 \bar "||"

  a4 bf c bf8[ a] |
  g2 f \bar "||"

  g4 a bf8[ a] bf[ c] |
  a4 a g g \bar "||"

  bf4 c d c8[ d16 ef] |
  d4 c8[ bf] bf4 bf \bar "||"

  a4 bf c c |
  bf a g2 \bar "||"

  a4 bf c bf8[ a] |
  g4. f8 f2 \bar "|."
}

alto = \relative c' {
  \global
  f4 f e f |
  f8[ e] f4 e2 |

  f4 e8[ d] c4 d |
  d( c) c2

  f4 f e f |
  f8[ e] f4 e2 |

  f4 e8[ d] c4 d |
  d( c) c2

  e4 fs g8[ fs] g4 |
  g fs d d |

  g4 g8[ f!] f4 g |
  f ef8[ d] d4 d |

  c4 f c8[ d] e4 |
  f f e2 |

  f4 e8[ d] c4 d|
  d c c2
}

tenor = \relative c' {
  \global
  c4 d c8[ bf] a4 |
  bf c c2 |

  c4 g g8[ e] f4 |
  f( e) a2 |

  c4 d c8[ bf] a4 |
  bf c c2 |

  c4 g g8[ e] f4 |
  f( e) a2 |

  c4 c d g, |
  ef' d8[ c] bf4 bf |

  d4 c bf8[ a] bf4 |
  bf8[ g] a4 bf bf |

  f4 bf g c |
  d c c2 |

  c4 bf a8[ g] f4 |
  f e8[ bf'] a2
}

bass = \relative c {
  \global
  f4 d a d |
  g, a8[ bf] c2 |

  f,4 g a d8[ c] |
  bf4( c) f,2 |

  f'4 d a d |
  g, a8[ bf] c2 |

  f,4 g a d8[ c] |
  bf4( c) f,2 |

  c'4 bf8[ a] g4 ef' |
  c d g, g |

  g a bf ef |
  f f, bf bf |

  f'8[ e] d4 e a |
  d,8[ e] f4 c2 |

  f,4 g a d8[ c] |
  bf4 c f,2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Je -- sus, name all names a -- bove;
  Je -- sus, best and dear -- est;
  Je -- sus, Fount of per -- fect love,
  Ho -- liest, ten -- derest, near -- est:
  Je -- sus, Source of grace com -- plet -- est;
  Je -- sus pur -- est, Je -- sus sweet -- est;
  Je -- sus, Well of power Di -- vine,
  Make me, keep me, seal me thine!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Woe that I have turned a -- side
  Af -- ter flesh -- ly plea -- sure!
  Woe that I have nev -- er tried
  For the heav'n -- ly trea -- sure!
  Trea -- sure, safe in himes su -- per -- nal,
  In -- cor -- rup -- ti -- ble, e -- ter -- nal;
  Trea -- sure no less price hath won
  Than the Pas -- sion of the Son!
}

verseThree = \lyricmode {
  \set stanza = "3."
  Je -- sus, crowned with thorns for me,
  Scourged for my trans -- gres -- sion!
  Wit -- ness -- ing, through a -- go -- ny,
  That Thy good con -- fes -- sion!
  Je -- sus, clad in pur -- ple rai -- ment,
  For my e -- vils mak -- ing pay -- ment:
  Let not all Thy woe and pain,
  Let not Cal -- v'ry be in vain!
}

verseFour = \lyricmode {
  \set stanza = "4."
  Je -- sus, o -- pen me the gate
  That of old He en -- tered
  Who, in that most lost es -- tate,
  Whol -- ly on Thee ven -- tured;
  Thou, whose wounds are ev -- er plead -- ing
  And Thy Pas -- sion in -- ter -- ced -- ing,
  From my mis -- ery let me rise
  To a home in Par -- a -- dise!
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
      tempoWholesPerMinute = #(ly:make-moment 84 4)
    }
  }
  \layout { }
}
