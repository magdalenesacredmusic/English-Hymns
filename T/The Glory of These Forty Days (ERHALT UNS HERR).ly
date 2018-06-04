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
  poet = \markup{ \fontsize #4 \smallCaps "The Glory of These Forty Days"  }
  meter = \markup { \small { "Music: ERHALT' UNS, HERR, L.M.; Martin Luther; adapt. J.S. Bach" } }
  piece = \markup { \small {Text: \italic "Clarum decus jejunii," St. Gregory the Great; tr. M.F. Bell, \italic "The English Hymnal" }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key f \minor
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  f8 g8 |
  af4 g8 f8 e4 f8 g8 |
  af4 g f \bar "||" af |
  bf bf c af |
  bf bf c \bar "||" c |
  df c8 df ef df c4 |
  bf8 af bf4 af4 \bar "||" c |
  af bf af g |
  f e f2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  c4 |
  f8 ef d4 c c8 e |
  f4 e c

  f |
  ef8 f g4 af c, |
  f8 af g f e4

  f |
  f8 g af4 bf af |
  g8 af af g ef4

  g4 |
  f f8 e8 f4 e! |
  f8 df c4 c2 |
}

tenor = \relative c' {
  \global
  \partial 4
  af8 bf |
  c4 bf8 af g4 af8 bf |
  c8 df8 g,8 c8 af4

  c4 |
  bf ef ef f |
  f bf, g

  af |
  bf ef ef ef |
  df8 c df bf c4

  c4 |
  c bf c c8 bf8 |
  af4 g8 af16 bf af2 |

}

bass = \relative c, {
  \global
  \partial 4
  f4 |
  f'4 bf,4 c8 bf af g |
  f bf c4 f,4

  f'4 |
  g ef af8 g f ef |
  df8 c8 df4 c4

  f4 |
  bf, af g af |
  ef' ef af

  e |
  f8 f,8 g4 af8 bf c4 |
  df8 bf c4 f,2 |

}

verseOne = \lyricmode {
  \set stanza = "1."
  The _ glo -- ry _ of these _ for -- ty days
  We cel -- e -- brate with songs of praise;
  For Christ, by _ Whom _ all things _ were made,
  Him -- self has fast -- ed and has prayed.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  A -- _ lone and _ fast -- ing _ Mo -- ses saw
  The lov -- ing God Who gave the law;
  And to E -- _ li -- _ jah, fast -- _ ing, came
  The steeds and char -- i -- ots of flame.
}

verseThree = \lyricmode {
  \set stanza = "3."
  So _ Dan -- iel _ trained his _ mys -- tic sight,
  De -- liv -- ered from the li -- ons’ might;
  And John, the _ Bride -- _ groom’s friend, _ be -- came
  The her -- ald of Mes -- si -- ah’s Name.
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
      tempoWholesPerMinute = #(ly:make-moment 72 4)
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
          \bold "4. "
          \column {
            "Then grant us, Lord, like them to be"
            "Full oft in fast and prayer with Thee;"
            "Our spirits strengthen with Thy grace,"
            "And give us joy to see Thy face."
          }
        }
        \vspace #1
        \line {
          \bold "5. "
          \column {
            "O Father, Son, and Spirit blest,"
            "To thee be every prayer addrest,"
            "Who art in threefold Name adored,"
            "From age to age, the only Lord."
          }
        }
      }
      \hspace #1.0

    }
  }
}



