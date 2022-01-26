\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {REX GLORIOSE, LM}
    }
    \right-column{
      \line {Melody adapted from}
      \line {\italic "Catholische Geistliche Gesänge" Andernach, 1608}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Te saeculorum Principem"}
      \line {Tr. Alan Gordon McDougall (1895-1965)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d2 \bar "|"
  fs4 g a a \bar "|"
  b cs d2 
  a2 \bar "|"
  d4. cs8 b4 a \bar "|"
  b g a2 
  a2 \bar "|"
  b4 g a fs \bar "|"
  g e d2 
  d'2 \bar "|"
  cs4 b a fs \bar "|"
  g( fs) e2 \bar "|"
  d \bar "||"

  d2 d \bar "|."
}

alto = \relative c' {
  \global
  d2
  d4 d e a
  g fs8[ e] fs2
  fs
  a4 fs g d 
  d d8[ e] cs2
  d
  fs4 e e d 
  d b8[ cs] d2
  fs
  a4 g8[ fs] e4 d 
  e( d) d( cs) 
  d2
  
  b2 a
}

tenor = \relative c {
  \global
  fs2
  a4 d cs d 
  d a a2
  d
  d4 a cs d 
  g, g e2
  d'4.( cs8) 
  b4 b a d8[ cs]
  b4 g fs2
  d'2
  a4 d cs b
  b( a) b( a)
  fs2
  
  g2 fs
}

bass = \relative c {
  \global
 d2
 d8[ cs] b4 a8[ a'] g[ fs]
 e4 a d,2
 d
 fs4 d e fs 
 g b, a2
 fs'2
 d4 e cs d 
 e g,8[ a] b2
 b'2
 fs4 g a b 
 e,( fs) g( a)
 d,2
 
 g, d'
}

verseOne = \lyricmode {
  \vOne
Thee, Lord of ev -- 'ry age, we sing:
Thee, Christ we hail the na -- tions' King:
Con -- fess thy right thy realm to find
With -- in the hearts of all man -- kind.
}

verseTwo = \lyricmode {
  \vTwo
The hate -- swayed mob cries, prid -- en -- ticed,
They will not have thy king -- dom, Christ:
But we, ex -- ult -- ant, round thy throne
Thy reign o'er all cre -- a -- tion owns.
}

verseThree = \lyricmode {
  \vThree
O Christ, our Prince, that bring -- est peace,
Let ev -- 'ry reb -- el im -- pulse cease:
And sheep a -- stray thy love would fain
Bring back to thy one fold a -- gain.
}

verseFour = \lyricmode {
  \vFour
For this thine arms wide -- stretched in plea
Hung bleed -- ing on the~a -- ton -- ing Tree:
For this the spear's re -- veal -- ing dart
Laid bare thy love -- en -- flam -- èd heart.
}

verseFive = \lyricmode {
  \vFive
  For this thou dost thy glo -- ry hide,
Out -- pour -- ing from thy pierc -- èd side
The rich -- es of thy love di -- vine
Be -- neath the veils of bread and wine.

\set stanza = "8." A -- men.
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
    \include "hymn_layout.ly"
  }
      \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "6. "
          \column {
            "May realms and they that rule them vie"
"With solemn rites to raise thee high;"
"May laws and arts thy servants be,"
"All life be sanctified in thee."
          }
        }
    \vspace #1
        \line {
          \bold "7. "
          \column {
            "Their kingly gear and royal state"
"Kings to their King shall consecrate;"
"Subjects their all before thee lay" 
"In service of thy gentle sway."
          }
        }
            \vspace #1
        \line {
          \bold "8. "
          \column {
            "O Christ, to thee, beneath whose sway"
"All earth shall bow, all praise we pay;"
"With Father and with Spirit be"
"All glory thine eternally.  Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}
  \bottom
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Hymnal")
\book {
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  \top
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
    \include "hymn_layout.ly"
  }    
       \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "6. "
          \column {
            "May realms and they that rule them vie"
"With solemn rites to raise thee high;"
"May laws and arts thy servants be,"
"All life be sanctified in thee."
          }
        }
    \vspace #1
        \line {
          \bold "7. "
          \column {
            "Their kingly gear and royal state"
"Kings to their King shall consecrate;"
"Subjects their all before thee lay" 
"In service of thy gentle sway."
          }
        }
            \vspace #1
        \line {
          \bold "8. "
          \column {
            "O Christ, to thee, beneath whose sway"
"All earth shall bow, all praise we pay;"
"With Father and with Spirit be"
"All glory thine eternally.  Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
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
      \new Lyrics \lyricsto "tune" { \verseFour}
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
       \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "6. "
          \column {
            "May realms and they that rule them vie"
"With solemn rites to raise thee high;"
"May laws and arts thy servants be,"
"All life be sanctified in thee."
          }
        }
    \vspace #1
        \line {
          \bold "7. "
          \column {
            "Their kingly gear and royal state"
"Kings to their King shall consecrate;"
"Subjects their all before thee lay" 
"In service of thy gentle sway."
          }
        }
            \vspace #1
        \line {
          \bold "8. "
          \column {
            "O Christ, to thee, beneath whose sway"
"All earth shall bow, all praise we pay;"
"With Father and with Spirit be"
"All glory thine eternally.  Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}
  \bottom
}
