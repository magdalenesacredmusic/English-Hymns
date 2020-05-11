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
      \line {ROCKINGHAM LM}
    }
    \right-column{
      \line {arr. Edward Miller, 1790}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Isaac Watts, 1707}
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
  fs4( g) e |
  d2 fs4 |
  a2 b4 |
  a2 \bar "||"
  
    a4 |
  d2 cs4 |
  b2 a4 |
  a4( g) fs |
  fs( e) \bar "||"
  
    e |
  a2 b4 |
  cs2 a4 |
  d2 gs,4 |
  a2 \bar "||"
  
    d,4 |
  g2 fs4 |
  e2 d4 |
  d8[( e] fs4) e |
  d2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  d2 cs4 |
  d2 d4 |
  d2 d4 |
  d2 d4 |
  d2 d4 |
  d( e) fs |
  e2 d4 |
  d( cs) cs |
  e2 e4 |
  e2 cs4 |
  d( fs) d |
  cs2 a4 |
  b( cs) d |
  cs2 d4 |
  d2 cs4 |
  d2 \bar "|."
}

tenor = \relative c {
  \global
  \partial 4
  fs4 |
  a( b) g |
  fs2 b4 |
  a2 g4 |
  fs2 fs4 |
  fs( g) a |
  b( cs) d |
  a2 a4 |
  a2 a4 |
  cs2 gs4 |
  a2 a4 |
  a( b) b |
  a2 a4 |
  g2 a4 |
  a( g) fs |
  b( a) g |
  fs2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  d( g,) a |
  d2 b4 |
  fs2 g4 |
  d'2 
  
    d4 |
  d( e) fs |
  g2 fs4 |
  cs2 d4 |
  a2 
  
    a4 |
  a( cs) e |
  a2 g4 |
  fs( d) e |
  a,2 
  
    fs'4 |
  e2 d4 |
  a2 b4 |
  g( a) a |
  d2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  When I sur -- vey the won -- drous cross
  On which the Prince of glo -- ry died,
  My rich -- est gain I count but loss,
  And pour con -- tempt on all my pride.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  For -- bid it, Lord, that I should boast,
  Save in the death of Christ my God!
  All the vain things that charm me most,
  I sac -- ri -- fice them to His blood.
}

verseThree = \lyricmode {
  \set stanza = "3."
  See from His head, His hands, His feet,
  Sor -- row and love flow min -- gled down!
  Did e’er such love and sor -- row meet,
  Or thorns com -- pose so rich a crown?
}

verseFour = \lyricmode {
  \set stanza = "4."
  Were the whole realm of na -- ture mine,
  That were a pre -- sent far too small;
  Love so a -- maz -- ing, so di -- vine,
  De -- mands my soul, my life, my all.
}

%{verseFive = \lyricmode {
  \set stanza = "5."
  To Christ, who won for sin -- ners grace
  By bit -- ter grief and an -- guish sore,
  Be praise from all the ran -- somed race
  For -- ev -- er and for -- ev -- er -- more.
}
v. 5, Hymns Ancient and Modern, 1904 %}
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
