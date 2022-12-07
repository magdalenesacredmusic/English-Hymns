\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {JOACHIM EST NATA  IRREG.}
    }
    \right-column{
      \line {proper Mode I plainsong}
      \line {Harm. "The Summit Choirbook," 1983}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Joachim est nata"}
      \line {Sequence for the Feast of St. Ann}
      \line {Tr. \italic "The Summit Choirbook," 1983}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  b8\rest e,8 g g a a g4 \hb
  a8 b g g e d g4 \bar "|"
  
  b8\rest e,8 g g a a g4 \hb
  a8 b g g e d g4 \bar "|"
  
  r8 b8 c a b4( g) \hb 
  b8 b c b a b a4( g) \bar "|"
  
  r8 b8 c a b4( g) \hb 
  b8 b c b a b a4( g) \bar "|"
  
  b4 g8 e g a fs4 \hb \break
  g4 fs8 d fs g e4 \bar "||"
  
  %verse 2
  g8 a b b a4 \hb
  b8 d a b a4 \bar "|"
  
  g8 a b b a4 \hb
  b8 d a b a4 \bar "|"
  
  a8 b g e fs8[ g] a4 \bar "|"
  a8 b g e fs8[ g] a4 \bar "|"
  
  b4 g8 e g a fs4 \hb
  g4 fs8 d fs g e4 \bar "||"
  
  %verse 3
  r8 g8 b a g a b4 \hb
  a8 b a b d c4 b \bar "|"
  
  r8 g8 b a g a b4 \hb
  a8 b a b d c4 b \bar "|"
  
  a8 b a g a4 g \hb
  a8 b g e fs e4 d \bar "|"
  
  a'8 b a g a4 g \hb
  a8 b g e fs e4 d \bar "|"
  
  b'4 g8 e g a fs4 \hb
  g4 fs8 d fs g e4 \bar "||"
  
  %verse 4
  b'8\rest e,8 g4 a8 b a g a b g4 e \bar "|"
  b'8\rest e,8 g4 a8 b a g a b g4 e \bar "|"
  
  a8 b a g e fs e d e4 \bar "|"
  a8 b a g e fs e d e4 \bar "|"
  
  g4 e8[ fs] e g g fs e d4 \hb 
  g8[ fs] a b g fs d fs8[ g] e e4 \bar "|"
  
  e8[ fs e] d4( e) \bar "||"
}

alto = \relative c' {
  \global
  s4 e2~ e4~
  e4 d2~ d4
  
  s4 e2~ e4~
  e4 d2~ d4
  
  e2~ e2~
  e2 c4 d2
  
  e2~ e2~
  e2 c4 d2
  
  g4 g8 e c4 d~
  d4~ d2 b4
  
  %verse 2
  g'4~ g2~ 
  g4 fs2
  
  g4~ g2~ 
  g4 fs2
  
  fs4 e2 fs4
  fs4 e2 fs4
  
  d2 e4 fs4
  g4 fs8 d fs g e4
  
  %verse 3
  d4~ d2~ d4~
  d8~ d2 a'4 fs
  
  d4~ d2~ d4~
  d8~ d2 a'4 fs
  
  d2~ d4~ d4~
  d8~ d2~ d4~ d
  
  d2~ d4~ d4~
  d8~ d2~ d4~ d
  
  d2 e4 d4~
  d4~ d2 b4
  
  %verse 4
  s2. s1
  s1 s4
  
  s2. s1
  s1 s4
  
  e4~ e4.~ e4~ e4 d4~
  d4.~ d4~ d4~ d4. b4
  
  c4. a4( b)
  
}

