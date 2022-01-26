\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {ISTE CONFESSOR (2)   11 11 11 5}
    }
    \column{
      \line {\italic "Poitiers Antiphoner," 1746}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Iste Confessor"}
      \line {8th cent.; Tr. Laurence Housman (1865-1959)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d2 a'4 f |
  g2 a |
  d,4. e8 f4 g |
  f( e) d2 |
  
  d2 a'4 f |
  g2 a |
  a4. g8 a4 b |
  c( <g b>) a2 |
  
  d2 c4 d |
  c( bf) a2 |
  c4. bf8 a4 bf |
  <f a>( <e g>) f2 |
  
  a2 d,4 e |
  f2( e) |
  d1 \bar "||" \break
  
  d4( e d c) |
  d1 \bar "|."
}

melodya = \relative c' {
  \global
  d2 a'4 f |
  g2 a |
  d,4. e8 f4 g |
  f( e) d2 |
  
  d2 a'4 f |
  g2 a |
  a4. g8 a4 b |
  c( b) a2 |
  
  d2 c4 d |
  c( bf) a2 |
  c4. bf8 a4 bf |
  a( g) f2 |
  
  a2 d,4 e |
  f2( e) |
  d1 \bar "||" \break
  
  d4( e d c) |
  d1 \bar "|."
}

alto = \relative c' {
  \global
  d2 e4 d |
  d2 c |
  a4. c8 c4 d |
  c2 a |
  
  d2 e4 f |
  <c e>2 <c f> |
  c2 f4 f |
  e2 <c e> |
  
  d2 f4 f |
  e f <c f>2 |
  <c e>4. f8 <c f>4 <bf d> |
  c2 <a d>2 
  
  <a c> bf4 g |
  <a c>1 |
  <f a>1 |
  
  a4 c bf a |
  a1
}

tenor = \relative c' {
  \global
  a2 a |
  d, e |
  f4. g8 a4 bf |
  a g f2 |
  
  a2 a |
  g f |
  f4. g8 c4 d |
  g,2 a |
  
  <f bf> a4 bf |
  g f a2 |
  
  g4. f8 a4 g |
  f g d2 |
  
  f2. c4 |
  c1 d |
  
  f4 a f2 |
  <d f>1
}

bass = \relative c {
  \global
  <d f>2 <c e>4 <d f> |
  bf2 a |
  d4. c8 a4 g |
  a c d2 |
  
  <d f>2 <c e>4 d |
  c2 f, |
  f'4. e8 f4 d |
  c e a2 |
  
  bf,2 f'4 bf, |
  c d f2 |
  c4. d8 f4 g, |
  a c d2 |
  f,2 bf4 c |
  f,2 a |
  d,1 |
  
  d'4 a bf f |
  d1
}

verseOne = \lyricmode {
  \vOne
  He, whose con -- fes -- sion God of old ac -- cept -- ed,
  Whom through the a -- ges all now hold in hon -- or,
  Gain -- ing his guer -- don this day came to en -- ter
  Heav -- en's high por -- tal.
}

verseTwo = \lyricmode {
  \vTwo
  God -- fear -- ing, watch -- ful, pure of mind and bod -- y,
  Ho -- ly and hum -- ble, thus did all men find him;
  While, through his mem -- bers, to the life im -- mor -- tal
  Mor -- tal life called him.
}

verseThree = \lyricmode {
  \vThree
  Thus to the ear -- y, from the life en -- shrin -- èd,
  Po -- tent in vir -- tue, flowed hu -- mane com -- pas -- sion;
  Sick and sore la -- den, how -- so -- ev -- er bur -- dened,
  There they found heal -- ing.
}

verseFour = \lyricmode {
  \vFour
  So now in chor -- us, giv -- ing God the glo -- ry,
  Riase we our an -- them glad -- ly to his hon -- or,
  That in fair kin -- ship we may all be shar -- ers
  Here and here -- a -- fter.
}

verseFive = \lyricmode {
  \vFive
    Hon -- or and glo -- ry, pow -- er and sal -- va -- tion,
    Be in the high -- est un -- to him who reign -- eth
    Change -- less in heav -- en o -- ver earth -- ly chang -- es,
    Tri -- une, e -- ter -- nal.
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
#(define output-suffix "Hymnal")
\book {
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { %\transpose c d
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
      \new Lyrics \lyricsto "tune" {
        \verseFive }
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
