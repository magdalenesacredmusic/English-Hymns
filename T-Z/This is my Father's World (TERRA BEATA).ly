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
      \line {TERRA BEATA  SMD}
    }
    \column{
      \line {English; arr. F.L. Sheppard, 1915}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Maltbie D. Babcock, 1901}
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
  g4 bf g f |
  ef2. f8[ g] |
  af4 c bf g |
  f2. \bar "" \break

  c'4 |
  bf g g f8[ ef] |
  g4 f ef bf |
  ef8[ f] g4 bf f8[ g] |
  ef2. \bar "" \break

  bf'4 |
  ef bf c d |
  ef2. ef8[ d] |
  c4 ef d c |
  bf2.

  \set melismaBusyProperties = #'() c8~ c8  |
  bf4 g g  f8( ef) \unset melismaBusyProperties |
  g4 f ef bf |
  ef8[ f] g4 bf   \set melismaBusyProperties = #'()  f8( g) \unset melismaBusyProperties |
  ef2. \bar "|."
}

alto = \relative c' {
  \global
  ef4 |
  ef ef d d |
  ef2. ef4 |
  ef ef ef ef |
  d2.

    d4 |
  ef ef d d8[ ef] |
  d4 d ef bf |
  ef ef d d |
  ef2.

    d4 |
  ef g af af |
  g2. ef4 |
  ef ef ef ef |
  ef2.

    d8( d) |
  ef4 ef d d8( ef) |
  d4 d ef bf |
  ef ef4 d4 d8( d) |
  ef2.
}

tenor = \relative c' {
  \global
  g8[ af] |
  bf4 g bf af |
  g2. af8[ bf] |
  c4 af g bf |
  bf2.

    af4 |
  g bf bf af8[ g] |
  bf4 af g g |
  g8[ af] bf4 bf af |
  g2.

    bf8[ af] |
  g4 bf af bf |
  bf2. bf4 |
  af c bf af |
  g2.

    af8( af) |
  g4 bf bf af8( g) |
  bf4 af g bf4 |
  g8[ af] bf4 bf4 af8( af) |
  g2.
}

bass = \relative c {
  \global
  ef4 |
  ef ef bf bf |
  ef2. ef4 |
  ef ef ef ef |
  bf2. 
  
    bf4 |
  ef ef bf bf |
  bf bf ef ef |
  ef ef bf bf |
  ef2. 
  
    f4 |
  ef ef af f ef2. g4 |
  af af af af |
  ef2. 
  
    bf8( bf) |
  ef4 ef bf bf8( bf) |
  bf4 bf ef bf |
  ef ef4 bf4 bf8( bf) |
  ef2.
}

%%%%%%%%%
%%%%%%%%%
%%%%%%%%%

altoA = \relative c' {
  \global
  \partial 4
  ef4 |
  ef ef ef d |
  ef2. f8[ e] |
  f4 f f ef |
  d2.

  d4 |
  ef ef d c |
  d b c bf |
  ef4 ef ef d ef2.

  ef4 |
  ef ef ef af |
  g2. ef4 |
  ef ef f ef |
  d2.

  d8~ d8 |
  ef4 ef d c8~ c |
  b4 d c bf |
  ef ef ef d8~ d8 |
  ef2.
}

tenorA = \relative c' {
  \global
  \partial 4
  g8[ af] |
  bf4 bf bf af |
  g2. c4 |
  c af f g8[ af] |
  bf2.

  bf4 |
  bf4 bf b g |
  g g g af4 |
  g8[ af] bf4 bf af8[ bf] |
  g2.

  g8[ af] |
  bf4 ef af, bf |
  bf2. bf4 |
  af bf a g8[ a] |
  bf2.

  bf8~ bf8 |
  bf4 bf bf g8~ g8 |
  g4 g g af |
  g8[ af] bf4 bf af8( bf) |
  g2.
}

bassA = \relative c {
  \global
  \partial 4
  ef4 |
  ef g, bf bf |
  c2. af'8[ g] |
  f4 ef d ef |
  bf2.

  af'4 |
  g ef g, c |
  b g c d |
  ef4 ef g, bf |
  ef2.

  ef8[ f] |
  g4 g af f |
  ef2.  g4 |
  af g f f |
  bf,2.

  af'8~ af |
  g4 ef bf c8~ c8 |
  g4 b c d |
  ef ef g,8[ af] bf8~ bf |
  ef2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  This is my Fa -- ther's world,
  And to my list -- 'ning ears,
  All na -- ture sings, and round me rings
  The mu -- sic of the spheres.

  This is my Fa -- ther's world,
  I rest me in the thought
  Of _ rocks and trees, of _ skies and seas–
  His hand the won -- ders _ wrought.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  This is my Fa -- ther's world,
  The birds their car -- ols raise,
  The morn -- ing light, the lil -- y white,
  De -- clare their Mak -- er's praise.

  This is my Fa -- ther's world,
  He shines in all that's fair;
  In the rust -- ling grass I _ hear Him pass,
  He speaks to me ev -- 'ry -- where.
}

verseThree = \lyricmode {
  \set stanza = "3."
  This is my Fa -- ther's world,
  O let me ne'er for -- get
  That though the wrong seems oft so strong,
  God is the Rul -- er yet.

  This is my Fa -- ther's world,
  The bat -- tle is not done,
  Je -- _ sus who died shall be sat -- is -- fied,
  And earth and heav'n be _ one.
}


\book {
  \include "hymn_paper_multipage.ly"
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
  
  \pageBreak
   \markup {
     Alternate harmonization E.S. Barnes, 1933
 }
  \score {
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \altoA }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenorA }
        \new Voice = "bass" { \voiceTwo \bassA }
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
%%%%%%%%%%%
%%%%%%%%%%%
%%%%%%%%%%%

