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
      \line {GROSSER GOTT  78 78 77}
    }
    \right-column{
      \line {\italic "Katholisches Gesangbuch" 1774}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Te deum laudamus" }
      \line {paraphrased as \italic "Grosser Gott, wir loben dich," Ignaz Franz}
      \line {tr. C.A. Walworth}
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

melody = \relative c' {
  \global
  f2 f4 |
  f( e) f |
  g( a) g |
  f2.

  a2 a4 |
  a( g) f |
  c'( bf) a4 |
  a g2 |

  f2 f4 |
  f( e) f |
  g( a) g |
  f2.

  a2 a4 |
  a( g) f |
  c'( bf) a4 |
  a g2 |

    g2 a4 |
    bf( a) g |
    a2 bf4 |
    c2.

    d2 d4 |
    c( bf) a |
    bf( a) g |
    f2.

    g2 a4 |
    bf( a) g |
    a2 bf4 |
    c2.

    d2 d4 |
    c( bf) a |
    bf( a) g |
    f2. \bar "|."
}

melodya = \relative c' {
  \global
  f2 f4 |
  f( e) f |
  g( a) g |
  f2.

  a2 a4 | \break
  a( g) f | 
  c'( bf) a4 |
  a g2 |

  f2 f4 |
  f( e) f | \break
  g( a) g |
  f2. | 

  a2 a4 |
  a( g) f |
  c'( bf) a4 |
  a g2 | \break

    g2 a4 |
    bf( a) g | 
    a2 bf4 |
    c2. |

    d2 d4 | \break
    c( bf) a |
    bf( a) g |
    f2. | 

    g2 a4 |
    bf( a) g | \break
    a2 bf4 |
    c2.

    d2 d4 |
    c( bf) a |
    bf( a) g |
    f2. \bar "|."
}

alto = \relative c' {
  \global 
  c2 c4 |
  c2 c4 |
  d( c) c |
  a2. |
  
  f'2 f4 |
  f( e) f | 
  g2 f4 |
  f4 e2 |
  
  c2 c4 |
  c2 c4 |
  d( c) c |
  a2. |
  
  f'2 f4 |
  f( e) f | 
  g2 f4 |
  f4 e2 |
  
  e2 f4 |
  g( f) e |
  f2 f4 |
  e2. |
  
  f2 f4 |
  e2 f4 |
  f2 e4 |
  d2.
  
  e2 f4 |
  g( f) e |
  f2 f4 |
  e2. |
  
  f2 f4 |
  e2 f4 |
  f2 e4 |
  f2.
}

tenor = \relative c' {
  \global
  a2 a4 |
  a( g) f |
  f2 e4 |
  f2. |
  
  c'2 c4 |
  c2 c4 |
  c2 c4 |
  c4 c2 |
  
  a2 a4 |
  a( g) f |
  f2 e4 |
  f2. |
  
  c'2 c4 |
  c2 c4 |
  c2 c4 |
  c4 c2 |
  
  c2 c4 |
  d( c) c |
  c2 bf4 |
  g2. |
  
  bf2 bf4 |
  g2 f4 |
  d'4( c) c |
  a2. |
  
  c2 c4 |
  d( c) c |
  c2 bf4 |
  g2. |
  
  bf2 bf4 |
  g2 f4 |
  d'4( c) c |
  a2.
}

bass = \relative c {
  \global
  f2 f4 |
  f( c) a |
  bf( c) c |
  f,2. |
  
  f'2 f4 |
  f( c) f |
  e2 f4 |
  c'4 c,2 |
  
  f2 f4 |
  f( c) a |
  bf( c) c |
  f,2. |
  
  f'2 f4 |
  f( c) f |
  e2 f4 |
  c'4 c,2 |

  c4( bf) a |
  g2 c4 |
  f( e) d |
  c2. |
  
  bf2 bf4 |
  c2 d4 |
  bf( c) c |
  d2. |
  
    c4( bf) a |
  g2 c4 |
  f( e) d |
  c2. |
  
  bf2 bf4 |
  c2 d4 |
  bf( c) c |
  f2. |
}
%%%%
%%%%
%%%%

