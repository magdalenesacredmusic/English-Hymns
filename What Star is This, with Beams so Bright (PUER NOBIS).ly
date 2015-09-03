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
  poet = \markup{ \fontsize #4 \smallCaps "What Star is this, with Beams so Bright"  }
  meter = \markup { \small { Music: PUER NOBIS NASCITUR, L.M.; Trad. or M. Praetorius; harm. G.R. Woodward, 1902 } }
  piece = \markup { \small {Text: \italic "Quae stella sole pulchrior," Charles Coffin; tr. John Chandler, 1837 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key d \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  d2 e4 |
  fs2 g4 |
  fs2 e4 |
  d2 d4 |
  a'2 a4 |
  a4( b) cs |
  d2 d4 |
  d2 \bar "||"

  a4 |
  d2 d4 |
  cs2 a4 |
  b2 b4 |
  a2 g4 |
  a2 fs4 |
  e2 fs4 |
  d2 cs4 |
  d2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  a4 |
  d2 cs4 |
  d2 d4 |
  d2 a4 |
  fs2 d'4 |
  d( g) fs |
  e2 e4 |
  fs2 g4 |
  fs2 \bar "||"

  e4 |
  d( fs) e |
  e2 d4 |
  b2 d4 |
  d2 b4 |
  e2 d4 |
  cs2 d4 |
  b2 a4 |
  a2 \bar "|."
}

tenor = \relative c {
  \global
  \partial 4
  fs4 |
  fs2 a4 |
  a2 d,4 |
  a'4( b) cs |
  d2 d4 |
  d2 a4 |
  a2 a4 |
  a2 b4 |
  a2 \bar "||"

  a4 |
  b2 b4 |
  a( g) fs |
  g2 g4 |
  fs2 g4 |
  e2 a4 |
  a2 a4 |
  g( fs) e |
  fs2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  b2 a4 |
  d( cs) b |
  a( g) a |
  d2 g4 |
  fs( e) d |
  cs2 a4 |
  d2 d4 |
  d2 \bar "||"

  cs4 |
  b( a) gs |
  a2 d4 |
  g,2 b4 |
  d2 e4 |
  cs2 d4 |
  a( g) fs |
  g2 a4 |
  d2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  What star is this, with beams so bright,
  More love -- ly than the noon -- day light?
  ’Tis sent to~an -- nounce a new -- born King,
  Glad tid -- ings of our God to bring.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  'Tis now ful -- filled what God de -- creed,
  “From Ja -- cob shall a star pro -- ceed”;
  And lo! the East -- ern sa -- ges stand
  To read in heav'n the Lord’s com -- mand.
}

verseThree = \lyricmode {
  \set stanza = "3."
  While out -- ward signs the star dis -- plays,
  An in -- ward light the Lord con -- veys,
  And ur -- ges them, with force be -- nign,
  To seek the Gi -- ver of the sign.
}

verseFour = \lyricmode {
  \set stanza = "4."
  True love can brook no dull de -- lay,—
  Through toils and dan -- gers lies their way:
  And yet their home, their friends, their all,
  They leave at once, at God's high call.
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

  \layout { }
}

\markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "4. "
          \column {
            "O, while the star of heavenly grace"
            "Invites us, Lord, to seek Thy face,"
            "May we no more that grace repel,"
            "Or quench that light which shines so well!"
          }
        }
        \vspace #1
        \line {
          \bold "5. "
          \column {
            "To God the Father, God the Son,"
            "And Holy Spirit, Three in One,"
            "May every tongue and nation raise"
            "An endless song of thankful praise!"
          }
        }
      }
      \hspace #1.0

    }
  }
}
