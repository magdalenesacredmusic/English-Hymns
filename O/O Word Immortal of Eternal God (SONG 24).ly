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
      \line {SONG 24   10 10 10 10}
    }
    \right-column{
      \line {Orlando Gibbons, 1623}
      \line {arr. Ralph Vaughan Williams, 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Ὁ μονογενὴς ϒιός"}
      \line {Emperor Justinian; tr. T.A. Lacey, 1906}
    } 
  }
}


global = {
  \key e \minor
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \repeat volta 2 {
    g2 g4 a |
    b4. b8 a4 g |
    fs fs e2 \bar "||"
    b'4\rest b b cs |
    d4. d8 cs4 b |
    b as b2 \bar "||"
    b4\rest fs fs g |
    a4. fs8 g4 g |
    a c b2 \bar "||"
    b4\rest a d cs |
    b4. a8 g4 g |
    fs fs \tieDashed e2~
  }
  e4 fs fs g |
  a4. fs8 g4 g |
  a c b2 \bar "||"
  b4\rest a d cs |
  b4. a8 g4 g |
  fs fs e2 \bar "||"
  e2 e2 \bar "|."
}

alto = \relative c' {
  \global
  e2 e4 fs |
  g4. g8 fs4 e |
  e ds e2
  s4 g4 fs as |
  b4. b8 fs8[ e] d[ e] |
  fs4 fs fs2
  s4 d d b8[ cs] |
  d4. d8 e4 d |
  c c d2
  s4 d fs fs8[ e] |
  d4. fs8 fs4 e |
  e ds \tieDashed e2~

  e4 d d b8[ cs] |
  d4. d8 e4 d |
  c c d2
  s4 d fs fs8[ e] |
  d4. fs8 fs4 e |
  e ds e2 |
  c2 b
}

tenor = \relative c' {
  \global
  b2 b4 d |
  d4. d8 d8[ c] b4 |
  b4. a8 g2
  s4 b4 b e |
  d4. d8 a4 b |
  cs cs d2
  s4 b4 b g |
  fs4. a8 c4 g |
  g fs g2
  s4 fs fs a |
  b4. c8 d4 b |
  b4. a8 \tieDashed g2~

  g4 b b g |
  fs4. a8 c4 g |
  g fs g2 |
  s4 fs fs a |
  b4. c8 d4 b |
  b4. a8 g2
  a2 gs
}

bass = \relative c {
  \global
  e2 e4 d |
  g,4. g8 d'4 e |
  b b << {\stemDown \override Stem #'length = #4.0  e2} \\ {\teeny \ignore \override Stem #'length = #5.6 e,2} >> |
  d'4\rest e4 d cs |
  b4. b8 fs'4 g |
  fs fs, b2 |
  d4\rest b4 b e |
  d4. d8 c4 b |
  a a g2 |
  d'4\rest d4 b fs |
  g4. a8 b4 e |
  b b \tieDashed e2~ |

  e4 b b e |
  d4. d8 c4 b |
  a4 a g2 |
  d'4\rest d4 b fs |
  g4. a8 b4 e |
  b b << {\stemDown \override Stem #'length = #4.0  e2} \\ {\teeny \ignore \override Stem #'length = #5.6 e,2} >> |
  a2 e'
}

verseOne = \lyricmode {
  \set stanza = "1."
  O Word im -- mor -- tal of e -- ter -- nal God,
  On -- ly be -- got -- ten of the on -- ly source,
  For our sal -- va -- tion stoop -- ing to the course
  Of hu -- man life, and born of Ma -- ry’s blood.
}

verseTwo = \lyricmode {
  Sprung from the ev -- er vir -- gin wo -- man -- hood
  Of her who bare Thee, God im -- mu -- ta -- ble,
  In -- car -- nate, made as man with man to dwell,
  And con -- de -- scend -- ing to the bit -- ter Rood;

  In e -- qual ho -- nor with the Ho -- ly Ghost,
  And with th’e -- ter -- nal Fa -- ther glo -- ri -- fied.
  A -- men.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Save us, O Christ, our God, for Thou hast died
  To save Thy peo -- ple to the ut -- ter -- most,
  And dy -- ing tramp -- lest death in vic -- to -- ry;
  One of the ev -- er bles -- sèd Trin -- i -- ty,
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}