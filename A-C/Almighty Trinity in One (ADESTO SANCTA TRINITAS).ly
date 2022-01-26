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
      \right-column{
      \line {Chartes Church Melody}
      \line {harm. R. Vaughan Williams, 1906}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line { \italic "Immensa et una, Trinitas"}
     \line {Trinity Sunday. Vespers}
     \line {tr. St. Cecilia’s Abbey, \italic "Hymns for the Liturgy of the Hours," 1979}
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
  d'2 \bar ""

  d4 |
  d2 a4 |
  c2 b4 |
  a2 g4 |
  d2 \bar ""

  g4 |
  a2 b4 |
  g2 c4 |
  b2 a4 |
  g2 \bar "||" \break
  
  \cadenzaOn
  g4( a g fs) \bar "|"
  g1 \bar "|."
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
  <b d>2
  
  %amen
  <b e>4 <c e> <b d> <a d>
  <b d>1
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
  s2
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
  <g, g'>2
  
  e'4 a, b d 
  g1
}


verseOne = \lyricmode {
  \set stanza = "1."
Al -- might -- y Trin -- i -- ty in One,
Whose sov -- 'reign pow'r all things has made,
You rule the a -- ges and the world,
Be -- fore all time You reigned sup -- reme.
}

verseTwo = \lyricmode {
  \set stanza = "2."
Full plen -- i -- tude of joy is yours,
A -- lone and per -- fect, need -- ing naught,
Un -- sul -- lied, Sim -- ple, Pur -- i -- ty,
All things are held with -- in your sway.
}

verseThree = \lyricmode {
  \set stanza = "3."
O Fa -- ther, fount of ev -- 'ry grace,
O Fa -- ther's glo -- ry, God the Son,
O Ho -- ly Spir -- it of them both,
Un -- end -- ing source of love div -- ine.
}

verseFour = \lyricmode {
  \set stanza = "4."
To you, the Or -- i -- gin se -- rene,
The God -- head one in Per -- sons three,
All things cre -- a -- ted owe their form
And ev -- 'ry beau -- ty they con -- tain.
}

verseFive = \lyricmode {
  \set stanza = "5."
Your child -- ren whom you have en -- dowed
With son -- ship and a -- dop -- tion's gift,
Beg you to make them tem -- ples fair
For your in -- dwell -- ing Spir -- it's joy.
}

verseSix = \lyricmode {
  \set stanza = "6."
O liv -- ing Light, grant us the grace
To join the an -- gels round your throne,
That prais -- ing you with grate -- ful love,
Cre -- a -- tion's hymn may nev -- er end. 
A -- men.
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
      \new Lyrics \lyricsto soprano \verseSix
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
    \include "hymn_layout_ragged.ly"
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
      \new Lyrics \lyricsto "tune" { \verseSix }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}


