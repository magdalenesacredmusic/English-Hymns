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
          \line {FORTUNATUS }
      }
      \column{
      \line {Arthurs S. Sullivan, 1842-1900}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {\italic "" Venantius Fortunatus, c. 540-609}
     \line { Tr. John Ellerton, 1826-1893}
   }
  } 
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g8[ fs] g4 a b |
  c b a g |
  g2 fs |
  g1 |
  
  b8[ c] d4 e d |
  c b a b |
  a2 cs |
  d1 |
  
  d4 d cs cs |
  b2 fs |
  b4 b a g |
  fs1 |
  
  g4 g fs e |
  a g fs d |
  fs2 e |
  d1 |
  
  b'8[^\markup {\italic Refrain} c] d4 e d |
  b a g c |
  b2 a |
  g1 \bar "|."
}

alto = \relative c' {
   \global
  d4 d fs g |
  g g e d |
  e2 d |
  d1 |
  
  g4 g g g |
  fs g a g |
  fs2 g |
  fs1 |
  
  fs4 fs fs e |
  d2 d |
  g4 g fs e |
  d1

  d4 d cs cs |
  d e d d |
  d2 cs2 |
  d1 |
  
  g4 g g g |
  g fs g a |
  g2 fs |
  g1
}

tenor = \relative c' {
  \global
  b8[ a] b4 d d |
  e d c b |
  a2 a |
  b1 |
  
  d4 d c d |
  d d d d |
  d2 a |
  a1 |
  
  b4 b as as |
  b2 b |
  b4 b b b |
  b1
  
 b4 b a a |
 a a a b |
 a2 g |
 fs1 |
 
 d'4 d c d |
 d c b e |
 d2 c |
 b1
  
}

bass = \relative c' {
  \global
  g4 g d g |
  c, g a b |
  c2 d |
  g1 |
  
  g8[ a] b4 c b |
  a4 g fs g |
  a2 a, d1 |
  
  b4 b fs' fs, |
  b2 b |
  b4 b e g |
  b1 |
  
   e,4 e a g |
  fs4 cs d g, |
  a2 a |
  d1 |
  
  g8[ a] b4 c b |
  g d e c |
  d2 d |
  g,1
}

verseOne = \lyricmode {
  \set stanza = "1."
  “Wel -- come, hap -- py morn -- ing” age to age shall say:
  Hell to -- day is van -- quished, heav'n is won to -- day!
  Lo! the dead is liv -- ing, God for ev -- er -- more!
  Him, their true Cre -- a -- tor, all his works a -- dore!
  
   “Wel -- come, hap -- py morn -- ing” age to age shall say.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Earth her joy con -- fess -- es, cloth -- ing her for spring,
  All fresh gifts re -- turned with her re -- turn -- ing King:
  Bloom in ev -- 'ry mea -- dow, leaves on ev -- 'ry bough,
  Speak his sor -- row end -- ed, hail his tri -- umph now.
}

verseThree = \lyricmode {
  \set stanza = "3."
 Months in due suc -- ces -- sion, days of length'n -- ing light,
 Hours and pass -- ing mo -- ments praise thee in their flight.
 Bright -- ness of the morn -- ing, sky and fields and sea,
 Van -- quish -- er of dark -- ness, bring their praise to thee.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Mak -- er and Re -- deem -- er, life and health of all,
  Thou from heav'n be -- hold -- ing hu -- man na -- ture's fall,
  Of the Fa -- ther's God -- head true and on -- ly Son,
  Man -- hood to de -- liv -- er, man -- hood didst put on.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Thou, of life the auth -- or, death didst un -- der -- go,
  Tread the path of dark -- ness, sav -- ing strength to show;
  Come then, true and faith -- ful, now ful -- fil thy word,
  'Tis thine own third morn -- ing! rise, O bur -- ied Lord!
}

verseSix = \lyricmode {
  \set stanza = "6."
  Losse the souls long pris -- oned, bound with Sa -- tan's chain;
  All that now is fall -- en raise to life a -- gain;
  Show thy face in bright -- ness, bid the na -- tions see;
  Bring a -- gain our day -- light: day re -- turns with thee!
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
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
      \new Lyrics \lyricsto "tune" { \verseFive}
      \new Lyrics \lyricsto "tune" {\verseSix}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
