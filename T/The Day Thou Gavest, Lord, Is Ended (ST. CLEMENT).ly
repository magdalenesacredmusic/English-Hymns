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
  poet = \markup{ \fontsize #4 \smallCaps "The Day Thou Gavest, Lord, Is Ended"  }
  meter = \markup { \small { Music: ST. CLEMENT, 9.8.9.8, Clement C. Scholefield, 1874 } }
  piece = \markup { \small {Text: John Ellerton, 1870 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key af \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  ef4 |
  c'( df) c |
  ef( c) bf |
  af( bf) f |
  af g \bar "||"
  f |
  ef2 ef4 |
  af( bf) c |
  bf2 af4 |
  g2 \bar "||"
  ef4 |
  c'( df) c |
  ef( c) bf |
  af( bf) f |
  af g \bar "||"
  f |
  ef( f) g |
  af( c) bf |
  f( af) g |
  af2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  ef4 |
  ef2 af4 |
  g2 g4 |
  af( f) f |
  df df \bar "||"
  df |
  df( c) ef |
  f2 ef4 |
  d2 d4 |
  ef2 \bar "||"
  ef4 |
  ef2 af4 |
  g2 g4 |
  af( f) f |
  df df \bar "||"
  bf |
  ef2 df4 |
  c( ef) f |
  f2 ef4 |
  ef2 \bar "|."
}

tenor = \relative c {
  \global
  \partial 4
  ef4 |
  af2 af4 |
  bf( ef) df |
  c( df) bf |
  bf bf \bar "||"
  af |
  bf( af) bf |
  c2 af4 |
  f2 bf4 |
  bf2 \bar "||"
  bf4 |
  af2 af4 |
  bf( ef) df |
  c( df) bf |
  bf bf \bar "||"
  g |
  af2 bf4 |
  af2 df4 |
  df2 df4 |
  c2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  ef4 |
  af,2 af'4 |
  ef2 ef4 |
  f( bf,) df |
  ef ef \bar "||"
  f |
  g( af) g |
  f2 f4
  bf,2 bf4 |
  ef2 \bar "||"
  g4 |
  af2 af4 |
  ef2 ef4 |
  f( bf,) df |
  ef ef \bar "||"
  df |
  c2 ef4 |
  f( c) df |
  bf2 ef4 |
  af,2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  The day thou gav -- est, Lord, is end -- ed,
  The dark -- ness falls at Thy be -- hest;
  To Thee our morn -- ing hymns as -- cend -- ed,
  Thy praise shall hal -- low now our rest.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  We thank Thee that Thy Church un -- sleep -- ing,
  While earth rolls on -- ward in -- to light,
  Through all the world her watch is keep -- ing,
  And rests not now by day or night.
}

verseThree = \lyricmode {
  \set stanza = "3."
  As o'er each con -- ti -- nent and is -- land
  The dawn leads on an -- oth -- er day,
  The voice of prayer is nev -- er si -- lent,
  Nor dies the strain of praise a -- way.
}

verseFour = \lyricmode {
  \set stanza = "4."
  The sun, that bids us rest, is wak -- ing
  Our breth -- ren 'neath the west -- ern sky,
  And hour by hour fresh lips are mak -- ing
  Thy won -- drous do -- ings heard on high.
}

verseFive = \lyricmode {
  \set stanza = "5."
  So be it, Lord; Thy throne shall nev -- er,
  Like earth's proud em -- pires, pass a -- way:
  But stand, and rule, and grow for ev -- er,
  Till all Thy crea -- tures own Thy sway.
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
      \context Lyrics = five \lyricsto sopranos \verseFive
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