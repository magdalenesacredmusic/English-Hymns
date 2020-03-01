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
      \line {SO GIEBST DU NUN   10 10 10 10 8 4}
    }
    \right-column{
      \line {J.S. Bach (1865-1750)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {John Donne (1573-1631)}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key af \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
\partial 4
af4 |
c4. bf8 af4 c |
bf af af g |
af2. 

c4 |
ef4. df8 c4 c8[ bf] |
af[ g] f4 g4. f8 |
e4( c)

bf'4\rest g4 |
bf4. af8 g4 af |
af g f4. f8 |
g2. 

g4 |
af4 bf c \tuplet 3/2 {c8[ d ef]} |
d4.( c8) b4( c) |
c4. b8 c4 

b8\rest e,8 |
f4 g af \tuplet 3/2 {f8[ g af]} |
g4. f8 e4 f |
f4. e8 f2 \bar "|."
}

alto = \relative c' {
  \global
 \partial 4
 f4 |
 g4. g8 f4 f |
 f ef f ef |
 ef2.
 
 ef4 |
 ef4. ef8 ef4 g |
 f f d4. d8 |
 c2
 
 s4 e4 |
 f4. f8 ef4 f8[ ef] |
 d4 ef ef d |
 ef2. 
 
 ef4 |
 ef ef ef af |
 af2 g4( ef) |
 d4. d8 e4 
 
 s8 c8 |
 c4 c c c |
 df4. df8 c4 c |
 c4. c8 c2
}

tenor = \relative c' {
  \global
\partial 4
c4 |
c4. c8 c4 af |
bf c df df |
c2. 

af4 |
bf4. bf8 af4 c |
c f, bf4. af8 |
g4( e)

df4\rest c'4 |
bf4. bf8 bf4 c |
bf bf af4. bf8 |
bf2.

bf4 |
ef bf af c |
f4.( ef8) d4( c) |
d g, g 

d8\rest g8 |
af4 g f af |
bf4. af8 g4 af |
g4. g8 af2
}

bass = \relative c {
  \global
\partial 4 
f4 |
e4. e8 f4 f8[ ef] |
df4 c bf4. bf8 |
af2. 

af'4 |
g4. g8 af4 e |
f8[ ef] df[ c] bf4. bf8 |
c4( c,) 

s4 c'4 |
d4. d8 ef4 af, |
bf4 ef bf4. bf8 |
ef2. 

ef4 |
c g af af' |
f4.~ f8 g4( c,) |
g4. g8 c4 

s8 c8 | af4 e f f |
bf4. bf8 c4 f |
c c, f2
}

verseOne = \lyricmode {
  \set stanza = "1. "
Wilt thou for -- give that sin, where I be -- gun,
  Which is my sin, though it were none be -- fore?
Wilt thou for -- give those sins, through which I run
  And do run still, though still I do de -- plore?
When thou hast done, thou hast not done,
    For I have more.
}

verseTwo = \lyricmode {
  \set stanza = "2. "
Wilt thou for -- give that sin, by which I won
  Oth -- ers to sin, and made my sin their door?
Wilt thou for -- give that sin which I did shun
  A year or two, but wal -- lowed in a score?
When thou hast done, thou hast not done,
    For I have more.
}

verseThree = \lyricmode {
  \set stanza = "3. "
I have a sin of fear, that when I've spun
  My last thread, I shall per -- ish on the shore;
Swear by thy -- self, that at my death thy Son
  Shall shine as he shines now, and here -- to -- fore.
And hav -- ing done that, thou hast done--
    I fear no more.
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
