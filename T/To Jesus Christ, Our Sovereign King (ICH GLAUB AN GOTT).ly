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
      \line {ICH GLAUB AN GOTT  87 87 with Refrain}
    }
    \right-column{
      \line {Mainz Gesangbuch, 1870}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Martin B Hellrigel (1891-1981)}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  c4 |
  f4 g a8[ bf] c4 |
  bf a g a |
  a f bf a |
  g2 f4 \bar "" \break
  
  c |
  f g a8[ bf] c4 |
  bf a g a |
  a f bf a |
  g2 f \bar "||" \break

  c'2^\markup {Refrain} c4 c |
  d2 d |
  bf a4 g |
  c2 c | 
  c, f4 a |
  c2 bf4 a |
  g1 |
  f2. \bar "|."
}

melodya = \relative c' {
  \global
  \partial 4
  c4 |
  f4 g a8[ bf] c4 |
  bf a g a |
  a f bf a |
  g2 f4 \bar ""
  
  c |
  f g a8[ bf] c4 |
  bf a g a |
  a f bf a |
  g2 f \bar "||"

  c'2^\markup {Refrain} c4 c |
  d2 d |
  bf a4 g |
  c2 c | \break
  c, f4 a |
  c2 bf4 a |
  g1 |
  f2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  c4 |
  c4 c c f |
  f f e e |
  f d d f |
  f( e) c
  
  c |
  c c c f |
  f f e e |
  f d d f |
  f( e) c2 |
  
  f2 g4 f |
  f2 g |
  g f4 d |
  f2 e |
  c d4 d |
  f2 f4 f4 |
  f2( e) |
  c2.
}

tenor = \relative c {
  \global
\partial 4
c4 |
a'4 g a f |
d' c c a |
a a bf c |
d( c8[ bf]) a4

c, |
a'4 g a f |
d' c c a |
a a bf c | 
d( c8[ bf]) a2

a2 g4 a |
bf2 bf 
d c4 d |
g, 2 g |
a a4 f |
f2 d'4 c |
d2( c4 bf) |
a2.
}

bass = \relative c {
  \global
 \partial 4
  c4 |
 f e f a, |
 bf f' c cs |
 d4 d g f |
 bf,( c) f
 
  c4 |
 f e f a, |
 bf f' c cs |
 d4 d g f |
 bf,( c) f2
 
 f2 e4 f |
 bf,2 g |
 g2 f4 bf |
 c2 c |
 f2 d4 d |
 a2 bf4 f |
 bf2( c) |
 f2.
 
}

verseOne = \lyricmode {
  \set stanza = "1."
  To Je -- sus Christ, our sov -- 'reign King,
  Who is the world's sal -- va -- tion,
  All praise and hom -- age do we bring
  And thanks and ad -- o -- ra -- tion.
  
  Christ Je -- sus, Vic -- tor!
  Christ Je -- sus, Ru -- ler!
  Christ Je -- sus, Lord and Re -- deem -- er!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Thy reign ex -- tend, O King be -- nign,
  To ev -- 'ry land and na -- tion;
  For in your King -- dom,
  Lord di -- vine,
  A -- lone we find sal -- va -- tion.
}

verseThree = \lyricmode {
  \set stanza = "3."
  To Thee, and to Thy church, great King,
  We pledge our heart's ob -- la -- tion;
  Un -- til be -- fore your throne we sing
  In end -- less ju -- bi -- la -- tion.
}

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { %\transpose c d
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
        tempoWholesPerMinute = #(ly:make-moment 100  4)
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
        \melodya
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

