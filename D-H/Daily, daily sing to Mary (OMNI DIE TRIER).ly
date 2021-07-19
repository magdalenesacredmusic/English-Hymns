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
      \line {OMNI DIE (TRIER)  87 87 D}
    }
    \right-column{
      \line {German melody, Trier, 1847}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Omni die dic Mariae"}
      \line {St. Bernard of Cluny, c. 1140}
      \line {tr Henry Bittleston (1818-1886)}
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

melody = \relative c'' {
  \global
a4 a g c |
f, g e c |
f c d8[ e] f4 |
f e f2 \bar "||"

a4 a g c |
f, g e c |
f c d8[ e] f4 |
f e f2 \bar "||"

e4 f g g |
a g8[ f] g4 g |
a a g c |
c b c2 \bar "||"

f,4 g a f |
bf a a g |
c c d8[ c] bf[ a] |
g4 g f2 \bar "|."
}

alto = \relative c' {
  \global
 c4 f g e |
 d d c c |
 a c bf a8[ bf] |
 c4 c c2 |
 
  c4 f g e |
 d d c c |
 a c bf a8[ bf] |
 c4 c c2 |
 
 c4 c c4 e |
 f e8[ d] e4 e |
 c4 f e8[ f] g4 |
 a g e2 |
 
 d4 c c d |
 d f f e |
 f ef d d8[ c] |
 d4 c8[ bf] a2

}

tenor = \relative c  {
  \global
f4 c' c c8[ bf] |
a4 bf g e |
f4 f f f  |
g g a2 |

f4 c' c c8[ bf] |
a4 bf g e |
f4 f f f  |
g g a2 |

g4 g g c8[ b] |
a4 b c c |
a c c c |
d d c2 |

a4 g f a |
bf c8[ d] c4 c |
a f f g8[ f] |
f4 e4 f2
}

bass = \relative c {
  \global
f4 f e c |
d bf  c c |
f, a bf d |
c c f2 |

f4 f e c |
d bf  c c |
f, a bf d |
c c f2 |

c4 d e c 
f g e c |
f4 a,8[ b] c[ d] e4 |
f g c,2 |
d4 e f d |
g, a8[ bf] c4 c |
f a, bf g8[ a] |
bf4 c f,2
}

verseOne = \lyricmode {
  \set stanza = "1. "
Dai -- ly, dai -- ly sing to Ma -- ry;
Sing with joy her prais -- es due!
All her feasts, her ac -- tions hon -- or 
With the heart's de -- vo -- tion true.
Lost in won -- d'ring con -- tem -- pla -- tion,
Be her maj -- es -- ty con -- fessed!
Call her Moth -- er, call her Vir -- gin,
Hap -- py Moth -- er, Vir -- gin blest!
}

verseTwo = \lyricmode {
  \set stanza = "2. "
She is might -- y in her plead -- ing
Ten -- der in her lov -- ing care;
Ev -- er watch -- ful, un -- der -- stand -- ing,
All our sor -- rows she will share.
Gifts of heav -- en she has giv -- en, no -- ble la -- dy, to our race,
Heav -- en's bless -- ings she dis -- pens -- es 
On our sin -- ful hu -- man race.
}

verseThree = \lyricmode {
  \set stanza = "3. "
Sing, my tongue, the Vir -- gin's tro -- phies,
Who for us her Mak -- er bore,
For the curse of old in -- flict -- ed,
Peace and bless -- ing to re -- store.
Sing in songs of priase un -- end -- ing,
Call up -- on her lov -- ing -- ly:
Seat of wis -- dom, Gate of heav -- en,
Morn -- ing Star up -- on the sea.
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
