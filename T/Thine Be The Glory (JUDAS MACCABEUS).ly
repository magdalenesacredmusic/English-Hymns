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
  poet = \markup{ \fontsize #4 \smallCaps "Thine Be the Glory"  }
  meter = \markup { \small { Music: JUDAS MACCABEUS, 55.65.65.65. refrain 55.65.; G.F. Handel, arr. } }
  piece = \markup { \small {Text: \italic "À toi la gloire," E. Bundry, 1904; tr. R.B. Hoyle, 1928  }}
  %breakbefore
  %copyright = ""
  tagline = "
}


global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a2 fs4. g8 |
  a2 d, |
  e8[ fs] g[ a] g4 fs |
  e1 |
  fs8[ g] a[ b] a4 a |
  d2 a |
  g4 fs e4. d8 |
  d1 |

  fs8[ e] fs[ g] fs4 fs |
  e2 d |
  g4 fs e d |
  cs1 |
  d8[ cs] d[ e] d4 d |
  b'2 gs |
  a4 b8[ a] gs4. a8 |
  a1 \bar "||"

  a2^\markup{\smallCaps Refrain.} fs4. g8 |
  a2 d, |
  e8[ fs] g[ a] g4 fs |
  e1 |
  fs8[ g] a[ b] a4 a |
  d2 a |
  g4 fs e4. d8 d1 \bar "|."
}

alto = \relative c' {
  \global
  d2 d4. cs8 |
  d2 d |
  cs8[ d] e[ fs] e4 d |
  cs1 |
  d4 d d d |
  d2 d |
  b8[ cs] d4 d cs |
  a1 |
  
  d8[ cs] d[ e] d4 d |
  cs2 b |
  e4 d cs b |
  as1 |
  b8[ as] b[ cs] b4 b |
  d2 d |
  cs4 d8[ cs] d4 e |
  e1 |
  
    d2 d4. cs8 |
  d2 d |
  cs8[ d] e[ fs] e4 d |
  cs1 |
  d4 d d d |
  d2 d |
  b8[ cs] d4 d cs |
  a1 |
}

tenor = \relative c {
  \global
  fs2 a4. g8 |
  fs2 a |
  g4 e a a |
  a1 |
  a4 a8[ g] a4 a |
  a2 fs |
  g4 a a g |
  fs1 |
  
  a4 a a a |
  g2 fs |
  as4 b g fs |
  fs1 |
  fs4 fs fs b |
  b2 b |
  a4 fs b b |
  cs1 |
  
  fs,2 a4. g8 |
  fs2 a |
  g4 e a a |
  a1 |
  a4 a8[ g] a4 a |
  a2 fs |
  g4 a a g |
  fs1 | 
}

bass = \relative c {
  \global
  d2 fs4. e8 |
  d2 fs |
  e4. d8 cs4 d |
  a1 |
  d8[ e] fs[ g] fs4 fs |
  fs2 d |
  e4 fs8[ g] a4 a, |
  d1 |
  
  d4 d d d |
  a2 b |
  cs4 d e b |
  fs'1 |
  b,4 b b a' |
  gs2 e |
  fs4 d e e |
  a,1 |
  
  d2 fs4. e8 |
  d2 fs |
  e4. d8 cs4 d |
  a1 |
  d8[ e] fs[ g] fs4 fs |
  fs2 d |
  e4 fs8[ g] a4 a, |
  d1 |
}

verseOne = \lyricmode {
  \set stanza = "1."
  Thine be the glo -- ry, ris -- en, con -- quering Son,
  End -- less is the vic -- t'ry Thou o'er death has won;
  An -- gels in bright rai -- ment rolled the stone a -- way,
  Kept the fold -- ed grave -- clothes where Thy bo -- dy lay.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Lo! Je -- sus meets us, ris -- en from the tomb;
  Lov -- ing -- ly he greets us, scat -- ters fear and gloom;
  Let the Church with glad -- ness hymns of tri -- umph sing,
  For her Lord now liv -- eth, death hath lost its sting;
  
  Thine be the glo -- ry, ris -- en, con -- quer -- ing Son,
  End -- less is the vic -- t'ry Thou o'er death has won.
}

verseThree = \lyricmode {
  \set stanza = "3."
  No more we doubt Thee, glo -- rious Prince of Life;
  Life is nought with -- out Thee; aid us in our strife;
  Make us more than con -- querors through Thy death -- less love;
  Bring us safe through Jor -- dan to Thy home a -- bove.
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
      tempoWholesPerMinute = #(ly:make-moment 120 4)
    }
  }
  \layout {}
}
