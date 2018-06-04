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
  poet = \markup{ \fontsize #4 \smallCaps "O Saviour Jesu, Not Alone"  }
  meter = \markup { \small { Music: DEO GRACIAS, L.M.; English, 15th cent.; harm. \italic "The English Hymnal," 1906 } }
  piece = \markup { \small {Text: \italic "Jesu, Salvator saeculi," 9th cent.; tr. T.A. Lacey }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key f \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  d4 ^\markup { \italic "To be sung in unison." } |
  d2 c4 |
  d2 c4 |
  c b2 |
  a2 \bar "||"

  d4 |
  d4( c) a |
  g( a) g8[ d] |
  f4 e2 |
  d \bar "||"

  a'4 |
  c2 c4 |
  d( c) bf |
  a4 g2 |
  f \bar "||"

  f4 |
  a2 a4 |
  g2 f4 |
  f4 e2 |
  d \bar "|."
}


alto = \relative c' {
  \global
  \partial 4
  <f a>4 |
  <f a>2 <e a>4 |
  <f a>2 <f a>4 |
  <e a>4 <e~ a> <e gs> |
  <cs e>2 \bar "||"

  <f a>4 |
  <f a>4 <e a>4 d |
  d2 d4 |
  d2 cs4 |
  d2 \bar "||"

  <d f!>4 |
  <ef g>2 <f a>4 |
  <f bf> <f a> <d g> |
  <d fs> <b d> <c e> |
  c2 \bar "||"

  d4 |
  <c f>2 d4 |
  <b d> <c e> <a c> |
  d2 cs4 |
  d2 \bar "|."
}

tenor = \relative c {
  \global
  \partial 4
  \teeny <d f a>4 |
  <d f a>2 <e a>4 |
  <f a>2 a4 |
  <e a>4 <e b'>2 |
  e2

  <f a>4 |
  <f a>~ <e a> a |
  \normalsize b a b |
  a2. |
  <fs a>2

  \teeny <f a>4 |
  <g c>2 <a c>4 |
  <f bf> <f a> <d g> |
  fs g2 |
  a2

  bf4 |
  a2 a4 |
  s2. |
  \normalsize a2. |
  <f a>2
}

bass = \relative c, {
  \global
  \partial 4
  d4 |
  d f a |
  d2 f4 |
  a, e2 |
  a \bar "||"

  d,4 |
  d a' f |
  g f g |
  d' a2 |
  d \bar "||"

  d4 |
  c2 f,4 |
  bf f g |
  d' g, c |
  f,2 \bar "||"

  bf4 |
  f2 f4|
  g c, f |
  d'4 a2 |
  d, \bar "|."
}


verseOne = \lyricmode {
  \set stanza = "1."
  O Sa -- viour Je -- su, not a -- lone
  We plead for help be -- fore Thy throne;
  Thy Mo -- ther's love shall aid our prayer
  To win for us that heal -- ing care.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  For souls de -- fault -- ing sup -- pli -- cate
  All or -- ders of the An -- gel state,
  The Pa -- tri -- archs in line to Thee,
  The Proph -- ets' good -- ly com -- pa -- ny.
}

verseThree = \lyricmode {
  \set stanza = "3."
  For souls in guilt en -- snar -- èd pray
  The Bap -- tist, her -- ald of Thy way,
  The wield -- er of the heav'n -- ly keys,
  The ap -- os -- tol -- ic wit -- ness -- es.
}

verseFour = \lyricmode {
  \set stanza = "4."
  For souls pol -- lut -- ed in -- ter -- cede
  Thy Mar -- tyrs, hal -- lowed in their deed,
  Con -- fes -- sors high in priest -- ly pow'r,
  And they who have the vir -- gin dower.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Let all who served Thy Church be -- low,
  And now Thy heav'n -- ly free -- dom know,
  Give heed to help our ling'r -- ing strife
  and claim for us the crown of life.
}

verseSix = \lyricmode {
  \set stanza = "6."
  To God the Fa -- ther, God the Son,
  And God the Spir -- it, Three in One,
  All hon -- our, praise and glo -- ry be
  From age to age e -- ter -- nal -- ly.
  A -- men.
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
    \new Lyrics \lyricsto soprano \verseFive
    \new Lyrics \lyricsto soprano \verseSix
    \new Staff  <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 92 4)
    }
  }
  \layout { }
}


