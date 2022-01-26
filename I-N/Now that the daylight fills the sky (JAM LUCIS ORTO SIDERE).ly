\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {JAM LUCIS ORTO SIDERE, LM}
    }
    \right-column{
      \line {Benedictine Plainsong, Mode VIII}
      \line {Harm. \italic "The Hymnal, 1940"}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Jam lucis orto sidere"}
      \line {5th cent.; Tr. John Mason Neale}
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

melody = \relative c'' {
  \global
  g8 g a g f g a g( a4) \bar "'"
  c8 c c c8[ d] c[ b] \bar "" \break
  
  a8 c c8[( d c] b4) \bar "|"
  a8 b c a g a g f8[ e f]^- \bar "'"
  d8 e f g f a g g4 \bar "||"
  
  g8[ a g] f4( g) \bar "||"
}

alto = \relative c' {
  \global
  d4. c4 d e2
  f4 g2
  
  f4 e4. g4
  e8 g4 c, e s4.
  b8 c2~ c4 b
  
  c4. d2
}

tenor = \relative c' {
  \global
  b4. s2 s2
  s4 s2
  
  s4 a4 c8 d4
  c8 g4 s4 c4
  a4.
  s8 s4 s s s 
  e4. a4 b
}

bass = \relative c' {
  \global
 g8 g,4 a b c2 d4 e2
 
 f4 a4. g4
 a8 e4 f8[ e] c4 d4.
 g8 c,4 a f g
 
 c4. d4 g
}

verseOne = \lyricmode {
  \vOne
  Now that the day -- light fills the sky,
  We lift our hearts to God on high,
  That he, in all we do or say,
  Would keep us free from harm to -- day:
}

verseTwo = \lyricmode {
  \vTwo
  Would guard our hearts and tongues from strife;
  From an -- ger's din would hide our life;
  From all ill sights would turn our eyes;
  Would close our ears from van -- i -- ties:
}

verseThree = \lyricmode {
  \vThree
  Would keep our in -- most con -- science pure;
  Our souls from fol -- ly would se -- cure;
  Would bid us check the pride of sense
  With due and ho -- ly ab -- sti -- nence.
}

verseFour = \lyricmode {
  \vFour
  So we, when this new day is gone,
  And night in turn is draw -- ing on,
  With con -- science by the world un -- stained
  Shall praise his name for vic -- t'ry gained.
}

verseFive = \lyricmode {
  \vFive
 All laud to God the Fa -- ther be;
 All priase, e -- ter -- nal Son, to thee;
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
