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
      \line {ALL SAINTS  87 87 77}
    }
    \right-column{
      \line {adpated from \italic "Darmstadt Gesangbuch," 1698}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Wer sind die vor Gottes Throne"}
      \line {T.H. Schenk, 1719; tr. F.E. Cox, 1841, 1864}
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

melody = \relative c'' {
  \global
  c4 g a a |
  g4. f8 e4 c |
  g' a8[ b] c4 b |
  a a g2 \bar "||"

  c4 g a a |
  g4. f8 e4 c |
  g' a8[ b] c4 b |
  a a g2 \bar "||"

  d'4 d d c8[ d] |
  e4 d8[ c] d2 |
  c4 g a8[ b] c4 |
  d d c2 \bar "|."
}

alto = \relative c' {
  \global
  e4 g f f |
  d b c c |
  d d c d |
  e d b2 |

  e4 g f f |
  d b c c |
  d d c d |
  e d b2 |

  g'4 a g g |
  g g g2 |
  g4 e f g |
  a g8[ f] e2 \bar "|."
}

tenor = \relative c' {
  \global
  g4 c c d |
  g, g g e |
  g fs8[ g] g4 g |
  g fs g2 |

  g4 c c d |
  g, g g e |
  g fs8[ g] g4 g |
  g fs g2 |

  b4 d8[ c] b4 c8[ b] |
  c4 b8[ c] b2 |
  c4 c c c |
  c b c2 \bar "|."
}

bass = \relative c {
  \global
  c4 e f d8[ c] |
  b4 g c c |
  b d8[ g] e4 d |
  c d g,2 |

  c4 e f d8[ c] |
  b4 g c c |
  b d8[ g] e4 d |
  c d g,2 |

  g'4 fs g8[ f] e[ d] |
  c4 g'8[ e] g2 |
  a4 e f a |
  f g c,2 \bar "|."

}

verseOne = \lyricmode {
  \set stanza = "1."
  Who are these, like stars ap -- pear -- ing,
  These be -- fore God’s throne who stand?
  Each a gold -- en crown is wear -- ing;
  Who are all this glo -- rious band?
  Al -- le -- lu -- ia! Hark, they sing,
  Prais -- ing loud their heav’n -- ly King.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Who are these of dazz -- ling bright -- ness,
  These in God’s own truth ar -- rayed,
  Clad in robes of pur -- est white -- ness,
  Robes whose lus -- ter ne’er shall fade,
  Ne’er be touched by time’s rude hand-
  Whence come all this glo -- rious band?
}

verseThree = \lyricmode {
  \set stanza = "3."
  These are they who have con -- tend -- ed
  For their Sa -- vior’s ho -- nor long,
  Wrest -- ling on till life was end -- ed,
  Foll' -- wing not the sin -- ful throng;
  These who well the fight sus -- tained,
  Tri -- umph through the Lamb have gained.
}

verseFour = \lyricmode {
  \set stanza = "4."
  These are they whose hearts were riv -- en,
  Sore with woe and an -- guish tried,
  Who in prayer full oft have striv -- en
  With the God they glo -- ri -- fied;
  Now, their pain -- ful con -- flict o’er,
  God has bid them weep no more.
}

verseFive = \lyricmode {
  \set stanza = "5."
  These, like priests, have watched and wait -- ed,
  Off' -- ring up to Christ their will;
  Soul and bo -- dy con -- se -- cra -- ted,
  Day and night to serve Him still:
  Now in God’s most ho -- ly place
  Blest they stand be -- fore His face.
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
        tempoWholesPerMinute = #(ly:make-moment 92 4)
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

