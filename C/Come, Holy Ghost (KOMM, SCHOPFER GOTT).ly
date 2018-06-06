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
      \line {KOMM, SCHÖPFER GOTT   88 88}
    }
    \right-column{
      \line {J. Klug}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Veni Creator Spiritus"}
      \line {Rabus Maurus, 8th cent.; tr. E. Caswall}
    }
  } 
}



global = {
  \key bf \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f2 g4 f |
  ef f bf c |
  bf2. bf4 |
  f g bf c |
  d d c2 |

  b4\rest c d bf |
  g f a bf |
  c2. f,4 |
  bf g ef g |
  g f f2 \bar "|."
}

alto = \relative c' {
  \global
  c2 ef4 d |
  c bf d f |
  d2. d4 |
  d ef d f |
  f f f2 |
  s4 f f d |
  ef d c f |
  f2. d4 |
  d d c bf |
  ef d c2
}

tenor = \relative c' {
  \global
  a2 bf4 bf |
  g f g a |
  bf2. bf4 |
  a c f, c' |
  bf bf a2 |
  d,4\rest a'4 a bf |
  bf bf f f |
  a2. bf4 |
  bf bf g g |
  bf bf a2
}

bass = \relative c {
  \global
  f2 ef4 bf |
  c d g f |
  bf,2. g4 |
  d' c bf a |
  bf d f2 |
  s4 f d g |
  ef bf f' d |
  f2. bf,4 |
  g bf c ef |
  g, bf f'2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Come, Ho -- ly Ghost, Cre -- a -- tor blest,
  And in our hearts take up Thy rest;
  Come with Thy grace and heav'n -- ly aid,
  To fill the hearts which Thou hast made,
  To fill the hearts which Thou hast made.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  O Com -- for -- ter to Thee we cry,
  Thou heav'n -- ly Gift of God Most High;
  Thou Fount of life and fire of love,
  And sweet a -- noint -- ing from a -- bove,
  And sweet a -- noint -- ing from a -- bove.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O Ho -- ly Ghost, through Thee a -- lone,
  Know we the Fa -- ther and the Son,
  Be this our ne -- ver chang -- ing creed,
  That Thou dost from them both pro -- ceed,
  That Thou dost from them both pro -- ceed.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Praise we the Fa -- ther and the Son,
  And Ho -- ly Spi -- rit with them One;
  And may the Son on us be -- stow
  The gifts that from the Spi -- rit flow,
  The gifts that from the Spi -- rit flow.
}

verseFive = \lyricmode {
	\set stanza = "5."

}

verseSix = \lyricmode {
	\set stanza = "6."

}

%}


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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}