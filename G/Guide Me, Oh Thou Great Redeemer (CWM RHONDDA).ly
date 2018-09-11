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
      \line {CWM RHONDDA 87 87 44 77}
    }
    \right-column{
      \line {John Hughes, 1907}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {William Williams, 1745; }
      \line {\italic "tr. from the Welsh by" Peter Williams, alt. to \italic "Redeemer"}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d4 e d4. g8 |
  g[ fs] g[ a] b4 a |

  b g e c' |
  b a g2

  d4 e d4. g8 |
  g[ fs] g[ a] b4 a |

  b4 c d c8[ a] |
  g4 fs g2

  a4. b8 c4 a |
  b4. c8 d4 b |
  d4. d8 d d d d |
  d1 |

  d4. c8 b[ d] c[ a] |
  g4 fs g2 \bar "|."
}

alto = \relative c' {
  \global
  b4 c d4. d8 |
  d4 d8[ e] d4 d |

  d c e e d c b2 |

  b4 c d4. d8 |
  d4 d8[ e] d4 d |

  d4 e d e |
  d d d2 |

  fs4. g8 a4 d, |
  g4. a8 b[ a] g4 |
  g4. g8 fs g d g |
  << {\voiceTwo fs 1} \\ {\voiceFour \teeny \once \override NoteColumn #'force-hshift = #1 fs4 d8[ fs]  a2 } >> |
  g4. fs8 g4 e |
  d d d2
}

tenor = \relative c' {
  \global
  g4 g g4. b8 |
  b[ a] g4 g fs |

  g4 g g g |
  g fs g2 |

  g4 g g4. b8 |
  b[ a] g4 g fs |

  g4 g g g8[ c] |
  b4 a b2 |

  c4. b8 a[ g] fs[ a] |
  d4. c8 b4 d |

  d4. d8 c b a g |
  d'1 |

  d4. d8 d[ b] a[ c] |
  b4 a8[ c] b2
}

bass = \relative c {
  \global
  g4 c b a |
  g8[ a] b[ c] d4 d |

  g4 e c a |
  d d g,2

  g4 c b a |
  g8[ a] b[ c] d4 d |

  g4 e b c |
  d d g,2 |

  d'4. d8 d[ e] fs4 |
  g4. d8 g[ a] b4 |
  b4. b8 a g fs e |
  <<
    { \voiceTwo d1 } \\ {
      \voiceFour \teeny
      \once \override NoteColumn #'force-hshift = #1 d4 fs8[ a] c2
    }
  >> |
  b4. a8 g4 c, |
  d d g2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Guide me, O thou great Re -- dee -- mer,
  Pil -- grim through this bar -- ren land.
  I am weak, but thou art might -- y;
  Hold me with thy pow'r -- ful hand.
  Bread of heav -- en, bread of heav -- en,
  Feed me till I want no more;
  Feed me till I want no more.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  O -- pen now the crys -- tal foun -- tain,
  Whence the heal -- ing stream doth flow;
  Let the fire and cloud -- y pil -- lar
  Lead me all my jour -- ney through.
  Strong de -- liv -- erer, strong de -- liv -- erer,
  Be thou still my strength and shield;
  Be thou still my strength and shield.
}

verseThree = \lyricmode {
  \set stanza = "3."
  When I tread the verge of Jor -- dan,
  Bid my anx -- ious fears sub -- side;
  Death of death and hell's de -- struc -- tion,
  Land me safe on Ca -- naan's side.
  Songs of prais -- es, songs of prais -- es,
  I will ev -- er give to thee;
  I will ev -- er give to thee.
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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 100 4)
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

%{ The original first line is "Guide Me, O Thou Great Jehovah." Jehovah being a common rendering of the tetragrammaton, 
the traditional English change to "Redeemer" instead of "Jehovah" is adopted here in order to conform with 
Liturgicam Authenticam 41.c: "in accordance with immemorial tradition, which 
indeed is already evident in the above-mentioned “Septuagint” version, the 
name of almighty God expressed by the Hebrew tetragrammaton (YHWH) and 
rendered in Latin by the word Dominus, is to be rendered into any given 
vernacular by a word equivalent in meaning."
%}
