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
  poet = \markup{ \fontsize #4 \smallCaps "Thou Art Gone Up On High"  }
  meter = \markup { \small { Music: OLD 25TH, D.S.M.; Day's Psalter, 1563; adapt. The English Hymnal, 1906} }
  piece = \markup { \small {Text:  }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key f \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f2 \bar "|"
  a4 g a bf \bar "|"
  c2 \bar "||"
  
  a2 \bar "|"
  a f bf g \bar "|"
  f2 \bar "||"
  
  a2 \bar "|"
  g4 f c' bf \bar "|"
  a g a2 \bar "||"
  
  d,2 \bar "|"
  g4 f bf a \bar "|"
  g2 \bar "||"
  
  a2 \bar "|"
  a4 bf c bf \bar "|"
  a2 \bar "||"
  
  f2 \bar "|"
  d4 e f g \bar "|"
  a2 \bar "||"
  
  f2 \bar "|"
  a4 a d c \bar "|"
  bf4 f g2 \bar "||"
  
  f2 \bar "|"
  c'4 a bf g \bar "|"
  f2 \bar "|."
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
