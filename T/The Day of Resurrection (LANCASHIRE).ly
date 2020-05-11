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
          \line {LANCASHIRE 76 76 D}
      }
      \column{
      \line {Henry T. Smart, 1836}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {Greek, St. John of Damascus, c. 750}
     \line {Tr. John Mason Neale, 1853}
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

melody = \relative c' '{
  \global
  \partial 4
  g4 |
  g e f a |
  g2 e4 c' |
  c f, g a |
  d,2. 
  
    g4 |
    g e f a |
    g2 e4 e | 
    d b' a fs4 |
    g2. 
    
      g4 |
      g e c c' |
      c4.( a8) f4 a |
      a fs d d' |
      d2( b4) 
      
        g4 |
        c c c c |
        c2 b4 a |
        g e d b |
        \partial 2. c2. \bar "|."
}

alto = \relative c' {
   \global
  \partial 4 
  c4 |
  c c c c |
  c2 c4 e |
  f c c c |
  b2. 
  
    b4 |
    c c c c |
    c2 c4 c |
    b d c c |
    b2. 
    
      b4 |
      c4 c g e' |
      f2 c4 cs |
      d d a fs' |
      g2. 
      
        d4 |
        g, c d e |
        f2 c4 c |
        c c g g |
        g2.
}
tenor = \relative c {
  \global
  \partial 4
  e4 |
  e g a f |
  e2 g4 g |
  f c' b a |
  g2.
  
    f4 |
    e bf' a f |
    e2 g4 g |
    g g fs a |
    g2.
     
       f4 |
       e bf' bf bf |
       a4.( c8) a4 g |
       fs4 c' c c |
       b2( d4)
       
         b4 |
         c g a bf |
         c2 c4 f, |
         e g f d |
         e2.
}

bass = \relative c {
  \global
  \partial 4 
  c4 |
  c c c c |
  c2 c4 bf |
  a a g f |
  g2. 
  
    g4 |
    c c c c |
    c2 c4 c |
    d d d d |
    g,2. 
    
      g4 |
      c g' e c |
      f,2 f'4 e |
      d a' fs d |
      g,2( g'4) 
      
        f4 |
        e e f g |
        a2 f4 f, |
        g g g g |
        c2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  The day of re -- sur -- rec -- tion!
  Earth, tell it out a -- broad;
  The Pass -- o -- ver of glad -- ness,
  The Pass -- o -- ver of God.
  From death to life e -- ter -- nal,
  From earth un -- to the sky,
  Our Christ hath brought us o -- ver
  With hymns of vic -- to -- ry.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Our hearts be pure form e -- vil,
  That we may see a -- right
  The Lord in rays e -- ter -- nal 
  Of re -- sur -- rec -- tion light;
  And, list -- 'ning to his ac -- cents,
  May hear so calm and plain
  His own “All hail!” and, hear -- ing,
  May raise the vic -- tor strain.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Now let the heav'ns be joy -- ful,
  Let earth her song be -- gin,
  The round world keep high tri -- umph,
  And all that is there -- in;
  Let all things seen and un -- seen
  Their notes to -- geth -- er blend,
  For Christ the Lord is ris -- en,
  Our joy that hath no end.
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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 110 4)
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
