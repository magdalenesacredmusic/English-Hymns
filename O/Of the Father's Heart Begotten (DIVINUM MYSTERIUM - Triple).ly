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
      \line {DIVINUM MYSTERIUM  87 87 87 7}
    }
    \right-column{
      \line {Piae Cantiones, 1582}
      \line {harm. \italic "The English Hymnal"}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line { \italic"Corde natus ex parentis"}
      \line {Prudentius; tr. R.F. Davis}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key e \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  e2 fs4 \bar "!"
  gs2 a4 \bar "!"
  gs2 fs4 \bar "!"
  gs2( fs4) \bar "!"
  e2. \bar "||"

  gs2 a4 \bar "!"
  b2 cs4 \bar "!"
  b( gs) a \bar "!"
  b2. \bar "||"

  cs2 ds4 \bar "!"
  e2 b4 \bar "!"
  b2 a4 \bar "!"
  gs2( fs4) \bar "!"
  e2. \bar "||"

  cs2 ds4 \bar "!"
  e2 fs4 \bar "!"
  e( cs) ds \bar "!"
  e2. \bar "||"

  e2 fs4 \bar "!"
  gs2 a4 \bar "!"
  gs2 fs4 \bar "!"
  b2( cs4\bar "!"
  b gs a) \bar "!"
  b2. \bar "||"

  e,2 ds4 \bar "!"
  cs2 ds4 \bar "!"
  e2 cs4 \bar "!"
  b2. \bar "||" \break

  e2 fs4 \bar "!"
  gs2 b4 \bar "!"
  gs2 e4 \bar "!"
  fs2.( \bar "!"
  e2.) \bar "|."
}

alto = \relative c' {
  \global
  b2. |
  e2.~ |
  e2 ds4 |
  e2 ds4 |
  b2. |

  e2. |
  ds2 e4 |
  e2.~ |
  e2 ds4 |

  e2 a4 |
  gs2 fs4 |
  gs2 e4 |
  e2 cs4 |
  cs2. |

  a2 b4 |
  gs2 cs4 |
  cs gs b |
  b2. |

  b2 ds4 |
  e2.~ |
  e2 ds4 |
  e2.~ |
  e2. |
  e2 ds4 |

  b2. |
  a2. |
  b2 a4 |
  fs2. |

  cs'2 ds4 |
  e2. |
  ds2 e4 |
  e2 ds4 |
  b2. \bar "|."
}

tenor = \relative c' {
  \global
  gs2 fs4 |
  b2 cs4 |
  b2.~ |
  b2. |
  gs2. |

  b2 a4 |
  fs2 a4 |
  fs2 e4 |
  fs2. |

  a2. |
  b2. |
  ds2 cs4 |
  b2 a4 |
  gs2. |

  a2 fs4 |
  e2 a4 |
  gs e fs |
  gs2. |

  gs2 b4 |
  b2 cs4 |
  b2. |
  e,2.~ |
  e2. |
  fs2. |

  e2 gs4 |
  e2 fs4 |
  e2.~ |
  e2 ds4 |

  cs'2 a4 |
  b2.~ |
  b2 gs4 |
  b2. |
  gs2. \bar "|."
}

bass = \relative c {
  \global
  e2 ds4 |
  e2 a,4 |
  e'2 b4 |
  gs a b |
  e2. |

  e2 cs4 |
  b2 a4 |
  e'2 cs4 |
  b2. |

  a'4 gs fs |
  e2 ds4 |
  gs2 a4 |
  e2 fs4 |
  cs2. |
  fs2 b,4 |
  cs2 fs4 |
  cs2 b4 |
  e2. |

  e2 b4 |
  e2 a,4 |
  e'2 b4 |
  gs2.~ |
  gs4 cs2 |
  b2. |

  gs2. |
  a2 fs4 |
  gs2 a4 |
  b2. |

  a'2 fs4 |
  e2 gs,4 |
  b2 cs4 |
  b2. |
  <<{ \voiceTwo e2.} \\ {\voiceTwo \ignore e,2.} >>
}


verseOne = \lyricmode {
  \set stanza = "1."
  Of the Fa -- ther’s heart be -- got -- ten,
 Ere the world from cha -- os rose,
 He is Al -- pha: from that Foun -- tain
 All that is and hath been flows;
 He is O -- me -- ga, of all things
 Yet to come the mys -- tic Close,
  \override Lyrics . LyricText #'font-shape = #'italic Ev -- er -- more and ev -- er -- more!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  By his word was all cre -- a -- ted;
  He com -- mand -- ed and 'twas done;
  Earth and sky and bound -- less o -- cean,
  U -- ni -- verse of three in one,
  All that sees the moon's soft ra -- diance,
  All that breathes be -- neath the sun,
}

