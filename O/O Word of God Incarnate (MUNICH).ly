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
      \line {MUNICH 76 76 D}
    }
    \column{
      \line {Meiningen, 1693; harm. Felix Mendelssohn, 1847}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {William Walsham How, 1867}
    } 
  }
}


global = {
  \key ef \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  ef8[ f] |
  g4 c bf af |
  g2 g4 g |
  bf af8[ g] f4 f |
  ef2. \bar "||" \break

  ef8[ f] |
  g4 c bf af |
  g2 g4 g |
  bf af8[ g] f4 f |
  ef2. \bar "||" \break

  f4 |
  f g af af |
  g2 g4 c |
  ef c g a |
  bf2. \bar "||" \break

  bf4 |
  bf g af bf |
  c2 c4 bf |
  af g f f |
  ef2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  ef4 |
  ef ef d f |
  ef2 ef4 ef |
  ef ef ef d |
  ef2.

  ef4 |
  ef ef d f |
  ef2 ef4 ef |
  ef ef ef d |
  ef2.

  d4 |
  d e f f |
  ef!2 ef4 f |
  ef g g f8[ ef] |
  d2.

  f4 |
  ef ef ef f8[ g] |
  af2 ef4 ef |
  ef ef ef d |
  ef2.
}

tenor = \relative c' {
  \global
  \partial 4
  g8[ af] |
  bf4 af8[ g] f4 bf |
  bf2 bf4 bf |
  bf c f,8[ g] af4 |
  g2.

  g8[ af] |
  bf4 af8[ g] f4 bf |
  bf2 bf4 c |
  bf c f,8[ g] af4 |
  g2.

  bf4 |
  bf bf c c |
  c2 c4 af |
  g ef'8[ d] c4 c |
  bf2.

  af4 |
  g bf ef df |
  c2 af4 ef |
  af c f,8[ g] af4 |
  g2.
}

bass = \relative c {
  \global
  \partial 4
  ef4 |
  ef af, bf d |
  ef2 ef4 ef |
  g, af bf bf |
  ef2.

  ef4 |
  ef af, bf d |
  ef2 ef4 c |
  g af bf bf |
  ef2.

  bf'4 |
  af g f f |
  c2 c4 c |
  c c8[ d] ef4 f |
  bf,2.

  d4 |
  ef df c bf |
  af2 af4 g |
  c af bf bf |
  ef2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  O Word of God in -- car -- nate,
  O Wis -- dom from on high,
  O Truth, un -- changed, un -- chang -- ing,
  O Light of our dark sky;
  We praise Thee for the ra -- diance
  That form the hal -- lowed page,
  A lan -- tern to our foot -- steps,
  Shines on from age to age.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  The Church from her dear Mas -- ter
  Re -- ceived the gift di -- vine,
  And still that light she lift -- eth
  O'er all the earth to shine.
  It is the gold -- en cas -- ket
  Where gems of truth are stored,
  It is the heav'n -- drawn pic -- ture
  Of Christ, the liv -- ing Word.
}

verseThree = \lyricmode {
  \set stanza = "3."
  It float -- eth like a ban -- ner
  Be -- fore God's host un -- furled;
  It shin -- eth like a bea -- con
  A -- bove the dark -- ling world;
  It is the chart and com -- pass
  That o'er life's surg -- ing sea,
  'Mid mists and rocks and quick -- sands,
  Still guides, O Christ, to Thee.
}

verseFour = \lyricmode {
  \set stanza = "4."
  O make Thy Church, dear Sav -- iour,
  A lamp of pur -- est gold,
  to bear be -- fore the na -- tions
  thy true light as of old;
  O teach Thy wand -- 'ring pil -- grims
  By this their path to trace,
  Till, clouds and dark -- ness end -- ed,
  They see Thee face to face.
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
        tempoWholesPerMinute = #(ly:make-moment 88 4)
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