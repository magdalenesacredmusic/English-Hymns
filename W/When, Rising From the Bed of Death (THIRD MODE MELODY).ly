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
      \line {THIRD MODE MELODY  DCM}
    }
    \right-column{
      \line {Thomas Tallis, 1561}
      \line {arr. R. Vaughan Williams, 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {William W. How, 1864}
    }
  } 
}

\header {
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

melodyTwo = \relative c' {
  \global
  e4 e e 
  e2. e4 a a 
  gs2.  gs4 
  gs2. fs4 gs a 
  gs2.
  
  g4 g g 
  g2. b4 a a 
  gs2.   gs4 
  gs2. gs4 a4 a 
  gs2.
  
    g4
  g4.( a8) b4 c2 b4
  a4 a g2.  g4
  f2. e4 e d 
  e2.    e4 
  a4.( g8) f4 e2 g4 
  c4.( b8) a4 g2   e4 
  a4 a a e8[ fs] 
  gs2.
}

altoTwo = \relative c' {
  \global
  b4 b b 
  b2. b4 c d 
  e2. e4 
  e2. ds4 e e 
  e2.  e4 e e 
  e2. e4 e d 
  e2.   e4 
  e2. e4 e e 
  e2.  e4 
  e2 fs4 g2 g4 
  e e e2.
  
  e4
  c2. c4 a a 
  a2.   c4 
  e2 c4 c2 c4
  c2 c4 c2   c4 
  a4 d c c 
  b2.
}

tenorTwo = \relative c {
    \global
  e4 g g \bar "|"
  g2. g4 a a \bar "|"
  b2. b4 \bar "|"
  b2. b4 b c \bar "|"
  b2. \bar "||" \break

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


%bassTwo = same as "bass"


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


\book {
  \include "hymn_paper_multipage.ly"
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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
      }
    }
    \include "hymn_layout.ly"
  }
  \bottom
  
    \markup { 
    \vspace #0.5 
    \line {Alternative Version (melody in the tenor)}
  }
  
  \score {
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melodyTwo }
        \new Voice = "alto" { \voiceTwo \altoTwo }
      >>
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenorTwo }
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
