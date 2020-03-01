%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {IN BABILONE 87 87 D}
    }
    \column{
      \line {Dutch Traditional Melody, arr. J. Röntgen}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {F.W. Faber, 1862}
    } 
  }
}


global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g4 fs8[ e] d4 g |
  a g8[ a] b4 g \bar "||"
  c4 b8[ a] b4 a8[ g] |
  fs8[ g] a[ fs] g2 \bar "||"

  g4 fs8[ e] d4 g |
  a g8[ a] b4 g \bar "||"
  c4 b8[ a] b4 a8[ g] |
  fs8[ g] a[ fs] g2 \bar "||"

  g4 a8[ b] c4 b |
  a gs a a \bar "||"
  a4 b8[ c] d4 g, |
  a g8[ fs] e4( d) \bar "||"

  g4 fs8[ e] d4 g |
  a g8[ a] b4 g \bar "||"
  c4 b8[ a] b4 a8[ g] |
  fs8[ g] a[ fs] g2 \bar "|."
}

alto = \relative c' {
  \global
  d4 c b b |
  e e8[ fs] g4 d |
  e d d e |
  c8[ d] e[ d] d2 |

  d4 c b b |
  e e8[ fs] g4 d |
  e d d e |
  c8[ d] e[ d] d2 |

  b4 f' e f |
  e e e e |
  fs d d e |
  d d cs( d) |

  d4 c b b |
  e e8[ fs] g4 d |
  e d d e |
  c8[ d] e[ d] d2
}

tenor = \relative c' {
  \global
  b4 a8[ fs] g4 g |
  g d' d g, |
  g fs g b |
  c8[ b] a[ c] b2 |

  b4 a8[ fs] g4 g |
  g d' d g, |
  g fs g b |
  c8[ b] a[ c] b2 |

  g4 f g d' |
  c b c c |
  d fs, g b |
  a b g( fs) |

  b4 a8[ fs] g4 g |
  g d' d g, |
  g fs g b |
  c8[ b] a[ c] b2
}

bass = \relative c {
  \global
  g4 a b e |
  c d g, b |
  a d b e |
  a,8[ b] c[ d] g,2 |

  g4 a b e |
  c d g, b |
  a d b e |
  a,8[ b] c[ d] g,2 |

  e'4 d c d |
  e e a, a |
  d c b e |
  fs, g a( d) |

  g,4 a b e |
  c d g, b |
  a d b e |
  a,8[ b] c[ d] g,2
}

verseOne = \lyricmode {
  \set stanza = "1. "
  There's a wide -- ness in God's mer -- cy,
  Like the wide -- ness of the sea;
  There's a kind -- ness in his jus -- tice,
  Which is more than li -- ber -- ty.

  There is no place where earth's sor -- rows
  Are more felt than up in heav'n;
  There is no place where earth's fail -- ings
  Have such kind -- ly judge -- ment giv'n.
}

verseTwo = \lyricmode {
  \set stanza = "2. "
  There is grace e -- nough for thou -- sands
  Of new worlds as great as this;
  There is room for fresh cre -- a -- tions
  In that up -- per home of bliss.

  For the love of God is broad -- er
  Than the mea -- sures of man's mind;
  And the heart of the E -- ter -- nal
  Is most won -- der -- ful -- ly kind.
}

verseThree = \lyricmode {
  \set stanza = "3. "
  But we make his love too nar -- row
  By false lim -- its of our own;
  And we mag -- ni -- fy his strict -- ness
  With a zeal he will not own.

  There is plen -- ti -- ful re -- demp -- tion
  In the Blood that has been shed,
  There is joy for all the mem -- bers
  In the sor -- rows of the Head.
}

verseFour = \lyricmode {
  \set stanza = "4. "
  'Tis not all we owe to Je -- sus;
  It is some -- thing more than all;
  Great -- er good be -- cause of e -- vil,
  Larg -- er mer -- cy through the fall.

  If our love were but more sim -- ple,
  We should take him at his word;
  And our lives would be all sun -- shine
  In the sweet -- ness of our Lord.
}


\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
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
        tempoWholesPerMinute = #(ly:make-moment 84 4)
      }
    }
    \include "hymn_layout.ly"
  }
  \bottom
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}