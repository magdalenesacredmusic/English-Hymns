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
      \line {WINCHESTER NEW  LM}
    }
    \right-column{
      \line {\italic "Musikalisches Hand-buch," 1690}
      \line {\italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Jordanis oras praevia"}
      \line {Charles Coffin; tr. John Chandler, 1837, alt.}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key bf \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  f4 |
  bf f g g |
  f ef d \bar "||"

  d |
  ef d c f |
  f e f \bar "||"

  f |
  bf c d bf |
  ef d c \bar "||"

  d |
  bf g f bf |
  bf a bf \bar "||"
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  f d ef ef8[ d] |
  c4 a bf

  bf |
  bf bf c d |
  d c c

  f |
  f ef d g8[ f] |
  ef4 f f

  f |
  f ef f d |
  g f f \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4
  bf4 |
  bf bf bf ef, |
  f f f

  f |
  g f8[ g] a4 a |
  bf8[ a] g4 a

  a |
  bf g8[ a] bf4 bf |
  bf8[ a] bf4 a

  bf |
  bf bf bf bf |
  c c d \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  bf4 |
  d bf ef c8[ bf] |
  a4 f bf

  bf |
  g bf f d' |
  bf c f,

  f'8[ ef] |
  d4 c bf ef8[ d] |
  c4 d8[ ef] f4

  bf, |
  d ef d g |
  ef f bf, \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  On Jor -- dan’s bank the Bap -- tist’s cry
  An -- noun -- ces that the Lord is nigh;
  Come, then, and heark -- en, for he brings
  Glad tid -- ings from the King of kings!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Then cleansed be ev' -- ry breast from sin;
  Make straight the way for God with -- in;
  Pre -- pare we in our hearts a home,
  Where such a migh -- ty Guest may come.
}

verseThree = \lyricmode {
  \set stanza = "3."
  For thou art our Sal -- va -- tion, Lord,
  Our Ref -- uge, and our great Re -- ward.
  With -- out thy grace our souls must fade
  And wi -- ther like a flow'r de -- cayed.
}


verseFour = \lyricmode {
  \set stanza = "4."
  Stretch forth thine hand, to heal our sore,
  And make us rise and fall no more;
  Once more up -- on thy peo -- ple shine,
  And fill the world with love di -- vine.
}

verseFive = \lyricmode {
  \set stanza = "5."
  All praise, e -- ter -- nal Son, to thee
  Whose ad -- vent sets thy peo -- ple free,
  Whom, with the Fa -- ther, we a -- dore,
  And Ho -- ly Spir -- it, ev -- er -- more.
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
      \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}