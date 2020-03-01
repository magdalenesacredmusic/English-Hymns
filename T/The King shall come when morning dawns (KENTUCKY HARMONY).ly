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
      \line {KENTUCKY HARMONY CM}
    }
    \right-column{
      \line {Traditional American Melody}
      \line {\italic "Kentucky Harmony," 1816}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Early Greek hymn}
      \line {tr. John Brownlie, 1907}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key af \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  c4^\markup {\italic Unison} |
  f g af bf8[ af] |
  g4 f8[ ef] c4 c |
  f g af bf |
  c2.\bar ""
  af8[ bf] |
  c4 df8[ c] bf4 af |
  g f8[ ef] c4 c |
  f g af8[ f] g4 |
  f2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  s4 |
  f1 |
  ef4 s2. |
  c2. ef4 |
  ef2. ef4 |
  f1 |
  ef4 s2. |
  c4 f f ef |
  c2.
}

tenor = \relative c {
  \global
  \partial 4
  c4 |
  af'4 bf c bf |
  bf4 g af g |
  af bf c g |
  af2. c4 |
  af2 bf4 c |
  c af g g |
  f df' c bf af2.
}

bass = \relative c {
  \global
  \partial 4
  s4 |
  f2. df4 |
  ef2 f |
  f2. ef4 |
  af,2. af'8[ g] |
  f1 |
  c2. bf4 |
  af bf c2 |
  f2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  The King shall come when morn -- ing dawns
  And light tri -- um -- phant breaks,
  When beau -- ty gilds the east -- ern hills 
  And life to joy a -- wakes.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Not as of old a lit -- tle child 
  To bear and fight and die,
  But crowned with glo -- ry like the sun
  That light the morn -- ing sky.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O bright -- er than the ris -- ing morn
  When He, vic -- to -- rious, rose
  And left the lone -- some place of death,
  De -- spite the rage of foes:
}

verseFour = \lyricmode {
  \set stanza = "4."
  O bright -- er than that glo -- rious morn
  Shall this fair morn -- ing be,
  When Christ our King, in beau -- ty comes
  And we His face shall see!
}


verseFive = \lyricmode {
  \set stanza = "5."
  The King shall come when morn -- ing dawns
  And light and beau -- ty brings,
  Hail, Christ the Lord! Thy peo -- ple pray:
  Come quick -- ly, King of kings!
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
        tempoWholesPerMinute = #(ly:make-moment 110 4)
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
