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
      \line {HELMSLEY  87 87 47}
    }
    \right-column{
      \line {attr. Thomas Olivers; \italic "The English Hymnal"}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Charles Wesley}
    }
  } 
}

\header {
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
  %\partial 4
  g2 b4( d) |
  g,( fs) e( d) |
  e4.( fs8 g4) fs8[ e] |
  d4.( c8) b2 \bar "||" 

  d2. d4 |
  g2 a |
  b4( d) c( b) |
  b2( a4) b4\rest \bar "||" \break

  %repeat
  g2 b4( d) |
  g,( fs) e( d) |
  e4.( fs8 g4) fs8[ e] |
  d4.( c8) b2 \bar "||"

  d2. d4 |
  g2 a |
  b4( d) c( b) |
  b2( a4) b4\rest \bar "||" \break


  a4.( b8 a4) b |
  c2 b |
  g4.( a8 g4) c4 |
  b( a) g2 |
  b4.( c8 b4) d |
  c( b) a2 \bar "||"

  g2. a8[ b] |
  d,2 c' |
  b a |
  g1 \bar "|."
}

alto = \relative c' {
  \global
  %\partial 4
  d2 d |
  b4( d) c( d) |
  c4.( d8 e4) d8[ c] |
  a2 g \bar "||"

  a2. d4 |
  d2 e4( fs) |
  g( b) a( g) |
  g2( fs4) s4 \bar "||"

  %repeat
  d2 d |
  b4( d) c( d) |
  c4.( d8 e4) d8[ c] |
  a2 g \bar "||"

  a2. d4 |
  d2 e4( fs) |
  g( b) a( g) |
  g2( fs4) s4 \bar "||"


  fs4.( g8 fs4) d |
  e( fs) g2 |
  d( e4) e |
  g( fs) e2 |
  e2. d4 |
  fs( g) g( fs) \bar "||"

  d2. d4 |
  d2 g |
  g fs |
  g1 \bar "|."
}

tenor = \relative c' {
  \global
  b2 b4( a) |
  g( b) g8[( a] b4) |
  g2. g4 |
  fs2 g \bar "||"

  fs4( g fs) fs |
  g2 c |
  b e |
  d2. s4 \bar "||"

  %repeat
  b2 b4( a) |
  g( b) g8[( a] b4) |
  g2. g4 |
  fs2 g \bar "||"

  fs4( g fs) fs |
  g2 c |
  b e |
  d2. s4 \bar "||"


  d2. d4 |
  c2 d |
  b4.( a8 b4) c |
  d4.( c8) b2 |
  g4.( a8 g4) g |
  a4( b8[ c]) d2 \bar "||"

  b2. b4 |
  a2 g4( a) |
  b( c) d( c) |
  b1 \bar "|."
}

bass = \relative c' {
  \global
  g2 g4( fs) |
  e( b) c( g) |
  c2. c4 |
  d2 g, \bar "||"

  d'4( e d) c |
  b2 a |
  g c |
  d2. d4\rest \bar "||"

  %repeat
  g2 g4( fs) |
  e( b) c( g) |
  c2. c4 |
  d2 g, \bar "||"

  d'4( e d) c |
  b2 a |
  g c |
  d2. d4\rest \bar "||"


  d2. b4 |
  a2 g |
  g'4.( fs8 e4) a, |
  b8[( c] d4) e2 |
  e2. b4 |
  a( g) d'2 \bar "||"

  g2. g4 |
  fs2 e |
  d d |
  g,1 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  Lo! He comes with clouds de -- scend -- ing,
  Once for fa -- vored sin -- ners slain;
  Thou -- sand thou -- sand saints at -- tend -- ing,
  Swell the tri -- umph of His train:
  Hal -- le -- lu -- jah! Hal -- le -- lu -- jah! Hal -- le -- lu -- jah!
  God ap -- pears on earth to reign.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Ev -- 'ry eye shall now be -- hold Him
  Robed in dread -- ful ma -- jes -- ty;
  Those who set at naught and sold Him,
  Pierced and nailed Him to the tree,
  Deep -- ly wail -- ing, deep -- ly wail -- ing, deep -- ly wail -- ing,
  Shall the true Mes -- si -- ah see.
}

verseThree = \lyricmode {
  \set stanza = "3."
  The dear to -- kens of His pas -- sion
  Still His dazz -- ling bo -- dy bears;
  Cause of end -- less ex -- ul -- ta -- tion
  To His ran -- somed wor -- ship -- pers;
  With what rap -- ture, with what rap -- ture, with what rap -- ture
  Gaze we on those glo -- rious scars!
}


verseFour = \lyricmode {
  \set stanza = "4."
  Yea, A -- men! let all a -- dore Thee,
  High on Thine e -- ter -- nal throne;
  Sa -- vior, take the pow'r and glo -- ry,
  Claim the king -- dom for Thine own;
  O come quick -- ly! O come quick -- ly! O come quick -- ly!
  Ev -- er -- last -- ing God, come down!
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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
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

