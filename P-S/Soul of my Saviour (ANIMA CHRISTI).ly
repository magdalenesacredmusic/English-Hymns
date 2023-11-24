\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Anima Christi," Anon., 14th cent.; Tr. Traditional
      }
      \wordwrap {
        Music: ANIMA CHRISTI (MAHER) 10 10 10 10, William J. Maher (1823-77)
      }
    }
  }
}


\header {
  tagline = ""
}

global = {
  \key af \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  ef2 af4 af4 |
  af2 g |
  af4 af bf bf |
  c1 | \break

  c2 bf4 c |
  af2 g |
  g4 af g f |
  ef1 %\bar "||" \break

  ef'2 df4 ef |
  c2 bf |
  ef4 ef df ef |
  c1 | \break

  bf4( df) c bf |
  af2 df |
  c4 c bf bf |
  af1 \bar "|."
}

alto = \relative c' {
  \global
  ef2 f4 f |
  f2 ef |
  f4 df8[ c] f4 ef |
  ef1 |

  ef4( f) g ef |
  ef( d) ef2 |
  ef4 ef d d |
  ef1 |

  ef4( g) af ef |
  bf'( af) af( g) |
  g4 a bf8[ af] g4 |
  af1 |

  g2 g4 g |
  g4( f) f2 |
  e4 f f ef8[ df] |
  c1
}

tenor = \relative c' {
  \global
  c2 c4 c |
  bf2 bf |
  af4 af af g |
  af1 |

  c4( d) ef c |
  c4( bf) bf( b) |
  c4 c bf4. af8 |
  g1 |

  bf2 af4 bf |
  ef2 ef |
  ef4 c bf bf4 |
  af2( c) |

  df4( f) ef df |
  c2 bf4 ( af) |
  g af af g |
  af1
}

bass = \relative c' {
  \global
  af4( g) f ef |
  df( bf) ef( df) |
  c f df ef |
  af,1 |

  af'2 g4 c, |
  f( bf,) ef2 |
  af4 f bf bf, |
  ef1 |

  g4( ef) f g |
  af( c) ef( df) |
  c f, bf ef, |
  af1 |

  ef2 ef4 ef |
  f2 bf, |
  c4 f df ef |
  af,1
}

verseOne = \lyricmode {
  \vOne
  Soul of my Sa -- vior sanc -- ti -- fy my breast,
  Bod -- y of Christ, be Thou my sav -- ing guest,
  Blood of my Sa -- vior, bathe me in Thy tide,
  Wash me, ye wa -- ters flow -- ing from His side.
}

verseTwo = \lyricmode {
  \vTwo
  Strength and pro -- tec -- tion may thy pas -- sion be,
  O bles -- sèd Je -- sus, hear and an -- swer me;
  Deep in Thy wounds, Lord, hide and shel -- ter me,
  So shall I nev -- er, nev -- er part from Thee.
}

verseThree = \lyricmode {
  \vThree
  Guard and de -- fend me from the foe ma -- lign,
  In death's dread mo -- ments make me on -- ly Thine;
  Call me and bid me come to Thee on high
  Where I may praise Thee with Thy saints for aye.
}


#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
  \score { \transpose c a,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      %\new Lyrics \lyricsto soprano \verseFour
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
  \score { \transpose c a,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      %\new Lyrics \lyricsto soprano \verseFour
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
    \transpose c a,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      %\new Lyrics \lyricsto "tune" { \verseFour }
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
