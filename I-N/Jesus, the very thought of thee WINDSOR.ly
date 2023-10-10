%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/
%}

\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Jesu dulcis memoria," St. Bernard, 11th cent.; Tr. Edward Caswall (1814-78)
      }
      \wordwrap {
        Music: WINDSOR, CM, melody William Damon (c. 1540-91), alt.; Harm. \italic "Booke of Musicke," 1591; rhythm after \italic "The Scottish Psalter," 1633
      }
    }
  }
}

refsA = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Jesu dulcis memoria," St. Bernard, 11th cent.; Tr. Edward Caswall (1814-78)
      }
      \wordwrap {
        Music: WINDSOR, CM, melody from \italic "Damon's Psalter," 1591; rhythm after \italic "The Scottish Psalter," 1633
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {ST. AGNES  CM}
    }
    \right-column{
      \line {John Bacchus Dykes, 1866}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Jesu dulcis memoria"}
      \line {St. Bernard, 11th cent.; tr. Edward Caswall}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key bf \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
 g'2 g4 a  
 bf a g g 
 fs2 bf 
 d4 c bf a 
 \time 2/4 bf2 
 
 \time 4/4 bf2 d4 c 
 bf a g g  
 fs2 bf2 
 a4 g g fs! 
 g2 \bar "|."
}

alto = \relative c' {
  \global
  d2 d4 f
  f f ef ef
  d2 d
  f4 g f f 
  f2
  
  d2 f4 ef
  d d bf ef
  d2 d
  d4 ef ef d 
  d2
}

altoA = \relative c' {
  \global
  d2 d4 d 
  d d d d
  d2 d
  f4 f f4. ef8
  d2
  
  f2 f4 f 
  d d bf ef
  d2 f
  f4 d ef d 
  d2
}

tenor = \relative c' {
  \global
  bf2 bf4 c
  d d bf c 
  a2 bf
  bf4 ef d c 
  d2
  
  bf2 bf4 g
  g f g c
  a2 g
  a4 bf c a
  bf2
}

tenorA = \relative c' {
  \global
  bf2 bf4 a
  g fs g bf
  a2 bf
  bf4 a d c
  bf2
  
  d2 bf4 a
  g f g c
  a2 d
  c4 bf c a 
  bf2
}

bass = \relative c {
  \global
g'2 g4 f
bf, d ef c
d2 g2
d4 ef f f
bf,2

bf'2 bf,4 c
g d' ef c 
d2 g2
f4 ef8[ d] c4 d
g,2
}

bassA = \relative c' {
  \global
  g2 g4 fs
  g d bf g
  d'2 bf
  bf4 f' d f
  bf,2
  
  bf2 bf'4 f
  g d ef c
  d2 bf
  f'4 g c, d
  g,2
}

verseOne = \lyricmode {
  \vOne
  Je -- sus, the ve -- ry thought of Thee
  With sweet -- ness fills my breast;
  But sweet -- er far Thy face to see,
  And in Thy pre -- sence rest.
}

verseTwo = \lyricmode {
  \vTwo
  Nor voice can sing, nor heart can frame,
  Nor can the mem' -- ry find,
  A sweet -- er sound than Thy blest name,
  O Sa -- viour of man -- kind!
}

verseThree = \lyricmode {
  \vThree
  O hope of ev' -- ry con -- trite heart,
  O joy of all the meek,
  To those who fall, how kind Thou art!
  How good to those who seek!
}

verseFour = \lyricmode {
  \vFour
  But what to those who find? Ah! this
  Nor tongue nor pen can show;
  The love of Je -- sus! what it is,
  None but his loved ones know.
}


verseFive = \lyricmode {
  \vFive
  Je -- sus, our on -- ly joy be Thou,
  As Thou our prize wilt be;
  Je -- sus, be Thou our glo -- ry now,
  And through e -- ter -- ni -- ty.
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
  
  
  \score { %\transpose c bf,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \altoA }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      \new Lyrics \lyricsto soprano \verseFour
      \new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenorA }
        \new Voice = "bass" { \voiceTwo \bassA }
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
  \refsA
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
  \markup {
    \vspace #2
  }
  %\bottom
  
  \score { %\transpose c bf,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \altoA }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      \new Lyrics \lyricsto soprano \verseFour
      \new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenorA }
        \new Voice = "bass" { \voiceTwo \bassA }
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
  \refsA
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
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}