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
  poet = \markup{ \fontsize #4 \smallCaps "When, Rising From the Bed of Death"  }
  meter = \markup { \small { Music:  THIRD MODE MELODY, D.C.M.; T. Tallis, 1561; arr. R. Vaughan Williams, 1906 } }
  piece = \markup { \small {Text: J. Addison, (1672-1719) }}
  %breakbefore
  %copyright = ""
  tagline = ""
}


global = {
  \key c \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  e4 g g \bar "|"
  g2. g4 a a \bar "|"
  b2. b4 \bar "|"
  b2. b4 b c \bar "|"
  b2. \bar "||"

  e,4 b' b \bar "|"
  b2. g4 a a \bar "|"
  b2. b4 \bar "|"
  b2. b4 c a \bar "|"
  b2. \bar "||" \break

  b4 \bar "|"
  b4.( c8) d4
  e2 d4 \bar "|"
  c4 c b2.
  g4 \bar "|"
  a2. e4 f f \bar "|"
  e2. \bar "||" \break

  a4 \bar "|"
  c4.( b8) a4
  g2 e4 \bar "|"
  a4.( g8) f4
  e2
  g4 \bar "|"
  f d e e \bar "|"
  e2. \bar "|."
}

alto = \relative c' {
  \global
  e4 e e |
  e2. e4 c d |
  b2. e4 |
  e2. ds4 e e |
  e2.

  e4 e e |
  e2. e4 e d |
  b2. e4 |
  e2. e4 e c |
  e2. |

  e4 |
  e( g) f
  e2 g4 |
  e e e2.
  e4 |
  e2. e4 e d |
  c2. |

  c4 |
  c2 c4
  c2 c4 |
  c2 c4
  c2 |

  c4 |
  c d c c |
  b2.
}

tenor = \relative c' {
  \global
  g4 b b |
  b2. b4 a a |
  gs2.
  gs4 |
  gs2. fs4 gs a |
  gs2. |

  g4 g g |
  g2. b4 a a |
  gs2. |
  gs4 |
  gs2. gs4 a a |
  gs2. |

  g4 |
  g4.( a8) b4
  c2 b4 |
  a4 a g2. |
  b4 |
  c2. a4 a a |
  a2.

  e4 |
  a4.( g8) f4
  e2 g4 |
  c4.( b8) a4 |
  g2
  e4 |

  a4 a a e8[ fs] |
  gs2.
}

bass = \relative c {
  \global
  e4 e e |
  e2. g4 f f |
  e2.
  e4 |
  e2. b4 e a, |
  e'2. |

  e4 e e |
  e2. g4 f f |
  e2.
  e4 |
  e2. e4 a, a |
  e'2. |

  e4 |
  e2 d4
  c2 g4 |
  a a e'2. |
  e4 |
  a,2. c4 d d |
  a2. |

  a4 a2 a4
  c2 c4 |
  a4 f2
  c'2 |
  c4 |
  f, f a a |
  e'2.

}

verseOne = \lyricmode {
  \set stanza = "1."
  When, ris -- ing from the bed of death,
  O'er -- whelmed with guilt and fear,
  I see my Mak -- er face to face,
  O how shall I ap -- pear?
  If yet, while par -- don may be found,
  And mer -- cy may be sought,
  My heart with in -- ward hor -- ror shrinks,
  And trem -- bles at the thought;
}

verseTwo = \lyricmode {
  \set stanza = "2."
  When thou, O Lord, shalt stand dis -- closed
  In ma -- jes -- ty se -- vere,
  And sit in judg -- ment on my soul,
  O how shall I ap -- pear?
  But thou hast told the trou -- bled mind
  who does her sins la -- ment,
  The time -- ly trib -- ute of her tears
  Shall end -- less woes pre -- vent.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Then see the sor -- row of my heart,
  Ere yet it be too late;
  And hear my Sav -- ior's dy -- ing groans,
  To give these sor -- rows weight.
  For nev -- er shall my soul de -- spair
  Her par -- don to pro -- cure,
  Who knows thine on -- ly Son has died
  To make her par -- don sure.
}

%{

verseFour = \lyricmode {
	\set stanza = "4."

}

verseFive = \lyricmode {
	\set stanza = "5."

}

verseSix = \lyricmode {
	\set stanza = "6."

}

%}


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
      %{\context Lyrics = four \lyricsto sopranos \verseFour
	  \context Lyrics = five \lyricsto sopranos \verseFive
	  \context Lyrics = six \lyricsto sopranos \verseSix %}

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
      tempoWholesPerMinute = #(ly:make-moment 100 4)
    }
  }
  \layout {}
}
