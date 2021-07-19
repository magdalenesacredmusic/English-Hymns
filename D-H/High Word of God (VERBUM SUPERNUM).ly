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
      \line {VERBUM SUPERNUM  LM}
    }
    \right-column{
      \line {\italic "Antiphonarium Romanum," Mechlin; harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Verbum supernum prodiens," c. 10th cent.}
      \line {Sarum Advent hymn; tr. Charles Biggs, 1906}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \cadenzaOn
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  g4 \bar "dashed"
  a( g) a \bar "dashed"
  c( b) a \bar "dashed"
  g( e) f \bar "dashed"
  g2 \bar "||"

  g4 b c \bar "dashed"
  d( c) b g a \bar "dashed"
  c2 \bar "||"

  a4 \bar "dashed"
  c b c g \bar "dashed"
  a( g) f \bar "dashed"
  g2 \bar "||"

  g4 \bar "dashed"
  a( g) a \bar "dashed"
  c( b) a \bar "dashed"
  g( e4.) f8 \bar "dashed"
  g2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  <c e>4
  << {\voiceTwo c b} \\ {\voiceFour e2 } >> <d f>4
  e2 <c f>4
  <b d> <a c>2
  c4 b

  <b d> <d g> <f a>
  <f a> <e g> <d g> c f
  e2

  <c f>4
  <c g> <d g> <c e> e
  <c f> <b d> c
  b2

  <b d>4
  <c f> <b d> f'
  e2 c4
  b c2
  c4 b \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4
  s4
  s2.
  s2.
  s2.
  g2

  s2.
  s1 s4
  s2

  s4
  s1
  s2 f4
  d2

  s4
  s2 a'4
  a g f
  d a2
  d2
}

bass = \relative c {
  \global
  \partial 4
  c4
  a e' d
  a e f
  <g g'> a2
  g2

  g'4 g f8[ e]
  d4 e g e d
  c2

  f,4
  e g a c
  f, g a
  g2

  g4
  f g d'
  a <e e'> f
  g a2
  g2
}


verseOne = \lyricmode {
  \set stanza = "1."
  High Word of God, who once didst come,
  Leav -- ing Thy Fath -- er and Thy home,
  To suc -- cour by Thy birth our kind,
  When, towards Thy ad -- vent, time de -- clined,
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Pour light up -- on us from a -- bove,
  And fire our hearts with Thy strong love,
  That, as we hear Thy Gos -- pel read,
  All fond de -- sires may flee in dread;
}

verseThree = \lyricmode {
  \set stanza = "3."
  That when Thou com -- est from the skies,
  Great Judge, to o -- pen Thine as -- size,
  To give each hid -- den sin its smart,
  And crown as kings the pure in heart,
}

verseFour = \lyricmode {
  \set stanza = "4."
  We be not set at Thy left hand,
  Where sen -- tence due would bid us stand,
  But with the Saints Thy face may see,
  For ev -- er whol -- ly lov -- ing Thee.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Praise to the Fa -- ther and the Son,
  Through all the a -- ges as they run;
  And to the ho -- ly Par -- a -- clete
  Be praise with Them and wor -- ship meet.
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
      \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}