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
      \line {SHIPSTON  87 87}
    }
    \right-column{
      \line {Warwickshire Ballad}
      \line {Harm. Ralph Vaughan Williams}
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
  \key ef \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  ef g bf4. c8 |
  bf8[ af] g[ f] g4 ef |
  ef g bf4. c8 |
  bf8[ g] f[ ef] f2 |
  
  ef4 g8[ af] bf4 ef |
  bf4. af8 af4 g |
  ef4. f8 g4 af8[ f] |
  ef4 d ef2 \bar "||" \break
  
  ef2 ef \bar "|."
}

alto = \relative c' {
  \global
  bf4 ef ef4. ef8 |
  d4 d ef ef |
  ef ef ef4. ef8 ef4 c d2 |
  
  c4 ef d ef |
  ef f ef ef |
  c4. d8 ef4 c |
  bf bf bf2
  
  c2 bf
}

tenor = \relative c' {
  \global
  g4 bf bf4. ef8 |
  bf4 bf bf g |
  g c bf4. af8 |
  g4 a bf2 |
  
  g4 ef g ef |
  ef bf' bf bf |
  c bf8[ af] 
  g4 c8[ af] |
  g4 f g2
  
  af2 g2
}

bass = \relative c {
  \global
  ef4 ef g4. af8 |
  bf4 bf, ef ef |
  ef c g4. af8 |
  bf4 c bf2 |
  
  c4 bf af g |
  c d ef g |
  af4 g8[ f] ef4 af, |
  bf bf ef2
  
  af2 ef2
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
