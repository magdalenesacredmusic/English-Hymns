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
      \line {AURELIA  76 76 D}
    }
    \right-column{
      \line {Samuel Sebastian Wesley, 1864}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Wie wohl hast du gelabet"}
      \line {Johann Rist, 1651; Tr. C. Winkworth, 1858}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key ef \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  g4 |
  g g af g |
  g2 f4 \bar "||"
  ef |
  ef c' bf af |
  g2. \bar "||" \break
  af4 |
  bf ef ef d |
  d2 c4 \bar "||"
  bf |
  af bf g ef |
  f2. \bar "||" \break
  f4 |
  g af bf c |
  c2 bf4 \bar "||"

  ef4 |
  ef4. d8 c4 g |
  af2. \bar "||"
  f4 |
  g g af g |
  g2 f4 \bar "||"
  ef |
  ef f ef d |
  ef2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  ef4 |
  ef ef ef ef |
  ef2 d4 ef |
  c ef ef d |
  ef2. d4 |
  ef ef ef f |
  f2 ef4 g |
  g f ef ef |
  d2. d4 |
  ef d ef ef |
  ef2 ef4 g |
  g4. g8 g4 g4 |
  f2. f4 |
  ef ef ef ef |
  c2 c4 c |
  c c bf bf |
  bf2. \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4
  bf4 |
  bf bf c bf |
  bf2 bf4 bf |
  f f g bf |
  bf2. bf4 |
  bf bf b b |
  b2 c4 d |
  ef f bf, a |
  bf2. bf4 |
  bf bf bf af |
  af2 bf4 c |
  c4. b8 c4 c |
  c2. bf4 |
  bf bf c bf |
  bf2 af4 af |
  af af f af |
  g2. \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  ef4 |
  ef ef ef ef |
  bf2 af4 g |
  af af bf bf |
  ef2. f4 |
  g g g g, |
  af2 af4 bf! |
  c d ef c |
  bf2. bf4 |
  ef f g af |
  af2 g4 c |
  g4. f8 ef4 e |
  f2. d4 |
  ef ef ef ef |
  af,2 af4 af |
  f f bf bf |
  ef2. \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  O liv -- ing Bread from heav -- en,
  How hast Thou fed Thy guest!
  The gifts Thou how hast giv -- en
  Have filled my heart with rest.
  O won -- drous Food of bles -- sing!
  O Cup that heals our woes!
  My heart, this gift pos -- ses -- sing,
  In thank -- ful song o'er -- flows.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  My Lord, Thou here hast led me
  With -- in Thy ho -- liest place,
  And there Thy -- self hast fed me
  With trea -- sures of Thy gracel
  And Thou hast free -- ly giv -- en
  What earth could nev -- er buy,
  The Bread of Life from heav -- en
  That now I shall not die!
}

verseThree = \lyricmode {
  \set stanza = "3."
  Thou giv -- est all I want -- ed,
  The Food can death de -- stroy;
  And Thou hast free -- ly grant -- ed
  The Cup of end -- less joy.
  Ah, Lord, I do not mer -- it
  The fa -- vor Thou hast shown,
  And all my soul and spir -- it
  Bow down be -- fore Thy throne!
}

verseFour = \lyricmode {
  \set stanza = "4."
  Lord, grant me that, thus streng -- thened
  With heav'n -- ly Food, while here
  My course on earth is length -- ened,
  I serve with ho -- ly fear:
  And when Thou call'st my spir -- it
  To leave this world be -- low,
  I en -- ter, through Thy mer -- it,
  Where joys un -- min -- gled flow.
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

