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
      \line {ST. VENANTIUS LM}
    }
    \right-column{
      \line {Rouen Church Melody}
      \line {harm. R. Vaughan Williams}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Hostis Herodes impie"}
      \line {C. Sedulius, c. 450; tr. P. Dearmer, 1906}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  f4 |
  a( c) bf |
  a( g) a |
  f2 g4 |
  a2 \bar ""

  c4 |
  d( c) bf |
  a( bf) c |
  c( bf) a |
  g2 \bar "m"

  g4 |
  bf( a) g |
  f( d) e |
  f( e4.) d8 |
  c2 \bar ""

  g'4 |
  a( f) bf |
  a( g) f |
  e2 f4 |
  f2 \bar "||" \break
  
  \cadenzaOn f4( g f e) f2 \bar "|."
}

melodya = \relative c' {
  \global
  \partial 4
  f4 |
  a( c) bf |
  a( g) a |
  f2 g4 |
  a2 \bar "" \break

  c4 |
  d( c) bf |
  a( bf) c |
  c( bf) a |
  g2 \bar "m"

  g4 |
  bf( a) g |
  f( d) e |
  f( e4.) d8 |
  c2 \bar ""

  g'4 |
  a( f) bf |
  a( g) f |
  e2 f4 |
  f2 \bar "||" \break
  
  \cadenzaOn f4( g f e) f2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  c4^\markup {\italic "To be sung in unison."} |
  f2 <d f>4 |
  <c f>~ <c e>2 |
  <a d> <c e>4 |
  <c f>2

  <f a>4 |
  <f bf> <e g>~ <d g> |
  <d f>2 <e g>4 |
  <c f> <d f>2 |
  <bf d>2

  <c e>4
  <d f>2~ <bf d>4~ |
  <a d> s2 |
  s2. |
  s2

  <c e>4~ |
  <c e> d2 |
  <c f>4 d a |
  c2~ <a c>4 |
  <a c>2
  
  <a d>4 <bf d> <a c> <g c>
   <a c>2

}

tenor = \relative c' {
  \global
  \partial 4
  a4 |
  c( a) s4 |
  s c, a |
  s2 c4 |
  s2

  s4 |
  bf c s |
  s2 c4 |
  a bf s4 |
  s2

  c4 |
  bf s2 |
  s4 <f' a> <g c>~ |
  <a c> <g c>4. <g b>8~ |
  <e g>2

  c4 |
  s f g |
  s bf f |
  g2 f,4 |
  f2
}

bass = \relative c {
  \global
  \partial 4
  f4 |
  f2 bf,4 |
  f' s2 |
  d2 s4 |
  f2

  f4 |
  s2 g4 |
  d2 s4 |
  s2 d4 |
  g2

  s4 |
  s4 d g |
  d2 c4 |
  f c4. g8 |
  c2

  s4 |
  a d g, |
  a bf d |
  c2 s4 |
  s2
  
  d4 g, a c f,2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Why, im -- pious He -- rod, shouldst thou fear
  Be -- cause the Christ is come so near?
  He who doth heav'n -- ly king -- doms grant
  Thine earth -- ly realm can nev -- er want.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Lo, sa -- ges from the East are gone
  To where the star hath new -- ly shone:
  Led on by light to Light they press,
  And by their gifts their God con -- fess.
}

verseThree = \lyricmode {
  \set stanza = "3."
  The Lamb of God is man -- i -- fest
  A -- gain in Jor -- dan's wa -- ter blest,
  And he who sin had nev -- er known
  By wash -- ing hath our sins un -- done.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Yet he that rul -- eth ev -- 'ry -- thing
  Can change the na -- ture of the spring,
  And gives at Ca -- na this for sign—
  The wa -- ter red -- dens in -- to wine.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Then glo -- ry, Lord, to thee we pay
  For thine E -- pi -- pha -- ny to -- day;
  All glo -- ry through e -- ter -- ni -- ty
  To Fa -- ther, Son, and Spir -- it be.
  \set stanza = "5." A -- men.
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
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
