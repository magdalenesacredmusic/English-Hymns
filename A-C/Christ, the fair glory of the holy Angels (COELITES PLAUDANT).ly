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
      \line {COELITES PLAUDANT  11 11 11 5}
    }
    \column{
      \line {Rouen Church Melody, Harm. R.V.W}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Christe, sanctorum decus Angelorum"}
      \line {ascr. Rabanus Maurus, 9th cent.}
      \line {Tr. Athelstan Riley, 1906}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  c2 g4 a |
  g4.( f8) e2 |
  a4. b8 g4 c |
  c( b) c2 |
  
  c2 d4 d |
  e( d) a2 |
  d4. a8 b4 c |
  b( a) g2 |
  
  e2 f4 g |
  f( e) d2 |
  a'4. b8 c4 a |
  d( c) b2 |
  
  g4.( f8) e4 f |
  e2( d) |
  c1 \bar "||" \break

  c4( d c b) |
  c1
\bar "|."
}

alto = \relative c' {
  \global
  e2^\markup {\italic Unison.} c4 c |
  <b d>2 c2 |
  c4. b8 c4 c |
  g'2 e |
  
  e2 g4 g | 
  g <e a> <d fs>2 |
  <d g>4. <d fs>8 < d g>4 <c e>4 |
  <d g>4 <d fs> <b d>2 |
  
  c2. b4 |
  a cs d2 |
  c4. d8 c4 c |
  f e e2 |
  
  b2 c4 a |
  c2 b |
  g1 |
  
  a2 g |
  g1
}

tenor = \relative c' {
  \global
  g2 g4 f |
  s1 |
  a4. f8 g4 a |
  d2 c |
  
  c2 b4 b |
  c4 s2. |
  s1 |
  s1 |
  
  g2 f4 d |
  f a f2 |
  f4. f8 g4 a |
  a a g2 |
  
  g2 c4 f, |
  g2 g |
  <c, e>1 |
  
  e4 f e d |
  e1
}

bass = \relative c {
  \global
 c2 e4 f |
 g,2 a |
 f'4. d8 e4 f |
 g2 c, |
 
 a'2 g4 g |
 c, a d2 |
 b4. d8 g,4 a |
 b d g,2 |
 
 c2 a4 g |
 d' a d2 |
 f4. d8 e4 f |
 d a' e2 |
 g2 a4 d, |
 e4 f g2 |
 c,,1 |
 
 a'4 d, e g |
 c,1
}

verseOne = \lyricmode {
  \set stanza = "1."
  Christ, the fair glo -- ry of the ho -- ly An -- gels,
  Thou who hast made us, thou who o'er us rul -- est,
  Grant of thy mer -- cy un -- to us thy ser -- vants
  Steps up to heav -- en.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Send thy Arch -- an -- gel, Mich -- ael, to our suc -- cor;
  Peace -- mak -- er bless -- èd, may he ban -- ish from us
  Striv -- ing and hat -- red, so that for the peace -- ful
  All things may pros -- per.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Send thy Arch -- an -- gel, Gab -- ri -- el, the might -- y;
  Her -- ald of heav -- en, may he from us mor -- tals
  Spurn the old ser -- pent, watch -- ing o'er the tem -- ples
  Where thou art wor -- shipped.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Send thy Arch -- an -- gel, Raph -- ael, the re -- stor -- er
  Of the mis -- guid -- ed ways of men who wan -- der,
  Who at thy bid -- ding strength -- ens soul and bod -- y
  With thine an -- oint -- ing.
}

verseFive = \lyricmode {
  \set stanza = "5."
  May the blest Moth -- er of our God and Sav -- ior,
  May the as -- semb -- ly of the Saints in glo -- ry,
  May the ce -- les -- tial com -- pan -- ies of An -- gels
  Ev -- er as -- sist us.
}

verseSix = \lyricmode {
  \set stanza = "6."
  Fa -- ther al -- might -- y, Son and Ho -- ly Spir -- it,
  God ev -- er bless -- èd, be thou our pre -- serv -- er;
  Thine is the glo -- ry which the An -- gels wor -- ship,
  Veil -- ing their fac -- es.
  
    \set stanza = "6." A -- men.
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
      \new Lyrics \lyricsto "tune" { \verseFour}
      \new Lyrics \lyricsto "tune" { \verseFive }
      \new Lyrics \lyricsto "tune" { \verseSix }      
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
