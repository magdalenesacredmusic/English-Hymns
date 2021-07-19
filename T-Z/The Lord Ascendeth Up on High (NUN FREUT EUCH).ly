%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup{ \fontsize #4 \smallCaps "The Lord Ascendeth Up On High"  }
  meter = \markup { \small { Music: NUN FREUT EUCH, 87.87.887; Wittenburg, 1524; adapt. and harm. J. S. Bach} }
  piece = \markup { \small {Text:  }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
\partial 4 
g4 |
g d g c |
b a g \bar "||"

g |
a8[ b] c4 b a |
e( fs) g \bar "||"

g4 |
g d g c |
b a g \bar "||"

g |
a8[ b] c4 b a |
e( fs) g \bar "||"

g4 |
c b a d |
d cs d \bar "||"

d e c d4. c8 |
b4 a g \bar "||"

b4 |
a d, g c |
b( a) g \bar "|."
}

alto = \relative c' {
  \global

}

tenor = \relative c' {
  \global

}

bass = \relative c {
  \global

}

verseOne = \lyricmode {
  \set stanza = "1. "

}

verseTwo = \lyricmode {
  \set stanza = "2. "

}

verseThree = \lyricmode {
  \set stanza = "3. "

}

verseFour = \lyricmode {
  \set stanza = "4. "

}

verseFive = \lyricmode {
  \set stanza = "5. "

}

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
      tempoWholesPerMinute = #(ly:make-moment 80 4)
    }
  }
  \layout { }
}
