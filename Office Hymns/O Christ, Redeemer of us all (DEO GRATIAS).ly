\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {DEO GRACIAS   LM}
    }
    \right-column{
      \line {English, 15th cent.}
      \line {harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Christe, Redemptor omnium, conserva"}
      \line {9th cent. Tr. \italic "The Monastic Diurnal," Collegeville, 1952}
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

melody = \relative c'' {
  \global
  \partial 4
  d4 |
  d2 c4 |
  d2 c4 |
  c b2 |
  a2 \bar ""

  d4 |
  d4( c) a |
  g( a) g8[ d] |
  f4 e2 |
  d \bar ""

  a'4 |
  c2 c4 |
  d( c) bf |
  a4 g2 |
  f \bar ""

  f4 |
  a2 a4 |
  g2 f4 |
  f4 e2 |
  \time 2/4 d \bar "||"
  
  \time 3/4 f4( d e) |
  d2. \bar "|."
}

melodya = \relative c'' {
  \global
  \partial 4
  d4 |
  d2 c4 |
  d2 c4 |
  c b2 |
  a2 \bar "" \break

  d4 |
  d4( c) a |
  g( a) g8[ d] |
  f4 e2 |
  d \bar "" \break

  a'4 |
  c2 c4 |
  d( c) bf |
  a4 g2 |
  f \bar ""

  f4 |
  a2 a4 |
  g2 f4 |
  f4 e2 |
  \time 2/4 d \bar "||" \break
  
  \time 3/4 f4( d e) |
  d2. \bar "|."
}


alto = \relative c' {
  \global
  \partial 4
  <f a>4^\markup { \italic "To be sung in unison." } |
  <f a>2 <e a>4 |
  <f a>2 <f a>4 |
  <e a>4 <e~ a> <e gs> |
  <cs e>2

  <f a>4 |
  <f a>4 <e a>4 d |
  d2 d4 |
  d2 cs4 |
  d2

  <d f!>4 |
  <ef g>2 <f a>4 |
  <f bf> <f a> <d g> |
  <d fs> <b d> <c e> |
  c2 

  d4 |
  <c f>2 d4 |
  <b d> <c e> <a c> |
  d2 cs4 |
  d2
  
  d4 b c |
  d2.
}

tenor = \relative c {
  \global
  \partial 4
  \teeny <d f a>4 |
  <d f a>2 <e a>4 |
  <f a>2 a4 |
  <e a>4 <e b'>2 |
  e2

  <f a>4 |
  <f a>~ <e a> a |
  \normalsize b a b |
  a2. |
  <fs a>2

  \teeny <f a>4 |
  <g c>2 <a c>4 |
  <f bf> <f a> <d g> |
  fs g2 |
  a2

  bf4 |
  a2 a4 |
  s2. |
  \normalsize a2. |
  <f a>2
  
  a4 g g |
  <fs a>2.
}

bass = \relative c, {
  \global
  \partial 4
  d4 |
  d f a |
  d2 f4 |
  a, e2 |
  a 

  d,4 |
  d a' f |
  g f g |
  d' a2 |
  d 

  d4 |
  c2 f,4 |
  bf f g |
  d' g, c |
  f,2
  
  bf4 |
  f2 f4|
  g c, f |
  d'4 a2 |
  d,
  
  d4 g c, |
  d2.
}


verseOne = \lyricmode {
  \vOne
  O Christ, Re -- deem -- er of us all,
  Pro -- tect thy ser -- vants when they call,
  And hear with re -- con -- cil -- ing care
  The bless -- ed Vir -- gin's ho -- ly prayer.
}

verseTwo = \lyricmode {
  \vTwo
  And ye, O ev -- er bliss -- ful throng
  Of heav'n -- ly Spir -- its, guard -- ians strong,
  Our past and pres -- ent ills dis -- pel,
  From fu -- ture per -- il shield us well.
}

verseThree = \lyricmode {
  \vThree
  Ye Pro -- phets of the Judge a -- dored,
  Ye twelve A -- pos -- tles of the Lord,
  For us your cease -- less prayer out -- pour,
  Sal -- va -- tion for our souls im -- plore.
}

verseFour = \lyricmode {
  \vFour
  Mar -- tyrs of God, re -- nowned for aye,
  Con -- fes -- sors set in bright ar -- ray,
  Let us your con -- stant prayers u -- nite
  To bear us to the realms of light.
}

verseFive = \lyricmode {
  \vFive
  O sa -- cred Vir -- gin choirs, may ye,
  With monks of ho -- ly min -- is -- try
  And ev' -- ry Saint of Christ ob -- tain
  That we his fel -- low -- ship may gain.
}

verseSix = \lyricmode {
  \vSix
  To thee, O Fa -- ther, born of none,
  And thee, O Sole -- be -- got -- ten Son,
  One with the Ho -- ly Par -- a -- clete,
  Be glo -- ry ev -- er, as is meet.
  A -- men.
}


\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { \transpose c bf,
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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
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
    \transpose c bf,
    <<
      \new Voice = "tune" {
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive}
      \new Lyrics \lyricsto "tune" { \verseSix }
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}


