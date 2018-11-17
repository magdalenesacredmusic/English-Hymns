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
      \line {SWEET SACRAMENT  LM with refrain}
    }
    \right-column{
      \line {\italic "Romischkatholishes Gesangbuchlein," 1862}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {St. 1-2, F.W. Faber; St. 3, \italic "Mediator Dei Hymnal," ©1955 GIA}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key ef \major
  \time 3/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  bf4 g ef |
  ef( d) ef |
  f( bf) af |
  af( g2)  |
  g4 f ef |
  af2 f4 |
  ef2 d4 |
  ef2. |

  bf'4 g ef |
  ef( d) ef |
  f( bf) af |
  af( g2)  |
  g4 f ef |
  af2 f4 |
  ef2 d4 |
  ef2. \bar "||"

  bf'4^\markup { \italic Refrain} bf bf |
  c2 c4 |
  d2 d4 |
  ef2. |
  bf4 af g |
  c2 af4 |
  f( bf) af |
  af( g2) |
  g4 f ef |
  af2 f4 |
  ef2 d4 |
  ef2. \bar "|."
}

alto = \relative c' {
  \global
  ef4 ef ef |
  bf2 bf4 |
  bf( d) f |
  f( ef2) |
  ef4 d c |
  c2 c4 |
  bf( c) bf |
  bf2. |
  ef4 ef ef |
  bf2 bf4 |
  bf( d) f |
  ef2. |
  ef4 d ef |
  c2 c4 |
  bf( c) bf |
  bf2. |

  ef4 d ef |
  ef2 f4 |
  af( g) f |
  ef2. |
  ef4 f ef |
  ef2 f4 |
  ef( d) f |
  f( ef2) |
  ef4 d c |
  c2 c4 |
  c( bf) bf |
  bf2. \bar "|."
}

tenor = \relative c' {
  \global
  g4 bf bf |
  af2 g4 |
  bf2 bf4 |
  bf2. |
  bf4 bf g |
  f( g) af |
  g( af) f |
  g2. |

  g4 bf af |
  bf( af) g |
  bf2 bf4 |
  bf2. |
  bf4 af bf |
  af2 af4 |
  g( af) f |
  g2. |

  g4 af bf |
  af( bf) af |
  c( bf) af |
  g( c2) |
  bf4 bf bf |
  af( bf) c |
  bf2 bf4 |
  bf2. |
  bf4 bf g |
  f( g) af |
  af( g) f |
  g2. \bar "|."
}

bass = \relative c {
  \global
  ef4 ef g |
  f2 ef4 |
  d( bf) d |
  ef2. |
  ef4 bf c |
  f2 af,4 |
  bf2 bf4 |
  ef2. |

  ef4 ef f |
  g( f) ef |
  d( bf) d |
  ef2. |
  ef4 f g |
  f( f,) af |
  bf2 bf4 |
  ef2. |

  ef4 f g |
  af( g) f |
  bf,2 bf4 |
  c2. |
  g'4 d ef |
  af( g) f |
  bf( bf,) d |
  ef2. |
  ef4 bf c |
  f2 af,4 |
  bf2 bf4 |
  ef2. \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  Je -- sus, my Lord, my God, my All,
  How can I love Thee as I ought?
  And how re -- vere this won -- drous gift,
  So far sur -- pass -- ing hope or thought?
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Had I but Mar -- y's sin -- less heart,
  To love Thee with, my dear -- est King;
  O! with what bursts of fer -- vent praise,
  Thy good -- ness, Je -- sus would I sing.

  Sweet Sac -- ra -- ment, we Thee a -- dore!
  O make us love Thee more and more!
  O make us love Thee more and more.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O! see up -- on the al -- tar placed
  The vic -- tim of di -- vin -- est love!
  Let all the earth be -- low a -- dore,
  And join the choirs of heav'n a -- bove.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Sound, then, his prais -- es high -- er still,
  And come, ye an -- gels, to our aid;
  For this is God, the ve -- ry God
  Who hath both men and an -- gels made!
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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
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


