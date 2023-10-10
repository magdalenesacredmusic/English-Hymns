\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Edmund Spenser (1552-1599)
      }
      \wordwrap {
        Music: FARLEY CASTLE  10 10 10 10, Henry Lawes (1596-1662)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {FARLEY CASTLE  10 10 10 10}
    }
    \right-column{
      \line {Henry Lawes (1596-1662)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Edmund Spenser (1552-1599)}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
c2 e4 f | 
g e f g |
a b c2 |

c2 b4 a |
c g a e |
g fs g2 |

g2 e4 a |
g f e f |
g c, d2 |

d2 g4 e |
f a g c |
c b c2 \bar "|."
}

alto = \relative c' {
  \global
g2 c4 c |
d c c c |
f f e2 |

e2 e4 c |
e c c c |
d d8[ c] b2 |

d2 c4 c |
c d g, c |
c c b2 |

b2 d4 c |
c f e4. f8 |
g4 g e2 
}

tenor = \relative c {
  \global
e2 g4 a | 
b g a g | 
f f g2 |

c2 g4 a | 
g c f, g |
b a g2 |

g2 g4 f |
g a8[ b] c4 c |
g fs g2 |

g2 g4 g |
a d b c |
 d d c2
}

bass = \relative c {
  \global
c2 c4 a |
 g c f e | 
 d d c2 |
 
 a'2 e4 f |
 c e f c |
 b d g,2 |
 
 b c4 f |
 e d c a |
 e a g2 |
 
 g2 b4 c |
 f d e a |
 g g c,2
}

verseOne = \lyricmode {
  \vOne
Most glo -- rious Lord of life, that on this day
didst make thy tri -- umph ov -- er death and sin,
and hav -- ing har -- rowed hell, didst bring a -- way
cap -- tiv -- i -- ty thence cap -- tive, us to win:
}

verseTwo = \lyricmode {
  \vTwo
This joy -- ous day, dear Lord, with joy be -- gin,
and grant that we for whom thou did -- dest die,
be -- ing with thy dear blood clean washed from sin,
may live for ev -- er in fe -- li -- ci -- ty:
}

verseThree = \lyricmode {
  \vThree
And that thy love we weigh -- ing worth -- i -- ly,
may like -- wise love thee for the same a -- gain;
and for thy sake, who dost all grace sup -- ply,
with love may one an -- oth -- er en -- ter -- tain;
}

verseFour = \lyricmode {
_ _ _ _ _ _ _ _ _ _ 
_ _ _ _ _ _ _ _ _ _ 
  \set stanza = "4."
So let us love, dear Love, like as we ought;
love is the les -- son which the Lord us taught.
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
    %  \new Lyrics \lyricsto soprano \verseFive
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_hymnal_layout.ly"
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
     % \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}
