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
      \line {ST. MICHAEL (OLD 134TH)  SM}
    }
    \right-column{
      \line {Louis Bourgeois, \italic "Genevan Psalter," 1551}
      \line {adapt. William Crotch}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Jam desinant suspiria"}
      \line {Charles Coffin; tr. W.J. Blew}
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
  \partial 4
  d4 |
  g b a a |
  b2. d4 |
  c b a a |
  g2. \bar "||" \break

  g4 |
  fs e d g |
  g a b b |
  a g g fs |
  g2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  b4 |
  e g g fs |
  g2. a4 |
  g g g fs |
  g2.

  e4 |
  d c b d |
  e e ds d |
  c d e d |
  d2.

}

tenor = \relative c' {
  \global
  \partial 4
  g4 |
  b d e d |
  d2. d4 |
  e d d4. c8 |
  b2.

  b4 |
  b g g g |
  b a fs g |
  e8[ fs] g4 c a |
  b2.
}

bass = \relative c' {
  \global
  \partial 4
  g4 |
  e b c d |
  g2. fs4 |
  e g d d |
  g,2.

  e'4 |
  b c g b |
  e c b g |
  a b c d |
  g2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Let sigh -- ing cease and woe,
  God from on high hath heard,
  Heav'n's gate is op -- 'ning wide, and lo!
  The long -- ex -- pect -- ed Word.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Peace! through the deep of night
  The heav'n -- ly choir breaks forth,
  Sing -- ing, with fes -- tal songs and bright,
  Our God and Sav -- iour's birth.
}

verseThree = \lyricmode {
  \set stanza = "3."
  The cave of Beth -- le -- hem
  Those wake -- ful shep -- herds seek:
  Let us too rise and greet with them
  That in -- fant pure and meek.
}

verseFour = \lyricmode {
  \set stanza = "4."
  We en -- ter at the door
  What mar -- vel meets the eye?
  A crib, a moth -- er pale and poor,
  A child of pov -- er -- ty.
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
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
            "  Art Thou the eternal Son,"
            "  The eternal Father's ray?"
            "Whose little hand, Thou infant one,"
            "  Doth lift the world alway?"
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "  Yea– faith through that dim cloud,"
            "  Like lightning, darts before,"
            "And greets Thee, at whose footstool bowed"
            "  Heav'n's trembling hosts adore."
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
            "  Chaste be our love like Thine;"
            "  Our swelling souls bring low,"
            "And in our hearts, O Babe divine"
            "  Be born, abide, and grow."
          }
        }
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "  So shall Thy birthday morn,"
            "  Lord Christ, our birthday be,"
            "Then greet we all, ourselves new-born,"
            "  Our King's nativity."
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
            "  Art Thou the eternal Son,"
            "  The eternal Father's ray?"
            "Whose little hand, Thou infant one,"
            "  Doth lift the world alway?"
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "  Yea– faith through that dim cloud,"
            "  Like lightning, darts before,"
            "And greets Thee, at whose footstool bowed"
            "  Heav'n's trembling hosts adore."
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
            "  Chaste be our love like Thine;"
            "  Our swelling souls bring low,"
            "And in our hearts, O Babe divine"
            "  Be born, abide, and grow."
          }
        }
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "  So shall Thy birthday morn,"
            "  Lord Christ, our birthday be,"
            "Then greet we all, ourselves new-born,"
            "  Our King's nativity."
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



