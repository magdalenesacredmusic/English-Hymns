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
      \line {DUKE STREET LM}
    }
    \right-column{
      \line {John Warrington Hatton, 1793}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Isaac Watts, 1719}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 2/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d2 fs4 g |
  a2 b4( cs) |
  d2 cs4( b) |
  a1 \bar "||" \break

  a2 a4 a |
  b2 a |
  g fs |
  e1 \bar "||" \break

  fs2 fs4 e |
  d( fs) a( d) |
  b( a) g( fs) |
  e1 \bar "||" \break

  a2 b4 cs |
  d2. g,4 |
  fs2 e |
  d1 \bar "|."
}

alto = \relative c' {
  \global
  d2 d4 cs |
  d2 d4( e) |
  fs2 e4( e) |
  cs1 |

  d2 d4 d |
  d2 d4( a) |
  b( cs) d2 |
  cs1 |

  d2 d4 cs |
  a( d) d2 |
  d cs4( d) |
  cs1 |

  d2 d4 e |
  fs4.( e8 d4) e |
  d2 cs |
  d1
}

tenor = \relative c {
  \global
  fs2 a4 a |
  a2 g |
  fs4( a) a( gs) |
  a1 |

  fs2 fs4 a |
  g2 a4( fs) |
  g( a) a2 |
  a1 |

  a2 a4 g |
  fs( a) a2 |
  b4( d) a2 |
  a1 |

  a2 g4 g |
  fs4.( g8 a4) b |
  a2 a4( g) |
  fs1
}

bass = \relative c {
  \global
  d2 d4 e |
  fs2 g4( e) |
  d2 e |
  a,1 |

  d2 d4 fs |
  g2 fs |
  e d |
  a1 |

  d2 d4 a |
  d2 fs |
  g4( fs) e( d) |
  a1 |

  fs'2 g4 e |
  d4.( e8 fs4) g |
  a2 a, |
  d1
}

verseOne = \lyricmode {
  \set stanza = "1."
  Je -- sus shall reign wher -- e'er the sun
  Does his suc -- ces -- sive jour -- neys run;
  His king -- dom stretch from shore to shore,
  Till moons shall wax and wane no more.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  For Him shall end -- less prayer be made,
  And prais -- es throng to crown His head;
  His Name, like sweet per -- fume, shall rise
  With ev' -- ry morn -- ing sac -- ri -- fice.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Peo -- ple and realms of ev' -- ry tongue
  Dwell on His love with sweet -- est song;
  And in -- fant voic -- es shall pro -- claim
  Their ear -- ly bles -- sings on His Name.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Bles -- sings a -- bound wher -- e'er He reigns;
  The pris' -- ner leaps to lose his chains,
  The wea -- ry find e -- ter -- nal rest,
  And all the sons of want are blest.
}


verseFive = \lyricmode {
  \set stanza = "5."
  Let ev' -- ry crea -- ture rise and bring
  Pe -- cu -- liar ho -- nors to our King,
  An -- gels des -- cend with songs a -- gain,
  And earth re -- peat the loud A -- men.
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
        tempoWholesPerMinute = #(ly:make-moment 112 4)
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
