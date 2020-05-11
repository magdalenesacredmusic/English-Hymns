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
      \line {ACH GOTT UND HERR   87 87}
    }
    \right-column{
      \line {alt. from a melody in \italic "As hymnodus sacer"}
      \line {harm. J.S. Bach}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Liturgy of Malabar"}
      \line {tr. Charles William Humphreys and Percy Dearmer, 1906}
    } 
  }
}


global = {
  \key bf \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  bf4 |
  a g f f |
  g a bf \bar "||"

  c4 |
  bf a g a8[ bf] |
  g2 f4 \bar "||"

  bf4 |
  a bf c c |
  d c8[ bf] c4

  f,4 |
  g a bf8[ c] d[ ef] |
  c2 bf4 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  f4 |
  f e c d8[ c] |
  bf4 c d
  f4 |
  f8[ e] f4 e f |
  f( e) f
  f |
  ef f f f |
  f e f
  f |
  c c bf4. g'8 |
  f4.( ef8) d4
}

tenor = \relative c' {
  \global
  \partial 4
  d4 |
  c4. bf8 a4 bf8[ a] |
  g[ f] ef4 f
  a4 |
  bf c c c |
  d( c8[ bf]) a4
  bf4 |
  c d a a |
  bf4 bf a
  bf4 |
  bf a d8[ ef] f[ bf,] |
  bf4( a) f
}

bass = \relative c {
  \global
  \partial 4
  bf4 |
  f' c f bf, |
  ef8[ d] c4 bf
  f'4 |
  g, c8[ bf] c4 f |
  bf,( c) f4
  d4 |
  c bf f' f |
  bf8[ a] g4 f
  d4 |
  e fs g( f8[) ef] |
  f2 bf,4
}

verseOne = \lyricmode {
  \set stanza = "1."
  Strength -- en for ser -- vice, Lord, the hands
  That ho -- ly things have tak -- en;
  Let ears that now have heard Thy songs
  To clam -- our nev -- er wak -- en.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Lord, may the tongues which ‘Ho -- ly’ sang
  Keep free from all de -- ceiv -- ing;
  The eyes which saw Thy love be bright,
  Thy bless -- èd hope per -- ceiv -- ing.
}

verseThree = \lyricmode {
  \set stanza = "3."
  The feet that tread Thy ho -- ly courts
  From light do Thou not ban -- ish;
  The bod -- ies by Thy Bo -- dy fed
  With Thy new life re -- plen -- ish.
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

