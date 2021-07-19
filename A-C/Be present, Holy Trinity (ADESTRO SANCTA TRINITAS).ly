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
          \line {ADESTO SANCTA TRINITAS LM}
      }
      \column{
      \line {Chartes Church Melody}
      \line {harm. R. Vaughan Williams, 1906}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line { \italic "Adesto, sancta Trinitas"}
     \line { c. 10th cent.; tr. J.M. Neale }
   }
  } 
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  g4^\markup { \italic "To be sung in unison." } |
  g2 d4 |
  g2 g4 |
  a2 a4 |
  g2 \bar ""

  g4 |
  c2 c4 |
  b2 b4 |
  a2 g4 |
  d'2 \bar "" \break

  d4 |
  d2 a4 |
  c2 b4 |
  a2 g4 |
  d2 \bar ""

  g4 |
  a2 b4 |
  g2 c4 |
  b2 a4 |
  g2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  <b d>4 |
  <b d>2 b4 |
  b2 <b e>4 |
  <d fs>2 <d fs>4 |
  <b d>2

  <b d>4 |
  <e g>2 <e g>4 |
  <d g>2 <d g>4 |
  <d fs>2 g4 |
  <fs a>2

  <g b>4 |
  <f a>2 <c f>4 |
  <e g>2 <d g>4 |
  <c e>2 e4 |
  a,2

  e'4 |
  <d fs>2 <d fs>4 |
  e2 <e g>4 |
  <d g>2 <d fs>4 |
  <b d>2 \bar "|."
}

tenor = \relative c {
  \global
  \partial 4
  s4 |
  s2 fs4 |
  g2 s4 |
  s2. |
  s2

  s4 |
  s2. |
  s2. |
  s2 b4 |
  d2

  s4 |
  s2. |
  s2. |
  s2 b4 |
  s2

  b4 |
  s2 b4 |
  b2 s4 |
  s2. |
  s2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  g4 |
  g2 b4 |
  e2 e4 |
  d2 d4 |
  g2

  g4 |
  c,2 c4 |
  g'2 g4 |
  d2 e4 |
  d2

  g4 |
  d2 f4 |
  c2 g4 |
  a2 e'4 |
  d2

  e4 |
  d2 b4 |
  e2 c4 |
  g'2 d4 |
  <g, g'>2 \bar "|."
}


verseOne = \lyricmode {
  \set stanza = "1."
  Be pre -- sent, Ho -- ly Tri -- ni -- ty,
  Like splen -- dor, and one De -- i -- ty;
  Of things a -- bove, and things be -- low,
  Be -- gin -- ning, that no end shall know.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Thee all the ar -- mies of the sky
  A -- dore, and laud, and mag -- ni -- fy;
  And na -- ture, in her tri -- ple frame,
  For ev -- er sanc -- ti -- fies Thy Name.
}

verseThree = \lyricmode {
  \set stanza = "3."
  And we, too, thanks and ho -- mage pay,
  Thine own a -- dor -- ing flock to -- day;
  O join to that ce -- les -- tial song
  The prais -- es of our sup -- pliant throng!
}

verseFour = \lyricmode {
  \set stanza = "4."
  Light, sole and one, we Thee con -- fess,
  With trip -- le praise we right -- ly bless;
  Al -- pha and O -- me -- ga we own,
  With ev -- 'ry spir -- it round Thy throne.
}

verseFive = \lyricmode {
  \set stanza = "5."
  To Thee, O un -- be -- got -- ten One,
  And Thee, O sole -- be -- got -- ten Son,
  And Thee, O Ho -- ly Ghost, we raise
  Our e -- qual and e -- ter -- nal praise.
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
        tempoWholesPerMinute = #(ly:make-moment 112 4)
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


