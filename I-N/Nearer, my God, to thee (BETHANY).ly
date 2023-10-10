\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Sarah Adams (1805-1848), 1841
      }
      \wordwrap {
        Music: BETHANY, 64 64 6664, Lowell Mason (1792-1872), 1856
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {BETHANY, 64 64 6664}
    }
    \right-column{
      \line {Lowell Mason, 1856}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Sarah Adams, 1841}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a2 g4 f |
  f4. d8 d2 |
  c2 f4 a |
  g1 |
  
  a2 g4 f 
  f4. d8 d2
  c4( f) e g 
  f1
  
  c'2 d4 c 
  c4. a8 c2 \break
  c2 d4 c 
  c4. a8 g2
  a2 g4 f
  f4. d8 d2
  c4( f) e g
  f1

\bar "|."
}

melodya = \relative c'' {
  \global
  a2 g4 f |
  f4. d8 d2 |
  c2 f4 a |
  g1 |
  
  a2 g4 f 
  f4. d8 d2
  c4( f) e g 
  f1
  
  c'2 d4 c 
  c4. a8 c2 %\break
  c2 d4 c 
  c4. a8 g2
  a2 g4 f
  f4. d8 d2
  c4( f) e g
  f1

\bar "|."
}

alto = \relative c' {
  \global
  c2 bf4 a
  d4. bf8 bf2
  c2 c4 c
  c1
  
  c2 bf4 a
  d4. bf8 bf2
  a4( c) c c 
  c1
  
  f2 f4 f 
  f4. f8 f2
  
  f2 f4 f 
  g4. c,8 c2
  c2 c4 c 
  d4. bf8 bf2
  a4( c) c c 
  c1
}

tenor = \relative c {
  \global
  f2 e4 f
  bf4. f8 f2
  a f4 f 
  e1
  
  f2 e4 f
  bf4. f8 f2
  f4( a) g bf
  a1
  
  a2 bf4 a
  a4. c8 a2
  
  a2 bf4 a
  g4. f8 e2
 
  f2 e4 f
  bf4. f8 f2
  f4( a) g bf
  a1
}

bass = \relative c {
  \global
 f2 c4 d
 bf4. bf8 bf2
 f2 a4 f
 c'1
 
 f2 c4 d
 bf4. bf8 bf2
 c c4 c
 f1
 
 f2 f4 f 
 f4. f8 f2
 f2 bf,4 f'
 e4. f8 c2
 
 f,2 g4 a 
 bf4. bf8 bf2
 c2 c4 c 
 f,1
}

verseOne = \lyricmode {
  \vOne
  Near -- er, my God, to thee,
  Near -- er to thee!
  E'en though it be a cross
  That rais -- eth me;
  Still all my song would be,
  
}

verseTwo = \lyricmode {
  \vTwo
  Though like the wan -- der -- er,
  The sun gone down,
  Dark -- ness be o -- ver me,
  My rest a stone;
  Yet in my dreams I'd be
  
}

verseThree = \lyricmode {
  \vThree
  There let the way ap -- pear
  Steps un -- to heav'n;
  All that thou send -- est me
  In mer -- cy giv'n;
  An -- gels to beck -- on me
  \vOff
  Near -- er, my God, to thee,
  Near -- er, my God, to thee,
  Near -- er to thee.
}

verseFour = \lyricmode {
  \vFour
  Then, with my wak -- ing thoughts
  Bright with thy praise,
  Out of my ston -- y griefs
  Beth -- el I'll raise;
  So by my woes to be
}

verseFive = \lyricmode {
  \vFive
  Or if on joy -- ful wing,
  Cleav -- ing the sky,
  Sun, moon, and stars for -- got,
  Up -- wards I fly,
  Still all my song shall be,
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
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
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}
