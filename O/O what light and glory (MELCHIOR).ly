\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {MELCHIOR, 66 66 D}
    }
    \right-column{
      \line {Melody by Melchior Vulpius, 1609}
      \line {adapt. from "VULPIUS;" Harm. \italic "The Hymnal," 1940}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "O quam glorifica"}
      \line {Tr. Thomas Isaac Ball (1838-1916)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a2 g4 f2 g4 \bar "|"
  a4( bf) c2 \bar "|"
  d2 c4 bf2 a4 \bar "|"
  g2 f \bar "|" \break

  a2 c4 bf2 a4 \bar "|"
  g( f) e2 \bar "|"
  f2 g4 a2 a4 \bar "|"
  bf2 a \bar "|" \break

  a2 bf4 c2 bf4 \bar "|"
  a( g) a2 \bar "|"
  g2 g4 a c \bar "|"
  b2 c \bar "|" \break

  c2 a4 d2 c4 \bar "|"
  \orAcc bf( a) g2 \bar "|"
  a2 c4 bf2 a4 \bar "|"
  g2 f \bar "||"
  
  f2 f \bar "|."
}

alto = \relative c' {
  \global
  f2 e4 d2 d4
  f2 e2
  f2 f4 f2 f4
  e2 f

  f2 f4 f2 f4
  e( d) cs2
  d e4 f2 f4
  g2 fs

  \orAcc d2 d4 f2 d4 \revAcc
  f( d) e2
  d2 d4 f e
  g2 e

  e2 f4 f2 f4
  f2 e2
  f2 g4 f2 f4
  f( e) f2
  
  d2 c
}

tenor = \relative c' {
  \global
  c2 c4 a2 bf4
  c( f,) g2
  bf c4 d2 c4
  c2 a

  c2 a4 d2 c4
  c( a) a2
  a2 c4 c2 d4
  d2 d

  fs,2 g4 a2 bf4
  c( d) cs2
  \orAcc		d bf4 c c
  d2 c
  \revAcc

  g2 f4 bf2 c4
  d( c) c2
  c2 c4 d2 c4
  c2 a
  
  bf2 a
}

bass = \relative c {
  \global
  f2 c4 d2 g4
  f( d) c2
  bf2 a4 bf2 f4
  c'2 f,

  f'2 f4 bf,2 f'4
  c( d) a2
  d2 c4 f2 d4
  g2 d

  d2 g4 f2 g4
  a( bf) a2
  bf g4 f a
  g2 c,

  c2 d4 bf2 a4
  bf( f') c2
  f2 e4 d2 f4
  c2 f
  
  bf,2 f
}

verseOne = \lyricmode {
  \vOne
  O what light and glo -- ry
  Deck thee, all re -- splen -- dent,
  Thou of roy -- al Da -- vid
  Glo -- ri -- ous des -- cen -- dant;

  Ma -- ry ev -- er -- vir -- gin,
  Who in heaven art dwell -- ing,
  All the choirs of an -- gels
  Ev -- er -- more ex -- cell -- ing.
}

verseTwo = \lyricmode {
  \vTwo
 Moth -- er, yet the hon -- or
 Of a vir -- gin bear -- ing,
 For the Lord of an -- gels
 Dwell -- ing pure pre -- par -- ing.

  Him with -- in thy bos -- om
  Chast -- ely thou en -- shrin -- est:
  Thus our God in -- car -- nate
  Takes his flesh di -- vin -- est.
}

verseThree = \lyricmode {
  \vThree
  Whom the whole cre -- a -- tion
Ev -- er -- more a -- dor -- eth,
And all low -- ly bend -- ing
Right -- ly now im -- plor -- eth,--
May his pit -- y grant us,
Far our dark -- ness send -- ing,
With thee in his glo -- ry
Joy and light un -- end -- ing!
}

verseFour = \lyricmode {
  \vFour
Hear us, ho -- ly Fath -- er,
Through thy Son su -- per -- nal,
With the Ho -- ly Spir -- it,
God and Lord e -- ter -- nal:
Who with thee in glo -- ry
Liv -- eth and a -- bide -- th,
Who the world and all things
Gov -- er -- neth and guid -- eth. A -- men.
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
#(define output-suffix "Hymnal")
\book {
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { %\transpose c d
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
        tempoWholesPerMinute = #(ly:make-moment 110 4)
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
