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
      \line {ST. CLEMENT  98 98}
    }
    \column{
      \line {Clement C. Scholefield, 1874}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {John Ellerton, 1870}
    } 
  }
}


global = {
  \key af \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  ef4 |
  c'( df) c |
  ef( c) bf |
  af( bf) f |
  af g \bar "||"
  f |
  ef2 ef4 |
  af( bf) c |
  bf2 af4 |
  g2 \bar "||"
  ef4 |
  c'( df) c |
  ef( c) bf |
  af( bf) f |
  af g \bar "||"
  f |
  ef( f) g |
  af( c) bf |
  f( af) g |
  af2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  ef4 |
  ef2 af4 |
  g2 g4 |
  af( f) f |
  df df \bar "||"
  df |
  df( c) ef |
  f2 ef4 |
  d2 d4 |
  ef2 \bar "||"
  ef4 |
  ef2 af4 |
  g2 g4 |
  af( f) f |
  df df \bar "||"
  bf |
  ef2 df4 |
  c( ef) f |
  f2 ef4 |
  ef2 \bar "|."
}

tenor = \relative c {
  \global
  \partial 4
  ef4 |
  af2 af4 |
  bf( ef) df |
  c( df) bf |
  bf bf \bar "||"
  af |
  bf( af) bf |
  c2 af4 |
  f2 bf4 |
  bf2 \bar "||"
  bf4 |
  af2 af4 |
  bf( ef) df |
  c( df) bf |
  bf bf \bar "||"
  g |
  af2 bf4 |
  af2 df4 |
  df2 df4 |
  c2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  ef4 |
  af,2 af'4 |
  ef2 ef4 |
  f( bf,) df |
  ef ef \bar "||"
  f |
  g( af) g |
  f2 f4
  bf,2 bf4 |
  ef2 \bar "||"
  g4 |
  af2 af4 |
  ef2 ef4 |
  f( bf,) df |
  ef ef \bar "||"
  df |
  c2 ef4 |
  f( c) df |
  bf2 ef4 |
  af,2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  The day thou gav -- est, Lord, is end -- ed,
  The dark -- ness falls at Thy be -- hest;
  To Thee our morn -- ing hymns as -- cend -- ed,
  Thy praise shall hal -- low now our rest.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  We thank Thee that Thy Church un -- sleep -- ing,
  While earth rolls on -- ward in -- to light,
  Through all the world her watch is keep -- ing,
  And rests not now by day or night.
}

verseThree = \lyricmode {
  \set stanza = "3."
  As o'er each con -- ti -- nent and is -- land
  The dawn leads on an -- oth -- er day,
  The voice of prayer is nev -- er si -- lent,
  Nor dies the strain of praise a -- way.
}

verseFour = \lyricmode {
  \set stanza = "4."
  The sun, that bids us rest, is wak -- ing
  Our breth -- ren 'neath the west -- ern sky,
  And hour by hour fresh lips are mak -- ing
  Thy won -- drous do -- ings heard on high.
}

verseFive = \lyricmode {
  \set stanza = "5."
  So be it, Lord; Thy throne shall nev -- er,
  Like earth's proud em -- pires, pass a -- way:
  But stand, and rule, and grow for ev -- er,
  Till all Thy crea -- tures own Thy sway.
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
        tempoWholesPerMinute = #(ly:make-moment 84 4)
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
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}