\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {UNIVERSITY COLLEGE   77 77}
    }
    \right-column{
      \line {H.J. Gauntlett (1805-76)}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Henry Kirke White (1785-1806)}
      \line {and others}
    }
  }
}

\header {
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
  a4 f d' c |
  bf a g2 |
  a4 f c' c |
  c b c2 |
  
  a4 g f d' |
  c bf a2 |
  a4 a c a |
  a g f2 \bar "|."
}

alto = \relative c' {
  \global
  f4 f f f |
  g f e2 |
  f4 f a g |
  f f e2 |
  
  f4 e f f |
  f f8[ e] f2 |
  e4 f e f |
  f e f2
}

tenor = \relative c' {
  \global
  c4 a bf c |
  c c c2 |
  c4 c c c |
  d d g,2 |
  a4 c8[ bf] a4 bf8[ a] |
  g4 c c2 |
  a4 f g a8[ bf] |
  c4 c8[ bf] a2
}

bass = \relative c {
  \global
 f4 f bf a |
 e f c2 |
 f4 a f e |
 d d c2 |
 
 f4 c d bf |
 c c f2 |
 cs4 d c f |
 c c f2
}

verseOne = \lyricmode {
  \vOne
  Oft in dan -- ger, oft in woe,
  On -- ward, Chris -- tians, on -- ward go;
  Bear the toil, main -- tain the strife,
  Strength -- ened with the Bread of Life.
}

verseTwo = \lyricmode {
  \vTwo
  On -- ward, Chris -- tians, on -- ward go,
  Join the war, and face the foe;
  Will ye flee in dan -- ger's hour?
  Know ye not your Cap -- tain's power?
}

verseThree = \lyricmode {
  \vThree
Let your droop -- ing hearts be glad;
March in heav'n -- ly ar  -- mor clad;
Fight, nor think the bat -- tle long,
Vic -- t'ry soon shall tune your song.
}

verseFour = \lyricmode {
  \vFour
  Let not sor -- row dim your eye,
  Soon shall ev -- 'ry tear be dry;
  Let not fears your course im -- pede,
  Great your strength, if great your need.
}

verseFive = \lyricmode {
  \vFive
  On -- ward then in bat -- tle move;
  More than con -- querors ye shall prove;
  Though op -- posed by man -- y~a foe,
  Chris -- tian sol -- diers, on -- ward go.
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
    \include "hymn_layout.ly"
  }
  \bottom
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Hymnal")
\book {
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  \top
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
      \new Lyrics \lyricsto "tune" { \verseFour}
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
