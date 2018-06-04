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
  poet = \markup{ \fontsize #4 \smallCaps "Christ Jesus Lay In Death's Strong Bands"  }
  meter = \markup { \small { Music: CHRIST LAG IN TODESBANDEN, 87.87.78.74., J. Walther; arr. \italic "The Chorale Book for England" }}
  piece = \markup { \small {Text: "Christ lag in Todesbanden," Martin Luther, 1524; tr. R. Massie, \italic "Martin Luther's Spiritual Songs" }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

\paper {
  page-count = 2
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  a4 g a c d |
  c b a \bar "||" a |
  f g a f |
  e2 d4 \bar "||" a'4 |

  g a c d |
  c b a \bar "||" a4 |
  f g a f |
  e2 d2 \bar "||"

  d4 f g d |
  f g a \bar "||" a4 |
  d c d e |
  c b a \bar "||" a4 |
  c a c g |
  f( e) d2 \bar "||"

  a'4 g8[ f] e2 |
  d2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  e4 |
  e e f f |
  e e c c |
  d e f d |
  d( cs) d e |

  e e f f |
  e e c c |
  d e f d |
  d( cs) d2 |

  a4 d d d |
  a c c d |
  f e a gs |
  e e c c |
  c c e d |
  d( cs) d2 |

  d4 d cs2 |
  d2.
}

tenor = \relative c' {
  \global
  \partial 4
  c4 |
  b c a a |
  a gs a \bar "||" a |
  bf bf c a |
  a2 f4 \bar "||" c'4 |

  b c a a |
  a gs a \bar "||" a |
  bf bf c a |
  a2 f2 \bar "||"

  f4 f bf g |
  f f8[ e] f4 \bar "||" f4 |
  a a a b |
  a gs a \bar "||" a4 |
  g a g g |
  a4. g8 f2 \bar "||"

  f4 bf bf4( a8[ g]) |
  fs2. \bar "|."
}

bass = \relative c' {
  \global
  \partial 4
  a4 |
  e a f d |
  a' e a, f' |
  bf, g f4. g8 |
  a2 d4 a |

  e' a f d |
  a' e a, f' |
  bf, g f4. g8 |
  a2 d2 |

  d4 bf g bf |
  d c f, d' |
  d a' f e |
  a e a, f' |
  e f c bf |
  a2 d2 |

  f,4 g a2 |
  d2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Christ Je -- sus lay in Death's strong bands,
  For our of -- fen -- ces gi -- ven;
  But now at God's right hand He stands,
  And brings us life from hea -- ven:
  Where -- fore let us joy -- ful be,
  And sing to God right thank -- ful -- ly
  Loud songs of Hal -- le -- lu -- jah!
  Hal -- le -- lu -- jah!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  No man from Death could vic -- t'ry win,
  O'er all man -- kind he reign -- ed;
  A -- las! that com -- eth of our sin,
  There was not one un -- stain -- ed:
  Where -- fore Death in tri -- umph came,
  And o -- ver us a right did claim;
  He held us all in thral -- dom.
  Hal -- le -- lu -- jah!
}

verseThree = \lyricmode {
  \set stanza = "3."
  Christ Je -- sus, God's own Son, came down,
  That He might us de -- li -- ver,
  And sin des -- troy -- ing, took his crown
  From Death's pale brows for ev -- er:
  Stript of pow'r, no more he reigns;
  An emp -- ty Shape a -- lone re -- mains;
  His sting is lost for ev -- er.
  Hal -- le -- lu -- jah!
}

verseFour = \lyricmode {
  \set stanza = "4."
  It was a strange and dread -- ful strife,
  When Life and Death con -- tend -- ed;
  The vic -- to -- ry re -- mained with Life,
  The reign of Death was end -- ed:
  Ho -- ly Scrip -- ture plain -- ly saith,
  That Death is swal -- lowed up by Death,
  Made hence -- forth a de -- ri -- sion.
  Hal -- le -- lu -- jah!
}


verseFive = \lyricmode {
  \set stanza = "5."
  Here the true Pas -- chal Lamb we see,
  Whom God so free -- ly gave us;
  He died on the ac -- curs -- ed tree
  So strong His love! to save us:
  See! His blood doth mark our door,
  Faith points to it, Death pas -- ses o'er,
  The Mur -- d'rer can -- not harm us.
  Hal -- le -- lu -- jah!
}

