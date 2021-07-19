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
          \line {VRUCHTEN 67 67 refrain}
      }
      \right-column{
      \line {Joachin Oudaen's \italic "David's Psalmen," 1685}
      \line { Arr. by Charles Wood, 1866-1926}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {George R. Woodward, 1894}
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
f g a bf |
c2. c4 |
d4. c8 bf4 d |
c4.( bf8 a4 g8[ f] |
g2) f4\fermata \bar "" \break
  c4 |
f g a bf |
c2. c4 |
d4. c8 bf4 d |
c4.( bf8 a4 g8[ f] |
g2) f4\fermata \bar "" \break 

f4 |
g a bf a |
g4. a8 bf4 c |
d c c( b) |
c2. \bar "" \break
  c4 |
 bf bf a a |
 g2. f4 |
 e f g a |
 bf2 g4 g |
 
 c2 a4 a |
 d2 c4 
   c4 |
   f4.( e8 d4 c8[ bf] |
   a4 g8[ f] g2) |
   \partial 2. f2. \bar "|."
}

alto = \relative c' {
   \global
  \partial 4
  c4 |
  c d8[ e] f4 f |
  f( e8[ d] e4) f4 |
  f f d d |
  g2( f4 c |
  d e) c
      c4 |
  c d8[ e] f4 f |
  f( e8[ d] e4) f4 |
  f f d d |
  g2( f4 c |
  d e) c
  
    c4 |
    c c d c8[ d] |
    e4. f8 f4 ef |
    d f d2 |
    e2. e4 |
    d4. e8 fs8[ e] fs4 |
    d2. c4 c4. b8 c4 c |
    d2 c4 c8[ d] |
    e2 d4 d8[ e] |
    f2 g4 
      e |
      f2.( g4 |
      c,2 d4 e) |
      c2.
}
tenor = \relative c' {
  \global
  \partial 4
  a4 |
  c bf a f |
  g2. a4 |
  bf a bf bf8[ a] |
  g4( c2 a4 |
  bf8[ a] g4) a\fermata	
      a4 |
  c bf a f |
  g2. a4 |
  bf a bf bf8[ a] |
  g4( c2 a4 |
  bf8[ a] g4) a\fermata
  
    a4 |
    g f f8[ g] a[ bf] |
    c4. c8 bf8[ f] g[ a] |
    bf4 a g2 |
    g2. a4 |
    a g d'4. c8 |
    bf2. a4 |
    g f e f |
    f( g8[ f]) e4 g |
    g( a8[ g]) f4 a |
    a( bf8[ a]) g4 
      
      c4 |
      c( a bf8[ a] g4 |
      a c bf8[ a] g4) |
      a2.
}

bass = \relative c {
  \global
  \partial 4 
  f4 |
  a g f8[ e] d4 |
  c2. f4 |
  bf f g g8[ f] |
  e2( f |
  bf,4 c) f 
  
     f4 |
  a g f8[ e] d4 |
  c2. f4 |
  bf f g g8[ f] |
  e2( f |
  bf,4 c) f 
  
    f4 |
  e f d8[ e] f4 |
  c4. f8 d4 c |
  bf f' g2 |
  c,2. a4 |
  bf4. c8 d4 d |
  g,2. a8[ bf] |
  c4 d c f |
  bf,2 c8[ d] e[ d] |
  a2 d8[ e] f[ e] |
  d2 e4 
    c'8[ bf] |
    a[( g] f4 bf4 e, |
    f a, bf c) |
    f2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  This joy -- ful Eas -- ter -- tide, a -- way with sin and sor -- row.
  My Love, the Cru -- ci -- fied, hath sprung to life this mor -- row.
    
    Had Christ, that once was slain, ne'er burst his three -- day pris -- on,
    our faith had been in vain: but now hath Christ a -- ris -- en, 
    a -- ris -- en, a -- ris -- en, a -- ris -- en!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  My flesh in hope shall rest, and for a sea -- son slum -- ber,
  Till trump from east to west shall wake the dead in num -- ber.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Death's flood hath lost its chill, since Je -- sus crossed the riv -- er:
  Lov -- er of souls, from ill my pass -- ing soul de -- liv -- er.
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
        tempoWholesPerMinute = #(ly:make-moment 110  4)
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
