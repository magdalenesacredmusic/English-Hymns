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
      \line {PUER NOBIS NASCITUR LM}
    }
    \right-column{
      \line {Michael Praetorius}
      \line {harm. G.R. Woodward, 1902}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Claro Paschali gaudio"}
      \line {tr. J.M. Neale and others, \italic "Hymns Ancient and Modern," 1875}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  d2 e4 |
  fs2 g4 |
  fs2 e4 |
  d2 d4 |
  a'2 a4 |
  a4( b) cs |
  d2 d4 |
  d2 \bar "||"

  a4 |
  d2 d4 |
  cs2 a4 |
  b2 b4 |
  a2 g4 |
  a2 fs4 |
  e2 fs4 |
  d2 cs4 |
  d2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  a4 |
  d2 cs4 |
  d2 d4 |
  d2 a4 |
  fs2 d'4 |
  d( g) fs |
  e2 e4 |
  fs2 g4 |
  fs2 \bar "||"

  e4 |
  d( fs) e |
  e2 d4 |
  b2 d4 |
  d2 b4 |
  e2 d4 |
  cs2 d4 |
  b2 a4 |
  a2 \bar "|."
}

tenor = \relative c {
  \global
  \partial 4
  fs4 |
  fs2 a4 |
  a2 d,4 |
  a'4( b) cs |
  d2 d4 |
  d2 a4 |
  a2 a4 |
  a2 b4 |
  a2 \bar "||"

  a4 |
  b2 b4 |
  a( g) fs |
  g2 g4 |
  fs2 g4 |
  e2 a4 |
  a2 a4 |
  g( fs) e |
  fs2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  b2 a4 |
  d( cs) b |
  a( g) a |
  d2 g4 |
  fs( e) d |
  cs2 a4 |
  d2 d4 |
  d2 \bar "||"

  cs4 |
  b( a) gs |
  a2 d4 |
  g,2 b4 |
  d2 e4 |
  cs2 d4 |
  a( g) fs |
  g2 a4 |
  d2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  That Eas -- ter -- tide with joy was bright,
  The sun shone out with fair -- er light,
  When, to their long -- ing eyes re -- stored,
  The_a -- post -- les saw their ris -- en Lord.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  He bade them see His hands, His side,
  Where yet the glo -- rious wounds a -- bide;
  The to -- kens true which made it plain
  Their Lord in -- deed was ris'n a -- gain.

}

verseThree = \lyricmode {
  \set stanza = "3."
  Je -- sus, the King of gen -- tle -- ness,
  Do Thou Thy -- self our hearts pos -- sess
  That we may give Thee all our days
  The tri -- bute of our grate -- ful praise.
}

verseFour = \lyricmode {
  \set stanza = "4."
  O Lord of all, with us a -- bide
  In this our joy -- ful Eas -- ter -- tide;
  From ev' -- ry wea -- pon death can wield
  Thine own re -- deemed for -- ev -- er shield.
}


verseFive = \lyricmode {
  \set stanza = "5."
  All praise be Thine, O ris -- en Lord,
  From death to end -- less life re -- stored;
  All praise to God the Fa -- ther be
  And Ho -- ly Ghost e -- ter -- nal -- ly.
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
        tempoWholesPerMinute = #(ly:make-moment 110 4)
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
