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
      \line {ADORO TE (NO. 2) 65 65}
    }
    \right-column{
      \line {melody, Van Damme; \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {W.H.H. Jervois and W.B. Trevelyan, 1906}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key ef \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  bf4 af g g |
  af2 g |
  f4 bf bf a |
  bf1 \bar "||" \break

  bf4 af g g |
  bf2 g |
  f4 ef f4. ef8 |
  ef1 \bar "||" \break

  bf'4 bf g bf |
  c2 bf |
  af4 g f af |
  g1 \bar "||" \break

  bf4 g af bf |
  c2 bf |
  af4 g f4. ef8 |
  ef1
}

alto = \relative c' {
  \global
  ef4 c ef ef |
  c2 ef |
  ef4 d c c |
  d1

  ef4 c ef ef |
  f2 ef |
  c4 ef ef d |
  ef1

  ef4 f ef ef |
  ef2 ef |
  c4 ef f f |
  ef1

  f4 ef c ef |
  ef2 d |
  ef4 ef ef d |
  ef1
}

tenor = \relative c' {
  \global
  g4 af bf bf |
  af2 c |
  a4 bf g f |
  f1 |

  g4 af bf bf |
  bf2 bf |
  af4 g bf bf |
  g1 |

  g4 bf bf bf |
  af2 g |
  af4 bf c c |
  c1 |

  f,4 bf af g |
  af2 f |
  c'4 bf bf bf |
  g1
}

bass = \relative c {
  \global
  ef4 f g ef |
  f2 c |
  f4 g ef f |
  bf,1 |

  ef4 f g ef |
  d2 ef |
  f4 c bf bf |
  ef1 |

  ef4 d ef g |
  af2 ef |
  f4 g af f |
  c1 |

  d4 ef f ef |
  af,2 bf |
  c4 ef bf bf |
  ef1
}

verseOne = \lyricmode {
  \set stanza = "1."
  Fa -- ther, see Thy chil -- dren bend -- ing at Thy throne,
  Plead -- ing here the Pas -- sion of Thine on -- ly Son,
  Plead -- ing here be -- fore Thee all His dy -- ing love,
  As He pleads it ev -- er in the courts a -- bove.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Not for our wants on -- ly we this Of -- fering plead,
  But for all Thy chil -- dren who Thy mer -- cy need:
  Bless Thy faith -- ful peo -- ple, win Thy wand -- 'ring sheep,
  Keep the souls de -- part -- ed who in Je -- sus sleep.
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

