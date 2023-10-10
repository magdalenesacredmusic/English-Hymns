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
        Music: ST. BOTOLPH  CM, Gordon Slater (1896-1979), © 1929 Oxford University Press
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
  \key ef \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  ef4 |  \noBreak
  g2 ef4 |  \noBreak
  bf'2 g4 |  \noBreak
  f( ef) d | \noBreak
  ef2 %\bar "" %\break
  
  f4 |  \noBreak
  g2 bf4 |  \noBreak
  c( bf) af |  \noBreak
  bf2 \bar "" \break 
  
  bf4 |
  c2 d4 |
  ef( d) c |
  bf( c) af |
  bf4( g) f |
  ef2 g4 |
  f( ef) f |
  ef2  \bar "|."
}

alto = \relative c' {
  \global
  ef4 |
  ef2 ef4
  ef( d) ef
  c2 bf4 
  ef2
  
  bf4 
  ef2 ef4 
  ef2 c4
  d2 ef4
  af2 af4 
  g2 af4
  bf( ef,2) 
  ef4( c) d 
  ef2 d4
  c2 d4
  ef2
}

tenor = \relative c' {
  \global
  g4
  bf2 af4
  bf2 ef,4
  f2 bf4
  bf( af)
  
  bf4
  bf2 bf4 
  af2 c4
  bf2 bf4 
  ef2 f4 
  ef2 ef4
  ef2 c4
  bf2 af4
  g2 ef4
  f2 af4
  g2
}

bass = \relative c {
  \global
 ef4
 ef( d) c 
 bf2 c4
 af2 bf4 
 c2
 
 d4
 ef( f) g
 af2 f4
 bf2 g4
 af4( g) f 
 c'( bf) af
 g( af) f
 g( bf,) bf 
 c2 bf4
 af2 bf4 
 ef2
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