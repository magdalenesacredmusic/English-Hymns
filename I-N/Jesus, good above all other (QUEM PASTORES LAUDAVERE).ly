\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Percy Dearmer (1867-1936), partly based on John Mason Neale (1818-1866)
      }
      \wordwrap {
        Music: QUEM PASTORES LAUDAVERE,88 87, German Melody, 14th cent.; Harm. Ralph Vaughan Williams (1872-1958)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {QUEM PASTORES LAUDAVERE}
    }
    \right-column{
      \line {German Melody, 14th cent.}
      \line {Harm. RVW}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Percy Dearmer (1867-1936)}
      \line {partly based on J.M. Neale (1818-1866)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
 f,2 a4 |
  c2 a4 |
  bf( c) d |
  c2 g4 |
  a( bf) c |
  bf( a) g |
  f2 d4 |
  e2 c4 |

  a'2 bf4 |
  c2 d4 |
  c2 g4 |
  a2 f4 |
  bf2 bf4 |
  a4( g) f |
  f( d) e |
  f2. \bar "|."
}

alto = \relative c' {
  \global
  f2 f4 
  g2 f4
  f2 f4
  f2 e4
  f2 f4
  d2 e4
  d2 b4
  c2 c4
  c2 f4
  f2 f4
  f2 e4
  e2 d4
  d2 g4
  e2 d4
  d2 c4
  c2.
}

tenor = \relative c' {
  \global
  a2 c4
  c2 c4
  bf2 bf4
  g( a) bf
  a2 a4
  bf2 bf4
  a2 g4
  g2 e4
  f2 f4 
  f2 bf4
  g( a) bf 
  a2 a4
  bf2 d4 
  c2 a4
  bf2 bf4
  a2.
}

bass = \relative c {
  \global
 f2 f4
 e2 f4
 d2 bf4
 c2 c4
 f2 a4
 g2 c,4
 d2 g4
 c,2 c4
 f2 d4
 a2 bf4
 c2 c4
 cs2 d4
 g,2 g4 
 a2 d4
 g,2 c4
 f2.
}

verseOne = \lyricmode {
  \vOne
  Je -- sus, good a -- bove all oth -- er,
  Gen -- tle Child of gen -- tle Moth -- er,
  In a sta -- ble born our Broth -- er,
  Give us grace to per -- se -- vere.
}

verseTwo = \lyricmode {
  \vTwo
  Je -- sus, cra -- dled in a man -- ger,
  For us fac -- ing ev -- 'ry dan -- ger,
  Liv -- ing as a home -- less stran -- ger,
  make we thee our King most dear.
}

verseThree = \lyricmode {
  \vThree
  Je -- sus, for thy peo -- ple dy -- ing,
  Ris -- en Mas -- ter, death de -- fy -- ing,
  Lord in heav'n, thy grace sup -- ply -- ing,
  Keep us to thy pre -- sence near.
}

verseFour = \lyricmode {
  \vFour
  Je -- sus, who our sor -- rows bear -- est,
  All our thoughts and hopes thou shar -- est,
  Thou to man the truth de -- clar -- est;
  Help us all thy truth to hear.
}

verseFive = \lyricmode {
  \vFive
  Lord, in all our do -- ing guide us;
  Pride and hate shall ne'er di -- vide us;
  We'll go on with thee be -- side us,
  And with joy we'll per -- se -- vere!
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
  \score { %\transpose c bf,
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
  \score { %\transpose c bf,
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
  \refs
}