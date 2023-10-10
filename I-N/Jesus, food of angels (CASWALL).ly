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
        Text: \italic "Partendo dal Mondo," Alphonsus Liguori (1696-1787); Tr. Edmund Vaughan (1827-1908)
      }
      \wordwrap {
        Music: CASWALL (WEM IN LEIDENSTAGEN), 65 65, Friedrich Filiz (1804-76), 1847
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {CASWALL (WEM IN LEIDENSTAGEN) 65 65}
    }
    \right-column{
      \line {Friedrich Filiz, 1847}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Partendo dal Mondo"}
      \line {Alphonus Liguori (1696-1787); Tr. Edmund Vaughan (1827-1908)}
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
  a4 a g g |
  f2 e2 |
  f4 f g g |
  a1 

  c4 c bf bf |
  a2 g2
  a4 a g g |
  f1 \bar "|."
}

alto = \relative c' {
  \global
  f4 f f e |
  e( d) cs2 |
  d4 f f e |
  f1 |

  e4 f d g |
  g( f) e2 |
  f4 f f e |
  f1
}

tenor = \relative c' {
  \global
  c4 c c c |
  a2 a |
  a4 a c c |
  c1 

  c4 a bf c |
  c2 c |
  c4 c d c |
  a1 
}

bass = \relative c {
  \global
  f4 f c c |
  d2 a |
  d4 d c c |
  f1 |

  a4 f g e |
  f2 c |
  f4 a, bf c |
  f1 |
}

verseOne = \lyricmode {
  \vOne
  Je -- sus, food of an -- gels,
  Mon -- arch of the heart;
  Oh, that I could nev -- er 
  From thy Face de -- part.
}

verseTwo = \lyricmode {
  \vTwo
  Yes, thou ev -- er dwell -- est
  Here for love of me,
  Hid -- den thou re -- main -- est
  God of Maj -- es -- ty.
}

verseThree = \lyricmode {
  \vThree
  Soon I hope to see thee,
  And en -- joy thy love,
  Face to face, sweet Je -- sus,
  In thy heaven a -- bove.
}

verseFour = \lyricmode {
  \vFour
But on earth an ex -- ile,
My de -- light shall be
Ev -- er to be near thee
Veiled for love of me.
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}