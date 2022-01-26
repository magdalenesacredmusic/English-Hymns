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
          \line {ST. CROSS  LM}
      }
      \column{
      \line {John B. Dykes, 1823-1876}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {Frederick W. Faber, 1814-1863}
   }
  } 
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f2 f4 g |
  a2. d4 |
  c2 bf |
  a1 |
  a2 a4 bf |
  c2 f, |
  a g f2. a4 |
  a2. a4 |
  g2 a |
  f g |
  e1 |
  
  d2^\markup {\italic Refrain} d4 d |
  a'2. g4 |
  f2 e |
  d1 \bar "|."
}

alto = \relative c' {
   \global
d2 d4 e |
f2. f4 |
f( c) d( e) |
f1 |
f2 e4 d |
c2 f |
f e |
f2. c4 |
c2. d4 |
d2 cs |
d e4( d) |
cs1 |

d2 d4 d |
a'2. d,4 |
d2 cs |
d1
}

tenor = \relative c' {
  \global
  a2 a4 c |
  c2. bf4 |
  a2. g4 |
  a1 |
  f2 f4 f |
  f( g) a( bf) |
  c2. bf4 |
  a2. a4 |
  a2. a4 |
  bf2 a |
  a bf |
  a1 |
  
  d,2 d4 d |
  a'2. bf4 |
  a2 g |
  f1
}

bass = \relative c {
  \global
  d2 d4 c |
  f2. bf,4 |
  c2 c |
  f1 |
  d2 c4 bf |
  a2 d |
  c c |
  f,2. f'4 |
  f2. f4 |
  e2 a, |
  d g, |
  a1 |
  
  d2 d4 d |
  a'2. g,4 |
  a2 a |
  d1
}

verseOne = \lyricmode {
  \set stanza = "1."
  O come and mourn with me a -- while;
  O come ye to the Sav -- ior's side;
  O come, to -- geth -- er let us mourn:
  

}

verseTwo = \lyricmode {
  \set stanza = "2."
  Sev'n times he spake, sev'n words of love;
  And all three hours his si -- lence cried
  For mer -- cy on the souls of men:
}

verseThree = \lyricmode {
  \set stanza = "3."
  O break, O break, hard heart of mine!
  Thy weak self -- love and built -- y pride
  His Pi -- late and his Ju -- das were:
  
    Je -- sus, our Lord, is cru -- ci -- fied!
}

verseFour = \lyricmode {
  \set stanza = "4."
  A bro -- ken heart, a fount of tears,
  Ask, and they will not be de -- nied;
  A bro -- ken heart love's cra -- dle is:
}

verseFive = \lyricmode {
  \set stanza = "5."
  O love of God! O sin of man!
  In this dread act your strength is tried,
  And vic -- to ry re -- mains with love:
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
        tempoWholesPerMinute = #(ly:make-moment 120 4)
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
