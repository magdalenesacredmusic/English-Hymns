\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Giesù sommo conforto," Girolamo Savonarola (1452-98); Tr. Jane Francesca Wilde (1826-96)
      }
      \wordwrap {
        Music: O DU LIEBE MEINER LIEBE 87 87 D, Johann Thommen's \italic "Christenschatz," 1745
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {O DU LIEBE MEINER LIEBE   87 87 D}
    }
    \right-column{
      \line {Johann Thommen's \italic "Christenschatz," 1745}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Giesù sommo conforto"}
      \line {Girolamo Savonarola (1452-98)}
      \line {Tr. Jane Francesca Wilde (1826-96)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 2
  g4 a |
  b d c b |
  a a b a |
  g a g fs |
  g2 \bar "" \break
  
  g4 a |
  b d c b |
  a a b a |
  g a g fs |
  g2 \bar ""
  
  fs4 g |
  a a g fs |
  e e fs g |
  a b c b |
  a2 \bar ""
  
  g4 a |
  b d c b |
  a a b a |
  g a g fs |
  g2 \bar "|."
}

alto = \relative c' {
  \global
  d4 fs |
  g g g g |
  g fs g fs |
  e e d d |
  d2
  
  d4 fs |
  g g g g |
  g fs g fs |
  e e d d |
  d2
  
  d4 b |
  e d d8[ cs] d4 |
  d cs d d |
  e8[ fs] g4 g8[ fs] g4 |
  fs2
  
  e4 d |
  d fs g g |
  g fs g g8[ fs] |
  e4 e d d |
  d2
}

tenor = \relative c' {
  \global
  b4 d |
  d d e d |
  d d d d8[ c] |
  b4 c b a |
  b2
  
  b4 d |
  d d e d |
  d d d d8[ c] |
  b4 c b a |
  b2
  
  a4 g |
  e fs g a |
  a a a b |
  c d c d |
  d2
  
  b4 a |
  g a e' d |
  d d d d |
  b c b a |
  b2
}

bass = \relative c' {
  \global
 g4 d |
 g b, c g |
 d' d g d |
 e a, b8[ c] d4 |
 g2
 
 g4 d |
 g b, c g |
 d' d g d |
 e a, b8[ c] d4 |
 g2
 
 d4 e |
 cs d e d |
 a a d b |
 a g a b8[ c] |
 d2 
 
 e4 fs |
 g d e8[ fs] g4 |
 d d g d |
 e a, b8[ c] d4 |
 g2
}

verseOne = \lyricmode {
  \vOne
  Je -- sus, ref -- uge of the wea -- ry,
  Ob -- ject of the spir -- it's love,
  Foun -- tain in life's des -- ert drear -- y,
  Sav -- ior from the world a -- bove;
  O how oft thine eyes, of -- fend -- ed,
  Gaze up -- on the sin -- ner's fall;
  Yet up -- on the Cross ex -- tend -- ed,
  Thou didst bear the pain of all.
}

verseTwo = \lyricmode {
  \vTwo
  Do we pass that Cross un -- heed -- ing,
  Breath -- ing no re -- pent -- ant vow,
  Though we see thee wound -- ed bleed -- ing,
  See thy thorn -- en -- cir -- cled brow?
  Yet thy sin -- less death hath brought us
  Life e -- ter -- nal, peace, and rest;
  On -- ly what thy grace hath taught us
  Calms the sin -- ner's storm -- y breast.
}

verseThree = \lyricmode {
  \vThree
  Je -- sus, may our hearts be burn -- ing
  With more fer -- vent love for thee;
  May our eyes be ev -- er turn -- ing
  To thy Cross of a -- gon -- y;
  Till in glo -- ry, part -- ed nev -- er
  From the bless -- èd Sav -- ior's side,
  Grav -- en in our hearts for -- ev -- er,
  Dwell the Cross, the Cru -- ci -- fied.
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
     % \new Lyrics \lyricsto soprano \verseFour
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
      %\new Lyrics \lyricsto soprano \verseFour
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
     % \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}