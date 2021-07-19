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
      \line {AUSTRIA 87 87 D}
    }
    \right-column{
      \line {Joseph Haydn, 1797	}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {John Newton, 1779}
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

melody = \relative c' {
  \global
  ef4. f8 g4 f |
  af g f8[ d] ef4 |
  c' bf af g |
  f g8[ ef] bf'2 | %\break

  ef,4. f8 g4 f |
  af g f8[ d] ef4 |
  c' bf af g |
  f g8[ ef] bf'2 | %\break

  f4 g f8[ d] bf4 |
  af' g f8[ d] bf4 |
  bf' af g4. g8 |
  a4. a8 bf2 | %\break

  ef4. d8 c4 bf | %\noBreak
  c4. bf8 bf8[ af] g4 | %\noBreak
  f4 g8[ af] bf8[ c] af8[ f] | %\noBreak
  ef4 f ef2 \bar "|."
}

alto = \relative c' {
  \global
  ef4. ef8 ef4 d |
  bf bf bf bf |
  c8[ d] ef4 f ef |
  f ef d2 |

  ef4. ef8 ef4 d |
  bf bf bf bf |
  c8[ d] ef4 f ef |
  f ef d2 |

  bf4 bf bf bf |
  bf bf bf bf |
  bf c8[ d] ef4. ef8 |
  ef4. ef8 d2 |

  ef4. ef8 ef4 ef |
  ef4. ef8 f4 ef |
  d d ef ef8[ c] |
  bf4 d ef2
}

tenor = \relative c' {
  \global
  g4. af8 bf4 bf |
  f g af8[ f] g4 |
  af4 bf bf bf |
  c c f,2 |

  g4. af8 bf4 bf |
  f g af8[ f] g4 |
  af4 bf bf bf |
  c c f,2 |

  d4 ef d8[ f] d4
  f ef d8[ f] d4 |
  g f ef4. ef8 |
  f4. c'8 bf2 |

  bf4. bf8 af4 g |
  af4. bf8 bf4 bf |
  bf bf bf8[ ef,] c'[ af] |
  g4 bf8[ af] g2
}

bass = \relative c {
  \global
  ef4. ef8 ef4 bf |
  d ef bf ef |
  af g d ef |
  af, a bf2 |

  ef4. ef8 ef4 bf |
  d ef bf ef |
  af g d ef |
  af, a bf2 |

  bf4 bf bf bf |
  d ef bf bf |
  g af8[ bf] c4. c8 |
  f4. f8 bf,2 |

  g'4. g8 af4 ef |
  af4. g8 d4 ef |
  bf af g af |
  bf bf ef2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Glo -- rious things of thee are spo -- ken,
  Zi -- on, ci -- ty of our God!
  He, whose Word can -- not be bro -- ken,
  Formed thee for His own a -- bode.
  On the Rock of A -- ges found -- ed,
  What can shake thy sure re -- pose?
  With sal -- va -- tion’s walls sur -- round -- ed,
  Thou may’st smile at all thy foes.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  See! the streams of liv -- ing wa -- ters,
  Spring -- ing from e -- ter -- nal love;
  Well sup -- ply thy sons and daugh -- ters,
  And all fear of want re -- move:
  Who can faint while such a riv -- er
  Ev -- er flows their thirst t’as -- suage?
  Grace, which like the Lord, the giv -- er,
  Nev -- er fails from age to age.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Round each hab -- i -- ta -- tion hov -- 'ring,
  See the cloud and fire ap -- pear!
  For a glo -- ry and a cov -- 'ring
  Show -- ing that the Lord is near.
  Thus de -- riv -- ing from our ban -- ner
  Light by night and shade by day;
  Safe they feed up -- on the man -- na
  Which He gives them when they pray.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Sav -- ior, if of Zi -- on’s ci -- ty,
  I through grace a mem -- ber am,
  Let the world de -- ride or pi -- ty,
  I will glo -- ry in Thy name.
  Fad -- ing is the world -- ling’s plea -- sure,
  All his boast -- ed pomp and show;
  Sol -- id joys and last -- ing trea -- sure
  None but Zi -- on’s chil -- dren know.
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
