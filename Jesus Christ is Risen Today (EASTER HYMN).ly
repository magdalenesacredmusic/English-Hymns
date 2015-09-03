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
  poet = \markup{ \fontsize #4 \smallCaps "Jesus Christ is Risen Today"  }
  meter = \markup { \small { Music: EASTER HYMN, 7.7.7.7., with Alleluias; alt. from \italic "Lyra Davidica," 1708} }
  piece = \markup { \small {Text: Based on \italic "Surrexit Christus hodie," 14th cent.; traditional text, various authors }}
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

melody = \relative c' {
  \global
  c4 e g c, |
  f a a( g) \bar "||"
  e8[( f g c,] f4) e8[ f] |
  e4( d) c2 \bar "||"

  f4 g a g |
  f e e( d) \bar "||"
  e8[( f g c,] f4) e8[ f] |
  e4( d) c2 \bar "||"

  b'4 c d g, |
  c d e2 \bar "||"
  b8[( c d g,] c4) b8[ c] |
  b4( a) g2 \bar "||"

  g8[ a] b[ g] c4 e, |
  f a a( g) \bar "||"
  c8[( b c g] a[ b]) c[ d] |
  c4( b) c2 \bar "|."
}

alto = \relative c' {
  \global
  c4 c d c |
  c f f( e) |
  c2~( c8[ b]) c4 |
  c( b) c2 |

  c4 c c c |
  c8[ b] c4 c( b) |
  c2~( c8[ b]) c4 |
  c( b) c2 |

  g'4. fs8 g4 g |
  g f! e2 |
  g2~( g8[ fs]) g4 |
  g( fs) g2 |

  b,8[ c] d[ b] c4 c |
  c f f( e) |
  e8[( f g e] f4) e8[ f] |
  e4( g8[ f]) e2
}

tenor = \relative c {
  \global
  e4 g g e |
  c' c c2 |
  g( a8[ f]) g[ f] |
  g4.( f8) e2 |

  f4 e f g |
  a8[ f] g4 g2 |
  g( a8[ f]) g[ f] |
  g4.( f8) e2 |

  d'4 c b b |
  c4. b8 c2 |
  d2~ d4 d8[ c] |
  d4.( c8) b2 |

  g4 g g c8[ b] |
  c4 c c2 |
  g4.( c8~ c[ d]) c[ a] |
  g2 g
}

bass = \relative c {
  \global
  c4 c b c |
  a' f c2 |
  c8[( d] e4 d) c8[ a] |
  g2 c |

  a4 c f e |
  d c g2 |
  c8[( d] e4 d) c8[ a] |
  g2 c |

  g4 a b g'8[ f!] |
  e4 d c2 |
  g'8[( a] b4 a) g8[ e] |
  d2 g, |

  g'4. f8 e4 c'8[ b] |
  a4 f c2 |
  c8[( d e c] f[ d]) e[ f] |
  g4( g,) c2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Je -- sus Christ is ris'n to -- day, Al -- le -- lu -- ia!
  Our tri -- um -- phant ho -- ly day; Al -- le -- lu -- ia!
  Who did once, up -- on the cross, Al -- le -- lu -- ia!
  Suf -- fer to re -- deem our loss. Al -- le -- lu -- ia!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Hymns of praise then let us sing Al -- le -- lu -- ia!
  Un -- to Christ our heav'n -- ly King: Al -- le -- lu -- ia!
  Who en -- dured the cross and grave, Al -- le -- lu -- ia!
  Sin -- ners to re -- deem and save. Al -- le -- lu -- ia!
}

verseThree = \lyricmode {
  \set stanza = "3."
  But the pains which He en -- dured Al -- le -- lu -- ia!
  Our sal -- va -- tion hath pro -- cured: Al -- le -- lu -- ia!
  Now a -- bove the sky He's King, Al -- le -- lu -- ia!
  Where the an -- gels ever sing. Al -- le -- lu -- ia!
}

verseFour = \lyricmode {
  \set stanza = "4."
  Sing we to our God a -- bove— Al -- le -- lu -- ia!
  Praise e -- ter -- nal as His love; Al -- le -- lu -- ia!
  Praise Him all ye heav'n -- ly host, Al -- le -- lu -- ia!
  Fa -- ther, Son, and Ho -- ly Ghost. Al -- le -- lu -- ia!
}


\score {
  \new ChoirStaff <<
    \new Staff  <<
      \new Voice = "soprano" { \voiceOne \melody }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics  \lyricsto soprano \verseOne
    \new Lyrics  \lyricsto soprano \verseTwo
    \new Lyrics  \lyricsto soprano \verseThree
    \new Lyrics \lyricsto soprano \verseFour
    \new Staff  <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 80 4)
    }
  }
  \layout { }
}

