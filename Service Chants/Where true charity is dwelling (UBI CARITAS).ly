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
      \line {UBI CARITAS}
    }
    \column{
      \line {Mode VI plainsong}
      \line {accomp. ICEL, 2010}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Ubi caritas est vera"}
      \line {Tr. \italic "The Roman Missal"}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global

  f8 f g[ a] a[ g] a bf a[ g] a[-- g] \bar "'" \noBreak
  f8 f f g g4 \bar "||"

  f8 f g8[ a] a[ g] a 
  bf a[ g] a[-- g] \bar "'" \noBreak
  f8 f g g4 \bar "||" \break


  f8 f g8[ a] a[ g] a 
  bf a[ g] a[-- g] \bar "'" \noBreak
  f8 f g g4 \bar "||"

  f8 g f g[ a] 

  a8 f g[ f] d[ -- c] g' a g f4  \bar "||"
  f8 g f g8[ a] a f g[ f] d8[-- c] 
  g'8 g8[ a g] f[ d f] f4 \bar "||" \break
  f8[ g f] e4( f) \bar "||"

}

melodya = \relative c' {
  \global
    \override Voice.Rest #'staff-position = #0
  \override Stem #'length = #0
  \hide Flag

  f4 f g( a) a( g) a bf a( g) a2( g) \bar "'" \noBreak
  f4 f f g g2 \bar "||"

  f4 f g4( a) a( g) a
  bf a( g) a2(^- g) \bar "'" \noBreak
  f4 f g g2 \bar "||" \break


  f4 f g( a) a( g) a 
  bf a( g) a2( g) \bar "'" \noBreak
  f4 f g \hn g4 \bar "||"

  f4 g f g( a) a4 f g( f) d2( c) g'4 a g f2 \bar "||"
  f4 g f g( a) a f g( f) d2( c) \bar "" \break
  g'4 g( a g) f( d f) f2 \bar "||"
 
 f4( g f) e2( f) \bar "||"

}

alto = \relative c' {
  \global
  c4 f2~ f2 d4~
  d4~ d4 e4

  c4 f2~ f2 d4~
  d4 e4.

  c4 f2~ f2 d4~
  d4 e4.

  c4 d4.~ d4~ d4 bf4 d4 c4.

  c4 d4.~ d4~ d4 bf4. d4.~ d4. c4

  d4. c4~ c4
}

tenor = \relative c' {
  \global
  a4 c2 d2 c8[ bf]
  a4 bf4 c4

  a4 c2 d2 c8[ bf]
  a4 c4.

  a4 c2 d2 c8[ bf]
  a4 c4.

  a4~ a4. f4~ f4~ f8[ e] bf'4~ bf8 a4

  a4~ a4. f4~ f4~ f8 e4 f4. g4. a4

  bf4. g4 a4
}

bass = \relative c {
  \global
  f4 f2 d2 g4
  d4 g4 c,4

  f4 f2 d2 g4
  d4 c4.

  f4 f2 d2 g4
  d4 c4.

  f4 d4. c4 bf4 c4 bf4 f'4.

  f4 d4. c4 bf4 c4. bf4.~ bf4. f'4

  g,4. c4 f,4
}

verseOne = \lyricmode {
  \set stanza = "℟." Where true char -- i -- ty is dwell -- ing,
  God is pre -- sent there.

  \set stanza = "1."
  By the love of Christ we have been
  brought to -- geth -- er:
  let us find in him our glad -- ness
  and our plea -- sure;
  may we love him and re -- vere him, God the liv -- ing,
  and in love re -- spect each oth -- er with sin -- cere hearts.
}

verseTwo = \lyricmode {
  _ _ _ _ _ _ _ _ _ _ _ _ _
  \set stanza = "2."
  So when we as one are gath -- ered 
  all to -- geth -- er,
  let us strive to keep our minds free 
  of di -- vi -- sion;
  may there be an end to mal -- ice, strife and quar -- rels,
  and let Christ our God be dwell -- ing here a -- mong us.
}

verseThree = \lyricmode {
  _ _ _ _ _ _ _ _ _ _ _ _ _
  \set stanza = "3."
  May your face thus be our vi -- sion, 
  bright in glo -- ry,
  Christ our God, with all the bless -- ed
  Saints in heav -- en:
  such de -- light is pure and fault -- less, joy un -- bound -- ed,
  which en -- dures through count -- less ag -- es world with -- out end.

  \set stanza = "3." A -- men.
}

\book {
  \include "hymn_paper_multipage.ly"
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
      %\new Lyrics \lyricsto soprano \verseFour
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 96 4)
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
    >>
    \include "hymn_layout_ragged.ly"
   % \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