verseThree = \lyricmode {
  \set stanza = "3."
  He as -- sumed this mor -- tal bo -- dy,
  Frail and fee -- ble, doomed to die,
  That the race from dust cre -- a -- ted
  Might not per -- ish ut -- ter -- ly,
  Which the dread -- ful Law had sen -- tenced
  In the depths of hell to lie,
}

verseFour = \lyricmode {
  \set stanza = "4."
O how blest that won -- drous birth -- day,
When the Maid the curse re -- trieved,
Brought to birth man -- kind's sal -- va -- tion,
By the Ho -- ly Ghost con -- ceived;
And the Babe, the world's Re -- deem -- er,
In her lov -- ing arms re -- ceived,
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
  \markup {
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "This is he, whom seer and sibyl"
            "  Sang in ages long gone by;"
            "This is he of old revealed"
            "  In the page of prophecy;"
            "Lo! he comes, the promised Saviour;"
            "  Let the world his praises cry!"
          }
        }
        \vspace #0.5
        \line {
          \bold "6. "
          \column {
            "Sing, ye heights of heaven, his praises;"
            "  Angels and Archangels, sing!"
            "Wheresoe'er ye be, ye faithful,"
            "  Let your joyous anthems ring,"
            "Every tongue his name confessing,"
            "  Countless voices answering,"
          }
        }
      }
      \hspace #0.1  % adds horizontal spacing between columns;
      % if they are still too close, add more " " pairs
      % until the result looks good
      \column {
        \line {
          \bold "7. "
          \column {
            "Hail! thou Judge of souls departed;"
            "  Hail! of all the living King!"
            "On the Father's right hand thronèd,"
            "  Through his courts thy praises ring,"
            "Till at last for all offences"
            "  Righteous judgement thou shalt bring,"
          }
        }
        \vspace #0.5
        \line {
          \bold "8. "
          \column {
           "Now let old and young uniting"
           "  Chant to thee harrmonious lays,"
           "Maid and matron hymn thy glory,"
           "  Infant lips their anthem raise,"
           "Boys and girls together singing"
           "  With pure heart their song of praise,"
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}


\markup \fill-line {
  \center-column 	{
    \large {
      \vspace #1.5
      \column {
        \line {
          \bold "9. "
          \column {
         "Let the storm and summer sunshine,"
            "  Gliding stream and sounding shore,"
            "Sea and forest, frost and zephyr,"
            "  Day and night their Lord adore;"
            "Let creation join to laud thee"
            "  Through the ages evermore,"
          }
        }
        \hspace #1.0
      }
    }
  }
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \markup {
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "This is he, whom seer and sibyl"
            "  Sang in ages long gone by;"
            "This is he of old revealed"
            "  In the page of prophecy;"
            "Lo! he comes, the promised Saviour;"
            "  Let the world his praises cry!"
          }
        }
        \vspace #0.5
        \line {
          \bold "6. "
          \column {
            "Sing, ye heights of heaven, his praises;"
            "  Angels and Archangels, sing!"
            "Wheresoe'er ye be, ye faithful,"
            "  Let your joyous anthems ring,"
            "Every tongue his name confessing,"
            "  Countless voices answering,"
          }
        }
      }
      \hspace #0.1  % adds horizontal spacing between columns;
      % if they are still too close, add more " " pairs
      % until the result looks good
      \column {
        \line {
          \bold "7. "
          \column {
            "Hail! thou Judge of souls departed;"
            "  Hail! of all the living King!"
            "On the Father's right hand thronèd,"
            "  Through his courts thy praises ring,"
            "Till at last for all offences"
            "  Righteous judgement thou shalt bring,"
          }
        }
        \vspace #0.5
        \line {
          \bold "8. "
          \column {
           "Now let old and young uniting"
           "  Chant to thee harrmonious lays,"
           "Maid and matron hymn thy glory,"
           "  Infant lips their anthem raise,"
           "Boys and girls together singing"
           "  With pure heart their song of praise,"
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}


\markup \fill-line {
  \center-column 	{
    \large {
      \vspace #1.5
      \column {
        \line {
          \bold "9. "
          \column {
         "Let the storm and summer sunshine,"
            "  Gliding stream and sounding shore,"
            "Sea and forest, frost and zephyr,"
            "  Day and night their Lord adore;"
            "Let creation join to laud thee"
            "  Through the ages evermore,"
          }
        }
        \hspace #1.0
      }
    }
  }
}
  \bottom
}

