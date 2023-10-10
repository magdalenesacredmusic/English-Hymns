\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: George Herbert (1593-1632)
      }
      \wordwrap {
        Music: LUCKINGTON, Irreg., Basil Harwood (1859-1949), 1908
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {LUCKINGTON, Irreg.}
    }
    \right-column{
      \line {Basil Harwood (1859-1949), 1908}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {George Herbert (1593-1632)}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 
  fs2 a 
  d2. d,4
  e b' a g 
  fs2 a 
  b e, 
  cs'2. \bar "" \break
  d4 
  b g e cs' 
  d2 d 
  b4 g e cs' 
  d2 \bar "" \break a
  fs4 d b e
  cs2 a'
  fs4 d b e 
  cs2 \bar "" \break b'4\rest d,4 
  fs2 a 
  d2. d,4 
  e b' a g 
  fs2 d'
  e a, 
  d2. \bar "|."
}

alto = \relative c' {
  \global
  a4 
  d2 e
  fs2. d4
  d d d cs 
  d2 e 
  fs e 
  e2. d4
  d d d e 
  d2 d 
  d4 d d e 
  d2 e
  d4 a b b
  a2 e'
  d4 a b b 
  a2 s4 a4
  b2 cs 
  d2. d4
  d4 d cs e
  d2 a'
  b a4( g)
  fs2.
}

tenor = \relative c {
  \global
  fs4 
  a2 cs 
  d2. a4
  b g e' a, 
  a2 a 
  a gs 
  a2. a4
  g b a g 
  fs2 a
  g4 b a g
  fs2 a
  a4 a a gs
  e2 a
  a4 a a gs
  e2
  s4
  fs4
  d2 e 
  a2. a4
  b g e a
  a2 d
  d cs
  d2.
}

bass = \relative c {
  \global
 d4
 d2 cs 
 b2. fs'4
 g e a a 
 d,2 cs
 d e
 a,2. fs'4
 g e a a, 
 d2 fs
 g4 e a a,
 d2 cs
 d4 fs e e 
 a,2 cs
 d4 fs e e 
 a,2 d4\rest d4
 b2 a 
 fs2. fs'4 
 g e a, cs 
 d2 fs 
 g a 
 d,2.
}

verseOne = \lyricmode {
  \vOne
  Let all the world in ev -- 'ry cor -- ner sing,
  My God and King!
  The heav'ns are not too high,
  His priase my thith -- er fly;
  The earth is not too low,
  His prais -- es there may grow.
  Let all the world in ev -- 'ry cor -- ner sing,
  My God and King!
}

verseTwo = \lyricmode {
  \vTwo
Let all the world in ev -- 'ry cor -- ner sing,
  My God and King!
  The Church with psalms must shout,
  No door can keep them out;
  But a -- bove all, the heart
  Must bear the long -- est part.
  Let all the world in ev -- 'ry cor -- ner sing,
  My God and King!
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
      %\new Lyrics  \lyricsto soprano \verseThree
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
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
     % \new Lyrics  \lyricsto soprano \verseThree
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
     % \new Lyrics \lyricsto "tune" { \verseThree }
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