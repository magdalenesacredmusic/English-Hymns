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
  poet = \markup{ \fontsize #4 \smallCaps "Blessed Jesus, At Thy Word"  }
  meter = \markup { \small { Music: LIEBSTER JESU, 78.78.88.; mel. J.R. Ahle; harm. attr. J.S. Bach  } }
  piece = \markup { \small {Text: T. Clausnitzer, 1663; tr. C. Winkworth, 1858 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}


global = {
  \key c \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  b4 a8[ g] a4 d \bar "|"
  b g a2 \bar "||"
  
  g4 g g g a b \bar "|"
  a2 g2 \bar "||"
  
  b4 a8[ g] a4 d \bar "|"
  b g a2 \bar "||"
  
  g4 g g g a b \bar "|"
  a2 g2 \bar "||"
  
  d4 d e fs \bar "|"
  g a8[ g] fs[ e] d4 \bar "||"
  
  g4  g g g a b \bar "|"
  a2 g2 \bar "|."
}

alto = \relative c' {
  \global
  d4 d d fs |
  d d8[ e] fs2 |
  
  e4 f e d |
  e8[ fs] g4 g( fs) g2 |
  
  d4 d d fs |
  d d8[ e] fs2 |
  
  e4 f e d |
  e8[ fs] g4 g( fs) g2 |
  
  b,4 a b8[ cs] d4 |
  e e d a |
  
  e'4 f e d |
  e8[ fs] g4 g( fs) |
  g2
}

tenor = \relative c' {
  \global
  g8[ a] b4 a a |
  b8[ c] d4 d2 |
  
  b4 b c g |
  c d e( d8[ c]) b2 |
  
  g8[ a] b4 a a |
  b8[ c] d4 d2 |
  
  b4 b c g |
  c d e( d8[ c]) b2 |
  
  g4 a g a |
  b a a8[ g] fs4 |
  
  b b c g |
  c d d4.( c8) |
  b2
}

bass = \relative c {
  \global
  g4 g' fs4 d |
  g8[ a] b8[ g] d2 |
  
  e4 d c b |
  a g8[ b] c4( d) g,2 |
  
  g4 g' fs4 d |
  g8[ a] b8[ g] d2 |
  
  e4 d c b |
  a g8[ b] c4( d) g,2 |
  
  g'4 fs e d |
  d cs d d |
  
  e4 d c b |
  a g d'2 |
  g,2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Bless -- ed Je -- sus, at Thy word
  We are gath -- ered all to hear Thee;
  Let our hearts and souls be stirred
  Now to seek and love and fear Thee;
  By Thy teach -- ings, sweet and ho -- ly,
  Drawn from earth to love Thee sole -- ly.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  All our know -- ledge, sense, and sight
  Lie in deep -- est dark -- ness shroud -- ed,
  Till Thy Spir -- it breaks our night
  With the beams of truth un -- cloud -- ed.
  Thou a -- lone to God canst win us,
  Thou must work all good with -- in us.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Glo -- rious Lord, Thy -- self im -- part!
  Light of light, from God pro -- ceed -- ing,
  O -- pen Thou our ears and heart, 
  Help us by Thy Spir -- it's plead -- ing.
  Hear the cry Thy peo -- ple rais -- es,
  Hear, and bless our prayers and prais -- es.
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
      tempoWholesPerMinute = #(ly:make-moment 80 4)
    }
  }
  \layout {}
}
