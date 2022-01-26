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
      \line {ST. ANNE   CM}
    }
    \right-column{
      \line {William Croft, 1708; harm. \italic "Hymns Ancient and Modern," 1904}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Isaac Watts, 1719}
      \line {alt. traditional, \italic "The English Hymnal," 1906}
    }
  } 
}


global = {
  \key c \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  g4 |
  e a g c |
  c b c \bar ""

  g |
  c g a fs |
  g2. \bar ""

  b4 |
  c a d b |
  c a b \bar ""

  g4 |
  a c d b |
  c2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  c4 |
  c c c e |
  d d e 

  e4 |
  e e e d |
  d2. 

  d4 |
  e c f d |
  e4. d8 b4 

  c4 |
  f e d d |
  e2. 
}

tenor = \relative c {
  \global
  \partial 4
  e4 |
  g a c c |
  a g g 

  c4 |
  c b a a |
  b2. 

  g4 |
  g a a g |
  g a gs 

  g4 |
  f g  a g |
  g2. 
}

bass = \relative c {
  \global
  \partial 4
  c4 |
  c f e a |
  f g c, 

  c4 |
  a e' c d |
  g,2. 

  g'4 |
  c, a d g |
  c, f e 

  e4 |
  d c f g |
  c,2. 
}

verseOne = \lyricmode {
  \set stanza = "1."
  O God, our help in a -- ges past,
  Our hope for years to come,
  Our shel -- ter from the storm -- y blast,
  And our e -- ter -- nal home;
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Un -- der the shad -- ow of Thy throne
  Thy Saints have dwelt se -- cure;
  Suf -- fi -- cient is Thine arm a -- lone,
  And our de -- fense is sure.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Be -- fore the hills in or -- der stood,
  Or earth re -- ceived her frame,
  From ev -- er -- last -- ing Thou art God,
  To end -- less years the same.
}

verseFour = \lyricmode {
  \set stanza = "4."
  A thou -- sand a -- ges in Thy sight
  Are like an even -- ing gone;
  Short as the watch that ends the night
  Be -- fore the ris -- ing sun.
}

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { \transpose c bf,
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

  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "Time, like an ever-rolling stream,"
            "  Bears all its sons away;"
            "They fly forgotten, as a dream"
            "  Dies at the opening day."
          }
        }
        \vspace #1.0
        \line {
          \bold "6. "
          \column {
            "O God, our help in ages past,"
            "  Our hope for years to come,"
            "Be Thou our guard while troubles last,"
            "  And our eternal home."
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
%}
 \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "Time, like an ever-rolling stream,"
            "  Bears all its sons away;"
            "They fly forgotten, as a dream"
            "  Dies at the opening day."
          }
        }
        \vspace #1.0
        \line {
          \bold "6. "
          \column {
            "O God, our help in ages past,"
            "  Our hope for years to come,"
            "Be Thou our guard while troubles last,"
            "  And our eternal home."
          }
        }
      }
      \hspace #1.0

    }
  }
}
  \bottom

}

