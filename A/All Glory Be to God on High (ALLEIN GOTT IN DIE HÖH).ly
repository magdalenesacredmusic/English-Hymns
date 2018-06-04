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
          \line {ALLEIN GOTT IN DER HÖH' SEI EHR   87 87 887}
      }
      \column{
      \line {Leipzig, 1539}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {\italic "Allein Gott in der Höh sei Ehr"}
     \line {"Nikolaus Decius, 1525; tr. C. Winkworth, 1863, alt."}
   }
  } 
}

\header {
  tagline = ""
}


global = {
  \key g \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  g4 |
  b2 c4 |
  d2 c4 |
  b2 a4 |
  b2 \bar "||"

  b4 |
  b2 a4 |
  c4( b) a |
  g2( fs4) |
  g2 \bar "||"

  g4 |
  b2 c4 |
  d2 c4 |
  b2 a4 |
  b2 \bar "||"

  b4 |
  b2 a4 |
  c4( b) a |
  g2( fs4) |
  g2 \bar "||"

  g4 |
  g2 a4 |
  c2 b4 |
  a2 gs4 |
  a2 \bar "||"

  a4 |
  b2 c4 |
  d2 c4 |
  b2 a4 |
  b2 \bar "||"

  g4 |
  a2 c4 |
  b2 a4 |
  g2( fs4) |
  g2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  g2 g4 |
  fs2 g4 |
  g2 fs4 |
  g2

  g4 |
  g2 fs4 |
  g2 e4 |
  d( e d) |
  d2

  d4 |
  g2 g4 |
  fs2 g4 |
  g2 fs4 |
  g2

  g4 |
  g2 fs4 |
  g2 e4 |
  d( e d) |
  d2

  d4 |
  e2 fs4 |
  g2 g4 |
  e2 e4 |
  e2

  d4 |
  d2 g4 |
  fs2 e4 |
  e2 e4 |
  ds2

  b4 |
  d! 2 e4 |
  e2 e4 |
  d2. |
  d2
}

tenor = \relative c' {
  \global
  \partial 4
  b4 |
  d2 g,4 |
  a2 e'4 |
  d2 d4 |
  d2

  d4 |
  d2 d4 |
  e( d) c |
  b( a2) |
  b2

  b4 |
  d2 g,4 |
  a2 e'4 |
  d2 d4 |
  d2

  d4 |
  d2 d4 |
  e( d) c |
  b( a2) |
  b2

  b4 |
  b2 d4 |
  e2 d4 |
  c2 b4 |
  c2

  a4 |
  g2 g4 |
  a2 a4 |
  g2 e4 |
  fs2

  e4 |
  fs2 a4 |
  g2 a4 |
  b( a2) |
  b2
}

bass = \relative c' {
  \global
  \partial 4
  g4 |
  g2 e4 |
  d2 e4 |
  g2 d4 |
  g2

  g4 |
  g2 d4 |
  c g a |
  b( c d) |
  g,2

  g'4 |
  g2 e4 |
  d2 e4 |
  g2 d4 |
  g2

  g4 |
  g2 d4 |
  c g a |
  b( c d) |
  g,2

  g'4 |
  e2 d4 |
  c2 g'4 |
  a2 e4 |
  a2

  fs4 |
  g2 e4 |
  d2 a4 |
  e'2 c4 |
  b2

  e4 |
  d2 a4 |
  e'2 c4 |
  d2. |
  g,2
}

verseOne = \lyricmode {
  \set stanza = "1."
  All glo -- ry be to God on high,
  Who hath our race be -- friend -- ed!
  To us no harm shall now come nigh,
  The strife at last is end -- ed;
  God show -- eth His good -- will to men,
  And peace shall reign on earth a -- gain;
  O thank Him for His good -- ness!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  We praise, we wor -- ship Thee, we trust
  And give Thee thanks for -- ev -- er,
  O Fa -- ther, that Thy rule is just
  And wise, and chang -- es nev -- er;
  Thy bound -- less grace o’er all things reigns,
  Thou dost what -- e’er Thy will or -- dains;
  ’Tis well Thou art our Rul -- er!
}

verseThree = \lyricmode {
  \set stanza = "3."
  O Je -- sus Christ, our God and Lord,
  Be -- got -- ten of the Fa -- ther,
  O Thou who hast our peace re -- stored,
  And the lost sheep dost gath -- er,
  Thou Lamb of God, en -- throned on high
  Be -- hold our need and hear our cry;
  Have mer -- cy on us, Je -- sus!
}

verseFour = \lyricmode {
  \set stanza = "4."
  O Ho -- ly Spir -- it, pre -- cious Gift,
  Thou Com -- for -- ter un -- fail -- ing,
  Do Thou our trou -- bled souls up -- lift,
  A -- gainst the foe pre -- vail -- ing;
  A -- vert our woes and calm our dread:
  For us the Sav -- ior’s blood was shed;
  Do Thou in faith sus -- tain us!
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
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
