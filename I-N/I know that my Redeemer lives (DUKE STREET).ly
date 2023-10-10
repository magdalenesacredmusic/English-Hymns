\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Samuel Medley (1738-99)
      }
      \wordwrap {
        Music: DUKE STREET, LM, John Warrington Hatton (1710-1793)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {DUKE STREET, LM}
    }
    \right-column{
      \line {John Warrington Hatton (1710-1793)}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Samuel Medley (1738-99)}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 4/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d2 fs4 g 
  a2 b4( cs) 
  d2 cs4( b) 
  a1 
  
  a2 a 4 a 
  b2 a 
  g fs 
  e1 
  
  fs2 fs4 e 
  d( fs) a( d) 
  b( a) g( fs) 
  e1 
  
  a2 b4 cs 
  d2. g,4
  fs2 e
  d1

\bar "|."
}

melodya = \relative c' {
  \global
  d2 fs4 g 
  a2 b4( cs) 
  d2 cs4( b) 
  a1  \break
  
  a2 a 4 a 
  b2 a 
  g fs 
  e1  \break
  
  fs2 fs4 e 
  d( fs) a( d) 
  b( a) g( fs) 
  e1  \break
  
  a2 b4 cs 
  d2. g,4
  fs2 e
  d1

\bar "|."
}

alto = \relative c' {
  \global
  a2 d4 cs d2 d4( e) |
  fs2 e4( d) cs1 
  
  d2 cs4 d d2 d4( a) |
  b( cs) d2 cs1
  
  d2 d4 cs d2 fs4( d) 
  d2 cs4( d) cs1
  
  d2 d4 g fs2. e4
  d2 cs d1
}

tenor = \relative c {
  \global
  fs2 a4 a a2 g2
  a a4( gs) a1 
  fs2 g4 a g2 a
  e fs4( g) a1
  
  a2 a4 g fs4( a) d( a)
  b( fs) g( a) a1
  
  a2 g4 g a2. b4 
  a2 a4( g) fs1
}

bass = \relative c {
    \global
    d2 d4 e fs2 g4( e) 
    d2 e a,1
    
    d2 e4 fs g2 fs
    e d a1
    
    d2 d4 e fs2 d4( fs)
    g( fs) e( d) a1
    
    fs'2 g4 e d4.( e8 fs4) g
    a2 a, d1
}

%{ alto = \relative c' {
  \global
  a2 d4 d
  e2 g
  a g fs1
  
  d2 cs4 d d2. d4 
  cs2 d
  cs1
  
  d2 d4 cs d2 fs4( d) 
  d2 e4( d) cs1
  
  d2 d4 g fs2. e4
  d2 cs d1
}

tenor = \relative c' {
  \global
  fs,2 b4 b cs2 d4( e) 
  d2 d d1
  
  fs,2 g4 a d2. d4
  g,2 a a1
  
  a2 a4 g a2 a 
  b b cs1
  
  a2 g4 g a2. b4
  a2 g fs1
}

bass = \relative c {
  \global
 d2 b4 b a2 g'
 fs g d1
 d2 e4 fs g2. fs4 
 e2 d a1
 
 d2 d4 e fs2 d4( fs)
 g2 e a( g) 
 fs2 g4 e d4.( e8 fs4) g 
 a2 a, d1
} %}

verseOne = \lyricmode {
  \vOne
  I know that my Re -- deem -- er lives:
  What joy the blest as -- sur -- ance gives!
  He lives, he lives, who once was dead;
  He lives, my ev -- er -- last -- ing head!
}

verseTwo = \lyricmode {
  \vTwo
  He lives, to bless me with his love;
  He lives, to plead for me a -- bove;
  He lives, my hun -- gry soul to feed;
  He lives, to help in time of need.
}

verseThree = \lyricmode {
  \vThree
  He lives, and grants me dail -- y breath;
  He lives, and I shall con -- quer death;
  He lives, my man -- sion to pre -- pare;
  He lives, to bring me safe -- ly there.
}

verseFour = \lyricmode {
  \vFour
  He lives, all glo -- ry to his Name;
  He lives, my Sav -- ior, still the same;
  What joy the blest as -- sur -- ance gives:
  I know that my Re -- deem -- er lives!
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