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
      \line {ELLACOMB  CMD}
    }
    \column{
      \line {\italic "Wittenburg Gesangbuch," 1784; arr. William H. Monk}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Isaac Watts (1674-1748), alt.}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key a \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  e4 |
  a gs8[ fs] e4 a |
  cs, d e e |
  fs8[ gs] a4 b b |
  cs2. \bar "" \break
  
    e,4 |
    a gs8[ fs] e4 a |
    cs, d e e |
    fs8[ gs] a4 a gs | 
    a2.  \bar "" \break
    
      a8[ b] |
      cs4 b cs d |
      b gs8[ a] b4 a8[ b] |
      cs4 b cs d |
      b2.  \bar "" \break
      
        e,4 |
        a gs8[ fs] e4 a |
        cs, d e e |
        fs8[ gs] a4 a gs |
        a2.
\bar "|."
}

melodya = \relative c' {
  \global
  \partial 4
  e4 |
  a gs8[ fs] e4 a |
  cs, d e e |
  fs8[ gs] a4 b b |
  cs2. \bar ""
  
    e,4 |
    a gs8[ fs] e4 a |
    cs, d e e |
    fs8[ gs] a4 a gs | 
    a2.  \bar "" 
    
      a8[ b] |
      cs4 b cs d |
      b gs8[ a] b4 a8[ b] |
      cs4 b cs d |
      b2.  \bar "" 
      
        e,4 |
        a gs8[ fs] e4 a |
        cs, d e e |
        fs8[ gs] a4 a gs |
        a2.
\bar "|."
}

alto = \relative c' {
  \global
  \partial 4 
  e4 |
  a gs8[ fs] e4 e |
  cs b8[ a] b4 cs |
  d e fs e |
  e2. 
  
    e4 |
    a4 gs8[ fs] e4 e |
    cs b8[ a] b4 cs |
    d cs8[ d] e4 e |
    e2. 
    
      cs8[ d] |
      e4 e e fs |
      e e e a8[ e] |
      e4 e e fs |
      e2. 
      
        e4 |
        a gs8[ fs] e4 e |
        cs b8[ a] b4 cs |
        d cs8[ d] e4 e |
        e2.
}

tenor = \relative c {
  \global
   e4 |
   a gs8[ fs] e4 a |
   a fs gs a |
   a a a gs |
   a2.
   
      e4 |
        a gs8[ fs] e4 a |
        a fs gs a |
        a a b b | 
        cs2.
        
        a4 |
        a b a a |
        gs e8[ fs] gs4 cs8[ b] |
        a4 b a a |
        gs2.
        
         e4 |
        a gs8[ fs] e4 a |
        a fs gs a |
        a a b b |
        cs2.
}

bass = \relative c {
  \global
 \partial 4
  e4 |
   a gs8[ fs] e4 cs |
   fs fs e a, |
   d cs d e |
   a2.
   
    e4 |
        a gs8[ fs] e4 cs |
        fs fs e a, |
        d fs e e |
        a,2. 
        
        a4 |
        a' gs a d, | 
        e e4 e fs8[ gs] |
        a4 gs a d, | 
        e2. 
        
         e4 |
        a gs8[ fs] e4 cs4 |
        fs fs e a, |
        d fs e e |
        a,2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  I sing the might -- y power of God
  That made the moun -- tains rise,
  That spread the flow -- ing seas a -- broad, 
  And built the loft -- y skies.
  
  I sing the wis -- dom that or -- dained 
  The sun to rule the day;
  The moon shines full at his com -- mand, 
  And all the stars o -- bey.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  I sing the good -- ness of the Lord
  That filled the earth with food;
  He formed the crea -- tures with his word,
  And then pro -- nounced them good.
  
  Lord, how thy won -- ders are dis -- played
  Wher -- e'er I turn my eye;
  If I sur -- vey the gound I tread,
  Or gaze up -- on the sky!
}

verseThree = \lyricmode {
  \set stanza = "3."
  There's not a plant or flower be -- low, 
  But makes thy glo -- ries known;
  And clouds a -- rise, and tem -- pests blow
  By or -- der from thy throne;
  
  While all that bor -- rows life from thee
  Is ev -- er in thy care,
  And ev -- 'ry -- where that man can be,
  Thou, God art pres -- ent there.
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
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      %\new Lyrics \lyricsto "tune" { \verseThree }
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
