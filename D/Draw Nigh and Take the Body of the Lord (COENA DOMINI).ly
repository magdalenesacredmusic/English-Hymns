%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup{ \fontsize #4 \smallCaps "Draw Nigh and Take the Body of the Lord"  }
  meter = \markup { \small { Music: COENA DOMINI, 10.10.; A. Sullivan } }
  piece = \markup { \small {Text: \italic "Sancti, venite, Christi corpus smite," St. Sechnall; tr. J.M. Neale}}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key ef \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g2 f4 ef |
  af2 g |
  f4 g ef f |
  d1 \bar "||"

  ef2 af4 g |
  f c' bf ef, |
  g2. f4 |
  ef1 \bar "|."
}

alto = \relative c' {
  \global
  ef2 d4 ef |
  d2 ef |
  f4 ef ef c |
  bf1 \bar "||"

  bf2 af4 bf |
  c d ef ef |
  ef2 d2 |
  ef1 \bar "|."
}

tenor = \relative c' {
  \global
  bf2 bf4 bf |
  bf2 bf |
  bf4 bf bf a |
  f1 \bar "||"

  ef2 ef4 ef |
  ef f g af |
  bf2 af |
  g1 \bar "|."
}

bass = \relative c {
  \global
  ef2 af4 g |
  f2 ef |
  d4 ef c f |
  bf,1 \bar "||"

  g2 c4 bf |
  af af g c |
  bf2 bf |
  ef1 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  Draw nigh and take the Bo -- dy of the Lord,
  And drink the ho -- ly Blood for you out -- poured.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Saved by that Bo -- dy and that ho -- ly Blood,
  With souls re -- freshed, we ren -- der thanks to God.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Sal -- va -- tion's giv -- er, Christ, the on -- ly Son,
  By His dear cross and Blood the vic -- t'ry won.
}


verseFour = \lyricmode {
  \set stanza = "4."
  Of -- fered was He for great -- est and for least
  Him -- self the Vic -- tim, and Him -- self the Priest.
}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranos { \voiceOne << \melody >> }
      \context Voice =
      altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
      \context Lyrics = two \lyricsto sopranos \verseTwo
      \context Lyrics = three \lyricsto sopranos \verseThree
      \context Lyrics = four \lyricsto sopranos \verseFour
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenor >> }
      \context Voice =
      basses { \voiceTwo << \bass >> }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 84 4)
    }
  }

  \layout {}
}



\markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "Victims were offered by the law of old,"
            "That in a type celestial mysteries told."
          }
        }
        \vspace #0.5
        \line {
          \bold "6. "
          \column {
            "He, Ransomer from death, and Light from shade"
            "Now gives His holy grace, His saints to aid."
          }
        }
        \vspace #0.5
        \line {
          \bold "7. "
          \column {
            "He, Ransomer from death, and Light from shade"
            "Now gives His holy grace, His saints to aid."
          }
        }
        \vspace #0.5
        \line {
          \bold "8. "
          \column {
            "He, that His saints in this world rules and shields,"
            "To all believers life eternal yields;"
          }
        }
        \vspace #0.5
        \line {
          \bold "9. "
          \column {
            "With heavenly bread makes them that hunger whole,"
            "Gives living waters to the thirsting soul."
          }
        }
        \vspace #0.5
        \line {
          \bold "10. "
          \column {
            "Alpha and Omega, to Whom shall bow"
            "All nations at the doom, is with us now."
          }
        }
      }
      \hspace #1.0

    }
  }
}

