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
      \line {DEUS TUORUM MILITUM  LM}
    }
    \right-column{
      \line {Grenoble Church Melody}
      \line {\italic "The English Hymnal" }
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Deus tuorum militum"}
      \line {Common of Martyr(s). Vespers.;  Tr. J.M. Neale}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  \partial 4 c4^\markup { \italic "To be sung in unison." } |
  e2 g4 | c2 g4 |
  f4( e4) d4 |
  c2 \bar ""

  c'4 |
  e2 c4 |
  a4( b) c |
  g2 fs4 |
  g2 \bar ""

  g4 |
  a2 b4 |
  c2 g4 |
  f4( e) d |
  e2 \bar ""

  g4 |
  a4( b) c |
  g( f) e |
  d2 c4 |
  \time 2/4 c2 \bar "||" \break
  
  \time 3/4 c2( d4
  c2 b4)
  c2 \bar "|."
}

melodya = \relative c' {
  \global
  \partial 4 c4 |
  e2 g4 | c2 g4 |
  f4( e4) d4 |
  c2 \bar ""

  c'4 |
  e2 c4 |
  a4( b) c |
  g2 fs4 |
  g2 \bar "" \break

  g4 |
  a2 b4 |
  c2 g4 |
  f4( e) d |
  e2 \bar ""

  g4 |
  a4( b) c |
  g( f) e |
  d2 c4 |
 \time 2/4 c2 \bar "||" \break
  
  \time 3/4 c2( d4
  c2 b4)
  c2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  s4 |
  s2. |
  <c e>2 <c e>4 |
  s2. |
  s2 

  <e g>4 |
  <e a>2 <e a>4 |
  fs2 <e g>4 |
  b2 d4 |
  d2 

  <c e>4 |
  <c f>2 f4 |
  e2 c4 |
  c2 b4 |
  b2 

  c4 |
  <c e>4 \tieUp <d g ~>4 <e g>4 |
  <b d>4 c c |
  s2 c4 |
  c2 
  
}

tenor = \relative c {
  \global
  \partial 4
  <e g>4 |
  <g c>2 <g b>4 |
  s2. |
  <a c>4 g4 b4 |
  <e, g>2 

  c'4 |
  c2 a4 |
  d2 g,4 |
  g2 a4 |
  <g b>2 


  s4 |
  s2 b4 |
  a2 g4 |
  a g g |
  g2

  e4 |
  s2. |
  s4 a4 g |
  <g b>2 <e g>4 |
  <e g>2 
  
  <e a>2 <f a>4
  <e g>2 <d g>4
  <e g>2
}

bass = \relative c {
  \global
  \partial 4
  c4 |
  c2 e4 |
  a,2 c4 |
  f4 c4 g'4 |
  c,2 

  c'4 |
  a2 c,4 |
  d2 c4 |
  e2 d4 |
  g,2 

  c4 |
  f2 d4 |
  a2 e'4 |
  f c g' |
  e2 

  c4 |
  a g e |
  g a c |
  g2 <c, c'>4 |
  <c c'>2 
  
  a'2 d,4 
  e2 g4
  c2
}


verseOne = \lyricmode {
  \vOne
  Of all thy war -- rior saints, O Lord,
  The por -- tion, crown, and great re -- ward:
  From all trans -- gres -- sions set us free
  Who sing thy mar -- tyrs' vic -- to -- ry.
}

verseTwo = \lyricmode {
  \vTwo
  By wis -- dom taught, they learned to know
  The van -- i -- ty of all be -- low,
  The fleet -- ing joys of earth dis -- dained,
  And ev -- er -- last -- ing glo -- ry gained.
}

verseThree = \lyricmode {
  \vThree
  Cou -- ra -- geous -- ly the cross they bore,
  And ran the race of tor -- ments sore;
  For thee they poured their lives a -- way,
  With thee they live in end -- less day.
}

verseFour = \lyricmode {
  \vFour
  We there -- fore pray thee, Lord of love,
  Re -- gard us from thy throne a -- bove;
  On this thy Mar -- tyrs' tri -- umph day,
  Wash ev -- ry stain of sin a -- way
}


verseFive = \lyricmode {
  \vFive
  En -- dur -- ing laud and praise be done
  to God the Fa -- ther, and the Son,
  And to the Ho -- ly Par -- a -- clete,
  For end -- less a -- ges, as is meet.
  
  A -- men.
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
      \new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 112 4)
      }
    }
    \include "hymn_layout_ragged.ly"
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
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

