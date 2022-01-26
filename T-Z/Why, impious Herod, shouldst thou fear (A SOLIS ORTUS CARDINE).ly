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
      \line {A SOLIS ORTUS CARDINE  LM}
    }
    \right-column{
      \line {Plainsong, Mode III, \italic"Liber Usualis"}
      \line {Harm. arr. David O'Donnell, 2021 }
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Hostis Herodes impie"}
      \line {C. Sedulius, c. 450; Tr. Percy Dearmer, 1906}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d8 e f g[ a] d, e8[ g] f[ e] e4 \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|"
  g8 a8[ c] c c[ b] a[ g] a[ b] b b4 \bar "|"
  a8 a[ c d] c c[ b] a[ g] a g[ f] e[(^- d] f8[ g] a4) \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|"
 d,8 e f g8[ a] g[ f] g f e4 \bar "||" \break
 
 e8[ f e] d4( e) \bar "||"
}

melodya = \relative c' {
  \global
  \override Stem #'length = #0
  d4 e f g( a) d, e( g) f( e) e2 \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|"
  g4 a( c) c c( b) a( g) a( b) b b2 \bar "|"
  a4 a( c d) c c( b) a( g) a g( f) e4(^- d f g a2) \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|"
 d,4 e f g4( a) g( f) g f e4 \bar "||" \break
 
 e4( f e) d2( e) \bar "||"
}

alto = \relative c' {
  \global
  d4. e4 d8 c4~ c b~ |
  b8 f'4. g4 e~ e4.~ e4
  r8 e2~ e4 f4. g8[ f] e8[ d]~ d4 e
  d4. e2 c4 b
  
  c4. d4 b
}

tenor = \relative c {
  \global
  f8[ g a] g4 g8 e4 a g~ |
  g8 c4.g4 b c4. b4
  s8 c2~ c4~ c4. b4 b4 a4~ a
  f8[ g a] g2 a4 g
  
  a4.~ a4~ a8[ g]
}

bass = \relative c {
  \global
  d4. c4 b8 a4~ a e'~ |
  e8 f4. e4~ e a4. g4
  d8\rest a'2 g4 f4. d4 g4 d c
  d4. c2 a4 e'
  
  a4. f4 e
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
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
      \new Lyrics \lyricsto "tune" { \verseFour}
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout_ragged.ly"
  }
  \bottom
}
