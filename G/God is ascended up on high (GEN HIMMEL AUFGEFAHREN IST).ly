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
      \line {GEN HIMMEL AUFGEFAHREN IST  88 88}
    }
    \right-column{
      \line {German, 16th cent.}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Gen himmel aufgefahren ist"}
      \line {tr. Henry More (1614-1687)}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4 
  g4 |
  g2 c4 |
  b4.( c8) d4 |
  c( bf) af |
  g2. |
  
  c,4 ef f |
  g4.( a8 b4) |
  c4 c b |
  c2. |
  
  ef4 d c |
  bf2 g4 |
  af2 f4 |
  ef2. |
  
  bf'4 bf c |
  d4.( c8 bf4) |
  a4 g fs |
  g2 \bar "|."
  
}

alto = \relative c' {
  \global
  \partial 4
ef8[ f]
g2 g4 |
g2 g4 |
g2 f4 |
d2. |

c4 ef f |
d2. |
f4 d g |
ef2. |

g4 bf af |
g2 d4 |
f2 d4 |
ef2. |

g4 bf a |
g4.( fs8 g4) |
d4 d a |
d2
}

tenor = \relative c' {
  \global
  \partial 4
c8[ d] |
ef2 ef4 |
d4.( c8) b4 |
c2 c4 |
b2. |

c4 c c |
b4.( a8 g4) |
a g d' |
c2. |

c4 g' ef |
ef2 bf4 |
c2 bf4 |
g2. |

ef'4 f ef |
d4.( a8 d4) |
a d d |
b2
}

bass = \relative c {
  \global
\partial 4
c4 |
c'2 c4 |
g2 g4 |
ef2 f4 |
g2. 

c4 bf a |
g2. |
f4 g g |
c,2. |

c'4 g af |
ef2 g4 |
f2 bf,4 |
ef2. |

ef'4 d c |
bf4.( a8 g4) |
fs4 e d |
g2
}

verseOne = \lyricmode {
  \set stanza = "1. "
God is as -- cend -- ed up on high,
With mer -- ry noise of trum -- pet's sound,
And prince -- ly seat -- ed in the sky,
Rules o -- ver all the world a -- round.
}

verseTwo = \lyricmode {
  \set stanza = "2. "
In hu -- man shape and flesh He went,
A -- dorn -- èd with His pas -- sion's scars,
Which in heav'n's sight He did pre -- sent
More glo -- rious than the glit -- t'ring stars.
}

verseThree = \lyricmode {
  \set stanza = "3. "
Lord, raise our sink -- ing minds there -- fore
Up to our pro -- per coun -- try dear,
And pu -- ri -- fy us ev -- er -- more,
To fit us for those re -- gions clear.
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}