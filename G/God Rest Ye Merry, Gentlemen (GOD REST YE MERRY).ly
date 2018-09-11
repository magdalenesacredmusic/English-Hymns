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
      \line {GOD REST YE MERRY  86 86 86 w/refrain}
    }
    \right-column{
      \line {English traditional; harm. John Stainer}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {English Carol}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key g \major
  \time 2/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  e4 |
  e b' b a |
  g fs e d |
  e fs g a |
  b2. \bar "||" \break
  
    e,4 |
  e b' b a |
  g( fs) e d |
  e fs g a |
  b2.  \bar "||" \break

  b4 |
  c a b c |
  d e b a |
  g e fs g |
  a2 \bar "||" \break
  
  g4( a) |
  b2 c4 b |
  b( a) g fs |
  e2 g8 fs e4 | \break
  
  a2 g4( a)
  b( c) d e
  b( a) g fs |
  e2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  e4 |
  e g fs ds |
  e d c b |
  e ds e e |
  ds2. 
  
  e4 |
  e g fs ds |
  e( d) c b |
  e ds e e |
  ds2. 
  
  e4 |
  e d d g |
  f e d ds |
  e cs d g |
  fs2
  
  g4( d) |
  d2 e4 d |
  g( fs) e ds |
  e2 b8 b cs4 |
  d2 e4( fs) |
  g2 g4 g |
  g( fs) e ds |
  e2.
}

tenor = \relative c {
  \global
  \partial 4
  e4 |
  g e fs b |
  b b g g |
  g b b e, |
  fs2. 
  
  e4 |
  g e fs b |
  b2 g4 g |
  g b b e, |
  fs2. 
  
  gs4 |
  a a g g |
  g g g fs |
  g g a d |
  d( c)
  
  
  b( a) |
  g2 g4 g |
  d'( c) b b |
  g2 g8 g g4 |
  fs( a) d( c) |
  b( g) d' c |
  d( c) b4 b |
  g2.
}

bass = \relative c {
  \global
  \partial 4
  e4 |
  e e ds b |
  e b c g |
  c b e c |
  b2. 
  
  e4 |
  e e ds b |
  e( b) c g |
  c b e c |
  b2. 
  
  e4 |
  a fs g e |
  b c g b |
  e e d c |
  d2

  e4( fs) |
  g2 c,4 g' |
  g,( a) b b |
  e2 e8 e e4 |
  d( c) b( a) |
  g( e') b c |
  g( a) b b |
  e2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  God rest you mer -- ry, gen -- tle -- men,
Let noth -- ing you dis -- may.
For Je -- sus Christ our Sa -- vior,
Was born on Christ -- mas Day;
To save us all from Sa -- tan’s power,
When we were gone a -- stray.

	\override LyricText #'font-shape = #'italic 
O ti -- dings of com -- fort and joy,
com -- fort and joy,
O ti -- dings of com -- fort and joy.
}

verseTwo = \lyricmode {
  \set stanza = "2."
From God our heav'n -- ly Fath -- _ er,
A bless -- ed an -- gel came.
And unto cer -- tain shep -- herds,
Brought ti -- dings of the same,
How that in Beth -- le -- hem was born,
The Son of God by name:
}

verseThree = \lyricmode {
	\set stanza = "3."
And when to Beth -- le -- hem they came,
Where our dear Sav -- ior lay
They found him in a man -- ger,
Where ox -- en feed on hay;
His moth -- er Ma -- ry kneel -- _ ing,
Un -- to the Lord did pray:
}

verseFour = \lyricmode {
  \set stanza = "4."
  Now to the Lord sing prais -- _ es,
All you with -- in this place,
And with true love and bro -- ther -- hood,
Each oth -- er now em -- brace;
This ho -- ly tide of Christ -- _ mas,
Doth bring re -- deem -- ing grace.
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
