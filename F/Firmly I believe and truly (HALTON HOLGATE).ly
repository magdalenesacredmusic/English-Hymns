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
      \line {HALTON HOLGATE  87 87}
    }
    \right-column{
      \line {Melody by William Boyce (1711-1779)}
      \line {in S.S. Wesley's \italic "European Psalmist," 1872}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {John Henry Newman (1801-90)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  fs4 d a' d, |
  e8[ fs] g4 g fs |
  b a cs d |
  g, fs fs( e) |
  
  g8[ fs] e[ d] a'4 cs |
  b8[ cs] d4 d cs |
  d b g fs |
  g8[ fs] e4 d2 \bar "||" \break
  
  d2 d \bar "|."
}

alto = \relative c' {
  \global
  a4 d cs d |
  d cs cs d |
  d d a'8[ g] fs4 |
  e d d( cs) |
  a4 a a e' |
  fs e e e |
  d d d8[ cs] d4 |
  d d8[ cs] a2
  
  b2 a
}

tenor = \relative c' {
  \global
  a4 fs e d |
  b' a a a |
  g a a a |
  a a a2 |
  
  a4 g8[ fs] e4 a |
  a gs a a |
  a g a a |
  b8[ a] g4 fs2
  
  g2 fs2
}

bass = \relative c {
  \global
  d4 d a b |
  g a d d |
  g fs e d |
  cs d a2 |
  
  d4 d cs a |
  d e a a8[ g] |
  fs4 g e d |
  g, a d2
  
  g,2 d'2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Firm -- ly I be -- lieve and tru -- ly 
  God is Three, and God is One;
  And I next ac -- knowl -- edge du -- ly
  Man -- hood tak -- en by the Son.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  And I trust and hope most full -- y 
  In that Man -- hood cru -- ci -- fied;
  And each thought and deed un -- rul -- ly 
  Do to death, as he has died.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Sim -- ply to his grace and whol -- ly
  Light and life and strength be -- long,
  and I love su -- preme -- ly, sole -- ly,
  Him the ho -- ly, him the strong.
}

verseFour = \lyricmode {
  \set stanza = "4."
  And I hold in ven -- er -- a -- tion,
  For the love of him a -- lone,
  Ho -- ly church as his cre -- a -- tion, 
  And her teach -- ings as his own.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Ad -- o -- ra -- tion ay be giv -- en,
  With and throu th'an -- gel -- ic host,
  To the God of earth and heav -- en, 
  Fa -- ther, Son, and Ho -- ly Ghost.
  
    \set stanza = "5." A -- men.
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
