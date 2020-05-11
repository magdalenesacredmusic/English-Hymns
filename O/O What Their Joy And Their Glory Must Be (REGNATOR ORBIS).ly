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
      \line {REGNATOR ORBIS  10 10 10 10}
    }
    \right-column{
      \line {adapt. from \italic "La Feillée"}
      \line {arr. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line { \italic "O quanta qualia sunt illa Sabbata"}
      \line {Peter Abelard; tr. J.M. Neale}
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
  g2 g4 a |
  b2 g4 g |
  c2 b4 a |
  a2( g) \bar "||"

  d'2 b4 g |
  c2 b4 b |
  b a b( d) |
  cs2( d) \bar "||"

  g,2 fs4 g |
  e2 d4 d |
  g2 a4 b |
  b2( a) \bar "||"

  d2 g,4 g |
  b2 a4 a |
  b2 g4 a |
  a2( g) \bar "|."
}

soprano = \relative c'' {
  \global
  g2 g4 a |
  b2 g4 g |
  c2 b4 a |
  a2( g) \bar "||"

  d'2 b4 g |
  c2 b4 b |
  <g b> a <g b>( <fs d'>) |
  cs'2( d) \bar "||"

  g,2 fs4 g |
  e2 d4 d |
  g2 a4 b |
  <g b>2( <fs a>) \bar "||"

  d'2 g,4 g |
  b2 a4 a |
  b2 g4 a |
  a2( g) \bar "|."
}

alto = \relative c' {
  \global
  d2 e4 fs |
  <d g>2 e4 e |
  <e g>2 <e g>4 <c e> |
  <d fs>2 <b d> |

  fs' fs4 e |
  e2 e |
  d d |
  <e a>~ <fs a> |

  e2 fs4 d |
  c( b) a2 |
  d4 e fs g |
  d1 |

  <fs b>2 e4 e |
  fs2 e4 fs |
  d2 e4 <c e> |
  <d fs>2 <b d> \bar "|."
}

tenor = \relative c' {
  \global
  b2 b4 d |
  s2 b4 b |
  c,2 s4 a |
  d2 g, |

  b'2 b4 b |
  a2 g |
  s1 |
  s1 |

  b2 d4 g, |
  g2 fs |
  d' c4 b |
  s1 |

  s2 b4 b |
  d2 c4 a |
  g2 b4 s |
  d,2 g, \bar "|."
}

bass = \relative c' {
  \global
  g2 e4 d |
  g,2 e'4 e |
  s2 e4 s |
  s1 |

  b2 d4 e |
  a,2 e' |
  g4 fs g b |
  a2 d, |

  e2 d4 b |
  c2 d4 c |
  b2 <<{ \voiceFour \shiftOff \teeny a4 g } \\ { \voiceTwo \ignore \override Stem #'length = #4.5 a'4 g } >>
  d1 |

  b2 e4 e |
  b2 c4 d |
  g2 e4 a, |
  s1 \bar "|."
}


verseOne = \lyricmode {
  \set stanza = "1."
  O what their joy and their glo -- ry must be,
  Those end -- less Sab -- baths the bless -- èd ones see;
  Crown for the val -- iant, to wea -- ry ones rest:
  God shall be All, and in all ev -- er blest.

}

verseTwo = \lyricmode {
  \set stanza = "2."
  What are the Mon -- arch, his court and his throne?
  What are the peace and the joy that they own?
  O that the blest ones, who in it have share,
  All that they feel could as ful -- ly de -- clare!

}

verseThree = \lyricmode {
  \set stanza = "3."
  Tru -- ly, “Je -- ru -- sa -- lem” name we that shore,
  Cit -- y of peace that brings joy ev -- er -- more;
  Wish and ful -- fill -- ment are not sev -- ered there,
  Nor do things prayed for come short of the prayer.

}

verseFour = \lyricmode {
  \set stanza = "4."
  There, where no troub -- les dis -- trac -- tion can bring,
  We the sweet an -- thems of Zi -- on shall sing;
  While for thy grace, Lord, their voic -- es of praise
  Thy bless -- èd peo -- ple e -- ter -- nal -- ly raise.
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
        tempoWholesPerMinute = #(ly:make-moment 84 4)
      }
    }
    \include "hymn_layout.ly"
  }
  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "There dawns no Sabbath, no Sabbath is o'er,"
            "Those Sabbath-keepers have one and no more;"
            "One and unending is that triumph-song"
            "Which to the Angels and us shall belong."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "Now, in the meantime, with hearts raised on high,"
            "We for that country must yearn and must sigh,"
            "Seeking Jerusalem, dear native land,"
            "Through our long exile on Babylon's strand."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "Low before him with our praises we fall,"
            "Of whom and in whom and through whom are all;"
            "Of whom, the Father; and in whom, the Son;"
            "And through whom, the Spirit, with them ever One."
          }
        }
      }
      \hspace #1.0
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
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "There dawns no Sabbath, no Sabbath is o'er,"
            "Those Sabbath-keepers have one and no more;"
            "One and unending is that triumph-song"
            "Which to the Angels and us shall belong."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "Now, in the meantime, with hearts raised on high,"
            "We for that country must yearn and must sigh,"
            "Seeking Jerusalem, dear native land,"
            "Through our long exile on Babylon's strand."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "Low before him with our praises we fall,"
            "Of whom and in whom and through whom are all;"
            "Of whom, the Father; and in whom, the Son;"
            "And through whom, the Spirit, with them ever One."
          }
        }
      }
      \hspace #1.0
    }
  }
}
  \bottom
}
