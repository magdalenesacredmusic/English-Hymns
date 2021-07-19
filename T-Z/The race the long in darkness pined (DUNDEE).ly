%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {DUNDEE  CM}
    }
    \column{
      \line {\italic "Scottish Psalter" 1615}
      \line {harm. Ravenscroft's \italic "Psalter," 1621}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {John Morison (1750-98)}
      \line {based on \smallCaps "Isaiah" 9:2-7}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key ef \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 2
  ef2 |
  g4 af bf ef, |
 \time 3/2 f g af2 
  
   g2 |
  \time 4/4 f4 ef ef d |
   ef2 \bar "" \break
   
   bf'2 |
   ef4 d c bf |
   \time 3/2 bf a bf2 
   
   g |
   \time 4/4 f4 ef ef d |
   ef2 \bar "|."
   
}

alto = \relative c' {
  \global
  bf2 
  ef4 ef bf bf
  df df ef2
  
  ef 
  d4 c c bf 
  bf2
  
  ef2 
  g4 f ef d 
  c c d2
  
  bf
  c4 g8[ af] bf4 bf 
  bf2
}

tenor = \relative c' {
  \global
  g2
  bf4 c f, g
  af bf c2
  bf 
  bf4 g af f 
  g2
  
  g
  bf4 bf g f 
  g f f2
  
  g2 
  af4 ef f f 
  g2
}

bass = \relative c {
  \global
  ef2
  ef4 c d ef
  df bf af2
  ef'
  bf4 c af bf
  ef2
  
  ef
  ef4 bf c d
  ef f bf,2
  ef2
  af,4 c bf bf 
  ef2
}

verseOne = \lyricmode {
  \set stanza = "1."
  The race that long in dark -- ness pined
  Have seen a glor -- ious light;
  The peo -- ple dwell in day, who dwelt 
  In death's sur -- round -- ing night.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  To hail thy rise, thou bet -- ter Sun,
  The gath'r -- ing na -- tions come,
  Joy -- ous as when the reap -- ers bear
  The har -- vest -- trea -- sures home.
}

verseThree = \lyricmode {
  \set stanza = "3."
  To us a Child of hope is born,
  To us a Son is given;
  Hom shall the tribes of earth o -- bey,
  Him all the hosts of heaven.
}

verseFour = \lyricmode {
  \set stanza = "4."
  His name shall be the Prince of Peace,
  For ev -- er -- m ore a -- dored;
  The Won -- der -- ful, the Coun -- sel -- lor,
  The great and might -- y Lord.
}

verseFive = \lyricmode {
  \set stanza = "5."
  His power in -- creas -- ing still shall spread;
  His reign no end shall know:
  Jus -- tice shall guard his throne a -- bove,
  And peace a -- bound be -- low.
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
      \new LYrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
