%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/
%}
\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Henry van Dyke (1852-1933), alt
      }
      \wordwrap {
        Music: HYMN TO JOY, 87 87 D, L. van Beethoven (1770-1827); Adapt. Edward Hoges (1796-1867)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {HYMN TO JOY  87 87 D}
    }
    \right-column{
      \line {L. van Beethoven}
      \line {adapt. Edward Hoges (1796-1867)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Henry van Dyke (1852-1933), alt}
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
  b4 b c d |
  d c b a |
  g g a b |
  b4. a8 a2 |
  b4 b c d |
  d c b a |
  g g a b |
  a4. g8 g2 |
  
  a4 a b g |
  a g8[ c] b4 g |
  a b8[ c] b4 a |
  g a d,2 |
  b'4 b c d |
  d c b a |
  g g a b |
  a4. g8 g2 
\bar "|."
}

alto = \relative c' {
  \global
  d4 d d d |
  d e8[ fs] g4 d |
  d d fs g |
  g4. fs8 fs2 |
  g4 d e f |
  f e d e |
  d d fs g |
  fs4. g8 g2 |
  fs4 d d g |
  fs4 g8[ fs] g4 g |
  fs fs fs ds |
  e8[ d] cs4 d2 |
  d4 d e f |
  f e d e |
  d e fs g |
  fs4. g8 g2
}

tenor = \relative c' {
  \global
  g4 g a b |
  b a g fs |
  g b c d |
  d4. d8 d2 |
  d4 d c b |
  g a b c |
  b b c d |
  c4. b8 b2 |
  d4 fs, g b |
  c4 b8[ a] g4 b |
  c b8[ a] b4 b |
  b a8[ g] fs2 |
  g4 d' c b |
  g4 a b c |
  b b c d |
  c4. b8 b2
}

bass = \relative c' {
  \global
 g4 g g g |
 d d d c |
 b b a g |
 d'4. d8 d2 |
 g4 g g g |
 c, c c c |
 d d d d |
 d4. g8 g2 |
 d4 d d d |
 d d d d |
 d d ds b |
 e a, d2 |
 g4 g g g |
 c,4 c c c |
 d d d d |
 d4. g8 g2
}

%%% Lyrics taken from "Journeysongs" published by OCP.

verseOne = \lyricmode {
  \vOne
  Joy -- ful, joy -- ful, we a -- dore you,
  God of glo -- ry, Lord of love;
  Hearts un -- fold like flow'rs be -- fore you,
  O -- p'ning to the sun a -- bove.
  Melt the clouds of sin and sad -- ness;
  Drive the dark of doubt a -- way;
  Giv -- er of im -- mor -- tal glad -- ness, 
  Fill us with the light of day!
}

verseTwo = \lyricmode {
  \vTwo
  All your works with joy sur -- round you,
  Earth adn heav'n re -- flect your rays,
  Stars and an -- gels sing a -- round you,
  Cen -- ter of un -- bro -- ken praise;
  Field and for -- est, vale and moun -- tain,
  Flow -- 'ry mead -- ow, flash -- ing sea,
  Chant -- ing bird and flow -- ing foun -- tain, 
  Prais -- ing you e -- ter -- nal -- ly!
}

verseThree = \lyricmode {
  \vThree
  Al -- ways giv -- ing and for -- giv -- ing,
  Ev -- er bless -- ing, ev -- er blest,
  Well -- spring of the joy of liv -- ing,
  O -- cean depth of hap -- py rest!
  Lov -- ing Fa -- ther, Christ our broth -- er,
  Let your light up -- on us shine;
  Teach us how to love each oth -- er,
  Lift us to the joy di -- vine.
}

verseFour = \lyricmode {
  \vFour
  Mor -- tals, join the might -- y cho -- rus
  Which the morn -- ing stars be -- gan;
  Love di -- vine is reign -- ing o'er us, 
  Bind -- ing all with -- in its span.
  Ev -- er sing -- ing, march we on -- ward,
  Vic -- tors in the midst of strife;
  Joy -- ful mu -- sic leads us sun -- ward,
  In the tri -- umph song of life.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
  \score { %\transpose c bf,
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
      }
    }
    \include "hymn_layout.ly"
  }
  % \bottom
  \refs
}

%%%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 16)
#(define output-suffix "Hymnal")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  %\top
  \score { %\transpose c bf,
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
    \include "hymn_hymnal_layout.ly"
  }    
  \refs
  %\bottom
}
%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  %  \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}