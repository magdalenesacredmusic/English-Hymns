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
  poet = \markup{ \fontsize #4 \smallCaps "Hail, True Body Of the Saviour"  }
  meter = \markup { \small { Music: FILI MARIAE, 87.87. with refrain; traditional, arr. D. O'Donnell } }
  piece = \markup { \small {Text: \italic "Ave verum corpus;" tr. J. Oxenham, d. 1888 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}


global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d4 e fs8[ e] d4 |
  g fs e fs |

  b a g fs |
  e4. e8 d2 |

  d'4 a b a |
  g a g fs |

  d' cs b a |
  b a8[ gs] a2 |


  e4^\markup {\smallCaps Refrain.}  fs g fs |
  b d a8[ g] fs4 |
  fs b e, a8[ g] |
  fs4 e d2 \bar "|."
}

alto = \relative c' {
  \global
  a4 cs d d |
  b8[ cs] d4 d8[ cs] d4 |

  d4 d d8[ e] e[ d] |
  d4 cs d2

  d4 d d8[ e] fs[ d] |
  e4 e d d |

  d8[ fs] fs[ e] d4 cs |
  fs4 e e2

  cs4 d b8[ cs] d4 |
  d8[ e] fs4 e d |
  ds e8[ d] cs4 d8[ e] |
  d4 cs d2
}

tenor = \relative c {
  \global
  fs4 a a a |
  g a a4 a |

  g8[ b] d8[ a] b[ a] a4 |
  b4 a fs2

  fs8[ g] a8[ fs] b[ cs] d[ a] |
  b4 a a a |

  b as fs cs' |
  d cs8[ b] cs2

  a4 a g a4 |
  b8[ cs] d[ a] a4 a |
  b b a a8[ b] |
  a4 a8[ g] fs2
}

bass = \relative c {
  \global
  d4 a d fs4 |
  e d a d |

  g4 fs b,8[ cs] d4 |
  g,4 a d2


  d8[ e] fs[ d] g4 fs |
  e8[ d] cs[ a] d4 d |

  b cs d fs |
  d e a,2

  a'8[ g] fs4 e d |
  g d cs d
  b'8[ a] g4 a8[ g] fs[ g] |
  a4 a, d2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Hail, true Bo -- dy of the Sav -- iour,
  Spot -- less Ma -- ry's Vir -- gin birth!
  Slain up -- on the cross to cleanse us
  By His pains from sins of earth.

  Hear us, mer -- ci -- ful and gra -- cious,
  O sweet Je -- sus, Ma -- ry's Child.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  From Whose side for sin -- ners pierc -- èd,
  Wa -- ter flowed and min -- gled blood,
  May'st Thou, dear -- est Lord, be giv -- en
  In death's hour to be our food.
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


