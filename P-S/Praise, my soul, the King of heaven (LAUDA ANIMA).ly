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
      \line {LAUDA ANIMA  87 87 87}
    }
    \right-column{
      \line {John Goss (1800-1880), 1869}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Henry F. Lyte (1793-1847), 1834}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 2/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
a4 a |
a a|
d cs |
b2 |
a2 |
g4 fs |
b a |
fs g |
e2 |

fs4 fs |
fs fs |
b a |
a gs |
a b |
cs d |
fs, gs |
a2 |

d4 cs |
b a |
d cs |
b a |
b a |
g e |
d cs |
d2 \bar "|."
}

alto = \relative c' {
  \global
d4 d |
cs cs |
d a' |
a( g) |
fs2 |
d4 d |
d d |
d e |
cs2 |

cs4 e |
d cs |
b b |
d d |
cs e |
e d |
d d |
cs2 |

d4. d8 |
d4 cs |
d e8[ fs] |
g4 g |
fs e |
d b |
a a |
a2
}

tenor = \relative c {
  \global
fs4 fs |
g g |
a a |
b( cs) |
d2 |
g,4 a |
g a |
b b |
a( g) |

fs4 e |
d e |
fs b |
b b |
a d |
cs a |
b b |
a2 |

a4. a8 |
g4 g |
fs e8[ d] |
e4 a |
d cs |
b g |
fs e8[ g] |
fs2
}

bass = \relative c {
  \global
d4 d |
e e fs fs |
g2 |
d2 |
b4 d |
g fs |
b e, |
a,2 |

as4 as |
b cs |
d ds |
e es |
fs gs |
a fs |
d e |
a,2 |

fs'4. fs,8 |
g4 a |
b4. b8 |
cs4 cs |
d e8[ fs] |
g4 g, |
a a |
d2
}

verseOne = \lyricmode {
  \set stanza = "1. "
  Praise, my soul, the King of heav -- en,
  To his feet your trib -- ute bring;
  Ran -- somed, healed, re -- stored, for -- giv -- en,
  Who, like me, his praise should sing?
_ _ _ _ _ _ _ _ 
  Praise the ev -- er -- last -- ing King.
}

verseTwo = \lyricmode {
  \set stanza = "2. "
Praise him for his grace and fa -- vor
To our fa -- thers in dis -- tress;
Praise him, still the same for ev -- er,
Slow to chide, and swift to bless;
_ _ _ _ _ _ _ _ 
Glo --  rious in his faith -- ful -- ness.
}

verseThree = \lyricmode {
  \set stanza = "3. "
Fa -- ther -- like, he tends and spares us;
Well our fee -- ble frame he knows;
in his hands he gent -- ly bears us, 
Res -- cues us from all our foes;
Praise him, praise him, praise him, praise him,
Wide -- ly as his mer -- cy flows.
}

verseFour = \lyricmode {
  \set stanza = "4. "
Frail as sum -- mer's flow'r we flour -- ish,
Blows the wind and it is gone;
But while mor -- tals rise and per -- ish,
God en -- dures un -- chang -- ing on.
_ _ _ _ _ _ _ _ 
Praise the High E -- ter -- nal One.
}

verseFive = \lyricmode {
  \set stanza = "5. "
  An -- gels, help us to a -- dore him;
  Ye be -- hold him face to face;
  Sun and moon, bow down be -- fore him,
  Dwell -- ers all in time and space.
  _ _ _ _ _ _ _ _ 
  Praise with us the God of grace.
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
      \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
