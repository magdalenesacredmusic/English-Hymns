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
      \line {KINGS OF ORIENT  88 446 with refrain}
    }
    \column{
      \line {John H. Hopkins (1857)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {John H. Hopkins (1857)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \time 3/8
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  b4 a8 |
  g4 e8 |
  fs8 g fs |
  e4. |
  b'4 a8 |
  g4 e8 |
  fs g fs |
  e4. |
  g4 g8 |
  a4 a8 |
  b4 b8 |
  d[ c] b |
  a8 b a |
  g4 fs8 |
  e4. \bar "||"
  
  fs4(^\markup {\smallCaps Refrain.}\fermata a8)\fermata |
  g4 g8 |
  g4 d8 |
  g4 e8 |
  g4. |
   g4 g8 |
  g4 d8 |
  g4 e8 |
  g4. |
  g4 g8 |
  a4 b8 |
  c4 b8 |
  a4 b8 |
  g4 g8 |
  g4 d8 |
  g4 e8 |
  g4. 
\bar "|."
}

alto = \relative c'' {
  \global
  g4 fs8 |
  e4 e8 |
  ds8 ds ds |
  e4. |
  g4 fs8 |
  e4 e8 |
  ds8 ds ds |
  e4. |
  
  e4 e8 |
  fs4 fs8 |
  g4 g8 |
  g[ fs] g |
  e8 e e |
  e4 ds8 |
  e4. |
  
  d4. |
  d4 d8 |
  d4 b8 |
  e4 c8 |
  d4 s8 |
  d4 d8 |
  d4 b8 |
  e4 c8 |
  d4. |
  e4 e8 |
  fs4 g8 |
  g4 g8 |
  fs4 g8 |
  d4 d8 |
  d4 b8 |
  e4 c8 |
  d4.
}

tenor = \relative c' {
  \global
  b4 b8 |
  b4 g8 |
  a8 b a |
  g4. |
  b4 b8 |
  b4 g8 |
  a8 b a |
  g4. |
  
  b4 b8 |
  d4 d8 |
  d4 d8 |
  b[ c] d |
  c c c |
  b4 a8 |
  g4. |
  
  a4( c8) |
  b4 b8 |
  b4 g8 |
  g4 g8 |
  b4. |
  b4 b8 |
  b4 g8 |
  g4 g8 |
  b4.
  
  b4 b8 |
  d4 d8 |
  e4 d8 |
  d4 d8 |
  b4 b8 |
  b4 g8 |
  g4 g8 |
  b4.
}

bass = \relative c {
  \global
 e4 e8 |
 e4 e8 |
 b8 b b |
 e4. |
 e4 e8 |
 e4 e8 |
 b8 b b |
 e4. |
 
 e4 e8 |
 d4 d8 |
 g4 g8 |
 b8[ a] g |
 a8 a a |
 b4 b,8 |
 e4. |
 
 d4. |
 g4 g8 |
 g4 g8 |
 c,4 c8 |
 g4. |
 g'4 g8 |
 g4 g8 |
 c,4 c8 |
 g4. |
 
 e'4 e8 |
 d4 g8 |
 c,4 g'8 |
 d4 g8 |
 g4 g8 |
 g4 g8 |
 c,4 c8 |
 g4.
}

verseOne = \lyricmode {
  \set stanza = "1."
  We three kings of O -- ri -- ent are, 
  Bear -- ing gifts we trav -- erse a -- far,
  Field and foun -- tain, 
  Moor and moun -- tain,
  Fol -- low -- ing yon -- der star.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Born a King on Beth -- le -- hem's plain,
  Gold I bring to crown him a -- gain,
  King for ev -- er, 
  Ceas -- ing nev -- er
  O -- ver us all to reign.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Frank -- in -- cense to of -- fer have I,
  In -- cense owns a De -- i -- ty nigh,
  Prayer and prais -- ing,
  All men rais -- ing,
  Wor -- ship him, God on high.
  
  O star of won -- der, star of night,
  Star with roy -- al beau -- ty bright;
  West -- ward lead -- ing, 
  Still pro -- ceed -- ing,
  Guide us to thy per -- fect light!
}

verseFour = \lyricmode {
  \set stanza = "4."
  Myrrh is mine; its bit -- ter per -- fume
  Breathes a life of gath -- er -- ing gloom;
  Sorrowing, sigh -- ing,
  Bleed -- ing, dy -- ing,
  Sealed in the stone -- cold tomb.
}

verseFive = \lyricmode {
 \set stanza = "5."
 Glo -- rious now be -- hold him a -- rise,
 King, and God, and Sac -- _ ri -- fice,
 Al -- le -- lu -- ia, Al -- le -- lui -- ia!
 Sounds through the earth and skies.
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
      \new Lyrics \lyricsto soprano \verseFour
      \new Lyrics \lyricsto soprano \verseFive
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
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
