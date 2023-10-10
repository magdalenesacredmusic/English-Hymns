%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/
%}

\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Charles Wesley (1707-88), 1740
      }
      \wordwrap {
        Music: ABERYSTWYTH 7 77 D, Joseph Parry (1840-1903), 1879
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {ABERYSTWYTH 7 77 D}
    }
    \right-column{
      \line {Joseph Parry, 1879}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Charles Wesley, 1740}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key e \minor
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  e4 e8[ fs] g[ a] b4 |
  g fs e2 |

  g4 fs e ds |
  e8[ fs] g4 fs2 |

  e4 e8[ fs] g[ a] b4 |
  g fs e2 |

  fs4 g8[ a] b4 a |
  g fs e2 |

  e4 d e fs |
  g b8[ a] g2 |

  g4 fs g a |
  b d8[ cs] b2 |

  e4 e d b |
  g a b2 |

  e,4 e8[ fs] g[ a] b4 |
  g fs e2 \bar "|."
}

alto = \relative c' {
  \global
  b4 e8[ ds] e[ fs] g4 |
  e ds b2 |

  e4 ds e b |
  b e ds2 |

  b4 e8[ ds] e[ fs] g4 |
  e ds b2 |

  ds4 e8[ fs] g4 fs |
  e ds b2 |

  c4 b c c |
  d fs d2 |

  e4 ds e fs8[ d!] |
  d4 fs8[ e] d2 |

  e4 g8[ fs] g4 d |
  e e fs2 |

  e4 e8[ ds] e[ fs] g4 |
  e ds b2
}

tenor = \relative c' {
  \global
  g4 b b b |
  b b8[ a] g2 |

  b4 b b b |
  b b b2 |

  g8[ a] b4 b b |
  b fs8[ a] g2 |

  b4 b8[ d!] d4 c |
  b b8[ a] g2 |

  g4 g g a |
  b d8[ c] b2 |

  b4 b b d8[ fs,] |
  g8( b4) as8 b2 |

  g4 c d g, |
  b e ds2 |

  b8[ c] b8[ a] b4 b |
  b fs16[ g a8] g2
}

bass = \relative c {
  \global
  e4 g,8[ b] e4 g,8[ a] |
  b4 b e2 |

  e4 fs g a |
  g8[ fs] e4 b2 |

  e8[ fs] g8[ fs] e4 g,8[ a] |
  b4 b e2 |

  b4 e8[ d!] g4 a |
  b4 b,4 e2 |

  c4 g c8[ b] a4 |
  g d' g,2 |

  e'4 b e d |
  g fs b,2 |

  c4 c' b g |
  e c b2 |
  g'8[ a] g[ fs] e4 g,8[ a] |
  b4 b e2
}

verseOne = \lyricmode {
  \vOne
  Je -- sus, lov -- er of my soul,
  Let me to thy bos -- om fly,
  While the near -- er wa -- ters roll,
  While the tem -- pest still is high.
  Hide me, O my Sa -- vior, hide,
  Till the storm of life is past;
  Safe in -- to the ha -- ven guide;
  O re -- ceive my soul at last.
}

verseTwo = \lyricmode {
  \vTwo
  Oth -- er re -- fuge have I none,
  Hangs my help -- less soul on thee;
  Leave, ah! leave me not a -- lone,
  Still sup -- port and com -- fort me.
  All my trust on thee is stayed,
  All my help from thee I bring;
  Cov -- er my de -- fense -- less head
  with the sha -- dow of thy wing.
}

verseThree = \lyricmode {
  \vThree
  Thou, O Christ, art all I want,
  More than all in thee I find;
  Raise the fal -- len, cheer the faint,
  Heal the sick, and lead the blind.
  Just and ho -- ly is thy Name,
  I am all un -- righ -- teous -- ness;
  False and full of sin I am;
  Thou art full of truth and grace.
}


verseFour = \lyricmode {
  \vFour
  Plen -- teous grace with thee is found,
  Grace to cov -- er all my sin;
  Let the heal -- ing streams a -- bound;
  Make and keep me pure with -- in.
  Thou of life the foun -- tain art,
  Free -- ly let me take of thee;
  Spring thou up with -- in my heart;
  Rise to all e -- ter -- ni -- ty.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
  \score { %\transpose c bf,
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
  \score { %\transpose c bf,
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
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}


%{ originally 5 verses - following is original verse 3
Wilt Thou not regard my call?
Wilt Thou not accept my prayer?
Lo! I sink, I faint, I fall—
Lo! on Thee I cast my care;
Reach me out Thy gracious hand!
While I of Thy strength receive,
Hoping against hope I stand,
dying, and behold, I live.
%}
