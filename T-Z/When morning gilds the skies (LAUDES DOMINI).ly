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
      \line {LAUDES DOMINI  66 6 D}
    }
    \column{
      \line {Joseph Barnby, 1838-96}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Beim frühen Morgenlicht" }
      \line {German, c. 1800; Tr. Edward Caswall, 1814-78}
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
  \partial 4
  e4 |
  f g a c |
  b2( a4) g |
  a b c e |
  d2. \bar "" \break c4 |
  b c a4. g8 |
  g2. 
  
    g4 |
    g c b c |
    g2. \bar "" \break g4 |
    g c b c |
    g2. g4 |
    g2 c2 |
    c d |
    c2.
\bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  c4 |
  c c c f |
  f2. f4 |
  e g g g |
  fs2( g4) d |
  d e c4. c8 |
  b2.
  
    d4 |
    c c f f |
    f2( e4) d |
    c e fs fs |
    g( d e) f |
    e( f) g2 |
    f f |
    e2.
}

tenor = \relative c' {
  \global
  \partial 4
  g4 |
  g g f a |
  b2( c4) d |
  c d c c |
  c2( b4) a |
  g g g fs |
  g2. 
  
    b4 |
    c g b a |
    d( c b) b |
    c g d' c |
    b2. b4 |
    c( d) e2 |
    c2. b4 |
    c2.
}

bass = \relative c {
  \global
   \partial 4
   c4 |
   d e f d |
   g2( a4) b |
   c b a a |
   d,2( e4) fs |
   g c, d d |
   g,2. 
   
     f'4 |
     e e d c |
     b( a g) f' |
     e c d d |
     g( f! e) d |
     c2 bf' |
     a g |
     c,2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  When morn -- ing gilds the skies,
  My heart a -- wak -- ing cries,
  May Je -- sus Christ be praised:
  A -- like at work and prayer
  To Je -- sus I re -- pair;
  May Je -- sus Christ be praised.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  When sleep her balm de -- nies,
  My si -- lent spir -- it sighs,
  May Je -- sus Christ be praised:
  When e -- vil thoughts mo -- lest,
  With this I shield my breast,
  May Je -- sus Christ be praised.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Does sad -- ness fill my mind?
  A sol -- ace here I find,
  May Je -- sus  Christ be praised:
  Or fades my earth -- ly bliss?
  My com -- fort still is this,
  May Je -- sus Christ be praised.
}

verseFour = \lyricmode {
  \set stanza = "4."
  In heaven's e -- ter -- nal bliss
  The love -- liest strain is this,
  May Je -- sus Christ be praised:
  The powers of dark -- ness fear,
  When this sweet chant they hear,
  May Je -- sus Christ be praised.
}

verseFive = \lyricmode {
  \set stanza = "5."
 Let earth's wide cir -- cle found
 In joy -- ful notes re -- sound,
 May Je -- sus Christ be praised:
 Let air and sea and sky,
 From depth to height, re -- ply,
 May Je -- sus Christ be praised.
}

verseSix = \lyricmode {
  \set stanza = "6."
 Be this, while life is mine,
 My can -- ti -- cle Di -- vine,
 May Je -- sus Christ be praised:
 Be this the_e -- ter -- nal song,
 Through all the a -- ges on,
 May Je -- sus Christ be praised.
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
      \new Lyrics \lyricsto soprano \verseFive
      \new Lyrics \lyricsto soprano \verseSix
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
      \new Lyrics \lyricsto "tune" { \verseFour}
      \new Lyrics \lyricsto "tune" { \verseFive }
      \new Lyrics \lyricsto "tune" { \verseSix }
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
