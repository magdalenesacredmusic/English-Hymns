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
      \line {NUNC DIMITTIS 667 D}
    }
    \right-column{
      \line {Louis Bourgeois, 1549; harm. Claude Goudimel}
      \line { adapt. \italic "The English Hymnal"}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Φῶς Ἱλαρόν \italic "(Phos hilaron)," Ancient Greek hymn}
      \line {trans. Robert S. Bridges, 1899}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key f \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  c2 d4 c bf2 a g \bar "||"
  bf2 a4 f g g f2 \bar "||" \break

  f2 c'4 c d c bf2 a \bar "||"
  c2 a4 bf a g f2 \bar "||" \break

  f2 d4 e f d c2 \bar "||"
  f2 g4 a bf a g2 f1 \bar "|."
}

alto = \relative c'' {
  \global
  a2 bf4 a a( g2) fs4 g2 \bar "||"
  g2 f!4 f e e f2 \bar "||"
  f2 f4 f f f f2 f \bar "||"
  g2 f4 f f e d2 \bar "||"
  d2 d4 c c b c2 \bar "||"
  d2 d4 f f f f( e) f1 \bar "|."
}

tenor = \relative c' {
  \global
  f2 f4 f d2 d bf \bar "||"
  d2 d4 a c c a2 \bar "||"
  a2 a4 a bf a d2 c2 \bar "||"
  e2 d4 d c c a2 \bar "||"
  bf2 f4 a a g e2 \bar "||"
  bf'2 bf4 c d c c2 a1 \bar "|."
}

bass = \relative c {
  \global
  f2 bf,4 f' g2 d2 g,2 \bar "||"
  g2 d'4 d c c f,2 \bar "||"
  f'2 f4 f bf, f' bf2 f2 \bar "||"
  c2 d4 bf f' c d2 \bar "||"
  bf2 bf4 a f g c2 \bar "||"
  bf2 g4 f bf f c'2 f,1 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  O glad -- some light, O grace
  Of God the Fath -- er's face,
  The_e -- ter -- nal splen -- dour wear -- ing;
  Cel -- es -- tial, ho -- ly, blest,
  Our Sa -- viour Je -- sus Christ,
  Joy -- ful in thine ap -- pear -- ing.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Now, ere day fad -- eth quite,
  We see the ev' -- ning light,
  Our wont -- ed hymn out -- pour -- ing;
  Fath -- er of might un -- known,
  Thee, his in -- car -- nate Son,
  And Ho -- ly Spirit a -- dor -- ing.
}

verseThree = \lyricmode {
  \set stanza = "3."
  To thee of right be -- longs
  All praise of ho -- ly songs,
  O Son of God, Life -- giv -- er;
  Thee, there -- fore, O Most High,
  The world doth glo -- ri -- fy,
  And shall ex -- alt for -- ev -- er.
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
