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
  poet = \markup{ \fontsize #4 \smallCaps "O Food of Exiles Lowly"  }
  meter = \markup { \small { Music: INNSBRUCK, 7.7.6.7.7.6., H. Isaak; harm. J.S. Bach, \italic "Episcopal Hymnal," 1906, alt.} }
  piece = \markup { \small {Text: \italic "O esca viatorum," \italic "Maintzisch Gesangbuch," tr. M. Owen Lee, \italic "The New St. Basil Hymnal," alt. }}
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
  b4 |
  g a b8[ c] d4 |
  c2 b4 b8[ c] |
  d4 d \bar "" \break
  a b |
  g2 fs4 d4 |
  g a b b |
  a2. \bar "||" \break

  b4 |
  g a b8[ c] d4 |
  c2 b4 b8[ c] |
  d4 d \bar "" \break
  a b |
  g2 fs4 d |
  g a b c |
  b a g \bar "|."
}

alto = \relative c'' {
  \global
  \partial 4
  g4 |
  e fs g8[ a] b4 |
  b( a) g g |
  g8[ fs] g[ e] fs[ e] d4 |
  d4( cs) d a |
  d c b8[ c] d4 |
  d2. \bar "||"

  fs4 |
  e d d e |
  e8[ d e fs] gs4 g |
  a g8[ fs] e4 fs |
  fs( e) ds d |
  d8[ e] d[ c] b[ d] e[ fs] |
  g4 fs d \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4
  d4 |
  c c d8[ c] b[ a] |
  g4( d') d e |
  d d d fs, |
  g8[( fs] g4) a fs8[ e] |
  d4 e8[ fs] g4 g fs2. \bar "||"

  b4 |
  b8[ c] b[ a] g[ a] b4 |
  a8[ b c d] e4 e |
  d8[ c!] b4 cs fs, |
  b2 b4 b |
  b8[ c] b[ a] g4 g |
  e'4 a,8[ b16 c] b4 \bar "|."
}

bass = \relative c' {
  \global
  \partial 4
  g4 |
  c8[ b] a4 g4. fs8 |
  e4( fs) g e |
  b8[ a] b[ c] d[ c] b4 |
  e2 d4 c! |
  b a g8[ a] b8[ c] |
  d2. \bar "||"

  ds4 |
  e fs g gs |
  a( a,) e' e |
  fs g g8[ fs] e[ ds] |
  e[ fs g a] b4 b, |
  e fs g8[ fs] e[ d] |
  c4 d g4 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  O Food of ex -- iles low -- ly,
  O Bread of an -- gels ho -- ly,
  O Man -- na from on high!
  We hun -- ger for Your bles -- sing,
  All good in You pos -- sess -- ing,
  With fa -- vor hear our heart's out -- cry.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  O cleans -- ing Wa -- ter, stream -- ing
  From Je -- sus' side, re -- deem -- ing
  All men of Ad -- am's race!
  O lim -- pid Foun -- tain flow -- ing,
  Our ev -- 'ry want be -- stow -- ing,
  O come and fill our souls with grace.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O Lord, we kneel be -- fore You
  And fer -- vent -- ly a -- dore You,
  All hid be -- neath this bread.
  But make to us this prom -- ise:
  To see You in Your full -- ness,
  The sa -- cred Bo -- dy's mys -- tic head.

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
    \new Staff  <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 72 4)
    }
  }
  \layout { }
}

