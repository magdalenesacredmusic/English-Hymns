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
  poet = \markup{ \fontsize #4 \smallCaps "He is Risen, He is Risen"  }
  meter = \markup { \small { Music: UNSER HERRSCHER (NEANDER), 87.87.77.; J. Neander, 1680; harm. \italic "The English Hymnal," 1906  } }
  piece = \markup { \small {Text: C.F. Alexander, 1846, alt. }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

\paper {
  page-count = 1
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  c4. d8 e4 c |
  e4 f g g |
  c4 b8[ a] g4 e' |
  d d c2 \bar "||"

  c,4. d8 e4 c |
  e4 f g g |
  c4 b8[ a] g4 e' |
  d d c2 \bar "||"

  e4. e8 d4 d |
  c4. c8 b2 |
  a4. a8 g4 c |
  d b c2 \bar "|."
}

alto = \relative c' {
  \global
  c4. b8 c4 c |
  c c d d |
  c d e g |
  a g e2 |

  c4. b8 c4 c |
  c c d d |
  c d e g |
  a g e2 |

  g4. g8 g4 g |
  e4. e8 e2 |
  c4 b c e |
  d d e2
}

tenor = \relative c {
  \global
  e4. g8 g4 g |
  a c c b |
  a b c c |
  c b c2 |

  e,4. g8 g4 g |
  a c c b |
  a b c c |
  c b c2 |

  c4. c8 c4 b |
  \mergeDifferentlyDottedOn a4. a8 a4( gs) |
  a f g a |
  a g g2
}

bass = \relative c {
  \global
  c4. g8 c4 e |
  a a g g |
  a g8[ f] e4 c |
  f g c,2 |

  c4. g8 c4 e |
  a a g g |
  a g8[ f] e4 c |
  f g c,2 |

  c4 e8[ f] g4 g |
  a c,8[ d] e2 |
  f4 d e a |
  f g c,2

}

verseOne = \lyricmode {
  \set stanza = "1."
  He is ris -- en, He is ris -- en!
  Tell it out with joy -- ful voice:
  He has burst His three days' pris -- on;
  Let the whole wide earth re -- joice:
  Death is con -- quered, man is free,
  Christ has won the vic -- to -- ry.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Come, ye sad and fear -- ful -- heart -- ed,
  With glad smile and ra -- diant brow:
  Lent's long sha -- dows have de -- part -- ed;
  All His woes are o -- ver now,
  And the Pas -- sion that He bore:
  Sin and pain can vex no more.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Come, with high and ho -- ly hymn -- ing,
  Chant our Lord's tri -- um -- phant lay;
  Not one dark -- some cloud is dim -- ming
  Yon -- der glo -- rious morn -- ing ray,
  Break -- ing o'er the pur -- ple east,
  Sym -- bol of our East -- er feast.
}

verseFour = \lyricmode {
  \set stanza = "4."
  He is ris -- en, He is ris -- en!
  He hath o -- pened heav -- en's gate:
  We are free from sin's dark pris -- on
  Ris -- en to a ho -- lier state;
  And a bright -- er East -- er beam
  On our long -- ing eyes shall stream.
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
      tempoWholesPerMinute = #(ly:make-moment 96 4)
    }
  }
  \layout {}
}
