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
  poet = \markup{ \fontsize #4 \smallCaps "To Jesus Christ, Our Sovereign King"  }
  meter = \markup { \small { Music: ICH GLAUB AN GOTT, 87.87. with Refrain; Mainz Gesangbuch, 1870 } }
  piece = \markup { \small {Text: Martin B. Hellrigel, (1891-1981) }}
  %breakbefore
  %copyright = ""
  tagline = ""

}

global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  c4 |
  f4 g a8[ bf] c4 |
  bf a g a |
  a f bf a |
  g2 f4 c |
  f g a8[ bf] c4 |
  bf a g a |
  a f bf a |
  g2 f \bar "||"

  c'2^\markup {Refrain} c4 c |
  d2 d |
  bf a4 g |
  c2 c |
  c, f4 a |
  c2 bf4 a |
  g1 |
  f2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  c4 |

}

tenor = \relative c' {
  \global

}

bass = \relative c {
  \global

}

verseOne = \lyricmode {
  \set stanza = "1."
  To Je -- sus Christ, our sov -- 'reign King,
  Who is the world's sal -- va -- tion,
  All praise and hom -- age do we bring
  And thanks and ad -- o -- ra -- tion.
  
  Christ Je -- sus, Vic -- tor!
  Christ Je -- sus, Ru -- ler!
  Christ Je -- sus, Lord and Re -- deem -- er!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Thy reign ex -- tend, O King be -- nign,
  To ev -- 'ry land and na -- tion;
  For in your King -- dom,
  Lord di -- vine,
  A -- lone we find sal -- va -- tion.
}

verseThree = \lyricmode {
  \set stanza = "3."
  To Thee, and to Thy church, great King,
  We pledge our heart's ob -- la -- tion;
  Un -- til be -- fore your throne we sing
  In end -- less ju -- bi -- la -- tion.
}

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

