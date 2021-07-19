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
          \line {NICAEA 11 12 12 10}
      }
      \column{
      \line {John Bacchus Dykes, 1861}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {Reginald Herber, 1826}
  } 
}
}

\header {
  tagline = ""
}

global = {
  \key e \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  e4 e gs gs |
  b2 b |
  \phrasingSlurDashed cs4\( cs\) cs cs |
  b2 gs2 \break

  b4. b8 b4 b |
  \phrasingSlurDashed e4\( e\) ds b |
  fs b cs4. b8 |
  b1 \break

  e,4 e gs gs |
  b2 b |
  cs4. cs8 cs4 cs |
  b2 b

  e b4 b |
  cs2 gs |
  a4 fs fs4. e8 |
  e1 \bar "|."

}

alto = \relative c' {
  \global
  b4 b e e |
  ds( fs) e( ds) |
  \slurDashed cs( ds) e fs |
  gs2 e |

  fs4 fs gs fs |
  \slurDashed e( fs) fs gs |
  fs ds e4. ds8 |
  ds1 |

  b4 b e e |
  \slurSolid ds( fs) e( ds) |
  cs ds e fs |
  gs2 e |

  e2 e4 e |
  e2 e4( d) |
  cs cs ds!4. e8 |
  e1 |

}

tenor = \relative c' {
  \global
  gs4 gs e e |
  fs( a) gs( b) |
  \slurDashed a( b) cs ds |
  \slurSolid e( b) b2 |

  b4 b b b |
  \slurDashed gs( as) b b |
  ds b as4. b8 |
  \slurSolid b2( a!2) |

  gs4 gs e e |
  fs( a) gs( b) |
  a4 b cs ds |
  e( b) gs2 |

  gs4( a) b d |
  cs2 b |
  a4 a a4. gs8 |
  gs1 |
}

bass = \relative c {
  \global
  e4 e cs cs |
  b2 e |
  \slurDashed a,4( a) a' a |
  e2 e

  ds4 ds e ds |
  cs( cs) ds e |
  fs fs fs4. b,8 |
  b1 |

  e4 e cs cs |
  b2 e |
  a,4. a8 a'4 a |
  e2 e |

  cs gs4 gs |
  a2 e' |
  a,4 a b4. e8 |
  e1 |
}

verseOne = \lyricmode {
  \set stanza = "1."
  Ho -- ly, Ho -- ly, Ho -- ly! Lord _ God Al -- migh -- ty!
  Ear -- ly in the morn -- _ ing our song shall rise to thee;
  Ho -- ly, Ho -- ly, Ho -- ly! Mer -- ci -- ful and Migh -- ty!
  God in Three Per -- sons, bles -- sed Trin -- i -- ty!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Ho -- ly, Ho -- ly, Ho -- ly! all the saints a -- dore thee,
  Cast -- ing down their gol -- den crowns a -- round the glas -- sy sea;
  Cher -- u -- bim and Ser -- a -- phim fal -- ling down before thee,
  Which wert, and art, and ev -- er -- more shalt be.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Ho -- ly, Ho -- ly, Ho -- ly! though the dark -- ness hide thee,
  Though the eye of sin -- ful man thy glo -- ry may not see:
  On -- ly thou art ho -- ly, there is none bes -- ide thee,
  Per -- fect in pow'r, in love, and pu -- ri -- ty.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Ho -- ly, Ho -- ly, Ho -- ly! Lord _ God Al -- migh -- ty!
  All thy works shall praise thy name in earth and sky and sea;
  Ho -- ly, Ho -- ly, Ho -- ly! Mer -- ci -- ful and Migh -- ty!
  God in Three Per -- sons, bles -- sed Trin -- i -- ty!
}

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { \transpose c bf,
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
        tempoWholesPerMinute = #(ly:make-moment 84 4)
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
