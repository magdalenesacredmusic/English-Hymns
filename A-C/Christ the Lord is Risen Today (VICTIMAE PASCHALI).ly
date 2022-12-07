%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}
\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Victimae Paschali laudes;" Tr. Jane Elizabeth Leeson (1807-82) in Henry Fornby's \italic "Catholic Hymns," 1851
      }
      \wordwrap {
        Music: VICTIMAE PASCHALI, 77 77 D, Adapt. from \italic "Katholisches Gesangbuch," 1859; Harmony from various sources
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {VICTIMAE PASCHALI   77 77 D}
    }
    \right-column{
      \line {adapt. from \italic "Katholisches Gesangbuch," 1859}
      \line { harmony various}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Victimae Paschali laudes"}
      \line {Wipo of Burgundy; tr. J.E. Leeson in H. Fornby's \italic "Catholic Hymns," 1851}
    }
  } 
}



global = {
  \key a \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  e a fs b |
  a gs a2 |
  a4 cs b a |
  gs fs e2 |

  a4. gs8 fs4 fs |
  b4. a8 gs2 |
  a4 b cs d8[ b] |
  a4 gs a2 |

  cs,4. d8 e4 e |
  a b cs2 |
  d4. cs8 b4 a |
  gs4. a8 b2 |

  a4. gs8 fs4 fs |
  b4. a8 gs2 |
  a4 b cs d8[ b] |
  a4 gs a2 \bar "|."
}

alto = \relative c' {
  \global
  cs4 e d fs |
  e e e2 |
  e4 e e e |
  e ds b2 |

  cs8[ d] e4 d e |
  ds8[ e] fs4 e2 |
  e4 e e fs |
  e e e2 |

  cs4. b8 b4 b |
  cs fs fs( es) |
  fs4 e fs4 fs |
  e4. ds8 e2 |

  cs8[ d] e4 d e |
  ds8[ e] fs4 e2 |
  e4 e e fs |
  e e e2

}

tenor = \relative c' {
  \global
  a4 a a d |
  cs d cs2 |
  a4 a b cs |
  b a gs2 |

  a4 a a4 as |
  b4 b b2 |
  a4 gs a a |
  cs4 b8[ d] cs2 |

  a4. a8 a4 gs |
  a8[ gs] fs4 gs2
  b4. as8 b4 b |
  b a gs2 |

  a4 a a as |
  b4 b b2 |
  a4 gs4 a a8[ b] |
  cs4 b8[ d] cs2
}

bass = \relative c {
  \global
  a4 cs d d |
  e e a,2 |
  cs4 a gs a |
  b b e2 |

  a,8[ b] cs4 d cs |
  b8[ cs] ds4 e( d) |
  cs4 b a d |
  e e a,2 |

  fs'4. fs8 e4 e |
  fs8[ e] d4 cs2 |
  b4 cs d4 ds |
  e fs e2 |

  a,8[ b] cs4 d cs |
  b8[ cs] ds4 e( d) |
  cs4 b a d |
  e e a,2

}

verseOne = \lyricmode {
  \vOne
  Christ the Lord is ris'n to -- day:
  Chris -- tians, haste your vows to pay;
  Of -- fer ye your prais -- es meet
  At the Pas -- chal Vic -- tim's feet.
  For the sheep the Lamb hath bled,
  Sin -- less in the sin -- ner's stead;
  Christ the Lord is ris'n on high,
  Now He lives no more to die.
}

verseTwo = \lyricmode {
  \vTwo
  Christ, the Vic -- tim un -- de -- filed,
  Man to God hath re -- con ciled;
  Whilst in strange and aw -- ful strife
  Met to -- ge -- ther Death and Life.
  Chris -- tians, on this hap -- py day
  Haste with joy your vows to pay;
  Christ the Lord is ris'n on high,
  Now He lives no more to die.
}

verseThree = \lyricmode {
  \vThree
  Say, O won -- d'ring Ma -- ry, say,
  What thou saw -- est on thy way?
  “I be -- held, where Christ had lain,
  Emp -- ty tomb and an -- gels twain'
  I be -- held the glo -- ry bright
  Of the ris -- ing Lord of light:
  Christ my hope is ris'n a -- gain,
  Now He lives, and lives to reign.”
}

verseFour = \lyricmode {
  \vFour
  Christ, who once for sin -- ners bled,
  Now the first -- born from the dead,
  Thron'd in end -- less might and pow'r,
  Lives and reigns for ev -- er -- more.
  Hail, e -- ter -- nal Hope on high!
  Hail, Thou King of vic -- to -- ry!
  Hail, Thou prince of life a -- dored!
  Help and save us, gra -- cious Lord!
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}
