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
      \line {DANBY  LM}
    }
    \right-column{
      \line {English Traditional Melody}
      \line {harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "O Lux, beata Trinitas"}
      \line {Trinity Sunday. Vespers.}
      \line {tr. J.M. Neale}
    } 
  }
}


global = {
  \key g \major
  \time 3/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
\partial 2.
d4 g fs |
g2~ g4 d4 f e
d2~ d4 d4 g fs|
g2~ g4 a8[ b] c4 b |
a2~ a4 g4 a d |
d2 c4( b) a d, |
g2~ g4 g4 a b |
a2~ a4 e4 d d |
d2. \bar "|."
}

alto = \relative c' {
  \global
\partial 2.
b4 d d
d2~ d4 b4 d c 
c2~ c4 c4 d d 
b2~ b4 d4 e d 
d2~ d4 d4 e fs
g2 d e4 d 
d2~ d4 b4 d d 
e2~ e4 c8[ b] a[ b] c4 
c2 b4
}

tenor = \relative c' {
  \global
g4 g a 
b2~ b4 g4 g g 
g2~ g4 fs4 g a 
g2~ g4 fs4 g g 
g2( fs4) g c b8[ a]
g2 a4( b) c b8[ a] 
g2~ g4 g4 d' d 
c( b a) g g fs 
g2.
}

bass = \relative c {
  \global
g4 b d 
g2~ g4 g,8[ a] b4 c
g2~ g4 a4 b d 
e2~ e4 d4 c g' 
d2~ d4 b c d
e2 fs4( g) c, c
b2~ b4 e4 fs g 
c,2~ c4 c4 d d 
g,2.
}

verseOne = \lyricmode {
  \set stanza = "1. "
O Tri -- ni -- ty of bless -- ed Light,
O U -- ni -- ty of prince -- ly might,
The fier -- y sun now goes his way;
Shed thou with -- in our hearts thy ray.
}

verseTwo = \lyricmode {
  \set stanza = "2. "
To thee our morn -- ing song of praise,
To thee our ev'n -- ing prayer we raise;
Thy glo -- ry sup -- pliant we a -- dore
For ev -- er and for ev -- er -- more.
}

verseThree = \lyricmode {
  \set stanza = "3. "
All laud to God the Fath -- er be;
All praise, e -- ter -- nal Son, to thee;
All glo -- ry as is ev -- er meet,
To God the ho -- ly Pa -- ra -- clete. 
Amen.
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
        tempoWholesPerMinute = #(ly:make-moment 104 4)
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