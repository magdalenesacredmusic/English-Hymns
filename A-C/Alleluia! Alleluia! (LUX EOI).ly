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
          \line {LUX EOI  87 87 D}
      }
      \column{
      \line {Arthur S. Sullivan, 1842-1900}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {Christopher Wordsworth, 1807-85}
   }
  } 
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g4. g8 c4 g |
  g f f e |
  a a g e | 
  d c d2 |
  
  g4. g8 c4 c |
  b a d g, |
  fs e d g |
  g fs g2 |
  
  f4 f e e |
  a4. a8 a4 gs |
  a b c b |
  e, gs a2 |
  
  g4 c e d |
  c b a g |
  fs f e a |
  c, d c2 \bar "|."
}

alto = \relative c' {
   \global
  c4. c8 c4 c |
  e d d c |
  c d e g, |
  a a b2 |
  
  b4. b8 c4 c |
  d d d d |
  d c b e8[ d] |
  c4 c b2 |
  
  c4 c b b |
  c d e e |
  e e e f |
  e e e2 |
  
  f4 e g g |
  g g f e |
  e d c c |
  g b c2
}
tenor = \relative c {
  \global
  e4. e8 e4 g |
  c b b c |
  a b c e, |
  fs fs g2 |
  
  g4. g8 g4 g |
  g fs g g |
  g a b c8[ b] |
  a4 d, d2 |
  
  f4 f g g |
  a a b b |
  a gs a a8[ b] |
  c4 b c2 |
  
  d4 c c b |
  c c c c | 
  c g c, d4 |
  e f e2 
}

bass = \relative c {
  \global
  c4. c8 c4 e |
  g g, g a |
  f' f e c |
  a d g,2 |
  
  g'4. f8 e4 e |
  d c b b |
  c c d d |
  d d g,2 |
  
  a4 a g g |
  f f' e e |
  c b a d |
  e e a2 |
  
  b4 c g f |
  e e, f g |
  a b c f, |
  g g c2
}

verseOne = \lyricmode {
  \set stanza = "1. "
Al -- le -- lu -- ia! Al -- lu -- lu -- ia!
  Hearts to heav'n and voic -- es raise;
Sing to God a hymn of glad -- ness,
  Sing to God a hymn of praise;
He who one the Cross a Vic -- tim
  For the world's sal -- va -- tion bled,
Je -- sus Christ, the King of Glo -- ry,
  Now is ris -- en from the dead.
}

verseTwo = \lyricmode {
  \set stanza = "2. "
Christ is ris -- en, Christ the first -- fruits
  Of the ho -- ly har -- vest field
Which will all its full a -- bun -- dance
  At his sec -- ond com -- ing yield;
Then the gold -- en ears of har -- vest
  Will their heads be -- fore him wave,
Ri -- pened by his glo -- rious sun -- shine 
  From the fur -- rows of the grave.
}

verseThree = \lyricmode {
  \set stanza = "3. "
Christ is ris -- en, we are ris -- en!
  Shed up -- on us heav'n -- ly grace,
Rain and dew and gleams of glo -- ry
  From the bright -- ness of thy face;
That we, Lord, with hearts in heav -- en,
  Here on earth may fruit -- ful be,
And by an -- gel hands be gath -- ered
  And be ev -- er safe with thee.
}

verseFour = \lyricmode {
  \set stanza = "4. "
Al -- le -- lu -- ia! Al -- lu -- lu -- ia!
  Glo -- ry be to God on high;
Al -- le -- lu -- ia! to the Sa -- vior
  Who has gained the vic -- to -- ry;
Al -- le -- lu -- ia! to the Spir -- it,
  Font of love and sanc -- ti -- ty;
Al -- le -- lu -- ia! Al -- lu -- lu -- ia!
  To the Tri -- une Ma -- jes -- ty.
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
