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
  poet = \markup{ \fontsize #4 \smallCaps "Hail, Holy Queen Enthroned Above"  }
  meter = \markup { \small "Music: SALVE REGINA CAELITUM, 8.4.8.4.7.7.7.4.5; harm. Healy Willan" }
  piece = \markup { \small {Text: \italic "Salve Regina caelitum;" Tr. Traditional adapt. by M. Owen Lee }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key c \major
  \time 4/4
    \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  e8 f8 |
  g4 g g a |
  g4. f8 e2 |
  f2 e |
  d c4 \bar "" \break
  e8 f8 |
  g4 g g a |
  g4. f8 e2 |
  f2 e |
  d c \bar "||" \break

  c'4 b a d8 c |
  b4 a g2 |
  c4 b a d8 c |
  b4 a g2 |
  c4 d e c |
  c b c2 |
  c4( b) a2 |
  d4( c) b2 |
  c4( d) e c |
  d2 c2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  c8 d8 |
  e4 f g f |
  e d c2 |
  c4( b) c2 |
  c4( b) c c8 d8 |
  e4 f g f |
  e d c2 |
  c4( d) d( c) |
  c( b) c2 |

  g'4 f8 g a4 a |
  g fs g2 |
  e4 e f! fs |
  g fs g( f)
  e g g e |
  a g e( f) |
  g2 f |
  a g4( f) |
  e( g) g e |
  a( g8 f) e2 |
}

tenor = \relative c' {
  \global
  \partial 4
  g4 |
  c b c c |
  c b c2 |
  a4( f) g2 |
  g2 e4 g |
  c b c c |
  c b g2 |
  a2 g2 |
  g e \bar "||"

  e'4 d c d |
  d c d( b)
  c c c d |
  d c d( b) |
  c b c c |
  d d c( d)
  c2 c2 |
  f2 d2 |
  c4( b) b c |
  c( b) c2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  c4 |
  c d e f |
  g g a2 |
  d,2 c4( e) |
  g4( g,4) c4 c4 |
  c d e f |
  g g, c( b) |
  a( b) c( e) |
  g( g,) c2 |

  c4 d8 e8 f4 fs |
  g a b( g) |
  a g f!8 e8 d4 |
  g a b( g) |
  a g8 f8 e4 a4 |
  f g a2 |
  e f4( e) |
  d2 g2 |
  a4( g8 f8) e4 a4 |
  f( g) c,2 |
}

verseOne = \lyricmode {
  \set stanza = "1."
  Hail, _ Ho --  ly Queen en -- throned a -- bove, O Ma -- rí -- a.
  Hail, _ Queen of mer -- cy and of love, O Ma -- rí -- a.
  Tri -- umph, all ye _ Cher -- u -- bim,
  Sing with us, ye _ Ser -- a -- phim,
  Heav'n and earth re -- sound the hymn:
  Sal -- ve, Sal -- ve, Sal -- ve Re -- gí -- na.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  The _ cause of joy to men be --  low, O Ma -- rí -- a.
  The _ spring through which all gra -- ces flow, O Ma -- rí -- a.
  An -- gels, all your _ prais -- es bring,
  Earth and hea -- ven, _ with us sing,
  All cre -- a -- tion ech -- o -- ing:
  Sal -- ve, Sal -- ve, Sal -- ve Re -- gí -- na.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O _ gen -- tle, lov -- ing, ho -- ly one,  O Ma -- rí -- a.
  The _ God of light be -- came your Son,  O Ma -- rí -- a.
  Tri -- umph, all ye _ Cher -- u -- bim,
  Sing with us, ye _ Ser -- a -- phim,
  Heav'n and earth re -- sound the hymn:
  Sal -- ve, Sal -- ve, Sal -- ve Re -- gí -- na.
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
      tempoWholesPerMinute = #(ly:make-moment 96 4)
    }
  }
  \layout {}
}

%from The New Saint Basil Hymnal - copyright 1958, not renewed
