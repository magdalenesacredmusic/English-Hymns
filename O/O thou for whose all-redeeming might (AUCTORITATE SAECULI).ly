\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {AUCTORITATE SAECULI, LM}
    }
    \right-column{
      \line {Angers Church Melody}
      \line {Harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Jesu, Redemptor omnium"}
      \line {8th cent.; Tr. Richard Meux Benson (1824-1915) }
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key af \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  c4 |
  f2 af4
  g2 f4
  g( f) ef 
  f2 f4
  af2 bf4 
  c2 af4
  bf2 bf4 
  c2 \bar ""
  
  af4 |
  c2 bf4
  c2 af4
  bf( af) g
  f2
  
  c4
  f2 af4
  g2 f4
  g( f) ef 
  f2 \bar "||"
  
  \cadenzaOn f4( g f ef f) f2 \bar "|."
}

alto = \relative c' {
  \global
  s4
  s2 <c f>4
  <c ef>2 <af c>4
  <c ef>4 <af df> <af c>
  <af c>2 <af c>4
  <c f>2 <ef g>4
  <ef af>2 ef4 
  f2 <ef g>4
  <ef af>2
  
  <df f>4 
  <ef af>2 <ef g>4
  <ef g>2 <c f>4
  <df f>2 ef4
  <af, df>2 af4
  <af df>2 <c ef>4
  <bf ef>2 <af c>4
  <c ef>4 <af df> <af c>
  <af c>2
  
  <af c>4 <c ef> <af df> <af c>~ <af c> <af c>2
}

tenor = \relative c {
  \global
  <f af>4 
  <af c>2 s4
  s2.*14
  f2
}

bass = \relative c, {
  \global
 f4 
 f2 f'4
 c2 f4 
 c df af' 
 f2 f4
 f2 ef4
 af,2 c4 
 df2 ef4
 af,2
 
 df4
 af2 ef'4 
 c2 f4
 bf,2 c4
 df2 f4
 df2 af4
 ef'2 f4
 c df af
 f2
 
 f4 c df af' f f2
}

verseOne = \lyricmode {
  \vOne
  O thou whose all -- re -- deem -- ing might
  Crowns ev -- 'ry chief in faith's true fight,
  On this com -- mem -- or -- a -- tion day
  Hear us, good Je -- sus, while we pray.
}

verseTwo = \lyricmode {
  \vTwo
  In faith -- ful strife for thy dear name
  Thy ser -- vant earned the saint -- ly fame,
  Which pi -- ous hearts with praise re -- vere
  In con -- stant mem -- 'ry year by year.
}

verseThree = \lyricmode {
  \vThree
  Earth's fleet -- ing joys he count -- ed naught,
  For high -- er, tru -- er joys he sought,
  And now, with An -- gels round thy throne,
  Un -- fad -- ing treas -- ures are his own.
}

verseFour = \lyricmode {
  \vFour
  O grant that we, most gra -- cious God,
  May fol -- low in the steps he trod;
  And, freed from ev -- 'ry stain of sin,
  As he hath won may al -- so win.
}

verseFive = \lyricmode {
  \vFive
  To thee, O Christ, our lov -- ing King,
  All glo -- ry, praise, and thanks we bring;
  Whom with the Fa -- ther we a -- dore
  And Ho -- ly Ghost for ev -- er -- more.
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
        tempoWholesPerMinute = #(ly:make-moment 120 4)
      }
    }
    \include "hymn_layout.ly"
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
      \new Lyrics \lyricsto "tune" { \verseFour}
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
