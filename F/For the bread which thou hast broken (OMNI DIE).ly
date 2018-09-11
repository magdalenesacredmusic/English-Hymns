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
      \line {OMNI DIE   87 87}
    }
    \right-column{
      \line {Corner's \italic "Gross Catholisch Gesangbuch," 1631}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Louis FitzGerald Benson, (1855-1930)}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 3/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 2
  f4 f |
  g2 f a4 c |
  bf2 a f4 g |
  a c c2 b2 |
  c1 \bar "||"
  
  c4 c |
  d2 c bf4 a |
  g2 a f4 g |
  a bf g2. f4 |
  f1 \bar "|."
}

alto = \relative c' {
  \global
  \partial 2
  c4 d |
  e2 f f4 f |
  f( e) f2 c4 e |
  f g f2 f |
  e1
  
  f4 g |
  f2 f f4 f |
  e4( d) cs2 d4 e |
  f f f2 e |
  f1
}

tenor = \relative c' {
  \global
\partial 2
a4 a |
c2 a c4 a |
bf2 c a4 c |
c c a( g) f2 |
g1

a4 g |
a2 a d4 c |
c( d) e2 a,4 c |
c d c2 c |
a1
}

bass = \relative c {
  \global
\partial 2
f4 d |
c2 f f4 f |
g2 f f4 c |
f e f( e) d2 |
c1

f4 e |
d2 f bf,4 f' |
c( bf) a2 d4 c |
f bf, c2 c |
f,1
}

verseOne = \lyricmode {
  \set stanza = "1. "
For the bread which thou hast bro -- ken;
For the wine which thou hast poured;
For the words which thou hast spo -- ken;
Now we give thee thanks, O Lord.
}

verseTwo = \lyricmode {
  \set stanza = "2. "
By the pledge that thou dost love us,
By thy gift of peace re -- stored,
By thy call to heaven a -- bove us,
Hal -- low all our lives, O Lord.
}

verseThree = \lyricmode {
  \set stanza = "3. "
With our saint -- ed ones in glo -- ry
Seat -- ed at our Fa -- ther's board,
May the Church that wait -- eth for thee
Keep love's tie un -- bro -- ken, Lord.
}

verseFour = \lyricmode {
  \set stanza = "4. "
In thy ser -- vice, Lord, de -- fend us,
In our hearts keep watch and ward,
In the world where thou dost send us
Let thy Kingdom come, O Lord.
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