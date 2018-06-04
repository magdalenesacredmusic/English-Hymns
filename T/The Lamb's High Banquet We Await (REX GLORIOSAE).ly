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
  poet = \markup{ \fontsize #4 \smallCaps "The Lamb's High Banquet We Await"  }
  meter = \markup { \small { Music: REX GLORIOSAE, L.M.; French Church Melody, harm. \italic "The English Hymnal" } }
  piece = \markup { \small {Text: \italic "Ad cenam Agni providi," 7th c.; tr. J.M. Neale  }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key f \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4^\markup {\italic "To be sung in unison."} |
  a'2 g4 |
  f( e) d |
  a'2 b4 |
  c2 \bar "||"

  a4 |
  d2 c4 |
  bf( a) g |
  a( g4.) f8 |
  f2 \bar "||"

  a4 |
  c2 c4 |
  d2 a4 |
  g( f) g |
  a2 \bar "||"

  f4 |
  bf( a) g |
  a( g) f |
  e2 d4 |
  d2 \bar "|."
}

soprano = \relative c' {
  \global
  \partial 4
  d4 |
  a'2 g4 |
  f( e) d |
  a'2 b4 |
  c2 \bar "||"

  a4 |
  d2 c4 |
  bf( a) g |
  a( g4.) f8 |
  f2 \bar "||"

  a4 |
  c2 c4 |
  d2 a4 |
  g( f) g |
  a2 \bar "||"

  f4 |
  bf( a) g |
  a( g) f |
  e2 d4 |
  d2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  d2 <bf d>4 |
  d2 a4 |
  f'2 d4 |
  e2

  f4 |
  f2 f4 |
  <bf, d>2 <c e>4 |
  <c e>2~ <c e>8[ <a c>] |
  <a c>2

  d4 |
  e2 f4 |
  f2. |
  d2. |
  c2

  d4 |
  d2 e4 |
  c2 c4 |
  c2 a4 |
  a2 \bar "|."
}

tenor = \relative c {
  \global
  \partial 4
  <f a>4 |
  f2 g4 |
  a2 f4 |
  c'2 g4 |
  g2

  f4 |
  a2. |
  g2. |
  e2~ e8[ f8] |
  s2

  f4 |
  g2 a4 |
  bf2 a4 |
  d,2. |
  e2

  d4 |
  g2 g4 |
  f2 f4 |
  g2 f4 |
  f2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  d2 g,4 |
  d'2 d4 |
  f2 g4 |
  c,2

  f4 |
  d2 f4 |
  g,2 c4 |
  a( c4.) f8 |
  f2

  d4 |
  c2 f4 |
  bf,2 d4 |
  bf2 bf4 |
  a2

  d4 |
  g,2 c4 |
  f,2 a4 |
  c2 d4 |
  d2 \bar "|."
}


verseOne = \lyricmode {
  \set stanza = "1."
  The Lamb's high ban -- quet we a -- wait
  In snow white robes of roy -- al state;
  And now, the Red Sea's chan -- nel past,
  To Christ, our Prince, we sing at last.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Up -- on the Al -- tar of the Cross
  His Bod -- y hath re -- deemed our loss:
  And tast -- ing of his ro -- seate Blood,
  Our life is hid with Him in God.
}

verseThree = \lyricmode {
  \set stanza = "3."
  That Pas -- chal Eve God's arm was bared,
  The de -- va -- stat -- ing An -- gel spared:
  By strength of hand our hosts went free
  From Pha -- raoh's ruth -- less ty -- ran -- ny.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Now Christ, our Pas -- chal Lamb, is slain,
  The Lamb of God that knows no stain,
  The true O -- bla -- tion of -- fered here,
  Our own un -- leav -- ened Bread sin -- cere.
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
      tempoWholesPerMinute = #(ly:make-moment 112 4)
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
            "O Thou, from whom hell's monarch flies,"
            "O great, O very Sacrifice,"
            "Thy captive people are set free,"
            "And endless life restored in Thee."
          }
        }
        \vspace #0.5
        \line {
          \bold "6. "
          \column {
            "For Christ, arising from the dead,"
            "From conquered hell victorious sped,"
            "And thrust the tyrant down to chains,"
            "And Paradise for man regains."
          }
        }
      }
      \hspace # 0.1
      \column {
        \line {
          \bold "7. "
          \column {
            "We pray Thee, King with glory decked,"
            "In this our Paschal joy, protect"
            "From all that death would fain effect"
            "Thy ransomed flock, Thine own elect."
          }
        }
        \vspace #0.5
        \line {
          \bold "8. "
          \column {
            "To Thee who, dead, again dost live,"
            "All glory Lord, Thy people give;"
            "All glory, as is ever meet,"
            "To Father and to Paraclete. Amen."
          }
        }
      }
      \hspace #1.0

    }
  }
}



