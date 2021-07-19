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
      \line {NUN DANKET ALLE GOTT  67 67 66 66}
    }
    \right-column{
      \line {Johann Crüger}
      \line {harm. Felix Mendelssohn}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Nun danket alle Gott"}
      \line {Martin Rinkart, 1636; tr. Catherine Winkworth}
    }
  } 
}


global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  c4 |
  c c d d |
  c2. c4 |
  bf a g a |
  g2 f4 \bar "" \break

  c'4 |
  c c d d |
  c2. c4 |
  bf a g a |
  g2 f4 \bar ""

  g4 |
  g g a c |
  g2. g4 |
  a8[ b] c4 d b |
  c2. \bar ""

  c4 |
  d c bf a |
  bf2. a4 |
  g f f e |
  f2. \bar "|."
}

melodya = \relative c'' {
  \global
  \partial 4
  c4 |
  c c d d |
  c2. c4 |
  bf a g a |
  g2 f4 \bar ""% \break

  c'4 |
  c c d d |
  c2. c4 |
  bf a g a |
  g2 f4 \bar ""

  g4 |
  g g a c |
  g2. g4 |
  a8[ b] c4 d b |
  c2. \bar ""

  c4 |
  d c bf a |
  bf2. a4 |
  g f f e |
  f2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  f4 |
  f f f d8[ e] |
  f2. f8[ ef] |
  d4 f e f 
  f( e) f 

  f4 |
  f f f f8[ e] |
  f2. f4 |
  f f8[ e] d4 e |
  d( e) f 

  e4 f e8[ d] c4 c |
  c2. c4 |
  c8[ d] e4 f e |
  e2. 

  e4 |
  d d d fs |
  g2. f8[ e] |
  d4 a8[ bf] c4 c |
  c2. 
}

tenor = \relative c' {
  \global
  \partial 4
  a4 |
  a c bf f8[ g] |
  a2. a4 |
  bf c c8[ bf] a4 |
  bf2 a4

  a4 |
  a  a bf bf |
  a2. a4 |
  bf c d4. cs8 |
  d4( c8[ bf]) a4 

  c4 |
  d4 c8[ b] a4 f |
  e2. c'4 |
  c g8[ c] c[ b] a[ gs] |
  a2. 

  a4 |
  a g8[ a] bf4 c |
  bf2. c4 |
  d f,8[ g] a4 g8[ bf] |
  a2. 
}

bass = \relative c {
  \global
  \partial 4
  f4 |
  f a bf bf, |
  f'2. f,4 |
  g a8[ bf] c4 f |
  c2 f4 

  f4 |
  f f8[ ef] d[ c] bf4 |
  f'2. f8[ e] |
  d4 c bf a |
  bf( c) f4 

  c4 |
  b c f,8[ g] a[ b] |
  c2. e4 |
  f e d e |
  a,2. 

  a'8[ g] |
  fs4 e8[ fs] g4 d |
  g,2. a4 |
  bf d c c |
  f,2. 
}

verseOne = \lyricmode {
  \set stanza = "1."
  Now thank we all our God,
  With heart and hands and voi -- ces,
  Who won -- drous things hath done,
  In whom the world re -- joi -- ces;
  Who from our moth -- er's arms
  Hath bless'd us on our way
  With count -- less gifts of love,
  And still is ours to -- day.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Oh may this boun -- teous God
  Through all our life be near us,
  With ev -- er joy -- ful hearts
  And bles -- sed peace to cheer us;
  And keep us in His grace,
  And guide us when per -- plex'd,
  And free us from all ills
  In this world and the next.
}

verseThree = \lyricmode {
  \set stanza = "3."
  All praise and thanks to God
  The Fath -- er now be giv -- en,
  The Son, and Him who reigns
  With them in high -- est heav -- en,
  The One e -- ter -- nal God,
  Whom earth and heav'n a -- dore,
  For thus it was, is now,
  And shall be ev -- er -- more!
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
        tempoWholesPerMinute = #(ly:make-moment 88 4)
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
        \melodya
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
