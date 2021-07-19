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
      \line {BLAENWERN  87 87 D}
    }
    \column{
      \line {William Rowlands (1860-1937)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Alma lux"}
      \line {Latin, 17th cent., Tr. Edward Caswall (1814-1878)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d2 d4 |
  e2 e4 |
  d( g) b |
  b2 a4 |
  g2 fs4 |
  e2 d4 |
  d( fs) e |
  d2. |
  
   d2 d4 |
  e2 e4 |
  d( g) b |
  b2 a4 |
  g2 a4 |
  b( c) a |
  g2 fs4 |
  g2. |
  
  b2 b4 |
  b( g) b |
  c( b) a |
  b2 b4 |
  d2 d4 |
  d( b) d |
  e( d) cs |
  d2. |
  
  e2 c4 |
  d2 b4 |
  d( c) b |
  b2 a4 |
  g2 a4 |
  b( c) a |
  g2 fs4 |
  g2. \bar "|."
  
}

alto = \relative c' {
  \global
  b2 b4 |
  c2 c4 |
  b( d) d |
  d2 d4 |
  b( e) ds |
  e2 b4 |
  a( d) cs |
  d2. |
  
    b2 b4 |
  c2 c4 |
  b( d) d |
  d2 d4 |
  b2 d4 |
  d( e) e |
  d2 d4 |
  d2. |
  
  d2 ds4 |
  e2 g4 |
  g2 fs4 |
  g2 g4 |
  g2 fs4 |
  g2 a4 |
  g( fs) e8[ g] |
  fs2. |
  
  g2 fs4 |
  g2 g4 |
  a2 g4 |
  g2 fs4 |
  g2 fs4 |
  g2 e4 |
  d2 d4 |
  d2.
}

tenor = \relative c' {
  \global
  g2 g4 |
  g2 g4 |
  g( b) g |
  g2 fs4 |
  g( b) a |
  g2 g4 |
  fs( a) g |
  fs2. |
  
  g2 g4 |
  g2 g4 |
  g( b) g |
  g2 fs4 |
  g2 fs4 |
  g2 a4 |
  b2 a8[ c] |
  b2. |
  
  b2 a4 |
  g( b) d |
  e( d) d |
  d2 d4 |
  d2 c4 |
  b( d) a |
  b( a) a |
  a2. |
  
  c2 c4 |
  b2 d4 |
  d2 d4 |
  d2 d4 |
  d( e) c |
  d( g,) c4 |
  b2 a8[ c] |
  b2.
}

bass = \relative c {
  \global
  g2 g4 |
  g2 g4 |
  g2 g4 |
  d'2 d4 |
  e2 b4 |
  c2 b4 |
  a2 a4 |
  d2. |
  
  g,2 g4 |
  c2 c4 |
  g2 g4 |
  d'2 d4 |
  e2 d4 |
  g( c,) c |
  d2 d4 |
  g,2. |
  
  g'2 fs4 |
  e2 d4 |
  c( d) d |
  g2 g4 |
  b2 a4 |
  g2 fs4 |
  e a a, |
  d2. |
  
  c'2 a4 |
  b2 g4 |
  fs2 g4 |
  d2 d4 |
  b'( c) a |
  g( e) c |
  d2 d4 |
  g,2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Ho -- ly light on earth's ho -- ri -- zon,
  Star of hope to fall -- en man,
  Light a -- mid a world of shad -- ows,
  Dawn of God's re -- demp -- tive plan.
  
  Cho -- sen from e -- ter -- nal a -- ges,
  Thou a -- lone of all our race
  By thy Son's a -- ton -- ing mer -- its
  Wast con -- ceived in per -- fect grace.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Moth -- er of the world's Re -- deem -- er
  Prom -- ised from the dawn of time;
  How could one so high -- ly fav -- ored Share the guilt of A -- dam's crime?
  Sun and moon and stars a -- dorn thee,
  Sin -- less Eve, tri -- um -- phant sign;
  Thou art she who crushed the ser --  pent,
  Ma -- ry, pledge of life di -- vine.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Earth be -- low and high -- est heav -- en
  Praise the splen -- dor of thy state;
  Thou who now art corwned in glo -- ry
  Wast con -- ceived im -- mac -- cu -- late.
  Hail, be -- lov -- ed of the Fa -- ther.
  Moth -- er of his on -- ly Son,
  Mys -- tic bride of Love E -- ter -- nal:
  Hail, thou fair and spot -- less one!
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
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
