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
  poet = \markup{ \fontsize #4 \smallCaps "All Glory, Laud, and Honour"  }
    meter = \markup { \small {Music: ST. THEODULPH, 7.6.7.6. D; M. Teschner; harm. J.S.Bach, adapt. }}
  piece = \markup { \small {Text: \italic "Gloria, laus, et honor," Palm Sunday Procession, tr. J.M. Neale, \italic "Hymns Ancient and Modern" }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

refrain = \relative c' {
  \global
  \partial 4
  \repeat volta 2 {
    c4 |
    g' g a b |
    c2 c4 \bar "||"

    e |
    d c c b |
    c2. ^\markup { \italic Fine.}
  } \break
}

verses = \relative c'' {

  c4 |
  e4 e d c |
  b4( a4) g \bar "||"

  b4 |
  c b a a |
  g2. \bar "||"

  g4 |
  e4 g4 a g |
  g( f) e \bar "||"

  g4 |
  f e d d |
  c2. ^\markup { \italic D.C. }\bar "||"
}

alto = \relative c' {
  \global
  \partial 4
  \repeat volta 2 {
    g4 |
    c e f e |
    e2 e4 \bar "||"

    a |
    a f e d |
    e2.
  }

  e8[ f] |
  g4 a a fs |
  g4( fs) d \bar "||"

  g |
  g g g fs |
  d2. \bar "||"

  d4 |
  c8[ d] e4 f e |
  e( d) c \bar "||"

  c4 |
  c c c b |
  g2. \bar "||"
}

tenor = \relative c {
  \global
  \partial 4
  \repeat volta 2 {
    e4 |
    g c c b |
    a2 a4 \bar "||"

    c4 |
    a a g g |
    g2.
  }

  g4 |
  c c d d |
  d4( c) b \bar "||"

  d4 |
  c d e d8[ c] |
  b2. \bar "||"

  g4 |
  g c c bf |
  a2 a4 \bar "||"

  e |
  f g a g8[ f] |
  e2. \bar "||"
}

bass = \relative c {
  \global
  \partial 4
  \repeat volta 2 {
    c4 |
    e c f gs, |
    a2 a4 \bar "||"

    a'4 |
    f d g g, |
    c2.
  }

  c4 |
  c'8[ b] a[ g] fs4 d4 |
  g2 g,4 \bar "||"

  f'!4 |
  e d c d |
  g,2. \bar "||"

  b4 |
  c bf a8[ b] cs4 |
  d2 a4 \bar "||"

  bf4 |
  a g fs g |
  c2. \bar "||"
}

refrainText = \lyricmode {
  <<
    {
      \override LyricText #'font-shape = #'italic
      All glo -- ry, laud, and hon -- our
      To Thee, Re -- dee -- mer, King,
    }
    \new Lyrics {
      \set associatedVoice = "refrain"
      \override LyricText #'font-shape = #'italic
      To whom the lips of chil -- dren
      Made sweet ho -- san -- nas ring.
    }
  >>
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Thou art the King of Is -- rael,
  Thou Da -- vid's roy -- al Son,
  Who in the Lord's name com -- est,
  The King and Bles -- sèd One.
}

verseThree = \lyricmode {
  \set stanza = "3."
  The com -- pa -- ny of An -- gels
  Are prais -- ing Thee on high,
  And mor -- tal men and all things
  Cre -- a -- ted make re -- ply.
}

verseFour = \lyricmode {
  \set stanza = "4."
  The peo -- ple of the He -- brews
  With palms to meet Thee went:
  Our praise and pray'r and an -- thems
  Be -- fore Thee we pre -- sent.
}

verseFive = \lyricmode {
  \set stanza = "5."
  To Thee be-- fore Thy Pas -- sion
  They sang their hymns of praise;
  To Thee now high ex -- alt -- ed
  Our mel -- o -- dy we raise.
}

verseSix = \lyricmode {
  \set stanza = "6."
  Thou didst ac -- cept their prais -- es,
  Ac -- cept the praise we bring,
  Who in all good de -- light -- est,
  Thou good and gra -- cious King.
}

%%%%%%
%%%%%%
%%%%%%

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice = refrain {
        \voiceOne
        \refrain {
          \context Voice = verses {
            \voiceOne
            \verses
          }
        }
      }
      \context Voice =
      altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto refrain \refrainText
      \context Lyrics = two \lyricsto verses \verseTwo
      \context Lyrics = three \lyricsto verses \verseThree
      \context Lyrics = four \lyricsto verses \verseFour
      \context Lyrics = five \lyricsto verses \verseFive
      \context Lyrics = six \lyricsto verses \verseSix
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