verseSix = \lyricmode {
  \set stanza = "6."
  So let us keep the fes -- ti -- val
  Where -- to the Lord in -- vites us;
  Christ is Him -- self the joy of all,
  The sun that warms and lights us.
  By His grace He doth im -- part
  E -- ter -- nal sun -- shine to the heart;
  The night of sin is end -- ed!
  Hal -- le -- lu -- jah!
}

verseSeven = \lyricmode {
  \set stanza = "7."
  Then let us feast this Eas -- ter day
  On the true Bread of heav -- en;
  The Word of grace hath purged a -- way
  The old and wick -- ed leav -- en:
  Christ a -- lone our souls will feed,
  He is our meat and drink in -- deed;
  Faith lives up -- on no oth -- er.
  Hal -- le -- lu -- jah!
}

%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%

sopranoa = \relative c'' {
  \global
  \partial4

  a4 |
  gs a8[ b] c4 d |
  c b a a |
  f g a g8[ f] |
  e[( d] e4) d4 \bar "||"

  a' |
  gs a8[ b] c4 d |
  c b a a |
  f g a g8[ f] |
  e[( d] e4) d4 \bar "||"

  b'4\rest |
  d,8[ e] f4 g d8[ e] |
  f4 g a a |
  d cs d e8[ d] |
  c4 b a \bar "" \break

  a |
  c a8[ bf] c4 g |
  f( e) d2 |

  a'4( g) f2 |
  e d4 \bar "|."
}

altoa = \relative c' {
  \global
  \partial 4
  f4 |
  e e e e |
  e e8[ d] cs4 e |
  d c c8[ cs] d4 |
  d( cs) a4

  f' |
  e e e e |
  e e8[ d] cs4 e |
  d c c8[ cs] d4 |
  d( cs) a4 s4 |

  a4 d d4. cs8 |
  d4 c c f8[ g] |
  a4 g a e |
  e e8[ d] c4 d |
  e c f e |
  e8[ d] d[ cs] d2 |
  c8[ d] e4~ e8[ cs] d4 |
  d( cs) a4
}

tenora = \relative c' {
  \global
  \partial 4

  d8[ c] |
  b4 c8[ gs] a4 b |
  a gs e a |
  a8[ bf] a[ g] f[ g] a4 |
  bf4 e,8[ g] f4

  d'8[ c] |
  b4 c8[ gs] a4 b |
  a gs e a |
  a8[ bf] a[ g] f[ g] a4 |
  bf4 e,8[ g] f4 s4

  f8[ g] a4 g8[ a] bf4 |
  a g f c' |
  f e d8[ c] b4 |
  a gs e f |
  g f f c'8[ bf] |
  a4 g f2 |
  f4( e8[ a]) a4( bf~ |
  bf) a8[ g] fs4
}

bassa = \relative c {
  \global
  \partial 4
  d4 |
  e8[ d] c[ b] a4 gs |
  a <e e'> a cs |
  d g f8[ e] d4 |
  g,8[ a16 bf] a4 d

  d |
  e8[ d] c[ b] a4 gs |
  a <e e'> a cs |
  d g f8[ e] d4 |
  g,8[ a16 bf] a4 d d\rest

  d4. c8 bf[ a] g4 |
  d' e f f8[ e] |
  d4 e fs gs |
  a e a, d |
  c f a,8[ bf] c4 |
  d a bf2

  f'4( cs) d( bf) |
  g( a) <d d,>4
}

%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%

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
      \context Lyrics = five \lyricsto sopranos \verseFive
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
      tempoWholesPerMinute = #(ly:make-moment 80 4)
    }
  }
  \layout {}
}

%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranos { \voiceOne << \sopranoa >> }
      \context Voice =
      altos { \voiceTwo << \altoa >> }
      \context Lyrics = six \lyricsto sopranos \verseSix
      \context Lyrics = seven \lyricsto sopranos \verseSeven
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenora >> }
      \context Voice =
      basses { \voiceTwo << \bassa >> }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 72 4 )
    }
  }
  \layout {}
}
