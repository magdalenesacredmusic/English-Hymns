%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \line {
         Text: \italic "Gloria, laus, et honor," Palm Sunday Procession; Tr. J.M. Neale, \italic "Hymns Ancient and Modern"
      }
      \wordwrap {
        Music: ST. THEODULPH, 76 76 D, Melchior Teschner; Harm. J.S. Bach, adapt.
      }
    }
  }
}

top = \markup {
\fill-line {
      \column {
          \line {ST. THEODULPH   76 76 D}
      }
      \column{
      \line {Melchior Teschner; harm. J.S.Bach, adapt.}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {\italic "Gloria, laus, et honor"}
     \line {"Palm Sunday Procession, tr. J.M. Neale,"}
     \line {\italic "Hymns Ancient and Modern"}
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

melody = \relative c' {
  \global
  \partial 4
c4 |
    g' g a b |
    c2 c4 \bar ""

    e |
    d c c b |
    c2. \bar "" \break

    c,4 |
    g' g a b |
    c2 c4 \bar "|"

    e |
    d c c b |
    c2. ^\markup { \italic Fine.} \bar "|."
 \break

  c4 |
  e4 e d c |
  b4( a4) g \bar ""

  b4 |
  c b a a |
  g2. \bar ""

  g4 |
  e4 g4 a g |
  g( f) e \bar ""

  g4 |
  f e d d |
  c2. ^\markup { \italic D.C. }\bar "||"
}

alto = \relative c' {
  \global
  \partial 4

    g4 |
    c e f e |
    e2 e4 

    a |
    a f e d |
    e2.


 g,4 |
    c e f e |
    e2 e4 

    a |
    a f e d |
    e2.
    
  e8[ f] |
  g4 a a fs |
  g4( fs) d 

  g |
  g g g fs |
  d2.

  d4 |
  c8[ d] e4 f e |
  e( d) c 

  c4 |
  c c c b |
  g2.
}

tenor = \relative c {
  \global
  \partial 4

    e4 |
    g c c b |
    a2 a4 

    c4 |
    a a g g |
    g2.

e4 |
    g c c b |
    a2 a4 

    c4 |
    a a g g |
    g2.

  g4 |
  c c d d |
  d4( c) b 

  d4 |
  c d e d8[ c] |
  b2. 

  g4 |
  g c c bf |
  a2 a4 

  e |
  f g a g8[ f] |
  e2. 
}

bass = \relative c {
  \global
  \partial 4
    c4 |
    e c f gs, |
    a2 a4 

    a'4 |
    f d g g, |
    c2.
 
  c4 |
    e c f gs, |
    a2 a4 

    a'4 |
    f d g g, |
    c2.

  c4 |
  c'8[ b] a[ g] fs4 d4 |
  g2 g,4 

  f'!4 |
  e d c d |
  g,2. 

  b4 |
  c bf a8[ b] cs4 |
  d2 a4 

  bf4 |
  a g fs g |
  c2. 
}

verseOne =  \lyricmode {
    \override LyricText #'font-shape = #'italic
    All glo -- ry, laud, and hon -- our
    To thee, Re -- dee -- mer, King,

    To whom the lips of chil -- dren
    Made sweet ho -- san -- nas ring.
    
\revert Lyrics.LyricText.font-shape
\vOneL
Thou art the King of Is -- rael,
Thou Da -- vid's roy -- al Son,
Who in the Lord's name com -- est,
The King and Bles -- sèd One.
}

verseTwo = \lyricmode {
  _ _ _ _ _ _ _
  _ _ _ _ _ _
    _ _ _ _ _ _ _
  _ _ _ _ _ _
  \vTwoL
  The com -- pa -- ny of An -- gels
  Are prais -- ing thee on high,
  And mor -- tal men and all things
  Cre -- a -- ted make re -- ply.
}

verseThree = \lyricmode {
  _ _ _ _ _ _ _
  _ _ _ _ _ _
    _ _ _ _ _ _ _
  _ _ _ _ _ _
  \vThreeL
  The peo -- ple of the He -- brews
  With palms to meet thee went:
  Our praise and pray'r and an -- thems
  Be -- fore thee we pre -- sent.
}

verseFour = \lyricmode {
    _ _ _ _ _ _ _
  _ _ _ _ _ _
    _ _ _ _ _ _ _
  _ _ _ _ _ _
  \vFourL
  To thee be-- fore thy Pas -- sion
  They sang their hymns of praise;
  To thee now high ex -- alt -- ed
  Our mel -- o -- dy we raise.
}

verseFive = \lyricmode {
    _ _ _ _ _ _ _
  _ _ _ _ _ _
    _ _ _ _ _ _ _
  _ _ _ _ _ _
  \vFiveL
  Thou didst ac -- cept their prais -- es,
  Ac -- cept the praise we bring,
  Who in all good de -- light -- est,
  Thou good and gra -- cious King.
}

%%%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  %\top
  \score { \transpose c bf,
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
  %\bottom
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
  \score { \transpose c bf,
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
 % \top
  \score {
    \transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour}
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \refs
 % \bottom
}
