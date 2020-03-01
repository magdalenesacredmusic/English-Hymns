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
      \line {UNSER HERRSCHER (NEANDER)  87 87 77}
    }
    \right-column{
      \line {J. Neander, 1680; harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Thut mir auf die schöne Pforte"}
      \line {Benjamin Schmolck, 1704}
      \line {tr. Catherine Winkworth}
    }
  } 
}

\header {
  tagline = ""
}

\paper {
  page-count = 1
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  c4. d8 e4 c |
  e4 f g g |
  c4 b8[ a] g4 e' |
  d d c2 \bar "||"

  c,4. d8 e4 c |
  e4 f g g |
  c4 b8[ a] g4 e' |
  d d c2 \bar "||"

  e4. e8 d4 d |
  c4. c8 b2 |
  a4. a8 g4 c |
  d b c2 \bar "|."
}

alto = \relative c' {
  \global
  c4. b8 c4 c |
  c c d d |
  c d e g |
  a g e2 |

  c4. b8 c4 c |
  c c d d |
  c d e g |
  a g e2 |

  g4. g8 g4 g |
  e4. e8 e2 |
  c4 b c e |
  d d e2
}

tenor = \relative c {
  \global
  e4. g8 g4 g |
  a c c b |
  a b c c |
  c b c2 |

  e,4. g8 g4 g |
  a c c b |
  a b c c |
  c b c2 |

  c4. c8 c4 b |
  \mergeDifferentlyDottedOn a4. a8 a4( gs) |
  a f g a |
  a g g2
}

bass = \relative c {
  \global
  c4. g8 c4 e |
  a a g g |
  a g8[ f] e4 c |
  f g c,2 |

  c4. g8 c4 e |
  a a g g |
  a g8[ f] e4 c |
  f g c,2 |

  c4 e8[ f] g4 g |
  a c,8[ d] e2 |
  f4 d e a |
  f g c,2

}

verseOne = \lyricmode {
  \set stanza = "1."
  O -- pen now thy gates of beau -- ty,
  Zi -- on, let me en -- ter there,
  Where my soul in joy -- ful du -- ty
  Waits on him who an -- swers prayer:
  O how bless -- ed is this place,
  Filled with sol -- ace, light, and grace.
}

verseTwo = \lyricmode {
  \set stanza = "2."
Here, O God, I come be -- fore thee,
Come thou al -- so down to me;
Where we find thee and a -- dore thee,
There a heav'n on earth must be:
To my heart O en -- ter thou,
Let it be thy tem -- ple now.
}

verseThree = \lyricmode {
  \set stanza = "3."
Here thy praise is glad -- ly chant -- ed,
Here thy seed is du -- ly sown;
Let my soul, where it is plant -- ed,
Bring forth pre -- cious sheaves a -- lone:
So that all I hear may be
Fruit -- ful un -- to life in me.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Thou my faith in -- crease and quick -- en,
  Let me keep thy gift di -- vine;
  How -- so -- e'er temp -- ta -- tions thick -- en,
  May thy word still o'er me shine,
  As my guid -- ing star through life,
  As my com -- fort in my strife.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Speak, O God, and I will hear thee,
  Let thy will be done in -- deed;
  May I un -- dis -- turbed draw near thee
  While thou dost thy peo -- ple feed;
  Here of life the foun -- tain flows,
  Here is balm for all our woes.
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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
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
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
