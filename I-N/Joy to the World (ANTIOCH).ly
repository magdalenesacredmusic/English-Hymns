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
      \line {ANTIOCH  CM with repeat}
    }
    \right-column{
      \line {att. George Friedrich Handel, 1742}
      \line {arr. Lowell Mason, 1863}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {}
      \line {}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 2/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  d4 cs8. b16 |
  a4. g8 |
  fs4 e |
  d4. a'8 |
  b4. b8 |
  cs4. cs8 |
  d4. \bar "" %\break

  d8 |
  d8[ cs] b[ a] |
  a8.[ g16 fs8] d'8 |
  d8[ cs] b[ a] |
  a8.[ g16 fs8] \bar "" %\break

  fs8 |
  fs fs fs fs16[ g] |
  a4. g16[ fs] |
  e8 e e e16[ fs] |
  g4. \bar "" %\break
  
  fs16[ e] |
  d8( d'4) b8 |
  a8.[ g16 fs8] g8 |
  fs4 e |
  d2 \bar "|."
}

alto = \relative c' {
  \global
  fs4 a8. g16 |
  fs4. e8 |
  d4 cs |
  d4. a'8 |
  g4. g8 |
  e4. e8 |
  fs4.

  fs8 |
  fs8[ a] g8[ fs] |
  fs8.[ e16 d8] fs |
  fs8[ a] g8[ fs] |
  fs8.[ e16 d8]

  d |
  d8 d d d16[ e] |
  fs4. e16[ d] |
  cs8 cs cs cs16[ d] |
  e4. d16[ cs] |
  d8( fs4) g8 |
  fs8.[ e16 d8] e8 |
  d4 cs |
  d2
}

tenor = \relative c' {
  \global
  d4 d8. d16 |
  d4. b8 |
  a4. g8 |
  fs4. d'8 |
  d4. d8 |
  a4. a8 |
  a4.

  a8 |
  a4 d |
  d( a8) a |
  a4 d |
  d4( a8)

  d,8\rest |
  d4\rest d8\rest a'8 |
  a a a a |
  a2~ |
  a4. a8 |
  fs8( a4) d8 |
  d4. b8 |
  a4 a8[ g] |
  fs2
}

bass = \relative c {
  \global
  d4 d8. d16 |
  d4. g,8 |
  a4 a |
  d4. fs8 |
  g4. g8 |
  a4. a8 |
  d,4.

  d8 |
  d4 d |
  d4. d8 |
  d4 d |
  d4.

  s8 |
  s4 s8 d8 |
  d d d d |
  a'4. a,8 |
  a8 a a a |
  d4. d8 |
  d4. g,8 |
  a4 a |
  d2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Joy to the world! The Lord is come:
  Let earth re -- ceive her King;
  Let ev -- 'ry heart pre -- pare Him room,
  And heav'n and na -- ture sing,
  And heav'n and na -- ture sing,
  And heav'n, and heav'n and na -- ture sing.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Joy to the earth! The Sa -- vior reigns:
  Let men their songs em -- ploy;
  While fields and floods,
  Rocks, hills, and plains
  Re -- peat the sound -- ing joy,
  Re -- peat the sound -- ing joy,
  Re -- peat, re -- peat the sound -- ing joy.
}

verseThree = \lyricmode {
  \set stanza = "3."
  No more let sins and sor -- rows grow,
  Nor thorns in -- fest the ground;
  He comes to make His bless -- ings flow
  Far as the curse is found,
  Far as the curse is found,
  Far as, far as the curse is found.
}


verseFour = \lyricmode {
  \set stanza = "4."
  He rules the world with truth and grace,
  And makes the na -- tions prove
  The glo -- ries of His righ -- teous -- ness,
  And won -- ders of His love,
  And won -- ders of His love,
  And won -- ders, won -- ders of His love.
}

tenorWords = \lyricmode {
  _ _ _ _ _
  _ _ _ _ _
  _ _ _ _ _
  _ _ _ _ _ _ _
  And heav'n and na -- ture sing,
}

bassWords = \lyricmode {
  _ _ _ _ _
  _ _ _ _ _
  _ _ _ _ _
  _ _ _ _ _
  _ _ _ _ _
  _ _ _
  And heav'n and na -- ture sing,
}

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { %\transpose c g,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      \new Lyrics \lyricsto soprano \verseFour
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 80 4)
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
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
