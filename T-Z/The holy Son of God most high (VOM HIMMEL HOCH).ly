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
      \line {VOM HIMMEL HOCH  LM}
    }
    \column{
      \line {\italic "Geistliche Lieder," Leipzig, 1539}
      \line {Harm. J.S. Bach, 1685-1750}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Henry More, 1614-87}
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

melody = \relative c'' {
  \global
  \partial 4
  c4 |
  b a b8[ a] g4 |
  a b c
    c | \break
  c g g e8[ f] | 
  g4 f e 
  
    e |
    a a g8[ a] b4 |
    c8[ b] a4 g 
    
    c4 |
    b a g a8[ g] |
    f[ e] d4 c
\bar "|."
}

alto = \relative c'' {
  \global
  \partial 4
  g4 |
  g8[ fs] e4 d e8[ d] |
  c4 d e 
  
  e8[ f] |
  g[ f] e4 d c |
  c d c 
  
  c8[ d] |
  e4 d d8[ fs] g4 |
  g g8[ fs] g4 
  
  e8[ d] |
  d[ e] e[ d] d[ c] c4 |
  c8[ a] b4 c
}

tenor = \relative c' {
  \global
  \partial 4
  e4 |
  d4 c b c8[ b] |
  a[ g] f4 g
  
  g |
  c c b bf8[ a] |
  g4 g g 
  
  g |
  g fs g8[ c] b[ a] |
  g[ b] e[ d] b4 
  
  a4 |
  g g8[ f] g[ e] a[ b] |
  c4 g8[ f] e4
}

bass = \relative c {
  \global
 \partial 4
 c4 |
 g'4. fs8 g8[ f] e4 |
 f8[ e] d4 c
 
 c8[ d] |
 e4 e8[ f] g4 g8[ f] |
 e8[ d] c[ b] c4
 
 c |
 cs4 d8[ c] b[ a] g4 |
 e'8[ d] c[ d] g4
 
 g8[ fs] g[ e] c[ d] b[ c] f[ g] |
 a[ f] g[ g,] c4
}

verseOne = \lyricmode {
  \set stanza = "1."
  The ho -- ly son of God most high,
  For love of A -- dam's laps -- ed race,
  Quit the sweet pleas -- ures of the sky
  To bring us to that hap -- py place.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  His robes of likght he lad a -- side, 
  Which did his maj -- es -- ty a -- dorn,
  And the frail state of mor -- tals tried,
  In hu -- man flesh and fig -- ure born.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Whole choirs of an -- gels loud -- ly sing
  the mys -- t'ry of his sac -- red birth.
  And the blest news to shep -- herds bring,
  Fill -- ing their watch -- ful souls with mirth.
}

verseFour = \lyricmode {
  \set stanza = "4."
  The Son of God thus man be -- came,
  That men the sons of God might be,
  And by their sec -- on birth re -- gain
  A like -- ness to his de -- i -- ty.
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
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
