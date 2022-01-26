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
      \line {IRBY  87 87 77}
    }
    \column{
      \line {Henry J. Gauntlett, 1858}
     \line {harm. \italic "The Hymnal," 1940}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Mrs. Cecil F. Alexander (1818-95)}
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
  \partial 2
  c4 e |
  f4. f8 f8[ e] f[ g] |
  g4 f f a |
  c4. a8 a8[ g] f[ e] |
  f2 \bar ""
  
  c4 e |
  f4. f8 f8[ e] f[ g] |
  g4 f f a |
  c4. a8 a8[ g] f[ e] |
  f2 \bar ""
  
  d'4 d |
  c4. f,8 bf4 bf |
  a4~ a d4 d |
  c4. a8 a8[ f] f[ e] |
  f4~ f4
  \bar "|."
}

alto = \relative c' {
  \global
  c4 bf |
  c4. c8 c4 c8[ e] |
  e4 f c f |
  f4. f8 d4 c |
  c2
  
  c4 bf |
  c4. c8 b4 b |
  c8[ bf] a4 c f |
  f4. f8 d4 c |
  c2
  
  f4 f |
  f8[ e f] f8 f4 e |
  f~ f d8[ e] f[ g] |
  c,[ e f] c d4 c |
  c~ c
}

tenor = \relative c' {
  \global
  a4 g |
  f4. a8 a8[ g] a[ bf] |
  bf4 a a f |
  f4. c'8 c8[ bf] a[ g] |
  a2
  
  a4 g |
  f4. a8 f4 f |
  e f a f |
  f4. c'8 c[ bf] a[ g] |
  a2
  
  bf4 f |
  a8[ bf c] a g4 c |
  c4 c bf bf |
  bf8[ g a] c c[ bf] a[ g] |
  a4~ a
}

bass = \relative c, {
  \global
   f4 g |
   a4. f8 c'4 c |
   c f f d |
   a4. f8 bf4 c |
   f,2 
   
   f4 g |
   a4. f8 d'4 g, |
   c f f d |
   a4. f8 bf4 c |
   f,2 
   
   bf8[ c] d[ e] |
   f8[ g a] f8 c4 c |
   f~ f bf,8[ c] d[ e] |
   f4. f8 bf,4 c |
   f~ f
}

verseOne = \lyricmode {
  \set stanza = "1."
  Once in roy -- al Da -- vid's ci -- ty
  Stood a low -- ly cat -- tle shed,
  Where a moth -- er laid her ba -- by
  In a man -- ger for his bed:
  Ma -- ry was that moth -- er mild,
  Je -- sus Christ her lit -- tle child.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  He came down to earth from hea -- ven,
  Who is God and Lord of all,
  And his shel -- ter was a sta -- ble,
  And his cra -- dle was a stall;
  With the poor, and mean, and low-ly,
  Lived on earth our Sa -- vior ho-ly.
}

verseThree = \lyricmode {
  \set stanza = "3."
  And, through all his won -- drous child -- hood,
  He would hon -- or and o -- bey,
  Love, and watch the low -- ly maid -- en
  In whose gen -- tle arms he lay;
  Chris -- tian chil -- dren all must be
  Mild, o -- be -- dient, good as he.
}

verseFour = \lyricmode {
  \set stanza = "4."
  For he is our child -- hood's pat -- tern;
  Day by day like us he grew;
  He was lit -- tle, weak, and help -- less,
  Tears and smiles like us he knew;
  And he feel -- eth all our sad-ness,
  And he shar -- eth in our glad-ness.
}

verseFive = \lyricmode {
  \set stanza = "5."
  And our eyes at last shall see him,
  Through his own re -- deem -- ing love;
  For that child so dear and gen -- tle
  Is our Lord in heav'n a -- bove;
  And he leads his chil -- dren on
  To the place where he is gone.
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
