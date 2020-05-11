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
      \line {NEANDER (UNSER HERRSCHER) 87 87 87}
    }
    \right-column{
      \line {J. Neander, 1680}
      \line {harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Tibi, Christe, splendor Patris"}
      \line {Rabus Maurus, 9th cent.; tr. J.M. Neale}
    } 
  }
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
  c4 b8[ a] g4 e' |
  d d c2 \bar "||"

  c,4. d8 e4 c |
  e4 f g g |
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
  Thee, O Christ, the Fa -- ther's splen -- dour,
  Life and vir -- tue of the heart,
  In the pre -- sence of the An -- gels
  Sing we now with tune -- ful art,
  Meet -- ly in al -- ter -- nate cho -- rus
  Bear -- ing our re -- spon -- sive part.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Thus we praise with ve -- ner -- a -- tion
  All the ar -- mies of the sky;
  Chief -- ly him, the war -- rior Pri -- mate,
  Of ce -- les -- tial chiv -- al -- ry,
  Mi -- chael, who in prince -- ly vir -- tue
  Cast Ab -- ad -- don from on high.
}

verseThree = \lyricmode {
  \set stanza = "3."
  By whose watch -- ful care re -- pel -- ling—
  King of ev -- er -- last -- ing grace—
  Ev -- 'ry ghost -- ly ad -- ver -- sa -- ry,
  All things e -- vil, all things base,
  Grant us of Thine on -- ly good -- ness
  In Thy Par -- a -- dise a place.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Laud and ho -- nour to the Fa -- ther,
  Laud and ho -- nour to the Son,
  Laud and ho -- nour to the Spir -- it,
  Ev -- er Three, and ev -- er One,
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
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}