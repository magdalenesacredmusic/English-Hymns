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
      \line {JESUS, MEINE ZUVERSICHT  78 78 77}
    }
    \right-column{
      \line {\italic "Praxis Pietatis Melica;" by Johann Crüger, 1653}
      \line {harm. after \italic "The Chorale Book for England," 1863}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Greek; tr. John Brownlie, 1907}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key c \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g4 e a b |
  c c b2 |
  a4 c g e |
  \time 6/4 f e d2 c2 \bar "||"

  \time 4/4
  g'4 e a b |
  c c b2 |
  a4 c g e |
  \time 6/4 f e d2 c2 \bar "||" \break

  \time 4/4 e4^\markup { \italic Refrain: } fs gs a |
  a gs a2 |
  b4 c d e |
  d d c2 \bar "|."
}

alto = \relative c' {
  \global
  e8[ d] c4 c f |
  e e e2 |
  c4 c d c8[ b] |
  a[ b] c4 c( b) c2 |

  e8[ d] c4 c f |
  e e e2 |
  c4 c d c8[ b] |
  a[ b] c4 c( b) c2 |

  c4 d d e |
  f! e8[ d] c2 |
  e4 e f g |
  a g8[ f] e2 
}

tenor = \relative c' {
  \global
  c4 g \once \override NoteColumn #'force-hshift = #1.0 f d' |
  c a a( gs) |
  a g g g |
  f g a( g) e2 

  c'4 g \once \override NoteColumn #'force-hshift = #1.0 f d' |
  c a a( gs) |
  a g g g |
  f g a( g) e2 

  a4 a b c |
  b b a2 |
  gs4 a b c |
  c b c2 |
}

bass = \relative c {
  \global
  c4 c f8[ e] d4 |
  a8[ b] c[ d] e2 |
  f4 e b c |
  d e f( g) c,2 |

  c4 c f8[ e] d4 |
  a8[ b] c[ d] e2 |
  f4 e b c |
  d e f( g) c,2 |

  a4 d8[ c] b4 a |
  d e f2 |
  e4 a4 g!8[ f] e4 |
  f g c,2 |
}

verseOne = \lyricmode {
  \set stanza = "1."
  \tagIt Let Thy Blood in mer -- cy poured,
  Let thy gra -- cious Bod -- y bro -- ken,
  \tagIt Be to me, O gra -- cious Lord
  Of Thy bound -- less love the to -- ken;
  Thou didst give Thy -- self for me,
  Now I give my -- self to Thee. A -- men.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Thou didst die that I might live;
  Bles -- sed Lord Thou cam’st to save me;
  All that love of God could give,
  Je -- sus by His sor -- rows gave me;
}

verseThree = \lyricmode {
  \set stanza = "3."
  By the thorns that crowned Thy brow,
  By the spear -- wound and the nail -- ing;
  By the pain and death I now
  Claim, O Christ, Thy love un -- fail -- ing;
}

verseFour = \lyricmode {
  \set stanza = "4."
  Wilt Thou own the gift I bring?
  All my pen -- i -- tence I give Thee;
  Thou art my ex -- alt -- ed King,
  Of Thy match -- less love for -- give me;
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
        tempoWholesPerMinute = #(ly:make-moment 88 4)
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




