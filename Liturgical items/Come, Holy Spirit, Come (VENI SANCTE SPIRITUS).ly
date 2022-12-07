\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"


top = \markup {
  \fill-line {
    \column {
      \line {VENI SANCTE SPIRITUS}
    }
    \right-column{
      \line {Mode I, Gregorian}
      \line {Harm. Achille P. Bragers (1887-1955)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Veni Sancte Spiritus"}
      \line {Tr. \italic "Lectionary," 1993}
    }
  }
}

global = {
  \key d \minor
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  c8[ d] e f e[ d] c d4 \divisioMaior \bar ""
  \set melismaBusyProperties = #'() \slurDashed f8( g) \unset melismaBusyProperties a bf a[ g f] g a4 \divisioMaior \bar "" \break
  c,8 d f g f[ e d] c d4 b'8\rest \finalis \bar ""

  %3
  a8 c d d c[ b!] c d4 \divisioMaior \bar "" \break
  c8 a c[ b!] g f[ e] d c4 \divisioMaior \bar ""
  g'8 f g[ a] g f[ e d] c d4 b'8\rest \finalis \bar ""  \break

  %5
  d8 d c[ b!] c d[ c] b a4 \divisioMaior \bar ""
  f8 d c d f g f4 \divisioMaior \bar "" \break
  g8[ a] bf! a g f[ e d] c d4 b'8\rest \finalis \bar ""

  %7
  a8 c b![ a] b c[ b!] a g4 \divisioMaior \bar ""  \break
  a8 a f[ e] f g[ f] e d4 \divisioMaior \bar ""
  e8 g a g c b! a4 b8\rest \finalis \bar ""  \break

  %9
  d8 d g, a c b! a4 \divisioMaior \bar ""
  a8 bf! a[ g] a f g f4 \divisioMaior \bar ""  \break
  e8 g a d, f e d4 b'8\rest \finalis \bar ""

  %Amen
  d,8[ e d] c4( d) \divisioMinima \bar ""
  c8 f e[ d] d4 \finalis \bar ""
}

alto = \relative c' {
  \global
  %1
  a2~ a4.~ a4
  d2~ d2~ d4
  c2 bf a4.

  %3
  f'2 g4. f4~
  f e4. d4 d8 c4~
  c4~ c4. a4 g a4.

  %5
  d4 e4.f4. e4
  r4 c bf a
  d4. c4~ c2 a4.


  %7
  e'4~ e4.~ e4.~ e4~
  e4 c4.~ c4. a4
  c d~ d c4.

  %9
  d4 g~ g e
  f d4.~ d4~ d~
  d~ d a~ a4.~

  a4. g4 a
  c~ c a
}

tenor = \relative c {
  \global
  %1
  f4~ f g4. f4
  a2 bf a4
  g f g2 f4. \finalis

  %3
  a2 g4. a4~
  a~ a4.~ a4. g4
  f e4. d4 e f4. \finalis

  %5
  a4 g4. a4.~ a4~
  a g f2~
  f4.~ f4~ f4 e4 f4. \finalis

  %7
  a4 g4. a4. b4
  a4~ a4. e4. f4
  g4~ g f e4. \finalis


  %9
  a4 c d c~
  c bf4.~ bf4 a
  g f g f4.~ \finalis

  %Amen
  f4. g4 f
  a g f \finalis
}

bass = \relative c {
  \global
  %1
  f4 d~ d4.~ d4~
  d f g2 f4
  e d~ d2~ d4.

  %3
  d4 f e4. d4~
  d c4. d4. e4
  d c4. d2~ d4.

  %5
  f4 e4. d4. c4
  d4 e d2
  bf4. f4 a2 d4.

  %7
  c4 e4.~ e4.~ e4
  c4 a4. c4. d4
  c b! a4~ a4.

  %9
  f'4 e g a8[ g]
  f4 g4. d4~ d~
  d~ d2~ d4.~

  %Amen
  d4. e4 d
  a c d
}


verseOne = \lyricmode {
  \set stanza = "1."
  Come, Ho -- ly Spir -- it, come!
  And from your ce -- les -- tial home
  Shed a ray of light di -- vine!

  \set stanza = "3."
  You, of com -- for -- ters the best;
  You, the soul’s most wel -- come guest;
  Sweet re -- fresh -- ment here be -- low;

  \set stanza = "5."
  O most bless -- ed Light di -- vine,
  Shine with -- in these hearts of yours,
  And our in -- most be -- ing fill!

  \set stanza = "7."
  Heal our wounds, our strength re -- new;
  On our dry -- ness pour your dew;
  Wash the stains of guilt a -- way:

  \set stanza = "9."
  On the faith -- ful, who a -- dore
  And con -- fess you, ev -- er -- more
  In your sev'n -- fold gift de -- scend;
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Come, Fa -- ther of the poor!
  Come, _ source of all our store!
  Come, with -- in our bo -- soms shine.


  \set stanza = "4."
  In our la -- bor, rest most sweet;
  Grate -- ful cool -- ness in the heat;
  Sol -- ace in the midst of woe.

  \set stanza = "6."
  Where you are not, we have naught,
  Noth -- ing good in deed or thought,
  Noth -- ing free from taint of ill.


  \set stanza = "8."
  Bend the stub -- born heart and will;
  Melt the fro -- zen, warm the chill;
  Guide the steps that go a -- stray.

  \set stanza = "10."
  Give them vir -- tue’s sure re -- ward;
  Give them your sal -- va -- tion, Lord;
  Give them joys that nev -- er end.

  A -- men.
  Al -- le -- lú -- ia.
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
 % \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
 % \bottom
}
