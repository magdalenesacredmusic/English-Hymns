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
      \line {EBENEZER (TON-Y-BOTEL) 87 87 D}
    }
    \right-column{
      \line {From an Anthem by}
      \line {Thomas Williams (1869-1944), 1890}
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
  \key af \major
  \time 4/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
f2 \tuplet 3/2 {f4 \melisma  g af \melismaEnd} g2 f |
g \tuplet 3/2 {g4  \melisma af bf \melismaEnd} af4.( g8) f2 |
c' \tuplet 3/2 {bf4  \melisma c df \melismaEnd} c4.( bf8) af2 |
bf4.( af8) g2 f1 \bar "||"

f2 \tuplet 3/2 {f4  \melisma g af \melismaEnd} g2 f |
g \tuplet 3/2 {g4  \melisma af bf \melismaEnd} af4.( g8) f2 |
c' \tuplet 3/2 {bf4  \melisma c df \melismaEnd} c4.( bf8) af2 |
bf4.( af8) g2 f1 \bar "||"

c'2 \tuplet 3/2 {af4  \melisma bf c \melismaEnd} bf2 bf |
af \tuplet 3/2 {f4  \melisma g af \melismaEnd} g2 g |
f \tuplet 3/2 {f4  \melisma g af \melismaEnd} bf2 bf |
af \tuplet 3/2 {bf4  \melisma af bf \melismaEnd} c1 \bar "||"

f,2 \tuplet 3/2 {f4  \melisma g af \melismaEnd} g2 f |
g \tuplet 3/2 {g4  \melisma af bf \melismaEnd} af4.( g8) f2 |
c'2 \tuplet 3/2 {bf4  \melisma c df \melismaEnd} c4.( bf8) af2 |
bf4.( af8) g2 f1 \bar "|."

}

alto = \relative c' {
  \global
c2 c e f
f e f c
c \tuplet 3/2 {ef2 f4} g2 f 
f e f1

c2 c e f
f e f c
c \tuplet 3/2 {ef2 f4} g2 f 
f e f1

ef2 ef ef ef 
c f f e
f c f ef
c f e1

af,2 f' e f
f e f f 
ef ef ef f 
f e f1
}

tenor = \relative c' {
  \global
af2 c c af 
df c c4.( bf8) af2
ef' \tuplet 3/2 {bf2 af4} c2 c 
df4.( c8) bf2 af1

af2 c c af 
df c c4.( bf8) af2
ef' \tuplet 3/2 {bf2 af4} c2 c 
df4.( c8) bf2 af1

af2 af af g 
af c c c 
f, af af g
af f g1

f2 c' c af 
df c c4.( bf8) af2
af \tuplet 3/2 {g4 af bf} af4.( g8) f2 
df'4.( c8) bf2 af1
}

bass = \relative c {
  \global
f,2 af c df
bf c f f 
af \tuplet 3/2 {g2 f4} e2 f
bf, c f1

f,2 af c df
bf c f f 
af \tuplet 3/2 {g2 f4} e2 f
bf, c f1

af,2 c ef ef 
f af, c c 
f ef df ef 
f4( ef) df2 c1

df2 af c df 
bf c f f 
af ef af, df
bf c f1
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
            \new Lyrics  \lyricsto soprano \verseFour
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 84 2 )
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
