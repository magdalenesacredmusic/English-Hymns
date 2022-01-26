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
      \line {WIE SCHÖN LEUCHTET   Irreg.}
    }
    \right-column{
      \line {Philip Nicolai, 1599}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic " O Heil'ger Geist, kehr' bei uns ein"}
      \line {Michael Schirmer, 1650; tr. Catherine Winkworth}
    }
  } 
}

\header {
  tagline = ""
}



global = {
  \key d \major
  \time 2/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  %\partial 4
  d2 a' |
  fs d |
  a' b4 b |
  a2 b4\rest a |
  b cs d2 |
  cs b4 b |
  a2 b4\rest a4 |
  \time 3/2 b2 a4 g2 fs4 |
  \time 2/2 e2 d \bar "||"

  d2 a' |
  fs d |
  a' b4 b |
  a2 b4\rest a |
  b cs d2 |
  cs b4 b |
  a2 b4\rest a4 |
  \time 3/2 b2 a4 g2 fs4 |
  \time 2/2 e2 d \bar "||"

  a'2 fs |
  a fs |
  fs4 fs e e |
  fs fs e e |
  fs fs e d |
  d'2 a |
  b a |
  g4 fs e2 |
  d1 \bar "|."
}

alto = \relative c' {
  \global
  %\partial 4
  a2 a |
  a b |
  e fs4 e |
  cs2 s4 e |
  d fs fs2 |
  e e4 e |
  cs2 s4 d |
  d2 d4 b( cs) d |
  d( cs) a2 |

  a2 a |
  a b |
  e fs4 e |
  cs2 s4 e |
  d fs fs2 |
  e e4 e |
  cs2 s4 d |
  d2 d4 b( cs) d |
  d( cs) a2 |

  a2 a |
  cs a |
  d4 d d cs |
  d d d cs |
  d d cs d |

  d2 d |
  d d |
  b4 d d( cs) |
  a1
}

tenor = \relative c {
  \global
  %\partial 4
  fs2 e |
  d fs |
  a a4 gs |
  a2 d,4\rest a'4 |
  fs cs' b( gs) |
  a2 a4 gs |
  e2 d4\rest a'4 |
  g2 fs4 g2 a4 |
  b( a)  fs2 |

  fs2 e |
  d fs |
  a a4 gs |
  a2 d,4\rest a'4 |
  fs cs' b gs |
  a2 a4 gs |
  e2 d4\rest a'4 |
  g2 fs4 g2 a4 |
  b( a)  fs2 |

  e d |
  e d |
  a'4 a a a |
  a a a a |
  a a a fs |

  a2 a |
  g fs |
  g4 a a2 |
  fs1
}

bass = \relative c {
  \global
  %\partial 4
  d2 cs
  d b |
  cs d4 e |
  a,2 s4 cs4 |
  b as b2 |
  cs4( d) e e, |
  a2 s4 fs |
  g( b) d e2 fs4 |
  g( a) d,2 |

  d2 cs
  d b |
  cs d4 e |
  a,2 s4 cs4 |
  b as b2 |
  cs4( d) e e, |
  a2 s4 fs |
  g( b) d e2 fs4 |
  g( a) d,2 |

  cs2 d |
  a d |
  d4 fs a a, |
  d fs a a, |
  d d a b |

  fs2 fs' |
  g d |
  e4 fs a( a,) |
  d1
}

verseOne = \lyricmode {
  \set stanza = "1."
  O Ho -- ly Spir -- it, en -- ter in,
  A -- mong these hearts Thy work be -- gin,
  Thy tem -- ple deign to make us;
  Sun of the soul, Thou Light di -- vine,
  A -- round and in us bright -- ly shine,
  To strength and glad -- ness wake us.
  Where Thou shin -- est, life from Heav -- en
  There is giv -- en; we be -- fore Thee
  For that pre -- cious gift im -- plore Thee.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Left to our -- selves, we shall but stray;
  O lead us on the nar -- row way,
  With wis -- est coun -- sel guide us;
  And give us stead -- fast -- ness, that we
  May hence -- forth tru -- ly fol -- low Thee,
  What -- ev -- er woes be -- tide us;
  Heal Thou gen -- tly hearts now bro -- ken,
  Give some to -- ken Thou art near us,
  Whom we trust to light and cheer us.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O might -- y Rock, O Source of life,
  Let Thy dear word ’mid doubt and strife
  Be so with -- in us burn -- ing,
  That we be faith -- ful un -- to death,
  In Thy pure love and ho -- ly faith,
  From Thee true wis -- dom learn -- ing!
  Lord, Thy grac -- es on us show -- er;
  By Thy pow -- er Christ con -- fess -- ing,
  Let us win His grace and bless -- ing.
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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 64 2)
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}