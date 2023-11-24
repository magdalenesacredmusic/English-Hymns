\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Dies est laetitiae," German, 14th cent. paraphrased by John Mason Neale (1818-66), 1854
      }
      \wordwrap {
        Music: DIES EST LAETITIAE  Irreg., c. 13th cent.; Harm. Hermann Rudolph Schroeder, 1887
      }
    }
  }
}


global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g4 g a b |
  c a g2 |
  a4 a e fs |
  g2 g |
  g4 g a b |
  c a g2 |
  a4 a e fs |
  g2 g |

  d'4 d e d |
  b c d2 |
  d4 d e d8[ c] |
  b4 a g2 |
  e4 fs g e |
  d2 d |
  g4 g a b|
  c a g2 |
  a4 a e fs |
  g8[ fs] e4 d2 |
  e4 d e a |
  g2 g \bar "|."
}

alto = \relative c' {
  \global
  d4 d8[ e] fs4 fs8[ g] |
  a4 fs g2 |
  fs4 fs e d |
  d2 e |

  d4 d d d |
  c d d( e) |
  e c8[ d] e4 d |
  d2 d |

  g4 g g g8[ fs] |
  g4 g fs2 |
  g4 g g fs |
  d c b2 |

  cs4 d e cs |
  d2 d |
  d4 d8[ e] fs4 fs8[ g] |
  a4 fs g2 |

  fs4 fs e d |
  d c b2 |
  c4 d c c |
  c4( b8[ a]) b2
}

tenor = \relative c' {
  \global
  b4 b d d |
  e d8[ c] b2 |
  a4 a a a |
  g2 g |

  b4 b a g |
  g a b2 |
  a4 a a c |
  c( b8[ a]) b2 |

  b4 b c d |
  d g, a2 |
  b4 b c a |
  g fs g2 |

  a4 a b a |
  fs2 a |
  b4 b d d |
  e d8[ c] b2 |

  a4 a a a |
  g g g2 |
  g4 g g fs |
  g2 g
}

bass = \relative c' {
  \global
  g4 g d d |
  c d g,2 |
  d'4 d c c |
  b2 c |

  g4 g' fs g |
  e fs g( e) |
  c a8[ b] c4 d |
  g,2 g

  g'4 g c b8[ a] |
  g4 e d2 |
  g4 g c, d |
  g d g2 |

  a8[ g] fs4 e a |
  d,2 fs |
  g4 g d d |
  c d g,2 |

  d'4 d c c |
  b c g2 |
  c4 b c d |
  g2 g
}

verseOne = \lyricmode {
  \vOne
  Roy -- al Day that chas -- est gloom!
  Day by glad -- ness speed -- ed!
  Thou be -- held'st from Ma -- ry's womb
  How the King pro -- ceed -- ed;
  Whom, True man, with praise our Choir
  Hails, and love, and heart's de -- sire,
  Joy and ad -- mi -- ra -- tion;
  Who, True God, en -- throned in light,
  Pass -- eth won -- der, pass -- eth sight,
  Pass -- eth co -- gi -- ta -- tion.
}

verseTwo = \lyricmode {
  \vTwo
  On the Vir -- gin as He hung,
  God, the world's Cre -- a -- tor,
  Like a rose form li -- ly sprung,–
  Stood a -- stound -- ed na -- ture:
  That a Mai -- den's arms en -- fold
  Him That made the world of old,
  Him That ev -- er liv -- eth:
  That a Mai -- den's spot -- less breast
  To the King E -- ter -- nal rest,
  Warmth and nur -- ture giv -- eth!
}

verseThree = \lyricmode {
  \vThree
  As the sun -- beam through the glass
  Pass -- eth but not stain -- eth,
  Thus the Vir -- gin, as she was,
  Vir -- gin still re -- main -- eth:
  Bless -- ed Mo -- ther, in whose womb
  Lay the Light that ex -- iles gloom,
  God, the Lord of A -- ges:
  Bless -- ed Maid! from whom the Lord,
  Her own In -- fant, God a -- dored,
  Hun -- ger's pangs as -- suag -- es.
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
     % \new Lyrics \lyricsto soprano \verseFour
      % \new Lyrics \lyricsto soprano \verseFive
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
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
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
     % \new Lyrics \lyricsto soprano \verseFour
      % \new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \include "hymn_hymnal_layout.ly"
  }    
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
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
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
     % \new Lyrics \lyricsto "tune" { \verseFour }
      % \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}
