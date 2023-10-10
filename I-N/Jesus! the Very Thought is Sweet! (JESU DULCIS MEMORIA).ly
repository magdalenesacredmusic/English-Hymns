%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/
%}

\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Jesu, dulcis memoria," St. Bernard; tr. John Mason Neale (1818-66)
      }
      \wordwrap {
        Music: JESU DULCIS MEMORIA, LM, Cöln Gesangbuch, 1619, Harm. \italic "The English Hymnal," 1906
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {JESU DULCIS MEMORIA  LM}
    }
    \right-column{
      \line {Cöln Gesangbuch, 1619}
      \line {harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Jesu, dulcis memoria"}
      \line {St. Bernard; tr. John Mason Neale}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key g \minor
  \time 4/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g2 f4 g a2 a |
  bf a4( g) a1 |
  g2 f4 g a2 f | \break
  g f4( e) d1 \bar "|"

  g2 f4 g a2 a | \break
  bf a4( g) a1 |
  d2 d4 c d2. c4 |
  bf2 a g1 \bar "|."
}

alto = \relative c' {
  \global
  d2 d4 d f2 f |
  f2 f4( g) fs1 |
  d2 d4 d d2 d |
  d cs d1 |

  d2 d4 d f2 f |
  f f4( g) d1 |
  d2 f4 f f2. ef4 |
  d2 d bf1
}

tenor = \relative c' {
  \global
  bf2 a4 bf c2 c |
  d c4( g) d'1 |
  bf2 a4 bf a2 a |
  bf a4( g) fs1 |

  g2 a4 bf c2 c |
  d c4( g) fs1 |
  f2 bf4 a bf2. g4 |
  g2 fs g1
}

bass = \relative c' {
  \global
  g2 d4 g f2 f |
  bf, f'4( ef) d1 |
  g2 d4 g f2 d |
  g, a d1 |

  bf2 d4 g f2 f |
  bf,2 f'4( ef) d1 |
  bf2 bf4 f' bf,2. c4 |
  d2 d g,1
}

verseOne = \lyricmode {
  \vOne
  Je -- su! the ve -- ry thought is sweet!
  In that dear name all heart -- joys meet;
  But sweet -- er than the hon -- ey far
  The glimp -- ses of His pre -- sence are.
}

verseTwo = \lyricmode {
  \vTwo
  No word is sung more sweet than this:
  No name is heard more full of bliss:
  No thought brings sweet -- er com -- fort nigh,
  Than Je -- sus, Son of God most high.
}

verseThree = \lyricmode {
  \vThree
  Je -- su! the hope of souls for -- lorn!
  How good to them for sin that mourn!
  To them that seek Thee, O how kind!
  But what art Thou to them that find?
}

verseFour = \lyricmode {
  \vFour
  Je -- su, Thou sweet -- ness, pure and blest,
  Truth's Foun -- tain, Light of souls dis -- trest,
  Sur -- pas -- sing all that heart re -- quires,
  Ex -- ceed -- ing all that soul de -- sires!
}

verseFive = \lyricmode {
  \vFive
  No tongue of mor -- tal can ex -- press,
  No let -- ters write its bles -- sed -- ness:
  A -- lone who hath Thee in his heart
  Knows, love of Je -- sus! what Thou art.
}

extraVerses = 
  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "O Jesu! King of wondrous might!"
            "O Victor, glorious from the fight!"
            "Sweetness that may not be exprest,"
            "And altogether loveliest!"
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "Remain with us, O Lord, to-day!"
            "In every heart Thy grace display:"
            "That now the shades of night are fled,"
            "On Thee our spirits may be fed."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "All honour, laud, and glory be,"
            "O Jesu, Virgin-born, to Thee!"
            "All glory, as is ever meet,"
            "To Father and to Paraclete."
          }
        }
      }
      \hspace #1.0
    }
  }
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
      }
    }
    \include "hymn_layout.ly"
  }
  \extraVerses
  \markup {
    \vspace #0.5
  }
  % \bottom
  \refs
}

%%%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 16)
#(define output-suffix "Hymnal")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  %\top
  \score { %\transpose c d
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
    \include "hymn_hymnal_layout.ly"
  }    
  \extraVerses
  \markup {
    \vspace #0.5
  }
  \refs
  %\bottom
}
%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  %  \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \extraVerses
  \markup {
    \vspace #0.5
  }
  \refs
}