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
          \line {WESTMINSTER ABBEY  87 87 87}
      }
      \column{
      \line {Henry Purcell, arr. E. Hawkins (1802-1868)}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {\italic "Angularis fundamentum"}
     \line {tr. J.M. Neale, 1851}
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
  b2 d4 |
  b2 g4 |
  c2 a4 |
  fs2 d4 |
  g2 a4 |
  b4.( a8) g4 | \break
  fs e2 |
  d2. |

  fs2 a4 |
  fs2 d4 |
  g2 a4 |
  b2 g4 | \break
  c2 b4 |
  a4.( b8) g4 |
  g8[ fs] fs2 |
  e2. |

  gs2 gs4 |
  a2 a4 |  \break
  fs2 fs4 |
  g2 g4 |
  e2 e4 |
  fs2 g4 |
  g2 fs4 |
  g2. \bar "|."
}

alto = \relative c' {
  \global
   d2 d4 |
   d2 d4 |
   e2 e4 |
   d2 a4 |
   d2 c4 |
   b( d) cs |
   d2 cs4 |
   d2. | 
   
   d2 e4 |
   d2 a4 |
   b2 c4 |
   d2 d4 |
   e( fs8[ g]) fs4 |
   e8[( d] e4) b4 |
   c b2 |
   b2. |
   
   e2 e4 |
   e2 e4 |
   d2 d4 |
   d2 d4 |
   c2 c4 |
   d( c) b |
   a2 a8[ b16 c] |
   b2. |
}

tenor = \relative c' {
  \global
    g2 a4 |
    b2 b8[ a] |
    g2 a4 |
    a2 fs4 |
    b2 fs4 |
    g4.( fs8) e4 |
    fs8[ g] a4( g) |
    fs2. |
    a2 a4 |
    a2 fs4 |
    d4.( g8) fs4 |
    g2 b4 |
    g2 a8[ b] |
    c4( e,) ds |
    e2 ds4 |
    e2. |
    
    b'2 b4 |
    a2 a4 |
    a2 a4 |
    g2 g4 |
    g2 a4 |
    a2 g4 |
    fs8[( e] d4) d4 |
    d2.
}

bass = \relative c' {
  \global
  g2 fs4 |
  g2 g8[ fs] |
  e2 c4 |
  d2 d8[ c] |
  b2 a4 |
  g4.( d'8) e4 |
  d4 a2 |
  d2. |

  d2 cs4 |
  d2 d8[ c] |
  b2 a4 |
  g2 g'4 |
  e2 d4 |
  c2 b4 |
  a4 b2 |
  e2. |

  e2 d4 |
  cs2 cs4 |
  d2 c4 |
  b2 b4 |
  c2 a4 |
  d2 g4 |
  d2 d4 |
  g,2.

}

verseOne = \lyricmode {
  \set stanza = "1."
  Christ is made the sure foun -- da -- tion
  And the pre -- cious Cor -- ner -- stone,
  Who, the two -- fold walls sur -- mount -- ing,
  Binds them close -- ly in -- to one:
  Ho  -- ly Si -- on's help for ev -- er,
  And her con -- fi -- dence a -- lone.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  All that de -- di -- ca -- ted ci -- ty,
  Dear -- ly lov'd by God on high,
  In ex -- ult -- ant ju -- bi -- la -- tion
  Pours per -- pet -- ual me -- lo -- dy;
  God the One and God the Tri -- nal
  Sing -- ing ev -- er -- last -- ing -- ly.
}

verseThree = \lyricmode {
  \set stanza = "3."
  To this tem -- ple, where we call Thee
  Come, O Lord of Hosts, to -- day!
  With Thy won -- ted lov -- ing --  kind -- ness
  Hear Thy peo -- ple as they pray;
  And Thy ful -- lest be -- ne -- dic -- tion
  Shed with -- in its walls for aye.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Here vouch -- safe to all Thy ser -- vants
  That they sup -- pl -- icate to gain,
  Here to have and hold for ev -- er
  Those good things their pray'rs ob -- tain:
  And here -- af --t er in Thy glo -- ry
  With Thy bless -- ed ones to reign.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Laud and ho -- nour to the Fa -- ther
  Laud and ho -- nour to the Son;
  Laud and ho -- nour to the Spir -- it;
  Ev -- er Three, and ev -- er One:
  Con -- sub -- stan -- tial, co -- e -- ter -- nal,
  While un -- end -- ing a -- ges run.
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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
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
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
