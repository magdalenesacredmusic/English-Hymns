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
      \line {MERTON 87 87 }
    }
    \right-column{
      \line {W.H. MONK, 1850}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Vox clara ecce intonat," 6th c.}
      \line { tr. Edward Caswall; alt. \italic "The English Hymnal"}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key e \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  e4 gs b b |
  a cs cs b \bar "||"

  gs as b b |
  cs cs b2 \bar "||"

  b4 a gs b |
  a gs fs e \bar "||"

  fs4 gs a gs |
  fs fs e2 \bar "|."
}

alto = \relative c' {
  \global
  b4 b b ds |
  e e e e \bar "||"

  e e ds fs |
  gs fs8 e ds2 \bar "||"

  ds4 e8 fs e4 fs |
  e e ds e \bar "||"

  cs es fs e |
  e ds e2 \bar "|."
}

tenor = \relative c' {
  \global
  gs4 b fs fs |
  e a a gs \bar "||"

  b e, fs b |
  b as b2 \bar "||"

  ds4 cs8 b b4 b |
  cs b b8 a gs4 \bar "||"

  a b cs b |
  cs b8 a gs2 \bar "|."
}

bass = \relative c {
  \global
  e4 e ds b |
  cs a8 b cs ds e4 \bar "||"

  e cs b ds |
  e fs b,2 \bar "||"

  b4 cs8 ds e4 ds |
  cs e b cs \bar "||"

  a gs fs gs |
  a b \ignore << {\stemDown \override Stem #'length = #4.0  e2} \\ {\teeny \override Stem #'length = #5.6 e,2 } >> \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  Hark! a her -- ald voice is cal -- ling:
  'Christ is nigh,' it seems to say;
  'Cast a -- way the dreams of dark -- ness,
  O ye chil -- dren of the day!'
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Star -- tled at the sol -- emn warn -- ing
  Let the earth -- bound soul a -- rise;
  Christ, her Sun, all sloth dis -- pel -- ling,
  Shines up -- on the morn -- ing skies.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Lo! the Lamb, so long ex -- pect -- ed,
  Comes with par -- don down from heav'n;
  Let us hast, with tears of sor -- row,
  One and all to be for -- giv'n;
}

verseFour = \lyricmode {
  \set stanza = "4."
  So when next he comes with glo -- ry,
  Wrap -- ping all the earth in fear,
  May he then as our de -- fend -- er
  On the clouds of heav'n ap -- pear.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Ho -- nour, glo -- ry, vir -- tue, me -- rit,
  To the Fa -- ther and the Son,
  With the co -- e -- ter -- nal Spir -- it,
  While un -- end -- ing a -- ges run.
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
        tempoWholesPerMinute = #(ly:make-moment 92 4)
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
