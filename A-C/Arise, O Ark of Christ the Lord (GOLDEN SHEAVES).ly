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
          \line {GOLDEN SHEAVES 87 87 D}
      }
      \column{
      \line {Arthur Sullivan, 1874}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {R.F. Littledale}
   }
  } 
}

\header {
  tagline = ""
}


global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  b'4 d d c |
  b a g \bar ""

  g4 |
  a b c e, |
  fs2 g4 \bar "" \break

  d4 |
  b' d d c |
  b a g \bar ""

  b4 |
  b a b cs |
  e2 d4 \bar "" \break

  a4 |
  a4. a8 d4 b |
  a gs b \bar ""

  e,4 |
  c' c d c8[ d] |
  e2 e4 \bar "" \break

  c8[ d] |
  e4 e d g, |
  c c b \bar ""

  g4 |
  a b c e, |
  fs2 g4 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  g4 fs g a |
  g fs g

  d |
  e d c c |
  c2 b4

  d |
  g fs g c |
  g fs g

  g |
  g g g g |
  g2 fs4

  fs4 |
  fs4. fs8 fs4 fs |
  e e e

  e |
  e e g g |
  g2 g4

  e4 |
  g a a g |
  g fs g

  d |
  e d c e |
  d2 d4

}

tenor = \relative c {
  \global
  \partial 4
  d4 |
  d' d d d |
  d c b

  g |
  e4. e8 e4 a |
  a2 g4

  d |
  d' d d d |
  d c b

  d |
  cs cs d e |
  cs2 d4

  d4 |
  d4. d8 d4 d |
  b4. a8 gs4

  gs4 |
  a a b a8[ b] |
  c2 c4

  c4 |
  c c b e |
  e d g,

  g4 |
  e4. e8 e4 c' |
  c2 b4
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  g a b fs |
  g d e

  b |
  c b a a |
  d2 g4

  d4 |
  g c b fs |
  g d e

  e |
  a, a a' a |
  a2 d,4

  d4 |
  d4. d8 b4 d |
  e4. fs8 gs4

  e |
  a a g g |
  c2 c,4

  c |
  c' fs, b b |
  a d, e

  b4 |
  c b a a |
  d2 g,4
}

verseOne = \lyricmode {
  \set stanza = "1."
  A -- rise, O Ark of Christ the Lord,
  To thy cel -- es -- tial sta -- tion,
	While An -- gel hosts with glad ac -- cord
  Sing out their ac -- cla -- ma -- tion;
  A -- bove the Ser -- aphs take thy stand
  Hence -- forth from sor -- row rest -- ing,
  All glo -- rious at the King’s right hand
  In gold and broid -- ered vest -- ing.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  O Li -- ly of the Val -- leys fair,
	O sealed and crys -- tal Foun -- tain,
  Thy place is near -- est to Him there
  Up -- on His Ho -- ly moun -- tain;
  The saints and an -- gels see His face
  All bowed in a -- do -- ra -- tion,
  Thou, Ma -- ry, gaz -- est, full of grace,
  With Moth -- er’s ex -- ul -- ta -- tion.
}

verseThree = \lyricmode {
  \set stanza = "3."
  He came to thee, a Babe a -- lone,
  From all His pomp de -- scend -- ing:
  Thou cam -- est, ra -- diant to His Throne,
  With vir -- gin choirs at -- tend -- ing.
  Once poor -- est of all earth hath seen,
  God’s hand -- maid, meek and low -- ly,
	Now Thou art crowned of Heav'n the Queen,
  And fore -- most of the low -- ly.
}

verseFour = \lyricmode {
  \set stanza = "4."
  That crown with twelve pure stars be -- dight,
  In ray a -- round is shedd -- ing,
  The sun hath made thy rai -- ment bright,
  Thy feet the moon are tread -- ing;
  Yet, as of old, at Naz -- a -- reth,
  Be -- side His cra -- dle kneel -- ing,
  And la -- ter, at the cross of death,
  Thy soul to an -- guish steel -- ing.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Though rob’d and crown’d, thou low -- ly art,
  O stain -- less Moth -- er -- maid -- en,
  And feel -- est for each hu -- man heart
  With sin and sor -- row la -- den;
  Then to thy Son for sin -- ners pray
  As Moth -- er in -- ter -- ced -- ing,
  Ask on, He will not say thee nay,
  But grant thee all thy plead -- ing.
}

verseSix = \lyricmode {
  \set stanza = "6."
  A -- rise, O Ark of Christ the Lord,
  To thy ce -- les -- tial sta -- tion,
  While an -- gel hosts with glad ac -- cord
  Sing out their ac -- cla -- ma -- tion.
  To God the Fa -- ther praise be done,
  Who gave thee grace and me -- rit;
  Praise be to Christ, thine on -- ly Son,
	And to thy Spouse, the Spir -- it.
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
      \new Lyrics \lyricsto "tune" { \verseSix }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
