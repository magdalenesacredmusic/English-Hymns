\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Polish Carol; Paraphrased by Edith M.G. Reed (1885-1933), ca. 1925
      }
      \wordwrap {
        Music: W ZLOBIE LEZY, 87 87 88 77, Traditional Polish melody; Arr. in \italic "The Kingsway Carol Book," 1946
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {W ZLOBIE LEZY, 87 87 88 77}
    }
    \right-column{
      \line {Traditional Polish melody}
      \line {Arr. in \italic "The Kingsway Carol Book," 1946}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Polish Carol}
      \line {Paraphrased by Edith M.G. Reed, ca. 1925}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d8 d g4 g 
  fs8 g a4 a 
  b8 c d4 c 
  b8 a g2 \bar "" \break
  d8 d g4 g 
  fs8 g a4 a 
  b8 c d4 c 
  b8 a g2 \bar "" \break
  
  g8 fs e4 e 
  a8 g fs4 fs 
  b8 a g4 g 
  c8 b a4 a \bar "" \break
  b8 c d4 c
  b8 a g2
  b8 c d4 c 
  b8 a g2 \bar "|."
}

alto = \relative c' {
  \global
  b8 c
  d4 d d8 d 
  d4 fs fs8 e
  d4 e fs8 fs
  d2
  
  b8 c 
  d4 d d8 d 
  e4 fs g8 g8 
  g4 g fs8 fs8
  d2
    d8 d
    d4 c e8 e
    e4 d fs8 fs
    fs4 e g8 g 
    g4 fs
      g8 g
    g4 g fs8 fs
    fs4( e) g8 g
    g4 g fs8 fs
    d2
}

tenor = \relative c' {
  \global
  g8 a
  b4 b a8 b
  a4 d b8 g
  g4 g d'8 c
  c4( b)
  
  g8 a
  b4 b a8 b
  c4 c d8 e
  d4 e d8 c
  b2
  g8 g 
  g4 g c8 c 
  a4 a d8 d
  b4 b e8 e 
  e4 d
  d8 e
  d4 e d8 c
  b2 d8 e
  d4 e d8 c
  b2
}

bass = \relative c' {
  \global
 g8 g 
 g4 g g8 g 
 fs4 d d8 c
 b4 c d8 d g2
 g8 g 
 
 g4 g g8 g 
 g4 g g8 e
 b4 c d8 d
 g2
 
 b,8 b
 c4 c8[ b] a8 a
 d4 d8[ c] b8 d
 e4 e8[ d] c c 
 d4 d 
 
 g8 e 
 b4 c d8 d 
 e2 g8 e
 b4 c d8 d 
 g2
}

verseOne = \lyricmode {
  \vOne
  In -- fant ho -- ly, in -- fant low -- ly,
  For his bed a cat -- tle stall;
  Ox -- en low -- ing, lit -- tle know -- ing
  Christ the babe is Lord of all.
  Swift are wing -- ing an -- gels sing -- ing,
  No -- els ring -- ing, ti -- dings bring -- ing:
  Christ the babe is Lord of all!
  Christ the babe is Lord of all!
}

verseTwo = \lyricmode {
  \vTwo
  Flocks were sleep -- ing; shep -- herds keep -- ing
  Vig -- il till the morn -- ing new
  Saw the glo -- ry, heard the sto -- ry,
  Ti -- dings of the gos -- pel true.
  Thus re -- joic -- ing, free from sor -- row,
  Praise -- es voic -- ing greet the mor -- row:
  Christ the babe was born for you!
  Christ the babe was born for you!
}

verseThree = \lyricmode {
  \vThree

}

verseFour = \lyricmode {
  \vFour

}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
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
  %\top
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
    \include "hymn_hymnal_layout.ly"
  }    
  \refs
  %\bottom
}
%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  %  \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}