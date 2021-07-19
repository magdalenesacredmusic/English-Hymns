%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {WIE SCHÖN LEUCHTET, IRREG.}
    }
    \column{
      \line {Phillip Nicolai, 1599; harm. chiefly J.S. Bach}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Swedish, Johan Olof Wallin (1779-1839) 1814, based on a German hymn of 1621;}
     \line {tr. Ernst William Olson (1870-1958)}
    } 
  }
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
  e2 d4 \bar "|" \break

  d4 |
  a' fs d a' |
  b b a a |
  b cs d cs | \break
  b b a fs |
  b a g fs |
  e2 d2 \bar "|" \break

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
  All hail to thee, O bless -- èd morn!
To tid -- ings long by proph -- ets borne
Hast thou ful -- fill -- ment giv -- en.
O sa -- cred and im -- mor -- tal day,
When un -- to earth, in glo -- rious ray,
Des -- cends the grace of heav -- en!
Sing -- ing, ring -- ing, sounds are blend -- ing,
Prais -- es send -- ing un -- to heav -- en
For the Sav -- ior to us giv -- en.
}

verseTwo = \lyricmode {
  \set stanza = "2."
He tears, like oth -- er men, will shed,
Our sor -- rows share, and be our aid,
Through His e -- ter -- nal pow -- er;
The Lord's good will un -- to us show,
And min -- gle in our cup of woe
The drops of mer -- cy's show -- er;
Dy -- ing, buy -- ing through His pas -- sion
Our sal -- va -- tion and to mor -- tals
O -- pen -- ing the heav'n -- ly por -- tals.
}

verseThree = \lyricmode {
  \set stanza = "3."
He comes, for our re -- demp -- tion sent,
And by His glo -- ry heav'n is rent
To close up -- on us nev -- er;
Our bless -- èd Shep -- herd He would be,
Whom we may fol -- low faith -- ful -- ly
And be with Him for -- ev -- er;
High -- er, high -- er glo -- ry wing -- ing,
Prais -- es sing -- ing to the Fa -- ther
And His Son, our Lord and Sav -- ior.
}


\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
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
        tempoWholesPerMinute = #(ly:make-moment 84 4)
      }
    }
    \include "hymn_layout.ly"
  }
  \bottom
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}