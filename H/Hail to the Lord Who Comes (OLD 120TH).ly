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
      \line {OLD 120TH  66 66 66}
    }
    \right-column{
      \line {\italic "Damon's Psalter" and \italic "Este's Psalter," adapted}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line { John Ellerton, 1880}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 2
  d2 |
  fs4 g a b |
  a2 a |
  b4 cs d b |
  cs2 \bar "" \break
  a2 |
  d4 cs b a |
  gs2 a |
  b4 a a gs |
  a2 \bar ""
  fs2 |
  b4 a g fs |
  e2 a |
  g4 fs e e |
  d2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 2
  d2 |
  d4. e8 fs4 g |
  fs2 \bar "||"
  d2 |
  d4 e fs e |
  e2 \bar "||"
  fs2 |
  fs4 a fs cs |
  e2 \bar "||"
  e2 |
  fs4 fs b, e |
  e2 \bar "||"
  d2 |
  g4 e d d |
  cs2 \bar "||"
  cs2 |
  d8[ e] d4 d cs |
  d2 \bar "|."
}

tenor = \relative c {
  \global
  \partial 2
  fs2 |
  a4 d cs b |
  d2
  fs, |
  fs4 a a gs |
  a2
  a |
  b4 e d a |
  b2
  a |
  d4 cs e b |
  cs2
  a |
  d4 c b a |
  a2
  a |
  b8[ a] a4 a a8[ g] |
  fs2
}

bass = \relative c {
  \global
  \partial 2
  d2 |
  d4 b a g |
  d'2
  d |
  d4 cs b e |
  a,2
  d |
  b4 cs d fs |
  e2
  cs |
  d4 fs e e |
  a,2
  d |
  g,4 a b d |
  a2
  fs' |
  b,8[ cs] d4 a a |
  d2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Hail to the Lord who comes,
  Comes to his tem -- ple gate!
  Not with his An -- gel host,
  Not in his king -- ly state;
  No shouts pro -- claim him nigh,
  No crowds his com -- ing wait;
}

verseTwo = \lyricmode {
  \set stanza = "2."
  But borne up -- on the throne
  Of Ma -- ry's gen -- tle breast,
  Watched by her du -- teous love,
  In her fond arms at rest;
  Thus to His Fa -- ther's house
  He comes, the heav'n -- ly Guest.
}

verseThree = \lyricmode {
  \set stanza = "3."
  There Jo -- seph at her side
  In rev' -- rent won -- der stand;
  And, filled with ho -- ly joy,
  Old Si -- meon in his hands
  Takes up the pro -- mised Child,
  The glo -- ry of all lands.
}


verseFour = \lyricmode {
  \set stanza = "4."
  Hail to the great First -- born
  Whose ran -- som -- price they pay!
  The Son be -- fore all worlds,
  The Child of man to -- day,
  That he might ran -- som us
  Who still in bon -- dage lay.
}

verseFive = \lyricmode {
  \set stanza = "5."
  O Light of all the earth,
  Thy chil -- dren wait for Thee!
  Come to Thy tem -- ples here,
  That we, from sin set free,
  Be -- fore Thy Fa -- ther's face
  May all pre -- sen -- ted be!
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