tenor = \relative c' {
  \global
  b4~ b c b4~
  b4~ b a b
  
  b4~ b c b4~
  b4~ b a b
  
  b a g2~
  g4 a2~ a4( b)
  
  b a g2~
  g4 a2~ a4( b)
  
  b2 c4 d4~
  d4 a2 g4
  
  %verse 2
  s2.
  s2.
  
  s2.
  s2.
  
  s1
  s1
  
  s1
  s1
  
  %verse 3
  b4~ b2~ b4~
  b8~ b2 e4 d
  
  b4~ b2~ b4~
  b8~ b2 e4 d
  
  d2 a4 b4~
  b8~ b2 a
  
  d2 a4 b4~
  b8~ b2 a
  
  g2~ g4 d'4~
  d4 a2 g4
  
  %verse 4
  s4 e'2~ e2~ e2
  s4 e2~ e2~ e2
  
  e2~ e4 d e
  e2~ e4 d e
  
  b4~ b4. c4~ c4 a4~
  a4.~ a4~ a4~ a4. g4~
  
  g4. fs4( g)
  
}

bass = \relative c {
  \global
 e4~ e2~ e4~
 e4 g fs g
 
 e4~ e2~ e4~
 e4 g fs g
 
 e2~ e2~
 e4~ e2 fs4( g)
 
 e2~ e2~
 e4~ e2 fs4( g)
 
 e2~ e4 d4~
 d4~ d2 e4
 
 %verse 2
 e'4~ e2~
 e4 d2
 
 e4~ e2~
 e4 d2
 
 d4 e2 d4
 d4 e2 d4
 
 g,2 c4 d4~
 d2~ d4 e
 
 %verse 3
 g,4~ g2~ g4~
 g8~ g2 a4 b
 
 g4~ g2~ g4~
 g8~ g2 a4 b
 
 fs2~ fs4 g4~
 g8~ g2 fs2
 
 fs2~ fs4 g4~
 g8~ g2 fs2
 
 g2 c,4 d4~
 d4~ d2 e4
 
 %verse 4
 d4\rest e'2 d c
 d,4\rest e'2 d c
 
 c2~ c4 d e
 c2~ c4 d e

 e,4~ e4. e4~ e fs4~
 fs4.~ fs4~ fs4 d4. e4
 c4. fs4( e)
}

verseOne = \lyricmode {
  \set stanza = "1."
  To Jo -- a -- chim is born
  Bless -- ed daugh -- ter of the morn.
  From An -- na did a -- rise
  Sea -- star, splen -- dor of the skies.
  The pro -- phet's word now be -- gins to come to pass,
  And to the world shall sal -- va -- tion come at last.
  
  O hap -- py Jo -- a -- chim!
  O hap -- py moth -- er Anne!
  
  \set stanza = "2."
  Now the drag -- on's neck trod up -- on shall be,
  When th'Im -- mac -- u -- late Vir -- gin earth shall see:
  Bright -- test star of morn -- ing,
  Rose our land a -- dorn -- ing.
  
  O hap -- py Jo -- a -- chim!
  O hap -- py moth -- er Anne!
  
  \set stanza = "3."
  Now Jes -- se's rod of old has blos -- somed af -- ter a -- ges:
  Most won -- drous bear -- ing fruit, the prom -- is -- es of sag -- es.
  Par -- ents of Christ's moth -- er,
  All bril -- liant shine their prais -- es;
  Bright as ne'er an -- oth -- er, 
  Such mer -- its and such grac -- es.
  
  O hap -- py Jo -- a -- chim!
  O hap -- py moth -- er Anne!

  \set stanza = "4."
  And now may both Jo -- a -- chim and An -- na,
  And too their most ho -- ly child Ma -- ri -- a,
  Bring us safe -- ly by their gra -- cious plea
  To Christ's king -- dom where the bless -- ed be;
  Where now is reign -- ing with her Son
  Jo -- a -- chim and An -- na's lit -- tle one.
  A -- men.
}

verseTwo = \lyricmode {
  \vTwo

}

verseThree = \lyricmode {
  \vThree

}

verseFour = \lyricmode {
  \vFour

}

\book {
  \include "hymn_paper_multipage.ly"
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
#(define output-suffix "Hymnal")
\book {
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  \top
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
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
