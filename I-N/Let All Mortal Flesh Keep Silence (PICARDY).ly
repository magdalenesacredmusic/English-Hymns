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
      \line {PICARDY   87 87 87}
    }
    \right-column{
      \line {French Tune}
      \line {harm. Ralph Vaughan Williams}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Σιγησάτο παρα σὰρξ βροτεία}
      \line {Liturgy of St. James; tr. Gerard Moultrie, 1864}
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

melody = \relative c' {
  \global
  d4 e f g |
  a2 a4( g) |
  a2 a |

  a4 a bf c |
  bf2 a4( g) |
  a1 |

  d,4 e f g |
  a2 a4( g) |
  a2 a |

  a4 a bf c |
  bf2 a4( g) |
  a1 |

  a4 a d a |
  g2. f4 |
  d( f a f) |
  e1 |

  a4 a d a |
  g2 e4( f) |
  d1 \bar "|."
}

alto = \relative c' {
  \global
  <a d>1~ |
  <a d>2 <<{f'4 e}\\{d2}>>
  <c f>1 |

  f2 ef |
  <d f>2. e!4~ |
  <cs e>1 |

  d1 |
  <c f>2 <bf d> |
  <d f>1 |

  f2 ef |
  <d f>2. e!4 |
  <c f>1 |

  <d~ a'>1 |
  <bf d> |
  d |
  e |

  <d a'> |
  <bf d>2 <g c~>4 <a c> |
  a1 \bar "|."
}

tenor = \relative c {
  \global
  f1~ |
  f2 s2 |
  s1 |

  f1~ |
  f2. e4~ |
  e1 |

  f1~ |
  f2. e4 |
  d1 |

  f1~ |
  f2. e4 |
  f1 |

  d1~ |
  d1 |
  a'2. bf4 |
  c1 |

  d,1~ |
  d2 s2 |
  <d f>1 \bar "|."
}

bass = \relative c {
  \global
  d1~ |
  d2 bf |
  f1 |

  d'2 c4 a |
  bf1 |
  a1 |

  bf1 |
  f2 g |
  d1 |

  d'2 c4 a |
  bf1 |
  f |

  fs |
  g |
  <d' f> |
  <c g'> |

  f, |
  g2 c4 a |
  d,1 \bar "|."
}


verseOne = \lyricmode {
  \set stanza = "1."
  Let all mor -- tal flesh keep si -- lence, 
    And with fear and tremb -- ling stand;
  Pon -- der noth -- ing earth -- ly -- mind -- ed, 
    For with bles -- sing in His hand,
  Christ our God to earth de -- scend -- eth 
    Our full hom -- age to de -- mand.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  King of kings, yet born of Mar -- y, 
    As of old on earth He stood,
  Lord of lords, in hu -- man ves -- ture-- 
    In the Bod -- y and the Blood--
  He will give to all the faith -- ful 
    His Own Self for heav' -- nly food.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Rank on rank the host of heav -- en 
    Spreads its van -- guard on the way,
  As the Light of light de -- scend -- eth 
    From the realms of end -- less day,
  That the pow'rs of hell may van -- ish 
    As the dark -- ness clears a -- way.
}

verseFour = \lyricmode {
  \set stanza = "4."
  At His feet the six -- winged Ser -- aph: 
    Cher -- u -- bim with sleep -- less eye,
  Veil their fac -- es to the pres -- ence, 
    As with cease -- less voice they cry:
  Al -- le -- lu -- ia, Al -- le -- lu -- ia, 
    Al -- le -- lu -- ia, Lord most High!
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
        tempoWholesPerMinute = #(ly:make-moment 92 4)
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
