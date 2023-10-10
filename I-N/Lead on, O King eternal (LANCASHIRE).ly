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
        Text: Ernest Warburton Shurtleff, 1862-1917
      }
      \wordwrap {
        Music: LANCASHIRE, 76 76 D, Henry T. Smart (1813-79), 1836
      }
    }
  }
}

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
     \line {Ernest Warburton Shurtleff, 1862-1917 }
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
  d,2.  \bar "" \break
  
    g4 |
    g e f a |
    g2 e4 e | 
    d b' a fs4 |
    g2.  \bar "" \break
    
      g4 |
      g e c c' |
      c4.( a8) f4 a |
      a fs d d' |
      d2( b4)  \bar "" \break
      
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
  \vOneL
  Lead on, O King e -- ter -- nal, 
    The day of march has come;
  Hence -- forth in fields of con -- quest 
    Thy tents shall be our home:
  Through days of prep -- a -- ra -- tion 
    Thy grace has made us strong,
  And now, O King e -- ter -- nal, 
    We lift our bat -- tle song.
}

verseTwo = \lyricmode {
  \vTwoL
  Lead on, O King e -- ter -- nal,
    Till sin's fierce war shall cease,
  And ho -- li -- ness shall whis -- per
    The sweet a -- men of peace;
  For not with swords loud clash -- ing,
    Nor roll of stir -- ring drums,
  But deeds of love and mer -- cy,
    The heav'n -- ly king -- dom comes.
}

verseThree = \lyricmode {
  \vThreeL
  Lead on, O King e -- ter -- nal:
    We fol -- low, not with fears;
  For glad -- ness breaks like morn -- ing
    Wher -- e'er thy face ap -- pears.
  Thy cross is lift -- ed o'er us;
    We jour -- ney in its light:
  The crown a -- waits the con -- quest;
    Lead on, O God of might!
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