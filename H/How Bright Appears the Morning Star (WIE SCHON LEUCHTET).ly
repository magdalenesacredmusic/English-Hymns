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
  poet = \markup{ \fontsize #4 \smallCaps "How Bright Appears the Morning Star"  }
  meter = \markup { \small { Music: WIE SCHÖN LEUCHTET, IRREG.; P. Nicolai, 1599; harm. J.S. Bach, adapt. traditional} }
  piece = \markup { \small {Text: \large \override #'(font-name . "CloisterBlack") "Wie schön leuchtet der Morgenstern," P. Nicolai, 1599; freely tr. W. Mercer, 1859  }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key d \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  a' fs d a' |
  b b a a |
  b cs d cs | \break
  b b a fs |
  b a g fs |
  e2 d4 \bar "||" \break

  d4 |
  a' fs d a' |
  b b a a |
  b cs d cs | \break
  b b a fs |
  b a g fs |
  e2 d2 \bar "||" \break

  a'2 fs |
  a fs |
  fs4 fs e e |
  fs fs e fs |
  g fs e2 |
  d d'4 cs |
  b a g fs |
  e2 d4 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  a4 |
  a a b cs |
  fs e e fs |
  g g fs e8[ a] |
  a4 gs e d |
  d d d8[ cs] d4 |
  d( cs) a

  a4 |
  a a b cs |
  fs e e fs |
  g g fs e8[ a] |
  a4 gs e d |
  d d d8[ cs] d4 |
  d( cs) a2

  e'2 d |
  e d |
  d4 d cs cs |
  d d cs ds |
  e d!8[ cs] b4( cs) |
  a2 fs'4 fs8[ e] |
  d8[ e] fs4 fs8[ e] e[ d] |
  d4( cs) a4
}

tenor = \relative c {
  \global
  \partial 4
  fs4 |
  e d8[ e] fs[ gs] a4 |
  a gs cs d |
  d e a,8[ b] cs4 |
  fs,8[ fs'] e[ d] cs4 a |
  g a b8[ g] a4 |
  a4.( g8) fs4

  fs4 |
  e d8[ e] fs[ gs] a4 |
  a gs cs d |
  d e a,8[ b] cs4 |
  fs,8[ fs'] e[ d] cs4 a |
  g a b8[ g] a4 |
  a4.( g8) fs2

  a2 a |
  cs a |
  a4 a a a |
  a a a a |
  b8[ cs] d4 d8[( cs16 b] a8[ g]) |
  fs2 fs8[ gs] as4 |
  b cs d8[ e] a,4 |
  b( a8[ g]) fs4
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  cs d b fs'8[ e] |
  d4 e a, d |
  g! fs8[ e] fs[ gs] a4 |
  d, e a, d |
  g fs e d |
  a2 d4

  d4 |
  cs d b fs'8[ e] |
  d4 e a, d |
  g! fs8[ e] fs[ gs] a4 |
  d, e a, d |
  g fs e d |
  a2 d2

  cs2 d |
  a d |
  d8[ e] fs[ g] a[ b] a[ g] |
  fs[ e] fs[ d] a[ a'] g[ fs] |
  e4 b'8[ a] g4( a) |
  d,2 b4 fs |
  g a b8[ cs] d4 |
  g,4( a)  << {\stemDown \ignore  \override Stem #'length = #4.0  d4} \\ {\teeny \override Stem #'length = #5.6 d,4 } >>
}

verseOne = \lyricmode {
  \set stanza = "1."
  How bright ap -- pears the Morn -- ing Star,
  With mer -- cy beam -- ing from a -- far;

  The host of heav'n re -- joi -- ces;
  O Righ -- teous Branch, O Jes -- se's Rod!
  Thou Son of man and Son of God!
  We, too, will lift our voi -- ces:

  Je -- sus, Je -- sus!
  Ho -- ly, ho -- ly, yet most low -- ly,
  Draw Thou near us;
  Great Em -- man -- uel, come and hear us.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Though cir -- cled by the hosts on high,
  He deigned to cast a pit -- ying eye
  Up -- on His help -- less crea -- ture;
  The whole cre -- a -- tion's Head and Lord,
  By high -- est se -- ra -- phim a -- dored,
  As -- sumed our ve -- ry na -- ture;
  Je -- sus, grant us,
  Through Thy me -- rit, to in -- he -- rit
  Thy sal -- va -- tion;
  Hear, O hear our sup -- pli -- ca -- tion.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Re -- joice, ye heav'ns; thou earth, re -- ply;
  With praise, ye sin -- ners, fill the sky,
  For this His in -- car -- na -- tion.
  In -- car -- nate God, put forth Thy pow'r,
  Ride on, ride on, great Con -- quer -- or,
  Till all know Thy sal -- va -- tion.
  A -- men, A -- men!
  Hal -- le -- lu -- jah! Hal -- le -- lu -- ia!
  Praise be gi -- ven
  Ev -- er -- more, by earth and hea -- ven.
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
      tempoWholesPerMinute = #(ly:make-moment 72 4)
    }
  }

  \layout {}
}


