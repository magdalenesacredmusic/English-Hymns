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
      \line {BRYN CALFARIA   87 87 47}
    }
    \right-column{
      \line {William Owen (1813-93); harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Thomas Kelly (1769-1855), 1809}
      \line {}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key g \minor
  \time 3/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d4 d g2 a |
  bf4 bf bf2 a |
  bf4 bf d2 c4( bf) |
  a a g1 \bar "||"

  d4 d g2 a |
  bf4 bf bf2 a |
  bf4 bf d2 c4( bf) |
  a a g1 \bar "||"

  g4 a bf2 g |
  a4 bf c2 a |
  bf4 c d2 bf4( d) \bar "||"

  ef8[ d] c4 d8[ c] bf4 c8[ bf] a8[ g] |
  d'1 bf4 bf |
  d2 c4( bf) a a |
  g1. \bar "|."
}

alto = \relative c' {
  \global
  bf4 bf d2 d |
  d4 d g2 fs |
  g4 g g2 g |
  g4 fs g1 |

  bf,4 bf d2 d |
  d4 d g2 fs |
  g4 g g2 g |
  g4 fs g1 |

  g4 g g2 d |
  a'4 g g2 fs |
  d4 f f2 d4( f) |

  ef4 f d ef ef ef8[ g] |
  fs1 g4 g |
  g2 g g4 fs |
  g1.
}

tenor = \relative c' {
  \global
  g4 g g2 fs |
  g4 g d'2 d |
  d4 d d2 ef |
  a,4 d bf1 |

  g4 g g2 fs |
  g4 g d'2 d |
  d4 d d2 ef |
  a,4 d bf1 |

  bf4 c d2 bf |
  d4 d ef2 d |
  bf4 a bf2 bf |

  bf4 a bf g c c8[ bf] |
  a1 g4 g |
  d'2 ef a,4 d |
  bf1.
}

bass = \relative c {
  \global
  g4 g bf2 d |
  g4 g g2 d |
  g4 g bf,2 c |
  d4 d g,1 |

  g4 g bf2 d |
  g4 g g2 d |
  g4 g bf,2 c |
  d4 d g,1 |

  g'4 g g2 g |
  fs4 g c,2 d |
  g4 f bf2 bf, |

  c4 f bf, ef a, c |
  d1 g4 g |
  bf,2 c d4 d |
  g,1.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Look, ye saints, the sight is glo -- rious;
  See the Man of Sor -- rows now!
  From the fight re -- turned vic -- to -- rious,
  Ev -- 'ry knee to him shall bow.
  Crown him! Crown him! Crown Him!
  Crown him! Crown him! Crown Him!
  Crowns be -- come the vic -- tor's brow,
  Crowns be -- come the vic -- tor's brow.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Crown the Sa -- viour! An -- gels, crown Him;
  Rich the tro -- phies Je -- sus brings;
  On the seat of pow'r en -- throne Him
  While the vault of heav -- en rings.
  Crown him! Crown him! Crown Him!
  Crown him! Crown him! Crown Him!
  Crown the Sa -- viour King of kings,
  Crown the Sa -- viour King of kings.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Sin -- ners in de -- ri -- sion crowned Him
  Mocki -- ng thus the Sa -- viour's claim;
  Saints and an -- gels crowd a -- round Him,
  Own His ti -- tle, praise His Name:
  Crown him! Crown him! Crown Him!
  Crown him! Crown him! Crown Him!
  Spread a -- broad the vic -- tor's fame,
  Spread a -- broad the vic -- tor's fame.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Hark, those bursts of ac -- cla -- ma -- tion!
  Hark, those loud tri -- um -- phant chords!
  Je -- sus takes the high -- est sta -- tion;
  Oh, what joy the sight af -- fords!
  Crown him! Crown him! Crown Him!
  Crown him! Crown him! Crown Him!
  King of kings, and Lord of lords!
  King of kings, and Lord of lords!
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
        tempoWholesPerMinute = #(ly:make-moment 76 2)
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

