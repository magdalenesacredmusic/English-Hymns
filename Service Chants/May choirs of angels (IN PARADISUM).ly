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
      \line {IN PARADISUM}
    }
    \right-column{
      \line {Gregorian, Mode VII}
      \line {accomp. Achille Bragers}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "In Paradisum"}
      \line {Tr. \italic "The Saint Michael Hymnal," 2020}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
b8\rest f8 a bf c4 c \bar "'" 
c8 d c bf a bf8 c c4 \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|" \break
g8 bf bf bf bf8[^- c] bf4 \bar "'"
a8^- bf c bf a g f g bf bf4( a) \bar "'" \break
a8 bf c c c4 \bar "'"
c8 c c d c bf[~ bf c] c8[^- g] a8[^- g] a8 f f4 \bar "||"

f8[^- bf] g g[ f] ef f[ g] f4 \bar "'"
a8[(^- bf] c[^- bf g] bf) bf a4 \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|"
a8 bf c8[^- d] bf \bar "" \break 
  g^- bf a f g f ef4 \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|"
ef8 g8[ f] f4( g8[^- a^\prall bf^- a g]) f8[ g] g[ a] f8 f f4
\bar "||"
}

melodya = \relative c' {
  \global
   \override Stem #'length = #0
f4 a bf c2 c \bar "'" 
c4 d c bf a bf c c2 \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|" \break
g4 bf bf bf bf(^- c) bf2 \bar "'"
a4^- bf c bf a g f g bf bf2( a) \bar "'" \break
a4 bf c c c2 \bar "'"
c4 c c d c bf2( c4) c(^- g) a(^- g) a4 f f2 \bar "||"

f4(^- bf) g g( f) ef f( g) f2 \bar "'"
a4(^- bf c^- bf g bf) bf a2 \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|" \break
a4 bf c4(^- d) bf g^- bf a f g f ef2 \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|"
ef4 g4( f) f2( g4^- a bf^- a g) f4( g) g( a) f4 f f2
\bar "||"
}

alto = \relative c' {
  \global
  r4 f2~ f4~ 
  f8~ f2.~ f4 
  d2 ef4 d4~ 
  d4 g4. g8 f~ f4~ f2~
  f2~ f4~ f8 f4~ f4~ f4. ef4 f d c4
  
  d2. ef4 f~
  f g4. f4~ f~
  f4~ f4. d2~ d4 ef
  ef8~ ef4 f d~ d4. c4 bf~ bf a
}

tenor = \relative c' {
  \global
  a4 g2 a4~ 
  a8 bf4 c2~ c4
  bf2~ bf4~ bf~
  bf4~ bf4.~ bf4 d c2~
  c~ c4~
  c8~ c4 bf bf4.~ bf4 c4 bf a
  
  bf2.~ bf4 c~
  c4~ c4. d4 c~
  c4~ c4. bf2~ bf4~ bf~ 
  bf8~ bf4~ bf4 g f4.~ f4 d4~ d4 c
}

bass = \relative c {
  \global
 f4~ f2~f4~
 f8~ f2 g4 a
 bf4 a g4~ g4 f ef4. d4~ d4 f2~
 f4 g a4~
 a8~ a4 bf a4. g4 f2~ f4
 
 bf2. g4 a f ef4. d4 f g a4. bf2 a4 g4~
 g8 ef4 d bf4~ bf4. a4 bf4 f2
}

verseOne = \lyricmode {
  May choirs of an -- gels es -- cort you in -- to par -- a -- dise:
  and at your ar -- ri -- val may the mar -- tyrs re -- ceive and wel -- come you;
  may they bring you home
  in -- to the ho -- ly cit -- y, Je -- ru -- sa -- lem.
  
  May the ho -- ly an -- gels
  wel -- come you,
  and with Laz -- a -- rus, who lived in pov -- er -- ty,
  may you have __ ev -- er --  last -- ing rest.
}

verseTwo = \lyricmode {
  May choirs of an -- gels es -- cort you in -- to par -- a -- dise:
  and at your ar -- ri -- val may the mar -- tyrs re -- ceive and wel -- come you;
  may they bring you home
  in -- to the ho -- ly cit -- y, Je -- ru -- sa -- lem.
  
  May the ho -- ly an -- gels
  wel -- come you,
  and with Laz -- a -- rus, who lived in pov -- er -- ty,
  may you have ev -- er --  last -- ing rest.
}

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { \transpose c bf,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
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
    \transpose c bf,
    <<
      \new Voice = "tune" {
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseTwo }
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
