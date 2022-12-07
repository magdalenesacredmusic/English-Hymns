%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Gelobet seist du, Jesu Christ," Martin Luther, 1524, from Latin and German trad.; Tr. Anon., 1858
      }
      \wordwrap {
        Music: CANONBURY, LM, Robert Schumann, 1839; adapt. \italic "Hymns with Tunes, Old and New," 1872
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {CANONBURY  LM}
    }
    \right-column{
      \line {Robert Schumann, 1839}
      \line { adapt. \italic "Hymns with Tunes, Old and New" 1872}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Gelobet seist du, Jesu Christ"}
      \line {"Martin Luther, 1524, from Latin and German trad.; tr. Anon. 1858"}
    }
  } 
}

global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  b' b b c8[ b] |
  a4 g8[ a] b4 d, |
  e fs \bar "" \break
  g a |
  fs e d d |
  b' b b c8[ b] | \break
  
  a4 b8[ a] b4 d, |
  e fs g b8[ a] |
  g4 fs g \bar "|."
}

melodya = \relative c' {
  \global
  \partial 4
  d4 |
  b' b b c8[ b] |
  a4 g8[ a] b4 \bar "" \break  d, |
  e fs 
  g a |
  fs e d \bar "" \break d |
  b' b b c8[ b] | 
  
  a4 b8[ a] b4  \bar "" \break d, |
  e fs g b8[ a] |
  g4 fs g \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 | 
  d ds e e |
  c4 c b d |
  c c d e |
  d cs d d |
  d ds e e |
  c c b d |
  c c d e |
  d d d
}

tenor = \relative c {
  \global
  \partial 4 
  d4 |
  b' a g a8[ g] |
  fs4 e8[ fs] g4 g |
  g a g e | 
  a g fs d |
  g fs gs a8[ g] |
  fs4 e8[ fs] g4 g |
  g a g gs8[ a] |
  b4 a b
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  g fs e a, |
  d d g, b |
  c a b cs |
  d a d d |
  g, b e a, |
  d d g, b |
  c a b c |
  d d g,
}


verseOne = \lyricmode {
  \vOne
  All praise to thee, e -- ter -- nal Lord,
  Clothed in a garb of flesh and blood;
  Choos -- ing a man -- ger for thy throne,
  while worlds on worlds are thine a -- lone.
}

verseTwo = \lyricmode {
  \vTwo
  Once did the skies be -- fore thee bow; 
  A vir -- gin's arms con -- tain thee now:
  An -- gels who did in thee re -- joice
  Now lis -- ten for thine in -- fant voice.
}

verseThree = \lyricmode {
  \vThree
  A lit -- tle child, thou art our guest,
  That wea -- ry ones in thee may rest;
  For -- lorn and low -- ly is thy birth,
  That we may rise to heav'n from earth.
}

verseFour = \lyricmode {
  \vFour
  Thou com -- est in the dark -- some night
  To make us chil -- dren of the light,
  To make us, in the realms di -- vine,
  Like thine own an -- gles round thee shine.
}

verseFive = \lyricmode {
  \vFive
  All this for us they love hath done;
  By this to thee our love is won:
  For this we tune our cheer -- ful lays,
  And shout our thanks in cease -- less praise.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  %\top
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
        tempoWholesPerMinute = #(ly:make-moment 84 4)
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
  %\top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melodya 
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
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
