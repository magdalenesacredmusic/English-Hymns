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
      \line {ERSCHIENEN IST, LM with Alleluia}
    }
    \right-column{
      \line {Nicholas Hermann, 16th cent.}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {"Wir danken dir, Herr Jesu Christ" }
      \line {anon., 1607; tr. Matthias Loy (1828-1915), 1880}
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
  e e e |
  b'2 cs4 |
  d4.( cs8) b4 |
  a2 \bar "||"

  b4 |
  cs2 d4 |
  e2 b4 |
  d4 cs2 |
  b2 \bar "||"

  b4 |
  d2 b4 |
  a4.( g8) fs4 |
  g e2 |
  d2 \bar "||"

  d4 |
  g2 a4 |
  b2 a4 |
  g d'2 |
  b2 a4 |
  g fs2 |
  e2. \bar "|."
}

alto = \relative c' {
  \global
  b4 b b |
  d2 e4 |
  fs4.( e8) e4 |
  cs2

  e4 |
  e2 fs4
  g2 e4 |
  fs4 fs2 |
  ds2

  e4 |
  fs2 d4 |
  d2 d4 |
  d cs2 |
  a2

  b4 |
  e2 fs4 |
  g2 fs4 |
  e d2 |
  d2

  fs4 |
  e2 ds4 |
  e2.
}

tenor = \relative c' {
  \global
  g4 g g |
  fs2 a4 |
  a2 gs4 |
  a2

  gs4 |
  a2 a4 |
  b2 g4 |
  b b( as) |
  b2

  g4 |
  a2 g4 |
  a2 a4 |
  b4 a2 |
  fs2

  g4 |
  g2 c4 |
  d2 d4 |
  b a2 |
  g2 d'4 |
  b c( b) |
  g2.
}

bass = \relative c {
  \global
  e4 e e |
  b2 a4 |
  d4.( a8) e'4 |
  a,2

  e'4 |
  a2 fs4 |
  e2 e4 |
  b fs'2 |
  b,2

  e4 |
  d2 g4 |
  fs4.( e8) d4 |
  g, a2 |
  d2

  g,4 |
  c2 a4 |
  g2 d'4 |
  e fs2 |
  g2 d4 |
  e a,( b) |
  e2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  We thank Thee, Je -- sus, dear -- est Friend,
  That Thou didst in -- to heav'n as -- cend.
  O bless -- ed Sa -- vior, bid us live
  And strength to soul and bo -- dy give.
  Hal -- le -- lu -- jah.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  As -- cend -- ed to His throne on high,
  Hid from our sight, yet al -- ways nigh,
  He rules and reigns at God's right hand
  And has all pow'r at His com -- mand.
  Hal -- le -- lu -- jah.
}

verseThree = \lyricmode {
  \set stanza = "3."
  The man who trusts in Him is blest
  And finds in Him e -- ter -- nal rest;
  This world's al -- lure -- ments we de -- spise
  And fix on Christ a -- lone our eyes.
  Hal -- le -- lu -- jah.
}

verseFour = \lyricmode {
  \set stanza = "4."
  We there -- fore heart -- i -- ly re -- joice
  And sing His praise with cheer -- ful voice;
  He cap -- tive led cap -- ti -- vi -- ty,
  From bit -- ter death He set us free.
  Hal -- le -- lu -- jah.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Through Him we heirs of heav'n are made;
  O bro -- ther, Christ, ex -- tend Thine aid
  That we may firm -- ly trust in Thee
  And through Thee live e -- ter -- nal -- ly.
  Hal -- le -- lu -- jah.
}


%%%%%%
%%%%%%
%%%%%%
melodyB = \relative c' {
  \global
  e4^\markup {\italic "alternate harmonization adaptated from J.S. Bach, BWV 67, 145" } e e |
  b'2 cs4 |
  d4.( cs8) b4 |
  a2 \bar "||"

  b4 |
  cs2 d4 |
  e2 b4 |
  d4 cs2 |
  b2 \bar "||"

  b4 |
  d2 b4 |
  a4.( g8) fs4 |
  g e2 |
  d2 \bar "||" \break

  d4 |
  g2 a4 |
  b2 a4 |
  g d'2 |
  b2 a4 |
  g fs2 |
  e2. \bar "|."
}

altoB = \relative c' {
  \global
  b4 b cs |
  d4( e) e |
  d( a') e4 |
  e2 e4 |
  e2 fs4 |
  e( fs) g |
  fs( g) fs |
  ds2

  e4 |
  d( fs) g |
  e2 d4 |
  d2 cs4 |
  a2

  a4 |
  d( e) fs4 |
  g2 fs4 |
  e( a) fs4 |
  g2

  e4 |
  e2 ds4 |
  b2.
}

tenorB = \relative c' {
  \global
  g8[ a] b4 a |
  a( b) a |
  a2 gs4 |
  cs2

  gs4 |
  a2 a4 |
  b2 b4 |
  b2 as4 |
  fs2

  g4 |
  a( d) d |
  e( cs) a |
  g( b) e, |
  fs2

  fs4 |
  g2 c4 |
  d( e) b |
  b( a) d |
  d2

  a4 |
  b( c) b8[ a]
  gs2.
}

bassB = \relative c {
  \global
  e8[ fs] g4 a |
  fs( gs) a |
  fs( d) e |
  a,2

  e'4 |
  a( g) fs |
  g( fs) e |
  fs( e) fs |
  b,2

  e4 |
  fs( d) g |
  cs,( a) d4 |
  b( g) a |
  d2

  c4 |
  b( b')  a |
  g( cs,) ds |
  e( fs) d4 |
  g2

  c,4 |
  b( a) b |
  e2.
}

%%%%%%
%%%%%%
%%%%%%

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
  
  \score {
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melodyB }
        \new Voice = "alto" { \voiceTwo \altoB }
      >>
      \new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenorB }
        \new Voice = "bass" { \voiceTwo \bassB }
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


%%%%%%
%%%%%%
%%%%%%

