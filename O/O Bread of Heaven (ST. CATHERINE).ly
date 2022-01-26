%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {ST. CATHERINE  88 88 88 }
    }
    \right-column{
      \line {H.F. Hemy, 1864; arr. J.G. Walton, 1870, harm. various}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {A. de' Liguori; tr. E. Vaughan}
    }
  } 
}

\header {
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
  b4 a g |
  g( fs) g |
  a( e) fs |
  g2. |

  g4 fs e |
  d2 g4 |
  g( fs) g |
  a2. |

  b4 a g |
  g( fs) g |
  a( e) fs |
  g2. |

  g4 fs e |
  d2 b'4 |
  a( b) a |
  g2. |

  c4 c c |
  b2 b4 |
  a2 a4 |
  b2. |

  b4 a g |
  e2 g4 |
  a2 a4 |
  g2. \bar "|."
}

alto = \relative c' {
  \global
  d4 d d |
  d2 d4 |
  e2 d4 |
  d2. |

  e4 d c |
  b2 d4 |
  cs2 cs4 |
  d2. |

  d4 d d |
  d2 d4 |
  e2 d4 |
  b2. |

  e4 d c |
  b2 d4 |
  e2 c4 |
  b2. |

  g'4 g g |
  g2 g4 |
  g( e) fs4 |
  g2. |

  b,4 c d |
  c2 b4 |
  g'4( e) fs4 |
  d2.
}

tenor = \relative c' {
  \global
  d4 c b |
  b( c) b |
  c2 a4 |
  b2. |

  g4 g g |
  b2 b4 |
  a2 g4 |
  fs2. |

  g4 c b |
  b( a) g |
  c2 a4 |
  g2. |

  g4 g g |
  g2 g4 |
  g2 fs4 |
  g2. |

  e'4 c e |
  d2 d4 |
  d2 d4 |
  d2. |

  g,4 g g |
  g( a) g  |
  d'2 c4 |
  b2.
}

bass = \relative c' {
  \global
  g4 g g |
  g( a) g |
  c,2 d4 |
  g,2. |

  c4 c e |
  g2 g4 |
  e2 e4 |
  d2. |

  g4 g g |
  d( c) b |
  a2 d4 |
  e2. |

  c4 c c |
  g2 b4 |
  a2 d4 |
  g,2. |

  c4 e c |
  g'2 g4 |
  d2 d4 |
  g,2.|

  g4 a b |
  c2 e4 |
  d2 d4 |
  g,2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  \tagIt O Bread of Heav'n, be -- neath this veil
  \tagIt Thou dost my ve -- ry God con -- ceal:
  \tagIt My Je -- sus, dear -- est trea -- sure, hail!
  \tagIt I love Thee and, a -- dor -- ing, kneel;
  \tagIt Each lov -- ing soul by Thee is fed
  \tagIt With Thine own Self in form of Bread.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  O food of life, Thou Who dost give
  The pledge of im -- mor -- tal -- i -- ty;
  I live, no 'tis not I that live;
  God gives me life, God lives in me:
  He feeds my soul, He guides my ways,
  And ev' -- ry grief with joy re -- pays.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O Bond of love that dost u -- nite
  The ser -- vant to his liv -- ing Lord;
  Could I dare live and not re -- quite
  Such love- then death were meet re -- ward:
  I can -- not live un -- less to prove
  Some love for such un -- meas -- ured love.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Be -- lov -- ed Lord, in Heav'n a -- bove
  There, Je -- sus, Thou a -- wait -- est me,
  To gaze on Thee with end -- less love;
  Yes, thus I hope, thus shall it be:
  For how can He de -- ny me Heav'n,
  Who here on earth Him -- self hath giv'n?
}

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
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
    \include "hymn_layout.ly"
  }
  \bottom
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}