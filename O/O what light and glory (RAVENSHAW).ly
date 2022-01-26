\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {RAVENSHAW, 66 66}
    }
    \right-column{
      \line {Medieval German melody}
      \line {arr. William Henry Monk (1823-89)}
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
  \key ef \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  ef4 ef g af
  bf2 bf
  c4 d ef bf
  g( a) bf2
  af4 f g af
  g( f) ef2
  d4 ef f g 
  f2 ef

\bar "|."
}

alto = \relative c' {
  \global
  bf4 bf ef ef
  ef( d) ef2
  ef4 f g f 
  ef2 d
  ef4 f ef ef 
  ef( d) ef2
  bf4 bf d ef
  ef( d) ef2
}

tenor = \relative c' {
  \global
  g4 g bf af
  f2 g
  af4 af bf bf 
  bf( c) f,2
  ef4 bf' bf c 
  bf2 g
  bf4 bf af g 
  bf2 g
}

bass = \relative c {
  \global
 ef4 ef ef c
 bf2 ef
 af4 f ef d 
 ef( c) bf2
 c4 d ef af, 
 bf2 c
 bf4 g' f ef 
 bf2 ef
}

verseOne = \lyricmode {
  \vOne
  O what light and glo -- ry
  Deck thee, all re -- splen -- dent,
  Thou of roy -- al Da -- vid
  Glo -- ri -- ous des -- cen -- dant;
}

verseTwo = \lyricmode {
  \vTwo
  Ma -- ry ev -- er -- vir -- gin,
  Who in heaven art dwell -- ing,
  All the choirs of an -- gels
  Ev -- er -- more ex -- cell -- ing.
}

verseThree = \lyricmode {
  \vThree
 Moth -- er, yet the hon -- or
 Of a vir -- gin bear -- ing,
 For the Lord of an -- gels
 Dwell -- ing pure pre -- par -- ing.
}

verseFour = \lyricmode {
  \vFour
  Him with -- in thy bos -- om
  Chast -- ely thou en -- shrin -- est:
  Thus our God in -- car -- nate
  Takes his flesh di -- vin -- est.
}

%{
Whom the whole creation
Evermore adoreth,
And all lowly bend ing
Rightly now imploreth,--
May his pity grant us,
Far our darkness sending,
With thee in his glory
Joy and light unending!

Hear us, holy Father,
Through thy Son supernal,
With the Holy Spirit,
God and Lord eternal:
Who with thee in glory
Liveth and abideth,
Who the world and all things
Governeth and guideth. Amen.
%}

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
      \new Lyrics \lyricsto "tune" { \verseFour}
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
