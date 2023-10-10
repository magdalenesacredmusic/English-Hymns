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
        Text: Charles Wesley (1707-88), 1747
      }
      \wordwrap {
        Music: BLAENWERN, 87 87 D, William Rowlands (1860-1937)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {BLAENWERN  87 87 D}
    }
    \column{
      \line {William Rowlands (1860-1937)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Charles Wesley, 1747}
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
  d2 d4 |
  e2 e4 |
  d( g) b |
  b2 a4 |
  g2 fs4 |
  e2 d4 |
  d( fs) e |
  d2. |
  
  d2 d4 |
  e2 e4 |
  d( g) b |
  b2 a4 |
  g2 a4 |
  b( c) a |
  g2 fs4 |
  g2. |
  
  b2 b4 |
  b( g) b |
  c( b) a |
  b2 b4 |
  d2 d4 |
  d( b) d |
  e( d) cs |
  d2. |
  
  e2 c4 |
  d2 b4 |
  d( c) b |
  b2 a4 |
  g2 a4 |
  b( c) a |
  g2 fs4 |
  g2. \bar "|."
  
}

alto = \relative c' {
  \global
  b2 b4 |
  c2 c4 |
  b( d) d |
  d2 d4 |
  b( e) ds |
  e2 b4 |
  a( d) cs |
  d2. |
  
  b2 b4 |
  c2 c4 |
  b( d) d |
  d2 d4 |
  b2 d4 |
  d( e) e |
  d2 d4 |
  d2. |
  
  d2 ds4 |
  e2 g4 |
  g2 fs4 |
  g2 g4 |
  g2 fs4 |
  g2 a4 |
  g( fs) e8[ g] |
  fs2. |
  
  g2 fs4 |
  g2 g4 |
  a2 g4 |
  g2 fs4 |
  g2 fs4 |
  g2 e4 |
  d2 d4 |
  d2.
}

tenor = \relative c' {
  \global
  g2 g4 |
  g2 g4 |
  g( b) g |
  g2 fs4 |
  g( b) a |
  g2 g4 |
  fs( a) g |
  fs2. |
  
  g2 g4 |
  g2 g4 |
  g( b) g |
  g2 fs4 |
  g2 fs4 |
  g2 a4 |
  b2 a8[ c] |
  b2. |
  
  b2 a4 |
  g( b) d |
  e( d) d |
  d2 d4 |
  d2 c4 |
  b( d) a |
  b( a) a |
  a2. |
  
  c2 c4 |
  b2 d4 |
  d2 d4 |
  d2 d4 |
  d( e) c |
  d( g,) c4 |
  b2 a8[ c] |
  b2.
}

bass = \relative c {
  \global
  g2 g4 |
  g2 g4 |
  g2 g4 |
  d'2 d4 |
  e2 b4 |
  c2 b4 |
  a2 a4 |
  d2. |
  
  g,2 g4 |
  c2 c4 |
  g2 g4 |
  d'2 d4 |
  e2 d4 |
  g( c,) c |
  d2 d4 |
  g,2. |
  
  g'2 fs4 |
  e2 d4 |
  c( d) d |
  g2 g4 |
  b2 a4 |
  g2 fs4 |
  e a a, |
  d2. |
  
  c'2 a4 |
  b2 g4 |
  fs2 g4 |
  d2 d4 |
  b'( c) a |
  g( e) c |
  d2 d4 |
  g,2.
}

verseOne = \lyricmode {
  \vOneL
  Love di -- vine, all loves ex -- cel -- ling,
  Joy of heav'n to earth come down;
  Fix in us thy hum -- ble dwel -- ling;
  All thy faith -- ful mer -- cies crown!
  Je -- sus, thou art all com -- pas -- sion,
  Pure un -- bound -- ed love thou art;
  Vis -- it us with thy sal -- va -- tion;
  En -- ter ev' -- ry tremb -- ling heart.
}

verseTwo = \lyricmode {
  \vTwoL
  Come, Al -- migh -- ty to de -- liv -- er,
  Let us all thy life re -- ceive;
  Sud -- den -- ly re -- turn and nev -- er,
  Nev -- er more thy tem -- ples leave.
  Thee we would be al -- ways bles -- sing,
  Serve thee as thy hosts a -- bove,
  Pray and praise thee with -- out ceas -- ing,
  Glo -- ry in thy per -- fect love.
}

verseThree = \lyricmode {
  \vThreeL
  Fin -- ish, then, thy new cre -- a -- tion;
  Pure and spot -- less let us be.
  Let us see thy great sal -- va -- tion
  Per -- fect -- ly re -- stored in thee;
  Changed from glo -- ry in -- to glo -- ry,
  Till in heav'n we take our place,
  Till we cast our crowns be -- fore thee,
  Lost in won -- der, love, and praise.
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