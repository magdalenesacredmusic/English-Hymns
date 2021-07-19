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
      \line {BILLING  86 86}
    }
    \column{
      \line {Richard Runciman Terry, 1865}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "The Dream of Gerontius," John H. Newman, 1865}
    } 
  }
}

global = {
  \key ef \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  ef4 g bf |
  ef2 c4 |
  bf2 f4 |
  g2 g4 |
  g4( c) ef |
  d2 c4 |
  bf2 \bar "||" \break

  bf4 |
  ef2 bf4 |
  c2 f,4 |
  bf4( af) g |
  af2 g4 |
  g4( f) c |
  ef2 d4 |
  ef2. \bar "|."
}

alto = \relative c' {
  \global
  ef4 ef f |
  ef2 ef4 |
  ef2 d4 |
  ef2 f4 |
  ef2 ef4 |
  f2 ef4 |
  d2 d4 |

  ef2 ef8[ df] |
  c2 c4 |
  f2 e4 |
  f2 ef4 |
  c2 c4 |
  bf2 bf4 |
  bf2. \bar "|."
}

tenor = \relative c' {
  \override Staff.TimeSignature #'transparent = ##t
  \global
  g4 bf bf |
  g2 af4 |
  g4( f) bf |
  bf2 b4 |
  c2 g4 |
  f4( g) a |
  bf2 \bar "||"

  bf4 |
  bf4( af) g |
  g4( f) af |
  df4( c) c |
  c4( af) bf |
  bf4( af) f |
  f4( g) af |
  g2. \bar "|."
}

bass = \relative c {
  \global
  ef4 ef d |
  c2 af4 |
  bf2 bf4 |
  ef2 d4 |
  c2 c4 |
  f2 f4 |
  bf,2 af'4 |
  g4( f) ef |
  af,2 af4 |
  g4( c) c |
  f,2 g4 |
  af2 af4 |
  bf2 bf4 |
  ef2. \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1. "
  Praise to the Ho -- liest in the height,
  And in the depth be praise:
  In all His words most won -- der -- ful;
  Most sure in all His ways.
}

verseTwo = \lyricmode {
  \set stanza = "2. "
  O lov -- ing wis -- dom of our God!
  When all was sin and shame,
  A sec -- ond A -- dam to the fight
  And to the res -- cue came.
}

verseThree = \lyricmode {
  \set stanza = "3. "
  O wis -- est love! that flesh and blood
  Which did in A -- dam fail,
  Should strive a -- fresh a -- gainst the foe,
  Should strive and should pre -- vail;
}

verseFour = \lyricmode {
  \set stanza = "4. "
  And that a high -- er gift than grace
  Should flesh and blood re --  fine,
  God's Pres -- ence and His ver -- y Self,
  And Es -- sence all -- di -- vine.
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
            "O gen'rous love! That He who smote"
            "  In man for man the foe,"
            "The double agony in man"
            "  For man should undergo;"
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "And in the garden secretly,"
            "  And on the cross on high,"
            "Should teach His brethren and inspire"
            "  To suffer and to die."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "Praise to the Holiest in the height,"
            "  And in the depth be praise:"
            "In all His words most wonderful;"
            "  Most sure in all His ways."
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
            "O gen'rous love! That He who smote"
            "  In man for man the foe,"
            "The double agony in man"
            "  For man should undergo;"
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "And in the garden secretly,"
            "  And on the cross on high,"
            "Should teach His brethren and inspire"
            "  To suffer and to die."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "Praise to the Holiest in the height,"
            "  And in the depth be praise:"
            "In all His words most wonderful;"
            "  Most sure in all His ways."
          }
        }
      }
      \hspace #1.0

    }
  }
}
  \bottom
}





%{
%	Per _Westminster Hymnal_, #56
%}


