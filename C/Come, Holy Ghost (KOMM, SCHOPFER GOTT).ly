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
  poet = \markup{ \fontsize #4 \smallCaps "Come, Holy Ghost"  }
  meter = \markup { \small { Music: KOMM, SCHÖPFER GOTT, 88.88.; J. Klug } }
  piece = \markup { \small {Text: \italic "Veni Creator Spiritus," R. Maurus, 8th cent.; tr. E. Caswall }}
  %breakbefore
  %copyright = ""
  tagline = ""
}


global = {
  \key bf \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f2 g4 f |
  ef f bf c |
  bf2. bf4 |
  f g bf c |
  d d c2 |

  b4\rest c d bf |
  g f a bf |
  c2. f,4 |
  bf g ef g |
  g f f2 \bar "|."
}

alto = \relative c' {
  \global
  c2 ef4 d |
  c bf d f |
  d2. d4 |
  d ef d f |
  f f f2 |
  s4 f f d |
  ef d c f |
  f2. d4 |
  d d c bf |
  ef d c2
}

tenor = \relative c' {
  \global
  a2 bf4 bf |
  g f g a |
  bf2. bf4 |
  a c f, c' |
  bf bf a2 |
  d,4\rest a'4 a bf |
  bf bf f f |
  a2. bf4 |
  bf bf g g |
  bf bf a2
}

bass = \relative c {
  \global
  f2 ef4 bf |
  c d g f |
  bf,2. g4 |
  d' c bf a |
  bf d f2 |
  s4 f d g |
  ef bf f' d |
  f2. bf,4 |
  g bf c ef |
  g, bf f'2
}

verseOne = \lyricmode {
  \set stanza = "1."

}

verseTwo = \lyricmode {
  \set stanza = "2."

}

verseThree = \lyricmode {
  \set stanza = "3."

}

%{

verseFour = \lyricmode {
	\set stanza = "4."

}

verseFive = \lyricmode {
	\set stanza = "5."

}

verseSix = \lyricmode {
	\set stanza = "6."

}

%}


\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranos { \voiceOne << \melody >> }
      \context Voice =
      altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
      \context Lyrics = two \lyricsto sopranos \verseTwo
      \context Lyrics = three \lyricsto sopranos \verseThree
      %{\context Lyrics = four \lyricsto sopranos \verseFour
	  \context Lyrics = five \lyricsto sopranos \verseFive
	  \context Lyrics = six \lyricsto sopranos \verseSix %}

    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenor >> }
      \context Voice =
      basses { \voiceTwo << \bass >> }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 84 4)
    }
  }
  \layout {}
}

