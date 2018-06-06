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
      \line {NEANDER (UNSER HERRSCHER  87 87 87}
    }
    \right-column{
      \line {Jacob Neander, 1680}
      \line {harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {J. Hupton and J.M. Neale}
    }
  } 
}


\paper {
  page-count = 1
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  c4. d8 e4 c |
  e4 f g g |
  c4 b8[ a] g4 e' | \break
  d d c2 \bar "||"

  c,4. d8 e4 c |
  e4 f g g | \break
  c4 b8[ a] g4 e' |
  d d c2 \bar "||"

  e4. e8 d4 d |
  c4. c8 b4 b |
  a4. a8 g4 c |
  d b c2 \bar "|."
}

alto = \relative c' {
  \global
  c4. b8 c4 c |
  c c d d |
  c d e g |
  a g e2 |

  c4. b8 c4 c |
  c c d d |
  c d e g |
  a g e2 |

  g4. g8 g4 g |
  e4. e8 e4 e |
  c4 b c e |
  d d e2
}

tenor = \relative c {
  \global
  e4. g8 g4 g |
  a c c b |
  a b c c |
  c b c2 |

  e,4. g8 g4 g |
  a c c b |
  a b c c |
  c b c2 |

  c4. c8 c4 b |
  \mergeDifferentlyDottedOn a4. a8 a4 gs |
  a f g a |
  a g g2
}

bass = \relative c {
  \global
  c4. g8 c4 e |
  a a g g |
  a g8[ f] e4 c |
  f g c,2 |

  c4. g8 c4 e |
  a a g g |
  a g8[ f] e4 c |
  f g c,2 |

  c4 e8[ f] g4 g |
  a c,8[ d] e4 e |
  f d e a |
  f g c,2

}

verseOne = \lyricmode {
  \set stanza = "1."
  Come, ye faith -- ful, raise the an -- them,
  Cleave the skies with shouts of praise;
  Sing to Him who found the ran -- som,
  An -- cient of e -- ter -- nal days,
  God e -- ter -- nal, Word in -- car -- nate,
  Whom the heav'n of heav'n o -- beys.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Ere he raised the loft -- y moun -- tains,
  Formed the sea, or built the sky,
  Love e -- ter -- nal, free, and bound -- less,
  Forced the Lord of life to die,
  Lift -- ed up the Prince of prin -- ces
  On the throne of Cal -- va -- ry.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Now on those e -- ter -- nal moun -- tains
  Stands the sap -- phire throne, all bright,
  With the cease -- less al -- le -- lu -- ias
  Which they raise, the sons of light;
  Si -- on's peo -- ple tell his prais -- es,
  Vic -- tor af -- ter hard -- won fight.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Bring your harps, and bring your in -- cense,
  Sweep the string and pour the lay;
  Let the earth pro -- claim His won -- ders,
  King of that ce -- les -- tial day;
  He the Lamb once slain is wor -- thy,
  Who was dead, and lives for ay.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Laud and ho -- nour to the Fa -- ther,
  Laud and ho -- nour to the Son,
  Laud and ho -- nour to the Spir -- it,
  Ev -- er Three and ev -- er One,
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
        tempoWholesPerMinute = #(ly:make-moment 96  4)
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