altoA = \relative c' {
  \global
  c2 c4 |
  c2 c4 |
  d2 e4 |
  f2.
  f2 g4 |
  f( d) d |
  f2 f4 |
  f e2 |

  c2 c4 |
  c2 c4 |
  d2 e4 |
  f2.
  f2 g4 |
  f( d) d |
  f2 f4 |
  f e2 |

  e2 fs4 |
  g( f!) e |
  f2 f4 |
  g2. |
  f2 g4 |
  g2 f4 |
  d( f) e |
  d2.
  
    e2 fs4 |
  g( f!) e |
  f2 f4 |
  g2. |
  f2 f4 |
  e2 f4 |
  d( f) e |
  c2.
}

tenorA = \relative c' {
  \global
  a2 a4 |
  g2 c4 |
  g( f) c'4 |
  a2.
  c2 cs4 |
  d( bf) a |
  c( d) c |
  c c2 |

  a2 a4 |
  g2 c4 |
  g( f) c'4 |
  a2.
  c2 cs4 |
  d( bf) a |
  c( d) c |
  c c2 |

  c2 c4 |
  d( c) c |
  c2 d4 |
  e2.
  bf2 bf4 |
  c2 c4 |
  bf( c) c4 |
  a2.
  
  c2 c4 |
  d( c) c |
  c2 d4 |
  e2.
  af,2 af4 |
  g2 c4 |
  bf( c) c4 |
  a2.
}

bassA = \relative c {
  \global
  f2 f4 |
  c2 a4 |
  bf( d) c |
  f2.
  f2 e4 |
  d2 d4 |
  a( bf) f' |
  f4 c2 |

  f2 f4 |
  c2 a4 |
  bf( d) c |
  f2.
  f2 e4 |
  d2 d4 |
  a( bf) f' |
  f4 c2 |

  c4( bf) a |
  g( a) c |
  f( c) d |
  c2.
  bf2 g'4 |
  e2 f4 |
  g, a8[ bf] c4 |
  d2.
  
  c4( bf) a |
  g( a) c |
  f( c) d |
  c2.
  b2 b4 |
  c2 f4 |
  g, a8[ bf] c4 |
  f2.
}

%%%%
%%%%
%%%%

verseOne = \lyricmode {
  \set stanza = "1."
  Ho -- ly God, we praise thy name!
  Lord of all, we bow be -- fore thee;
  All on earth thy scep -- ter claim,
  All in heav'n a -- bove a -- dore thee;
  In -- fi -- nite thy vast do -- main,
  Ev -- er -- last -- ing is thy reign.
  
  In -- fi -- nite thy vast do -- main,
  Ev -- er -- last -- ing is thy reign.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Hark! the loud ce -- les -- tial hymn
  An -- gel choirs a -- bove are rais -- ing;
  Cher -- u -- bim and Ser -- a -- phim
  In un -- ceas -- ing cho -- rus prais -- ing,
  Fill the heav'ns with sweet ac -- cord:
  Ho -- ly, ho -- ly, ho -- ly Lord!
  
  Fill the heav'ns with sweet ac -- cord:
  Ho -- ly, ho -- ly, ho -- ly Lord!
}

verseThree = \lyricmode {
  \set stanza = "3."
  Ho -- ly Fa -- ther, Ho -- ly Son,
  Ho -- ly Spir -- it, Three we name thee,
  While in es -- sence on -- ly One,
  Un -- di -- vid -- ded God we claim thee,
  And a -- dor -- ing bend the knee,
  While we own the mys -- ter -- y.
  
  And a -- dor -- ing bend the knee,
  While we own the mys -- ter -- y.
}

\book {
  \include "hymn_paper_multipage.ly.ly"
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
  
    \markup { \smallCaps "Alternate Harmonization; Anon." }
  \score {
  \new ChoirStaff <<
    \new Staff  <<
      \new Voice = "soprano" { \voiceOne \melody }
      \new Voice = "alto" { \voiceTwo \altoA }
    >>
    \new Lyrics  \lyricsto soprano \verseOne
    \new Lyrics  \lyricsto soprano \verseTwo
    \new Lyrics  \lyricsto soprano \verseThree
    \new Staff  <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenorA }
      \new Voice = "bass" { \voiceTwo \bassA }
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
        \melodya
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
