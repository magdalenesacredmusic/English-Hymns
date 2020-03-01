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
          \line {KING'S WESTON 65 65 D}
      }
      \column{
      \line {Ralph Vaughan Williams, 1925}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {C.M. Noel, 1870}
   }
  } 
}

\header {
  tagline = ""
}

global = {
  \key e \minor
  \time 3/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  e4^\markup { \italic "To be sung in unison." } fs g2 fs |
  e1 d2 |
  e4 fs g2 a |
  e1. | \break

  g4 a b2 b |
  b2.( a4) g2 |
  e4 g a2 g |
  a1. | \break

  fs4 g a2 fs |
  b2.( a4) g2 |
  a4 b d2 cs |
  d1. |

  e2 d b4 a |
  d2 b a4 b |
  g1 fs2 |
  e1. \bar "|."
}

alto = \relative c' {
  \global
  s2 d d |
  s1.

  s1.
  b1 c2

  d2 b d |
  <d fs>1 b2
  g e' d |
  c d e |

  fs e d |
  d fs b, |

  a' fs e |
  fs g a |

  b a fs |
  d fs
  e4 d |
  <b d>1 <a d>2 |
  s1.
}

tenor = \relative c' {
  \global
  g2 b a |
  g a b |
  g4 a b2 c |
  g1. |

  g2 g g |
  s1. |

  d2 c b |
  a b c |

  d c d |
  b s1 |

  s1. |
  s1.	|

  s1. |
  b2 d c4 g |

  b2. c4 d2 |
  s1.
}

bass = \relative c {
  \global
  e2 b d |
  e fs g |

  e d c |
  e d c |

  b g b |
  d1 e2 |

  s1. |
  s1. |

  s1. |
  s2 d e |

  fs2 g a |
  d, e fs |

  g fs d |
  s1. |

  s1. |
  <e g b>1.
}

verseOne = \lyricmode {
  \set stanza = "1."
  At the name of Je -- sus
  Ev -- 'ry knee shall bow,
  Ev -- 'ry tongue con -- fess Him
  King of glo -- ry now;
  'Tis the Fa -- ther's plea -- sure
  We should call Him Lord,
  Who from the be -- gin -- ning
  Was the might -- y word.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  At His voice cre -- a -- tion
  Spring at once to sight,
  All the An -- gel fac -- es,
  All the hosts of light,
  Thrones and dom -- in -- a -- tions,
  Stars up -- on their way,
  All the heav'n -- ly or -- ders,
  In their great ar -- ray.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Hum -- bled for a sea -- son,
  To re -- ceive a name
  From the lips of sin -- ners
  Un -- to whom He ame,
  Faith -- ful -- ly He bore it
  Spot -- less to the last,
  Brought it back vic -- to -- rious
  When from death He passed.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Bore it up tri -- um -- phant
  With its hu -- man light,
  Through all ranks of crea -- tures,
  To the cen -- tral height,
  To the throne of God -- head,
  To the Fa -- ther’s breast;
  Filled it with the glo -- ry
  Of that per -- fect rest.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Name Him, bro -- thers, \lal name_Him,
  With love as strong as death
  But with awe and won -- der,
  And with bat -- ed breath!
  He is God the Sa -- vior,
  He is Christ the Lord,
  Ev -- er to be wor -- shipped,
  Trust -- ed and a -- dored.
}

verseSix = \lyricmode {
  \set stanza = "6."
  In your hearts en -- throne Him;
  There let Him sub -- due
  All that is not ho -- ly,
  All that is not true;
  Crown Him as your Cap -- tain
  In temp -- ta -- tion’s hour;
  Let His will en -- fold you
  In its light and power.
}

verseSeven = \lyricmode {
  \set stanza = "7."
  Broth -- ers, this Lord Je -- sus
  Shall re -- turn a -- gain,
  With His Fa -- ther’s glo -- ry,
  With His an -- gel train;
  For all wreaths of em -- pire
  Meet up -- on His brow,
  And our hearts con -- fess Him
  King of glo -- ry now.
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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
      }
    }
    \include "hymn_layout.ly"
  }
  \bottom
  
    \markup {
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
     "Name Him, brothers, name_Him,"
  "With love as strong as death"
  "But with awe and won der,"
  "And with bat ed breath!"
  "He is God the Savior,"
  "He is Christ the Lord,"
  "Ever to be worshipped,"
  "Trusted and adored."
          }
        }
      }
      \hspace #0.1  % adds horizontal spacing between columns;
      % if they are still too close, add more " " pairs
      % until the result looks good
      \column {
        \line {
          \bold "6. "
          \column {
            "In your hearts enthrone Him;"
 "There let Him subdue"
  "All that is not holy,"
  "All that is not true;"
  "Crown Him as your Captain"
  "In temptation’s hour;"
  "Let His will enfold you"
  "In its light and power."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}

\markup {
  \large {
    \fill-line {
        \line {
          \bold "7. "
          \column {
    "Brothers, this Lord Jesus"
  "Shall return again,"
  "With His Father’s glory,"
  "With His angel train;"
  "For all wreaths of empire"
  "Meet upon His brow,"
  "And our hearts confess Him"
  "King of glory now."
          }
        }
      }
      \hspace #1.0

    }
  }  

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
      \new Lyrics \lyricsto "tune" { \verseFive}
      \new Lyrics \lyricsto "tune" { \verseSix }
      \new Lyrics \lyricsto "tune" { \verseSeven}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
