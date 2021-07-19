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
  cs,( d) e e |
  fs8[ gs] a4 b b |
  cs2. \bar "" \break
  
    e,4 |
    a gs8[ fs] e4 a |
    cs,( d) e e |
    fs8[ gs] a4 a gs | 
    a2.  \bar "" \break
    
      a8[ b] |
      cs4 b cs d |
      b( gs8[ a]) b4 a8[ b] |
      cs4 b cs d |
      b2.  \bar "" \break
      
        e,4 |
        a gs8[ fs] e4 a |
        cs,( d) e e |
        fs8[ gs] a4 a gs |
        a2.
\bar "|."
}

melodya = \relative c' {
  \global
  \partial 4
  \global
  \partial 4
  e4 |
  a gs8[ fs] e4 a |
  cs,( d) e e |
  fs8[ gs] a4 b b |
  cs2. \bar ""
  
    e,4 |
    a gs8[ fs] e4 a |
    cs,( d) e e |
    fs8[ gs] a4 a gs | 
    a2.  \bar ""
    
      a8[ b] |
      cs4 b cs d |
      b( gs8[ a]) b4 a8[ b] |
      cs4 b cs d |
      b2.  \bar ""
      
        e,4 |
        a gs8[ fs] e4 a |
        cs,( d) e e |
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
   a( fs) gs a |
   a a a gs |
   a2.
   
      e4 |
        a gs8[ fs] e4 a |
        a( fs) gs a |
        a a b b | 
        cs2.
        
        a4 |
        a b a a |
        gs( e8[ fs]) gs4 cs8[ b] |
        a4 b a a |
        gs2.
        
         e4 |
        a gs8[ fs] e4 a |
        a( fs) gs a |
        a a b b |
        cs2.
}

bass = \relative c {
  \global
 \partial 4
  e4 |
   a gs8[ fs] e4 cs |
   fs2 e4 a, |
   d cs d e |
   a2.
   
    e4 |
        a gs8[ fs] e4 cs |
        fs2 e4 a, |
        d fs e e |
        a,2. 
        
        a4 |
        a' gs a d, | 
        e2 e4 fs8[ gs] |
        a4 gs a d, | 
        e2. 
        
         e4 |
        a gs8[ fs] e4 cs4 |
        fs2 e4 a, |
        d fs e e |
        a,2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Hail to the Lord's A -- noint -- ed!
  Great Da -- vid's great -- er Son;
  Hail, in the time ap -- point -- ed,
  His reign on eath be -- gun!
  He comes to break op -- pres -- sion,
  To set the cap -- tive free;
  To take a -- way trans -- gres -- sion,
  And rule in e -- qui -- ty.
}

verseTwo = \lyricmode {
  \set stanza = "2."
He comes with suc -- cor speed -- y
To those who suf -- fer wrong;
To help the poor and need -- y,
and bid the weak be strong;
To give them songs for sigh -- ing,
Their dark -- ness turn to light,
Whose souls, con -- demned and dy -- ing,
Were pre -- cious in his sight.
}

verseThree = \lyricmode {
  \set stanza = "3."
He shall come down like show -- ers
Up -- on the fruit -- ful earth,
And love, joy, hope, like flow -- ers,
Spring in his path to birth:
Be -- fore him on the moun -- tains
Shall peace the her -- ald go;
And right -- eous -- ness in foun -- tains
From hill to val -- ley flow.
}

verseFour = \lyricmode {
  \set stanza = "4."
Kings shall fall down be -- fore him,
And gold and in -- cense bring;
All na -- tions shall a -- dore him,
His praise all peo -- ple sing;
To him shall prayer un -- ceas -- ing
And dai -- ly vows as -- cend;
His king -- dom still in -- creas -- ing,
A king -- dom with -- out end.
}

verseFive = \lyricmode {
  \set stanza = "5."
  O'er ev -- 'ry foe vic -- to -- rious,
  He on his throne shall rest,
  From age to age more glo -- rious,
  All -- bless -- ing and all -- blest:
  The tide of time shall nev -- er
  His cov -- e -- nant re -- move;
  His name shall stand for ev -- er;
  That name to us is Love.
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
  \bottom
}
