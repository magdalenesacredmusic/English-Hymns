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
  poet = \markup{ \fontsize #4 \smallCaps "The King of Love My Shepherd Is"  }
  meter = \markup { \small { Music: ST. COLUMBA, 87.87.; \italic "Ancient Irish Hymn Melody;" \italic "The English Hymnal," 1906} }
  piece = \markup { \small {Text: \italic "Psalm 23," H.W. Baker, \italic "Hymns Ancient and Modern" }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key ef \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  ef8[ f] |
  g2 af4 |
  bf2 af8[ bf] |
  g2 f4 |
  ef2 \bar "||"

  ef8[ f] |
  g2 af4 |
  bf2 \times 2/3 { af8[ bf8 c8] } |
  bf2. |
  bf2 \bar "||"

  bf4 |
  ef2 c4 |
  bf2 af4 |
  g2 f4 |
  ef2 g4 |
  bf2 af4 |
  g2 f4 |
  ef2. |
  ef2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  bf4 |
  ef2 ef4 |
  d2 ef8[ f] |
  ef2 d4 |
  c2 

  ef4 |
  ef2 ef4 |
  ef2 c4 |
  ef2( f4) |
  g2 

  g8[ f] |
  ef2 f4 |
  g2 f4 |
  ef2 d4 |
  c2 d4 |
  ef2 ef4 |
  ef2 d4 |
  ef2( c4) |
  bf2 
}

tenor = \relative c' {
  \global
  \partial 4
  g8[ af] |
  bf2 af4 |
  f2 ef8[ bf'] |
  bf2 bf8[ af] |
  g2 

  g8[ af] |
  bf2 c4 |
  bf2 ef,4 |
  g2( af4) |
  bf2

  bf4 |
  c2 af4 |
  g2 c4 |
  bf4.( c8) d4 |
  ef2 d4 |
  bf2 c4 |
  bf2 af4 |
  g2( af4) |
  g2
}

bass = \relative c {
  \global
  \partial 4
  ef4 |
  ef4( d) c |
  bf2 c8[ d] |
  ef4( g,4) bf |
  c2

  c4 |
  bf2 af4 |
  g2 af4 |
  ef'2. |
  ef2 

  ef8[ d] |
  c2 d4 |
  ef2 f4 |
  g4.( af8) bf4 |
  c2 bf4 |
  g4( g,) af4 |
  bf2 bf4 |
  ef2. |
  ef2 
}

verseOne = \lyricmode {
  \set stanza = "1."
  The King of love my Shep -- herd is,
  Whose good -- ness fail -- eth nev -- er;
  I noth -- ing lack if I am His
  And He is mine for -- ev -- er.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Where streams of liv -- ing wat -- er flow
  My ran -- somed soul He lead -- eth,
  And where the ver -- dant pas -- tures grow,
  With food cel -- es -- tial feed -- eth.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Per -- verse and fool -- ish oft I strayed,
  But yet in love He sought me,
  And on His shoul -- der gent -- ly laid,
  And home, re -- joic -- ing, brought me.
}

verseFour = \lyricmode {
  \set stanza = "4."
  In death’s dark vale I fear no ill
  With Thee, dear Lord, be -- side me;
  Thy rod and staff my com -- fort still,
  Thy Cross be -- fore to guide me.
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
  \layout { }
}

\markup {
  \large{
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "4. "
          \column {
            "Thou spread’st a table in my sight;"
            "  Thy Unction grace bestoweth;"
            "And O what transport of delight"
            "  From Thy pure Chalice floweth!"
          }
        }
        \vspace #1
        \line {
          \bold "5. "
          \column {
            "And so through all the length of days"
            "  Thy goodness faileth never;"
            "Good Shepherd, may I sing Thy praise"
            "  Within Thy house forever."
          }
        }
      }
      \hspace #1.0

    }
  }
}

