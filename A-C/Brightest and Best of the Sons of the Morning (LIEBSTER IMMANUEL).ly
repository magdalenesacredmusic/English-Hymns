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
          \line {LIEBSTER IMMANUEL   11 10 11 10}
      }
      \right-column{
      \line {\italic "Himmels-Lust," Leipzig, 1675;}
      \line { harm. J.S. Bach}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {Reginald Herber, 1811}
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
  \key b \minor
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  d4 d d |
  cs4. b8 a4 |
  b g fs |
  e2 d4 \bar "|" \break

  a'4 a fs |
  b4. cs8 d4 |
  d, e4. fs8 |
  fs2. \bar "|" \break

  fs4 fs g |
  a fs4. fs8 |
  b4 as b |
  cs fs,2 \bar "|"

  d'4 cs b |
  as4. fs8 b4 |
  cs8[ d] as4. b8 |
  b2. \bar "|."

}

alto = \relative c' {
  \global
  fs4 fs es8[ fs] |
  gs4 es fs |
  d d8[ cs] d4 |
  d( cs) a |

  d4 d d |
  d g fs |
  b, b8[ d] cs[ b] |
  cs2. |

  d4 d d |
  e d4. d8 |
  fs4 e fs |
  fs fs2 |

  fs4 g fs  |
  fs4. fs8 fs4 |
  g fs fs |
  fs2.
}

tenor = \relative c' {
  \global
  b4 b b8[ a] |
  gs4 cs cs |
  b b a |
  a4. g8 fs4 |

  a a a |
  g8[ a] b4 b |
  b b as8[ b] |
  as2. |

  b4 b b |
  a a4. a8 |
  b4 cs d |
  as as2 |
  b4 as b |
  cs4. cs8 b4 |
  e8[ d] cs4 cs |
  d2.
}

bass = \relative c {
  \global
  b4 b'8[ a] gs8[ fs] |
  es4 cs fs |
  g e fs |
  a( a,) d |
  fs fs d |
  g e b |
  g g g' |
  fs2. |
  b,4 b e |
  cs4 d4. d8 |
  d4 cs b |
  fs' fs2 |

  b4 e, d |
  fs4 e d |
  e fs fs, |
  b2.

}

verseOne = \lyricmode {
  \set stanza = "1."
  Bright -- est and best of the sons of the morn -- ing,
  Dawn on our dark -- ness, and lend us thine aid;
  Star of the East, the hor -- i -- zon a -- dorn -- ing,
  Guide where our in -- fant Re -- deem -- er is laid.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Cold on His cra -- dle the dew -- drops are shin -- ing,
  Low lies His head with the beasts of the stall;
  An -- gels a -- dore Him in slum -- ber re -- clin -- ing,
  Mak -- er and Mon -- arch and Sa -- vior of all.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Say, shall we yield Him, in cost -- ly de -- vo -- tion,
  O -- dours of E -- dom, and of -- f'rings di -- vine?
  Gems of the moun -- tain, and pearls of the o -- cean,
  Myrrh from the for -- est, and gold from the mine?
}


verseFour = \lyricmode {
  \set stanza = "4."
  Vain -- ly we of -- fer each am -- ple ob -- la -- tion,
  Vain -- ly with gifts would His fa -- vour se -- cure;
  Rich -- er by far is the heart's a -- do -- ra -- tion,
  Dear -- er to God are the prayers of the poor.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Bright -- est and best of the sons of the morn -- ing,
  Dawn on our dark -- ness and lend us thine aid;
  Star of the East, the hor -- i -- zon a -- dorn -- ing,
  Guide where our in -- fant Re -- deem -- er is laid.
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
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
