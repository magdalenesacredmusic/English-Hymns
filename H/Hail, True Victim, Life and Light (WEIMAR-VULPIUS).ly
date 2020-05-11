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
      \line {WEIMAR (VULPIUS)  76 76 D}
    }
    \right-column{
      \line {melody, M. Vulpius 1609; harm. \italic "The Hymnal," 1940}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Ave vivens Hostia," J. Peckham, d. 1294}
      \line {tr. Ronald A. Knox, d. 1957}
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
  a2 g4 f2 g4 \bar "|"
  a4 bf c2 \bar "|"
  d2 c4 bf2 a4 \bar "|"
  g2 f \bar "||"

  a2 c4 bf2 a4 \bar "|"
  g f e2 \bar "|"
  f2 g4 a2 a4 \bar "|"
  bf2 a \bar "||"

  a2 bf4 c2 bf4 \bar "|"
  a g a2 \bar "|"
  g2 g4 a c \bar "|"
  b2 c \bar "||"

  c2 a4 d2 c4 \bar "|"
  \orAcc bf a g2 \bar "|"
  a2 c4 bf2 a4 \bar "|"
  g2 f \bar "|."
}

alto = \relative c' {
  \global
  f2 e4 d2 d4
  f f e2
  f2 f4 f2 f4
  e2 f

  f2 f4 f2 f4
  e d cs2
  d e4 f2 f4
  g2 fs

  \orAcc d2 d4 f2 d4 \revAcc
  f d e2
  d2 d4 f e
  g2 e

  e2 f4 f2 f4
  f f e2
  f2 g4 f2 f4
  f( e) f2
}

tenor = \relative c' {
  \global
  c2 c4 a2 bf4
  c f, g2
  bf c4 d2 c4
  c2 a

  c2 a4 d2 c4
  c a a2
  a2 c4 c2 d4
  d2 d

  fs,2 g4 a2 bf4
  c d cs2
  \orAcc		d bf4 c c
  d2 c
  \revAcc

  g2 f4 bf2 c4
  d c c2
  c2 c4 d2 c4
  c2 a
}

bass = \relative c {
  \global
  f2 c4 d2 g4
  f d c2
  bf2 a4 bf2 f4
  c'2 f,

  f'2 f4 bf,2 f'4
  c d a2
  d2 c4 f2 d4
  g2 d

  d2 g4 f2 g4
  a bf a2
  bf g4 f a
  g2 c,

  c2 d4 bf2 a4
  bf f' c2
  f2 e4 d2 f4
  c2 f
}

verseOne = \lyricmode {
  \set stanza = "1."
Hail, true Vic -- tim, life and light
  Un -- to sin -- ners lend -- ing,
Ev -- 'ry old -- er form and rite
  Hath in Thee its end -- ing.

Spot -- less in the Fa -- ther's sight
  Ev -- er -- more as -- cend -- ing,
Ho -- ly Church in bit -- ter fight
  Ev -- er -- more be -- friend -- ing.
}

verseTwo = \lyricmode {
  \set stanza = "2."
Hail, true Man -- na from the sky–
Is -- rael nev -- er knew thee;
Pil -- grims, for the day's sup -- ply,
Dai -- ly hom -- age do thee;
When our souls in sick -- ness lie,
Yields that sick -- ness to thee;
Chris -- tians, when they come to die,
Live im -- mor -- tal through thee.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Hail, Christ's Bod -- y– gift he made,
  His own death fore -- show -- ing,
  (God -- head un -- der earth -- ly shade
  Like a jew -- el glow -- ing),
  Sac -- red mem -- 'ries, ne'er to fade,
  On his Church be -- stow -- ing,
  When to earth fare -- well he bade,
  To his Pas -- sion go -- ing.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Je -- sus, tru -- ly in this place
  God and man re -- sid -- eth;
  Him no shad -- ow doth re -- place,
  Him no rent di -- vid -- eth,

  Ve -- ry flesh, al -- though His face,
  Glo -- ri -- fied, He hid -- eth;
  Gar -- nered in this lit -- tle space
  All of Christ a -- bid -- eth.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Seen in heav'n by bless -- èd eyes
  This his bod -- y reign -- eth;
  Form of bread, in oth -- er wise,
  Here its scope con -- tain -- eth;–
  Mys -- t'ry he a -- lone des -- cries
  Who the same or -- dain -- eth;
  Well may he such thing de -- vise
  Whom no pow'r re -- strain -- eth.
}

verseSix = \lyricmode {
  \set stanza = "6."
  Plead, true Vic -- tim, in our stead
  To the Fa -- ther cry -- ing,
  Thou, Thy chil -- dren's dai -- ly bread,
  Dai -- ly health sup -- ply -- ing;

  Ban -- quet for the ex -- ile spread,
  Grant us life un -- dy -- ing:
  May our love from Thine be fed,
  Self and sense de -- ny -- ing!
}



\book {
  \include "hymn_paper_multipage.ly.ly"
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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
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
      \new Lyrics \lyricsto "tune" { \verseSix }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

