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
      \line {UNDE ET MEMORES  10 10 10 10  10 10}
    }
    \right-column{
      \line {W.H. Monk, 1875}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {William Harry Turton, 1881}
    }
  } 
}


global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  fs4 |
  fs4. d8 d4 e |
  fs4. fs8 fs4 g |
  a2. fs4 |
  e fs g4. g8 |
  g4 fs a fs |
  e2. \bar "||"

  fs4 |
  fs4. d8 d4 e |
  fs4. fs8 fs4 g |
  a2. \bar "" \break
  fs4 |
  b a gs4. gs8 |
  a4 b cs b |
  a2. \bar "||"

  a4 |
  d a g fs | \break
  b b d b | \noBreak
  a2. a4 | \noBreak
  g fs e d | \noBreak
  b'4. g8 fs4 e | \noBreak
  d2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  d4. d8 d4 d |
  d4. d8 d4 cs |
  d2. d4 |
  cs d e4. e8 |
  e4 d d d |
  cs2.

  d4 |
  d4. d8 d4 d |
  d4. d8 d4 d |
  d2. d4 |
  d4 d d4. d8 |
  cs4 fs e d |
  cs2.

  cs4 |
  d d cs d |
  d4 d d g |
  fs2. d4 |
  cs d cs d |
  d4. e8 d4 cs |
  d2.
}

tenor = \relative c' {
  \global
  \partial 4
  a4 |
  a4. fs8 fs4 g |
  a4. a8 a4 a |
  a2. a4 |
  a a b4. b8 |
  a4 a a a |
  a2.

  a4 |
  a4. fs8 fs4 g4 |
  a4. d,8 d4 e |
  fs2. a4 |
  g a b4. b8 |
  a4 a a gs |
  a2.

  a4 |
  a a a a |
  g g g d' |
  d2. a4 |
  a a g fs |
  g4. b8 a4 g |
  fs2.
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  d4. d8 d4 d |
  d4. d8 d4 e |
  fs2. d4 |
  g fs e4. d8 |
  cs4 d fs,4. g8 |
  a2.

  d4 |
  d4. d8 d4 d |
  d4. b8 b4 b |
  fs2. d'4 |
  g fs e4. e8 |
  fs4 d e e |
  a,2.

  g'4 |
  fs4 fs e d |
  g, g b g |
  d'2. fs4 |
  e d a b |
  g4. g8 a4 a |
  d2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Thou, Who at Thy first Eu -- cha -- rist didst pray,
  That all Thy Church might be for -- ev -- er one,
  Grant us at ev -- 'ry Eu -- cha -- rist to say
  With long -- ing heart and soul, ‘Thy will be done.’
  Oh, may we all one Bread, one Bo -- dy be,
  Through this blest Sa -- cra -- ment of U -- ni -- ty.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  For all Thy Church, O Lord, we in -- ter -- cede;
  Make Thou our sad di -- vi -- sions soon to cease;
  Draw us the near -- er each to each, we plead,
  By draw -- ing all to Thee, O Prince of Peace;
  Thus may we all one Bread, one Bo -- dy be,
  Through this blest Sa -- cra -- ment of U -- ni -- ty.
}

verseThree = \lyricmode {
  \set stanza = "3."
  We pray Thee, too, for wan -- d'rers from Thy fold,
  Oh, bring them back, good Shep -- herd of the sheep,
  Back to the faith which saints be -- lieved of old,
  Back to the Church which still that faith doth keep;
  Soon may we all one Bread, one Bo -- dy be,
  Through this blest Sa -- cra -- ment of U -- ni -- ty.
}

verseFour = \lyricmode {
  \set stanza = "4."
  So, Lord, at length when Sa -- cra -- ments shall cease,
  May we be one with all Thy Church a -- bove,
  One with Thy saints in one un -- bro -- ken peace,
  One with Thy saints in one un -- bound -- ed love;
  More bles -- sèd still, in peace and love to be
  One with the Tri -- ni -- ty in U -- ni -- ty.
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
        tempoWholesPerMinute = #(ly:make-moment 86 4)
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}


