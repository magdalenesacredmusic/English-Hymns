%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

%%%%%%%%%%%%%%%%%%
%{ this edition follows the arrangement in the English Hymnal, 1906.
Neale's original translation was comprised of six verses.
Here, the refrain is actually taken the last three lines of the original verse three. %}
%%%%%%%%%%%%%%%%%%

top = \markup {
\fill-line {
      \column {
          \line {ES IST EIN' ROS' ENTSPRUNGEN 76 76 676.}
      }
      \column{
      \line {German, harm. M. Praetorius}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {\italic "Μέγα χαί παράδοξον θαυμα"}
     \line {"St. Germanus, 734; tr. J.M. Neale, 1862, alt."}
   }
  } 
}

global = {
  \key f \major
  \cadenzaOn
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  c2 \bar "|"
  c4 c d c \bar "|"
  c2 a bf \bar "|"
  a4 g2 f e4 \bar "|"
  f2. \bar "||" \break

  c'2 \bar "|"
  c4 c d c \bar "|"
  c2 a bf \bar "|"
  a4 g2 f e4 \bar "|"
  f2. \bar "||" \break

  a4 \bar "|"
  g e f d \bar "|"
  c2. \bar "||"

  c'4 \bar "|"
  c c d c \bar "|" \break
  c2 a bf \bar "|"
  a4 g2 f e4 \bar "|"
  f2. \bar "|."
}

alto = \relative c'' {
  \global
  a2
  a4 f f f
  e2 d d
  c d4. a8 c2
  c2.

  a'2
  a4 f f f
  e2 d d
  c d4. a8 c2
  c2.

  f4
  d c c b
  c8[( d] e2)

  e4
  g f f f
  e2 d d
  f4 d( e) f( g) c,
  c2.
}

tenor = \relative c' {
  \global
  c2
  c4 a bf a
  g2 f f
  a4( c) bf a2 g4
  a2.

  c2
  c4 a bf a
  g2 f f
  a4( c) bf a2 g4
  a2.

  c4
  bf a a g
  g2.

  g4
  g a bf a
  g2 fs g
  c4 bf a2 g
  a2.
}

bass = \relative c {
  \global
  f2
  f4 f bf f
  c2 d bf
  f'4 e d2 c
  f2.

  f2
  f4 f bf f
  c2 d bf
  f'4 e d2 c
  f2.

  f4
  g a f g
  c,2.

  c4
  e f bf, f'
  c2 d g,
  a4 bf c2 c  << {\ignore \stemDown \override Stem #'length = #4.0  f2.} \\ {\teeny \override Stem #'length = #5.6 f,2. } >>

}

verseOne = \lyricmode {
  \set stanza = "1."
  A great and might -- y won -- der
  A full and ho -- ly cure!
  The Vir -- gin bears the In -- fant
  With vir -- gin -- hon -- our pure.

  \override LyricText #'font-shape = #'italic
  Re -- peat the hymn a -- gain:
  'To God on high be glo -- ry,
  And peace on earth to men!'
}

verseTwo = \lyricmode {
  \set stanza = "2."
  The Word be -- comes In -- car -- nate,
  And yet re -- mains on high:
  And Che -- ru -- bim sing an -- thems
  To shep -- herds from the sky.
}

verseThree = \lyricmode {
  \set stanza = "3."
  While thus they sing your Mon -- arch
  Those bright an -- gel -- ic bands,
  Re -- joice, ye vales and moun -- tains,
  Ye o -- ceans, clap your hands.
}

verseFour = \lyricmode {
  \set stanza = "3."
  Since all he comes to ran -- som,
  By all be he a -- dored,
  The In -- fant born in Beth’ -- lem,
  The Sa -- viour and the Lord.
}

verseFive = \lyricmode {
  \set stanza = "5."
  And i -- dol forms shall per -- ish,
  And er -- ror shall de -- cay,
  And Christ shall wield his scep -- tre;
  Our Lord and God for aye.
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