\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Thomas Pestel (1584-1659)
      }
      \wordwrap {
        Music: THIS ENDRIS NYGHT, CM, English 15th century Carol
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {THIS ENDRIS NYGHT   CM}
    }
    \right-column{
      \line {English 15th century Carol}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Thomas Pestel (1584-1659)}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 6/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  d,4 
  fs2 g4 a2 a4
  b( cs) b a2 a4
  d2 cs4 b8.[( a16] b4) g 
  fs2.~ fs2 \bar "" \break
  
  fs4 |
  b2 b4 a2 a4 |
  g2 g4 fs2 fs4 |
  a2 fs4 g e2 |
  d2.~ d2

\bar "|."
}

alto = \relative c' {
  \global
  d4 |
  d2 d4 cs2 d4 |
  d2 g4 e2 e4 |
  d2 fs4 g2 b,4 |
  b2.~ b2
  
  b4 |
  b2 cs4 d2 fs4 |
  e2 d4 cs2 d4 |
  d2 d4 d cs2 
  d2.~ d2
}

tenor = \relative c {
  \global
  fs4
  a2 g4 e2 fs4 | g4( a) b cs2 cs4 | a2 a4 b2 e4 | d2.~ d2 
  
  d4 | d2 g,4 a2 b4 | b( cs) b as2 b4 | a2 b4 b a( g) | fs2.~ fs2
}

bass = \relative c {
  \global
 d4 |
 d2 b4 a2 d4 |
 g2 g,4 a2 g'4 |
 fs2 d4 g2 e4 |
 b2.~ b2
 
 b'4 |
 g2 e4 fs2 d4 |
 e2 e4 fs2 b,4 |
 fs2 b4 g a2 |
 d2.~ d2
}

verseOne = \lyricmode {
  \vOne
  Be -- hold the great Cre -- a -- tor makes
  Him -- self a house of clay,
  A robe of vir -- gin flesh he takes
  Which he will wear for ay.
}

verseTwo = \lyricmode {
  \vTwo
  Hark, hark, the wise e -- ter -- nal Word,
  Like a weak in -- fant cries!
  In form of ser -- vant is the Lord,
  And God in cra -- dle lies.
}

verseThree = \lyricmode {
  \vThree
  This won -- der struck the world a -- mazed,
  It shook the star -- ry frame;
  Squad -- rons of spir -- its stood and gazed,
  Then down in troops they came.
}

verseFour = \lyricmode {
  \vFour
  Glad shep -- herds ran to view this sight;
  A choir of an -- gels sings,
  And east -- ern sa -- ges with de -- light,
  A -- dore this King of kings.
}

verseFive = \lyricmode {
  \vFive
  Join then all hearts that are not stone,
  And all our voic -- es prove,
  To ce -- le -- brate this ho -- ly One,
  The God of peace and love.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  %\top
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
    \include "hymn_layout.ly"
  }
 % \bottom
 \refs
}

%%%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 16)
#(define output-suffix "Hymnal")
\book {
    \include "lilypond-book-preamble.ly"
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
 % \top
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
  %\bottom
\refs
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  %\top
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
  %\bottom
  \refs
}
