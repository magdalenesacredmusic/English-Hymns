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
      \line {CANONBURY  LM}
    }
    \right-column{
      \line {Robert Schumann, 1839}
      \line {adapt. \italic "Hymns with Tunes, Old and New" 1872}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "A Patre Unigenite"}
      \line {Tr. St. Cecilia's Abbey, Ryde}
    }
  }
}

global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  b' b b c8[ b] |
  a4 g8[ a] b4 d, |
  e fs \bar "" \break
  g a |
  fs e d d |
  b' b b c8[ b] | \break
  
  a4 b8[ a] b4 d, |
  e fs g b8[ a] |
  g4 fs g \bar "|."
}

melodya = \relative c' {
  \global
  \partial 4
  d4 |
  b' b b c8[ b] |
  a4 g8[ a] b4 \bar "" \break  d, |
  e fs 
  g a |
  fs e d \bar "" d |
  b' b b c8[ b] | 
  
  a4 b8[ a] b4  \bar "" d, |
  e fs g b8[ a] |
  g4 fs g \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 | 
  d ds e e |
  c4 c b d |
  c c d e |
  d cs d d |
  d ds e e |
  c c b d |
  c c d e |
  d d d
}

tenor = \relative c {
  \global
  \partial 4 
  d4 |
  b' a g a8[ g] |
  fs4 e8[ fs] g4 g |
  g a g e | 
  a g fs d |
  g fs gs a8[ g] |
  fs4 e8[ fs] g4 g |
  g a g gs8[ a] |
  b4 a b
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  g fs e a, |
  d d g, b |
  c a b cs |
  d a d d |
  g, b e a, |
  d d g, b |
  c a b c |
  d d g,
}

verseOne = \lyricmode {
  \set stanza = "1."
  O Son of God, you came to earth
  Through Vir -- gin Moth -- er, full of grace,
  And lat -- er deigned to be bap -- tized
  Your king -- dom to in -- au -- gu -- rate.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Most High, from heav -- en you came down,
  And chose to share our low -- ly state,
  Your own cre -- a -- tion to re -- deem
  And raise to ev -- er -- last -- ing joy.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Most dear Re -- deem -- er, we im -- plore,
  In gra -- cious love, come now to us,
  And flood our hearts with your pure light
  And grace that makes us one with you.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Re -- main with us, O Lord, we pray,
  Re -- move our heav -- y clouds of gloom,
  Wash all our sin -- ful stains a -- way,
  Be -- stow the heal -- ing that we need.
}

verseFive = \lyricmode {
  \set stanza = "5."
  All glo -- ry be to you, O Christ,
  Who are the Life, the Truth a -- lone;
  The Fa -- ther and the Spir -- it's light
  On high, re -- vealed you as their own.
  \set stanza = "5."
  A -- men.
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
        tempoWholesPerMinute = #(ly:make-moment 84 4)
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
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive }    
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
