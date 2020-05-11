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
      \line {ST. GEORGE'S WINDSOR  77 77 D}
    }
    \right-column{
      \line {George J. Elvey}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Henry Alford, 1865}
    }
  } 
}


global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  b4. b8 d4 b |
  g a b2 \bar "|"

  b4. b8 d4 b |
  g a b2 \bar "|"

  b4. b8 c4 c |
  a4. a8 b2 \bar "|"

  b4 cs d g, |
  fs e d2 \bar "|"

  fs4. fs8 a4 fs |
  g a b2 \bar "|"

  b4. b8 d4 b |
  c d e2 \bar "|"

  e4. e8 c4 a |
  d4. d8 b2 \bar "|"

  c4 e d g, |
  b a g2 \bar "|."
}

alto = \relative c' {
  \global
  d4. d8 d4 d |
  e fs g2 \bar "||"

  d4. d8 d4 d |
  e e ds2 \bar "||"

  e4. e8 e4 e |
  d d d2 \bar "||"

  d4 e d e |
  d cs d2 \bar "||"

  d4. d8 d4 d |
  d c d2 \bar "||"

  d4. d8 g4 g |
  g f e2 \bar "||"

  e4 gs a e |
  d fs g2 \bar "||"

  g4 g g g |
  g fs g2 \bar "|."
}

tenor = \relative c' {
  \global
  g4. g8 a4 b |
  b d d2 \bar "||"

  g,4. g8 a4 b |
  b c fs,2 \bar "||"

  g4. g8 a4 a |
  fs fs g2 \bar "||"

  g4 g a b |
  a4. g8 fs2 \bar "||"

  a4 a fs a |
  g4. fs8 g2 \bar "||"

  g4. g8 b4 d |
  c4. b8 c2 \bar "||"

  b4 e e c |
  a d d2 \bar "||"

  c4 c d b |
  d4. c8 b2 \bar "|."
}

bass = \relative c' {
  \global
  g4. g8 fs4 g |
  e d g2 \bar "||"

  g4. g8 fs4 g |
  e c b2 \bar "||"

  e4. e8 a,4 a |
  d d g,2 \bar "||"

  g'4 e fs g |
  a a, d2 \bar "||"

  d4. d8 d4 c |
  b a g2 \bar "||"

  g4. g8 g'4 f |
  e d c2 \bar "||"

  gs'4 e a4. a8 |
  fs4 d g2 \bar "||"

  e4 c b e |
  d d g,2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  Come, ye thank -- ful peo -- ple, come,
  Raise the song of Har -- vest -- home:
  All is safe -- ly gath -- ered in,
  Ere the win -- ter storms be -- gin:
  God our Ma -- ker doth pro -- vide
  For our wants to be sup -- plied:-
  Come to God's own tem -- ple, come,
  Raise the song of Har -- vest -- home!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  We our -- selves are God's own field,
  Fruit un -- to His praise to yield;
  Wheat and tares to -- ge -- ther sown,
  Un -- to joy or sor -- row grown:
  First the blade, and then the ear,
  Then the full corn shall ap -- pear:
  Grant, O har -- vest Lord, that we
  Whole -- some grain and pure may be.
}

verseThree = \lyricmode {
  \set stanza = "3."
  For the Lord our God shall come,
  And shall take His har -- vest home;
  From His field shall in that day
  All of -- fen -- ces purge a -- way;
  Give His an -- gels charge at last
  In the fire the tares to cast;
  But the fruit -- ful ears to store
  In His gar -- ner ev -- er -- more.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Then, thou Church tri -- um -- phant, come,
  Raise the song of Har -- vest -- home!
  All are safe -- ly gath -- ered in,
  Free from sor -- row, free from sin;
  There, for ev -- er pur -- i -- fied,
  In God's gar -- ner to a -- bide:
  Come, ten thou -- sand an -- gels, come,
  Raise the glo -- rious Har -- vest -- home!
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

