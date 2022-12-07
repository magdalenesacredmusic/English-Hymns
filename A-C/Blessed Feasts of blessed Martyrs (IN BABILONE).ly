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
         Text: \italic "O beata beatorum," before 12th cent.; Tr. J.M. Neale (1818-66)
      }
      \wordwrap {
        Music: IN BABILONE, 87 87 D, Dutch Traditional Melody, arr. J. Röntgen
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {IN BABILONE 87 87 D}
    }
    \column{
      \line {Dutch Traditional Melody, arr. J. Röntgen}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "O beata beatorum"}
      \line {before 12th cent.; Tr. J.M. Neale}
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
  g4 fs8[ e] d4 g |
  a g8[ a] b4 g |
  c4 b8[ a] b4 a8[ g] |
  fs8[ g] a[ fs] g2 |

  g4 fs8[ e] d4 g |
  a g8[ a] b4 g |
  c4 b8[ a] b4 a8[ g] |
  fs8[ g] a[ fs] g2 |

  g4 a8[ b] c4 b |
  a gs a a |
  a4 b8[ c] d4 g, |
  a g8[ fs] e4( d) |

  g4 fs8[ e] d4 g |
  a g8[ a] b4 g |
  c4 b8[ a] b4 a8[ g] |
  fs8[ g] a[ fs] g2 \bar "|."
}

alto = \relative c' {
  \global
  d4 c b b |
  e e8[ fs] g4 d |
  e d d e |
  c8[ d] e[ d] d2 |

  d4 c b b |
  e e8[ fs] g4 d |
  e d d e |
  c8[ d] e[ d] d2 |

  b4 f' e f |
  e e e e |
  fs d d e |
  d d cs( d) |

  d4 c b b |
  e e8[ fs] g4 d |
  e d d e |
  c8[ d] e[ d] d2
}

tenor = \relative c' {
  \global
  b4 a8[ fs] g4 g |
  g d' d g, |
  g fs g b |
  c8[ b] a[ c] b2 |

  b4 a8[ fs] g4 g |
  g d' d g, |
  g fs g b |
  c8[ b] a[ c] b2 |

  g4 f g d' |
  c b c c |
  d fs, g b |
  a b g( fs) |

  b4 a8[ fs] g4 g |
  g d' d g, |
  g fs g b |
  c8[ b] a[ c] b2
}

bass = \relative c {
  \global
  g4 a b e |
  c d g, b |
  a d b e |
  a,8[ b] c[ d] g,2 |

  g4 a b e |
  c d g, b |
  a d b e |
  a,8[ b] c[ d] g,2 |

  e'4 d c d |
  e e a, a |
  d c b e |
  fs, g a( d) |

  g,4 a b e |
  c d g, b |
  a d b e |
  a,8[ b] c[ d] g,2
}

verseOne = \lyricmode {
  \vOne
  Bless -- èd Feasts of bless -- èd Mar -- tyrs,
  Saint -- ly days of saint -- ly men,
  With af -- fec -- tion's rec -- ol -- lec -- tions
  Greet we your re -- turn a -- gain.
  
  %2
  Might -- y deeds they wrought, and won -- ders,
  while a frame of flesh they bore;
  We with meet -- est praise and sweet -- est
  Hon -- or them for ev -- er -- more.
}

verseTwo = \lyricmode {
  \vTwo
  Faith un -- blench -- ing, hope un -- quench -- ing,
  Well -- loved Lord, and sin -- gle heart,
  Thus they glo -- rious and vic -- to -- rious
  Bore the Mar -- tyr's hap -- py part.
  
  Blood in slaugh -- ter poured like wa -- ter,
  Tor -- ments long in heav -- y chain,
  Flame, and axe, and lac -- er -- a -- tion,
  They en -- dured, and con -- quered pain.
}

verseThree = \lyricmode {
  \vThree
  While they passed through di -- vers tor -- tures,
  Till they sank by death op -- prest,
  Earth's re -- ject -- ed were e -- lect -- ed
  To have por -- tions with the blest.

  By con -- tempt of world -- ly plea -- sures,
  And by might -- y bat -- tles done,
  Have they mer -- i -- ted with An -- gels
  To be knit for ay in one.
}

verseFour = \lyricmode {
  \vFour
  Where -- fore made co -- heirs of glo -- ry,
  Ye that sit with Christ on high,
  Join to ours your sup -- pli -- ca -- tions,
  As for grace and peace we cry;
  
  That, this wea -- ry life com -- plet -- ed,
  And its man -- y la -- bors past,
  We may mer -- it to be seat -- ed
  In our Fa -- ther's home at last.
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
