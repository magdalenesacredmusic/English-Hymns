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
      \line {IN BABILONE  87 87 D}
    }
    \column{
      \line {Dutch Traditional Melody; arr. J. Röntgen}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Christopher Wordsworth, 1862}
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
  See the Con -- queror mounts in tri -- umph,
  See the King in roy -- al state
  Rid -- ing on the clouds his char -- iot
  To his heav'n -- ly pal -- ace gate;
  Hark! the choirs of an -- gle voic -- es
  Joy -- ful Al -- le -- lu -- ias sing,
  And the por -- tals high are lift -- ed
  To re -- ceive their heav'n -- ly King.
}

verseTwo = \lyricmode {
  \set stanza = "2. "
  Who is this that comes in glo -- ry,
  With the trump of ju -- bi -- lee?
  Lord of bat -- tles, God of ar -- mies,
  He has gained the vic -- to -- ry;
  He who on the Cross did suf -- fer,
  He who from the grave a -- rose,
  He has van -- quised sin and Sa -- tan,
  He by death has spoiled his foes.
}

verseThree = \lyricmode {
  \set stanza = "3. "
  Thou hast raised our hu -- man na -- ture
  In the clouds to God's right hand;
  There we sit in heav'n -- ly plac -- es,
  There with thee in glo -- ry stand;
  Je -- sus reigns, a -- dored by An -- gels;
  Man with God is on the throne;
  Might -- y Lord, in thine As -- cen -- sion
  We by faith be -- hold our own.
}

verseFour = \lyricmode {
  \set stanza = "4. "
  Glo -- ry be to God the Fa -- ther;
  Glo -- ry be to
  god the Son,
  Dy -- ing, ris'n, as -- cend -- ing for us,
  Who the heav'n -- ly realm has won;
  Glo -- ry to the Ho -- ly Spir -- it;
  To One God in per -- sons Three;
  Glo -- ry both in earth and heav -- en,
  Glo -- ry, end -- less glo -- ry, be.
}

%%%%%%%%
%%%%%%%%
%%%%%%%%
%{

verseFive = \lyricmode {
  \set stanza = "5. "
  Ho -- ly Ghost, Il -- lum -- in -- a -- tor,
  Shed thy beams up -- on our eyes,
  Help us to look up with Ste -- phen,
  And to see be -- yond the skies,
  Where the Son of Man in glo -- ry
  Stand -- ing is at God's right hand,
  Beck'n -- ing on his Mar -- tyr ar -- my,
  Suc -- cour -- ing his faith -- ful band;
}

verseSix = \lyricmode {
  \set stanza = "6. "
  See him, who is gone be -- fore us,
  Heav'n -- ly man -- sions to pre -- pare,
  See him, who is ev -- er plead -- ing
  For us with pre -- vail -- ing prayer,
  See him, who with sound of trum -- pet
  And with his an -- gel -- ic train,
  Sum -- mon -- ing the world to judge -- ment,
  On the clouds will come a -- gain.
}

verseSeven = \lyricmode {
  \set stanza = "7. "
  Glo -- ry be to God the Fa -- ther;
  Glo -- ry be to
  god the Son,
  Dy -- ing, ris'n, as -- cend -- ing for us,
  Who the heav'n -- ly realm has won;
  Glo -- ry to the Ho -- ly Spir -- it;
  To One God in per -- sons Three;
  Glo -- ry both in earth and heav -- en,
  Glo -- ry, end -- less glo -- ry, be.
}
%}
%%%%%%%%
%%%%%%%%
%%%%%%%%

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