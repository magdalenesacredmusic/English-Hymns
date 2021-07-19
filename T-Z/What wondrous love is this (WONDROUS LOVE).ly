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
      \line {WONDROUS LOVE  Irreg.}
    }
    \column{
      \line {\italic "The Southern Harmony," 1835}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {American folk hymn}
    }
  }
}

\header {
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
  \partial 2
  d2 |
  d4 c e g |
  a2 g4 e |
  d2 d4 c |
  e2 a | \break
  c4 b a g |
  a2 g4 e |
  d1~ |
  d2 g |
  a4 g a c |
  d2 d |
  c4 a a8[ g] e4 |
  d2 d |
  d4 c e g |
  a2 g4 e |
  d2 d4 c |
  e2 a |
  c4 b a g |
  a2 g4 e |
  d1~ |
  d2
\bar "|."
}

alto = \relative c' {
  \global
  \partial 2
  a2 |
  a4 a c b |
  a( b) c c |
  a2 a4 c |
  c2 c |
  c4 d e d |
  e2 d4 c |
  a1~ |
  a2 c2 |
  c4 e f g |
  f2 f |
  g4 e d c |
  a2 a |
  a4 c b b |
  a( b) c4 c |
  a2 a4 c |
  c2 c |
  c4 d e d |
  e2 d4 c |
  a1~ |
  a2
}

tenor = \relative c {
  \global
  f2 |
  f4 e g e |
  d2 e4 g |
  f2 f4 f |
  g2 f |
  g4 f8[ g] a4 b |
  c2 g4 g |
  f1~ |
  f2 g |
  f4 c' c g |
  a2 a4( b) |
  c c a g |
  f2 f |
  f4 e g e |
  d2 e4 g |
  f2 f4 f |
  g2 f |
  g4 f8[ g] a4 b |
  c2 g4 g |
  f1~ |
  f2
}

bass = \relative c {
  \global
  d2 |
  d4 a g g |
  f2 c'4 c |
  d2 d4 d |
  c2 f |
  e4 d c b |
  a2 b4 c |
  d1~ |
  d2 e |
  f4 g f e |
  d2 d |
  e4 c b c |
  d2 d |
  d4 a g g |
  f2 c'4 c |
  d2 d4 d |
  c2 f |
  e4 d c b |
  a2 b4 c |
  d1~ |
  d2
}

verseOne = \lyricmode {
  \set stanza = "1."
  What won -- drous love is this, O my soul, O my soul,
  What won -- drous love is this, O my soul!
  What won -- drous love is this that caused the Lord of bliss 
  To bear the dread -- ful curse for my soul, for my soul,
  To bear the dread -- ful curse for my soul!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  To God and to the Lamb, I will sing, I will sing, 
  To God and to the Lamb, I will sing;
  To God and to the Lamb, who is the great I AM,
  While mil -- lions join the theme, I will sing, I will sing,
  While mil -- lions join the theme, I will sing.
}

verseThree = \lyricmode {
  \set stanza = "3."
  And when from death I'm free, I'll sing on, I'll sing on,
  And when from death I'm free, I'll sing on;
  And when from death I'm free, I'll sing and joy -- ful be,
  And through e -- ter -- ni -- ty I'll sing on, I'll sing on,
  And through e -- ter -- ni -- ty I'll sing on.
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
