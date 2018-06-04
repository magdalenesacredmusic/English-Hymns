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
  poet = \markup{ \fontsize #4 \smallCaps "Come, Thou Almighty King"  }
  meter = \markup { \small { Music: ITALIAN HYMN, 664.666.4.; F. de Giardini, alt.; harm. traditional }}
  piece = \markup { \small {Text: Anon., English, c. 1757 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key g \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  d4 b g |
  a( g) fs |
  g2. |
  
  g4 a b |
  c8[( d] c4) b |
  a2. |
  
  d4 b g |
  d2. |
  
  a'4 b c |
  b4. a8 g4 |
  a b c |
  b4. a8 g4 |
  
  g b d |
  d4. e8 d4 |
  c b a |
  g2. \bar "|."
}

alto = \relative c'' {
  \global
  g4 d d |
  e( d) d |
  d2. |
  
  d4 d g |
  fs( a) g |
  fs2. |
  
  d'4 b g |
  d2. |
  
  fs4 g a |
  g4. fs8 g4 |
  
  fs g a |
  g4. fs8 g4 |
  
  g b d |
  g,4. g8 g4 |
  a g fs |
  g2.
}

tenor = \relative c' {
  \global
  b4 d d |
  c( b) a |
  b2. |
  
  b4 d d |
  d2 d4 |
  d2. |
  
  d4 b g |
  d2. |
  
  d'4 d d |
  d4. c8 b4 |
  d d d |
  d4. c8 b4 |
  
  g b d |
  b4. c8 b4 |
  e d c |
  b2.
}

bass = \relative c' {
  \global
  g4 g b, |
  c4( d) d |
  g,2. |
  
  g'4 fs g a( fs) g |
  d2. |
  
  d'4 b g |
  d2. |
  
  d4 d d |
  g4. g8 g4 |
  d4 d d |
  g4. g8 g4 |
  
  g b d |
  g,4. g8 g4 |
  c, d d |
  g,2.
}

verseOne = \lyricmode {
  \set stanza = "1. "
  Come, Thou Al -- migh -- ty King,
  Help us thy name to sing,
  Help us to praise, 
  Fa -- ther all -- glo -- ri -- ous
  O'er all vic -- to -- ri -- ous,
  Come and reign o -- ver us,
  An -- cient of Days!
}

verseTwo = \lyricmode {
  \set stanza = "2. "
  Come, Thou In -- car -- nate Word, 
 Gird on Thy migh -- ty sword,
 Our prayer at -- tend!
 Come and thy peo -- ple bless,
 And give Thy Word suc -- cess,
 Spir -- it of ho -- li -- ness
 On us de -- scend!
}

verseThree = \lyricmode {
  \set stanza = "3. "
  Come, Ho -- ly Com -- for -- ter,
  Thy Sa -- cred wit -- ness bear,
  In this glad hour!
  Thou who al -- migh -- ty art,
  Now rule in ev -- 'ry heart,
  And ne'er from us de -- part,
  Spir -- it of power!
}

verseFour = \lyricmode {
  \set stanza = "4. "
  To the great One in Three
  E -- ter -- nal prais -- es be
  Hence ev -- er -- more!
  His sov -- ereign ma -- jes -- ty
  May we in glo -- ry see,
  And to e -- ter -- ni -- ty
  Love and a -- dore!
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
      \context Lyrics = four \lyricsto sopranos \verseFour
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
  \layout { }
}


%{ Verse 2 as printed in Martin Madan's "The Collection of Psalm and Hymn Tunes," 1769:
Jesus our Lord arise,
Scatter our Enemies,
And make them fall!
Let thine Almighty Aid
Our sure defence be made --
Our Souls on Thee e stay'd
Lord hear our Call!

vv. 2-4 were thus numbered vv. 3-5
%}