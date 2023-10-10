\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Horatio G. Spafford (1828-88), 1873
      }
      \wordwrap {
        Music: VILLE DU HAVRE, 11 8 11 9 with refrain, Philip P. Bliss (1838-76), 1876
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {VILLE DU HAVRE  11 8 11 9 with refrain}
    }
    \right-column{
      \line {Philip P. Bliss, 1876}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Horatio G. Spafford, 1873}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  g4 g2 f4 e 
  e2 d4 e 
  f( a) g f |
  e2. \bar "" \break
  
  g4 |
  c2 b4 a |
  a2 g4 fs 
  g2. g4 |
  c2 c4 b 
  a2 a4 a 
  d2 d4 c |
  b2 a4 g |
  c2 c4 c |
  
  c2 b4. c8 |
  c2 \bar "||" \break
  
    g4 g |
  g1~ |
  g2 g4 g |
  g1~ |
  g2 \bar "" 
  e4 g |
  a2 a4 c |
  c2 b4. c8 |
  c2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  e4 |
  e2 d4 c 
  c2 b4 c 
  b2 b4 d 
  c2.
  
  e4 
  e2 d4 c |
  e2 d4 d 
  d2. f4 |
  e2 e4 g
  f2 a4 g |
  f2 f4 fs 
  g2 g4 g 
  g2 c,4 d 
  e2 d4. e8 |
  e2
  
  r2 |
  r2 e4 e 
  d2 r2 
  r2 d4 f 
  e2
  
  c4 e 
  f2 f4 f 
  e2 d4. e8 
  e2.
}

tenor = \relative c' {
  \global
  \partial 4
  g4 |
  g2 g4 g 
  g2 g4 g 
  g2 g4 g 
  g2.
  
  g4 |
  a2 gs4 a 
  c2 b4 a 
  b2. b4 |
  c2 c4 c |
  c2 c4 cs |
  d2 d4 d |
  d2 c4 b |
  c2 g4 a |
  g2 g4. g8 |
  g2
  
  s2 |
  s2 g4 c |
  b2 s2 |
  s2 b4 d |
  c2
  
  g4 c |
  c2 c4 a |
  g2 g4. g8 |
  g2.
}

bass = \relative c {
  \global
 \partial 4
 c4 |
 c2 c4 c8[ e] |
 g2 f4 e |
 d2 g,4 g |
 c2.
 
 c4 |
 a2 b4 c |
 c2 d4 d |
 g,2. g'4 |
 c,2 c4 e |
 f2 f4 e |
 d2 d4 d |
 g2 g4 g8[ f] |
 e2 e4 f |
 g2 g,4. g8 |
 c2 
 
 d2\rest |
 d2\rest c4 e |
 g2 d2\rest 
 d2\rest g,4 g |
 c2 
 
 c4 c |
 f2 f4 f |
 g2 g,4. g8 |
 c2.
}

verseOne = \lyricmode {
  \vOneL
  %\set stanza = "1."
  When peace, like a riv -- er, at -- tend -- eth my way,
  When sor -- rows like sea bil -- lows roll;
  What -- ev -- er my lot, thou hast taught me to say,
      It is well, it is well with my soul.
}

verseTwo = \lyricmode {
  \vTwoL
  %\set stanza = "2."
  Thou Sa -- tan should buf -- fet, though tri -- als should come,
  Let this blest as -- sur -- ance con -- trol,
  That Christ has re -- gard -- ed my help -- less es -- tate,
  and hath shed his own blood for my soul.
  
  \vOff
  It is well with my soul,
  it is well, it is well with my soul.
 
}

verseThree = \lyricmode {
  \vThreeL
  %\set stanza = "3."
  My sin, oh, the bliss of this glo -- ri -- ous thought!
  My sin, not in part but the whole,
  Is nailed to the cross, and I bear it no more,
  Praise the Lord, praise the Lord, O my soul!
  
}

verseFour = \lyricmode {
  %\vFour
  \vFourL
  And, Lord, haste the day when my faith shall be sight,
  The clouds be rolled back as a scroll;
  The trump shall re -- sound and the Lord shall de -- scend,
  E -- ven so, it is well with my soul.
}

harmRef = \lyricmode {
  _ _ _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _ 
  _ _ _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _ _ 
  
  It is well with my soul
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
      \new Lyrics  \lyricsto alto \harmRef
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
      \new Lyrics  \lyricsto alto \harmRef
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