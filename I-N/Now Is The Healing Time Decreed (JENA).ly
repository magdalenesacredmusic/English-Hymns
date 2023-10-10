\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Ecce tempus idoneum," Tr. T.A. Lacey (1853-1931), 1906
      }
      \wordwrap {
        Music: DAS NEUGEBORNE KINDELEIN, Later form of melody from Vulpius's \italic Gesangbuch, Jena, 1609; Harm. chiefly by J.S. Bach (1685-1750)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {DAS NEUGEBORNE KINDELEIN}
    }
    \right-column{
      \line {Later form of melody from}
      \line {Vulpius's \italic Gesangbuch, Jena, 1609}
      \line {Harm. chiefly by J.S. Bach (1685-1750)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Ecce tempus idoneum"}
      \line {Tr. T.A. Lacey (1853-1931), 1906}
    }
  }
}

\header {
  tagline = ""
}


global = {
  \key e \minor
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  e4 e e |
  b'4.( a8) g4 |
  b( a) g |
  fs2. \bar ""

  b4 b cs |
  d2 cs4 |
  b as2 |
  b2. \bar ""

  b4 a fs |
  g4.( a8) b4 |
  a( g) fs |
  g2. \bar ""

  d'4 e d |
  b4.( a8) g4 |
  fs( e) ds |
  e2. \bar "||" \break
  
  e2.
  e2.
  \bar "|."
}

alto = \relative c' {
  \global
  e4 e e |
  fs2 e4 |
  e( ds) e |
  ds2( e4) |

  fs g g |
  a2 a4 |
  fs2 e4 |
  d2. |

  g4 e d |
  g2 d4 |
  e2 d4 |
  d2. |

  g4 g fs |
  fs2 e4 |
  c2 b4 |
  b2. 
  
  c2.
  b\bar "|."
}

tenor = \relative c' {
  \global
  g4 b g |
  b2 b4 |
  b( fs) g8[ a] |
  b2( cs4) |

  d!4 d e |
  fs2 e4 |
  d cs2 |
  b2. |

  d4 c a |
  g2 g4 |
  c( b) a |
  b2( c4) |

  d4 c a |
  b2 b4 |
  a( g) fs |
  gs2. 
  
  a2.
  gs2.
  \bar "|."
}

bass = \relative c {
  \global
  e4 g e |
  ds2 e4 |
  g( fs) e |
  b2. |

  b'4 g e |
  d( fs) a |
  b fs2 |
  b,2. |

  g4 a d |
  e2 b4 |
  c2 d4 |
  g,2( a4) |

  b4 c d |
  ds2 e4 |
  a,2 b4 |
  e2. 
  
  a,2.
  e'2.
  \bar "|."
}

verseOne = \lyricmode {
  \vOne
  Now is the heal -- ing time de -- creed
  For sins of heart, of word or deed,
  When we in hum -- ble fear re -- cord
  The wrong that we have done the Lord;
}

verseTwo = \lyricmode {
  \vTwo
  Who, al -- way mer -- ci -- ful and good,
  Has borne so long our way -- ward mood,
  Nor cut us off un -- spar -- ing -- ly
  In our so great in -- i -- qui -- ty.
}

verseThree = \lyricmode {
  \vThree
  There -- fore with fast -- ing and with prayer,
  Our se -- cret sor -- row we de -- clare;
  With all good striv -- ing seek his face,
  And low -- ly heart -- ed plead for grace.
}

verseFour = \lyricmode {
  \vFour
  Cleanse us, O Lord, from ev -- 'ry stain,
  Help us the meed of praise to gain,
  Till with the an -- gels linked in love
  Joy -- ful we tread thy courts a -- bove.
}

verseFive = \lyricmode {
  \vFive
  Fa -- ther and Son and Spir -- it blest,
  To thee be ev -- 'ry prayer ad -- dressed,
  Who art in three -- fold Name a -- dored,
  From age to age, the on -- ly Lord.
  
  A -- men.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
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
    \include "hymn_layout_ragged.ly"
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
  \score { %\transpose c d
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_hymnal_layout_ragged.ly"
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
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}
