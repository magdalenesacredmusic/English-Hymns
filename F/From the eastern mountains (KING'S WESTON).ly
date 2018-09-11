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
     \line {Godfrey Thring (1823-1903)}
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
  e1 d2 \bar "||"

  e4 fs g2 a |
  e1. \bar "||"

  g4 a b2 b |
  b2.( a4) g2 \bar "||"

  e4 g a2 g |
  a1. \bar "||"

  fs4 g a2 fs |
  b2.( a4) g2 \bar "||"

  a4 b d2 cs |
  d1. \bar "||"

  e2 d b4 a |
  d2 b \bar "||"

  a4 b |
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
From the east -- ern moun -- tains
Press -- ing on they come,
Wise men in their wis -- dom,
To his hum -- ble home;
Stirred by deep de -- vo -- tion,
Hast -- ing from a -- far,
Ev -- er jour -- n'ying on -- ward,
Guid -- ed by a star.
}

verseTwo = \lyricmode {
  \set stanza = "2."
There their Lord and Sav -- ior
As an in -- fant lay,
Won -- drous light that led them
On -- ward on their way,
Ev -- er now to light -- en
Na -- tions from a -- far,
As they jour -- ney home -- ward
By that guid -- ing star.
}

verseThree = \lyricmode {
  \set stanza = "3."
Thou who in a man -- ger
Once hast low -- ly lain,
Who dost now in glo -- ry 
O'er all king -- doms reign,
Gath -- er in the peo -- ples,
Who in lands a -- far
Ne'er have seen the bright -- ness
Of thy guid -- ing star.
}

verseFour = \lyricmode {
  \set stanza = "4."
Gath -- er in the out -- casts,
All who've gone as -- tray,
Throw thy ra -- diance o'er them,
Guide theme on their way;
Those who nev -- er knew thee, 
Those who've wand -- ered far,
Guide tem by the bright -- ness
Of thy guid -- ing star.
}

verseFive = \lyricmode {
  \set stanza = "5."
On --  ward through the dark -- ness 
Of the lone -- ly night,
Shin -- ing still be -- fore them
With thy kind -- ly light,
Guide them, Jew and Gen -- tile,
Home -- ward from a -- far,
Young and old to -- geth -- er,
By thy guid -- ing star.
}

verseSix = \lyricmode {
  \set stanza = "6."
Un -- til ev' -- ry na -- tion
Wheth -- er bond or free,
'Neath thy star -- lit ban -- ner, 
Je -- sus, fol -- lows thee,
O'er the dis -- tant moun -- tains
To that heav'n -- ly home
Where nor sin and sor -- row
Ev -- er -- more shall come.
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
      \new Lyrics \lyricsto soprano \verseSix
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 96 2)
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
      \new Lyrics \lyricsto "tune" { \verseSix }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
