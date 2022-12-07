\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"


top = \markup {
  \fill-line {
    \column {
      \line {DEUS TUORUM MILITUM  LM}
    }
    \right-column{
      \line {Grenoble Church Melody}
      \line {harm. \italic "The English Hymnal"}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Exultet caelum laudibus"}
      \line {Latin c. 10th cent.}
      \line {Tr. Richard Mant (1776-1848), alt.}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \time 3/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  \partial 4 c4^\markup { \italic "To be sung in unison." } |
  e2 g4 | c2 g4 |
  f4( e4) d4 |
  c2 \bar ""

  c'4 |
  e2 c4 | \break
  a4( b) c |
  g2 fs4 |
  g2 \bar "" 

  g4 |
  a2 b4 | 
  c2 g4 | \break
  f4( e) d |
  e2 \bar ""

  g4 |
  a4( b) c |
  g( f) e |
  d2 c4 |
  \partial 2 c2 \bar "||" \break
  c2( d4 |
  c2 b4) |
  c2. \bar "|."
}


alto = \relative c' {
  \global
  \partial 4
  s4 |
  s2. |
  <c e>2 <c e>4 |
  s2. |
  s2 

  <e g>4 |
  <e a>2 <e a>4 |
  fs2 <e g>4 |
  b2 d4 |
  d2 

  <c e>4 |
  <c f>2 f4 |
  e2 c4 |
  c2 b4 |
  b2 

  c4 |
  <c e>4 \tieUp <d g ~>4 <e g>4 |
  <b d>4 c c |
  s2 c4 |
   \partial 2 c2 
}

tenor = \relative c {
  \global
  \partial 4
  <e g>4 |
  <g c>2 <g b>4 |
  s2. |
  <a c>4 g4 b4 |
  <e, g>2 

  c'4 |
  c2 a4 |
  d2 g,4 |
  g2 a4 |
  <g b>2 


  s4 |
  s2 b4 |
  a2 g4 |
  a g g |
  g2 

  e4 |
  s2. |
  s4 a4 g |
  <g b>2 <e g>4 |
  \partial 2 <e g>2 
  
  <e a>2 <f a>4
  <e g>2 <d g>4 |
  <e g>2.
}

bass = \relative c {
  \global
  \partial 4
  c4 |
  c2 e4 |
  a,2 c4 |
  f4 c4 g'4 |
  c,2 

  c'4 |
  a2 c,4 |
  d2 c4 |
  e2 d4 |
  g,2 

  c4 |
  f2 d4 |
  a2 e'4 |
  f c g' |
  e2 

  c4 |
  a g e |
  g a c |
  g2 c4 |
  c2 
  a2 d,4 e2 g4 
  c,2
  
}


verseOne = \lyricmode {
  \set stanza = "1."
  Let the round world with songs re -- joice,
  Let heaven re -- turn the joy -- ful voice,
  All mind -- ful of the~ap -- ost -- les' fame,
  Let heaven and earth their praise pro -- claim.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Ye ser -- vants who once bore the light
  Of gos -- pel truth o'er heath -- en night,
  Still may your work that light im -- part,
  To glad our eyes and cheer our heart.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O God, by whom to them was given
  The key that shuts and o -- pens heaven,
  Our chains un -- bind, our loss re -- paire,
  And grant us grace to en -- ter there.
}

verseFour = \lyricmode {
  \set stanza = "4."
  For at thy will they preached the word
  Which cured dis -- ease, which health con -- ferred;
  O may thy heal -- ing power once more
  Our souls to grace and health re -- store.
}


verseFive = \lyricmode {
  \set stanza = "5."
  That when as judge thy Son shall come
  To bring his ran -- somed peo -- ple home,
  He may with them pro -- nounce us blest,
  And place us in thine end -- less rest.
}

verseSix = \lyricmode {
  \set stanza = "6."
  To God the Fa -- ther, God the Son,
  And God the Spir -- it, Three in One,
  Be hon -- or, praise, and ma -- jes -- ty,
  Now ans through -- out e -- ter -- ni -- ty.
  
  A -- men.
}

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { %\transpose c bf,
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
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
