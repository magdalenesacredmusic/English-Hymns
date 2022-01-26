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
      \line {IN ALLEN MEINEN THATEN  776 D}
    }
    \right-column{
      \line {\italic "Zions Harfe," 1855}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "O esca viaatorum," 17th cent.}
      \line {tr. Athelstan Riley, 1906}
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

melody = \relative c'' {
  \global
  \partial 4
  a4 |
  a c bf a |
  g2 f4 \bar "||"

  g4 |
  g g a8[ b] c4 |
  c( b) c4 \bar "||"

  d4 |
  c bf a bf |
  g2. \bar "||"

  g4 |
  g g a g |
  f2 e4 \bar "||"

  g4 |
  g g a c |
  bf2 a4 \bar "||"

  c4 f, bf8[ a] g4 g |
  f2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  f4 |
  f f f f |
  f( e) f 
  
  e |
  d e f e |
  d2 e4 
  
  f4 |
  e f8[ g] f4 f |
  e2. 
  
  e4 |
  c e f e |
  d( b) c 
  
  e4 |
  g e f f |
  f( e) f 
  
  e4 |
  d f f e |
  f2.
}

tenor = \relative c' {
  \global
  \partial 4
  c4 |
  d c d c |
  c4.( bf8) a4 
  
  c |
  g c c c |
  a( g) g 
  
  bf4 |
  g d' c d |
  c2. 
  
  c4 |
  g c c c |
  a( g8[ f]) g4 
  
  c4 |
  c c c c |
  d( c8[ bf]) c4 
  
  c4 |
  a d g, c8[ bf] |
  a2.
}

bass = \relative c {
  \global
  \partial 4
  f4 |
  d a bf f' |
  c2 f4
  
  c4 |
  b c f8[ g] a4 |
  f( g) c, 
  
  bf4 |
  c d8[ e] f4 bf, |
  c2. 
  
  c4 |
  e c f c |
  d2 c4 
  
  c4 |
  e c f a |
  g2 f4
  
  a, |
  d bf c c |
  f,2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  O food of men way -- far -- ing,
  The Bread of An -- gels shar -- ing,
  O Man -- na from on high!
  We hun -- ger; Lord, sup -- ply us,
  Nor thy de -- lights de -- ny us,
  Whose hearts to thee draw nigh.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  O Stream of love past tell -- ing,
  O pur -- est Foun -- tain, well -- ing
  From out the Sa -- viour's side!
  We faint with thirst; re -- vive us,
  Of thine aa -- bun -- dance give us,
  And all we need pro -- vide.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O Je -- su, by thee bid -- den,
  We here a -- dore thee, hid -- den
  'Neath forms of bread and wine.
  Grant when the veil is riv -- en,
  We may be -- hold, in heav -- en,
  Thy coun -- te -- nance di -- vine.
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
        tempoWholesPerMinute = #(ly:make-moment 92 4)
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
