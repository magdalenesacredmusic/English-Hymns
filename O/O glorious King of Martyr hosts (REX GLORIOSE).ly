\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {REX GLORIOSE, LM}
    }
    \right-column{
      \line {Melody adapted from}
      \line {\italic "Catholische Geistliche Gesänge" Andernach, 1608}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Rex gloriosae Martyrum"}
      \line {Tr. R.F. Littledale and others}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d2 \bar "|"
  fs4 g a a \bar "|"
  b cs d2 
  a2 \bar "|"
  d4. cs8 b4 a \bar "|"
  b g a2 
  a2 \bar "|"
  b4 g a fs \bar "|"
  g e d2 
  d'2 \bar "|"
  cs4 b a fs \bar "|"
  g( fs) e2 \bar "|"
  d \bar "||"

  d2 d \bar "|."
}

alto = \relative c' {
  \global
  d2
  d4 d e a
  g fs8[ e] fs2
  fs
  a4 fs g d 
  d d8[ e] cs2
  d
  fs4 e e d 
  d b8[ cs] d2
  fs
  a4 g8[ fs] e4 d 
  e( d) d( cs) 
  d2
  
  b2 a
}

tenor = \relative c {
  \global
  fs2
  a4 d cs d 
  d a a2
  d
  d4 a cs d 
  g, g e2
  d'4.( cs8) 
  b4 b a d8[ cs]
  b4 g fs2
  d'2
  a4 d cs b
  b( a) b( a)
  fs2
  
  g2 fs
}

bass = \relative c {
  \global
 d2
 d8[ cs] b4 a8[ a'] g[ fs]
 e4 a d,2
 d
 fs4 d e fs 
 g b, a2
 fs'2
 d4 e cs d 
 e g,8[ a] b2
 b'2
 fs4 g a b 
 e,( fs) g( a)
 d,2
 
 g, d'
}

verseOne = \lyricmode {
  \vOne
  O glo -- rious King of Mar -- tyr hosts,
  Thou Crown that each Con -- fes -- sor boasts,
  Who lead -- est to ce -- les -- tial day
  The Saints who cast earth's joys a -- way.
}

verseTwo = \lyricmode {
  \vTwo
  Thine ear in mer -- cy, Sa -- vior, lend,
  While un -- to thee our prayers as -- cend;
  And as we count their tri -- umphs won,
  For -- give the sins that we have done.
}

verseThree = \lyricmode {
  \vThree
  Mar -- tyrs in thee their tri -- umphs gain,
  Co -- fes -- sors grace from thee ob -- tain;
  We sin -- ners hum -- bly seek to thee,
  From sin's of -- fence to set us free.
}

verseFour = \lyricmode {
  \vFour
  All laud to God the Fa -- ther be,
  All praise, e -- ter -- nal Son, to thee;
  All glo -- ry, as is ev -- er meet,
  To God the ho -- ly Par -- a -- clete.
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
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
