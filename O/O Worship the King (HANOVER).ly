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
      \line {HANOVER   10 10 11 11}
    }
    \column{
      \line {William Croft, 1708}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Robert Grant, 1833, alt.}
    } 
  }
}
\paper {
  page-count = 1
}


global = {
  \key g \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  g g a |
  b2 d4 |
  g, a fs |
  g2 \bar "||" \break

  a4 |
  b a g |
  fs2 g4 |
  a g8[ fs] e4 |
  d2 \bar "||" \break

  fs4 |
  g a b |
  g e c' |
  b a g |
  d'2 \bar "||" \break

  d,4 |
  e fs g |
  a d, b' |
  e, a fs |
  g2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  b4 |
  b d d |
  d2 d4 |
  e e d |
  d2

  d4 |
  d d d8[ e] |
  a,2 b4 |
  d e8[ d] cs4 |
  d2

  ds4 |
  e e ds |
  b b d |
  d d g |
  fs2

  d4 |
  d c d |
  d b d |
  c e d |
  d2
}

tenor = \relative c' {
  \global
  \partial 4
  g4 |
  g g fs |
  g2 a4 |
  b c a |
  b2

  fs4 |
  g a b8[ cs] |
  d2 d4 |
  a b e, |
  fs2

  b4 |
  b e, fs |
  g g a |
  g d'4. cs8 |
  d2

  g,4 |
  g c b |
  a fs g |
  g c a |
  b2
}

bass = \relative c {
  \global
  \partial 4
  g4 |
  g b d |
  g2 fs4 |
  e c d |
  g,2

  d'4 |
  g fs e |
  d2 b4 |
  fs g a |
  d2

  b4 |
  e c b |
  e e fs |
  g fs e |
  d2

  b4 |
  c a g |
  fs b g |
  c a d |
  g,2
}

verseOne = \lyricmode {
  \set stanza = "1."
  O wor -- ship the King
  All glo -- rious a -- bove;
  O grate -- ful -- ly sing
  His pow'r and his love:
  Our Shield and De -- fen -- der,
  The An -- cient of days,
  Pa -- vil -- lioned in splen -- dour,
  And gird -- ed with praise.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  O tell of his might,
  O sing of his grace,
  Whose robe is the light,
  Whose ca -- no -- py space.
  His cha -- riots of wrath
  The deep thun -- der -- clouds form,
  And dark is his path
  On the wings of the storm.
}

verseThree = \lyricmode {
  \set stanza = "3."
  This earth, with its store
  Of won -- ders un -- told,
  Al -- migh -- ty, thy pow'r 
  Hath found -- ed of old;
  Hath stab -- lished it fast
  By a change -- less de -- cree,
  And round it hath cast,
  Like a man -- tle, the sea.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Thy boun -- ti -- ful care
  What tongue can re -- cite?
  It breathes in the air,
  It shines in the light;
  It streams from the hills,
  It de -- scends to the plain,
  And sweet -- ly dis -- tils 
  In the dew and the rain.
}

verseFive = \lyricmode {
    \set stanza = "5."
    Frail chil -- dren of dust,
    And fee -- ble as frail,
    In thee do we trust,
    Nor find thee to fail;
    Thy mer -- cies how ten -- der!
    How firm to the end!
    Our Ma -- ker, De -- fend -- er,
    Re -- deem -- er, and Friend.
}

verseSix = \lyricmode {
  \set stanza = "6."
  O meas -- ure -- less Might,
  In -- eff -- a -- ble Love,
  While An -- gels de -- light
  To hymn thee a -- bove,
  Thy hum -- bler cre -- a -- tion,
  Thou fee -- ble their lays,
  With true a -- do -- ra -- tion
  Shall sing to thy praise.
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
      \new Lyrics \lyricsto "tune" { \verseSix }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}