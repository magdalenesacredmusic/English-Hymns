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
        Text: Walter Chalmers Smith (1824-1908), 1867; Alt. traditional
      }
      \wordwrap {
        Music: ST. DENIO, 11 11 11 11, Welsh Melody, in John Roberts's \italic "Caniadau y Cyssegre," 1839
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {ST. DENIO  11 11 11 11}
    }
    \right-column{
      \line {Welsh Melody}
      \line {in John Roberts's \italic "Caniadau y Cyssegre," 1839}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Walter Chalmers Smith, 1867, alt. traditional}
      \line {}
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

melody = \relative c'' {
  \global
  \partial 4
  g |
  e c a' |
  fs d g |
  b b a |
  g2 \bar "" \break
  g4 |
  e c a' |
  fs d g |
  b b a |
  g2 \bar "" \break
  
  g4 |
  b b d | 
  b g g |
  b b d |
  a2 \bar "" \break
  
  b4 |
  g e a |
  fs d g |
  b b a |
  g2 \bar "|."
}

alto = \relative c' {
  \global
  b4 |
  c c e |
  d d b |
  d d d8[ c] |
  b2 b4 |
  c c e |
  d d b |
  d d d8[ c] |
  b2 
  
  b4 |
 d4 d d |
 d d e |
 d d d |
 d2
 
 d4 |
 e c e |
 d d b |
 d d d8[ c] |
 b2
}

tenor = \relative c' {
  \global
  g4 |
  g e c' |
  a fs g |
  g g fs |
  g2 g4 |
  g e c' |
  a fs g |
  g g fs |
  g2
  
  g4 |
  g g a |
  b b b |
  b b g |
  fs2
  
  g4 |
  g g c |
  a fs g |
  g g fs |
  g2
}

bass = \relative c {
  \global
 g4 |
 c c a |
 d d e |
 d d d |
 g,2  g4 |
  c c a |
  d d e |
  d d d |
  g,2 
  
  g4 |
  g' g fs |
  g g e |
  g g b,8[ c] |
  d2 
  
  g,4 |
  c c a |
  d d e |
  d d d |
  g,2
}

verseOne = \lyricmode {
  \vOne
  Im -- mor -- tal, in -- vis -- i -- ble, God on -- ly wise,
  In light in -- ac -- ces -- si -- ble hid from our eyes,
  Most bless -- ed, most glo -- rious, the An -- cient of Days, 
  Al -- migh -- ty, vic -- to -- rious, thy great Name we praise.
}

verseTwo = \lyricmode {
  \vTwo
  Un -- rest -- ing, un -- hast -- ing, and si -- lent as light,
  Nor want -- ing, nor wast -- ing, thou rul -- est in might;
  Thy jus -- tice like moun -- tains high soar -- ing a -- bove
  Thy clouds, which are foun -- tains of good -- ness and love.
}

verseThree = \lyricmode {
  \vThree
  To all life thou giv -- est, to both great and small;
  In all life thou liv -- est, the true life of all;
  We bloss -- om and flour -- ish, like leaves on the tree,
  Then with -- er and per -- ish; but naught chang -- eth thee.
}

verseFour = \lyricmode {
  \vFour
  Great Fa -- ther of glo -- ry, pure Fa -- ther of light,
  Thine an -- gels a -- dore thee, all veil -- ing their sight;
  All laud we would ren -- der: O help us to see
  'Tis on -- ly the splen -- dor of light hid -- eth thee.
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