\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"


top = \markup {
  \fill-line {
    \column {
      \line {VICTIMAE PASCHALI LAUDES}
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
      \line {\italic "Victimae paschali laudes"}
      \line {Tr. \italic "Lectionary," 1993}
    }
  }
}


global = {
\key e \minor
\cadenzaOn
\autoBeamOff
\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
\global
b'8\rest e, d e g a g fs e4 \divisioMinima \bar ""
b'8 a fs a g fs e4 b'8\rest \finalis \bar ""

%Agnus redemit
b8 d e b a[ b] b4 \divisioMaior \bar "" 
b8 a b a g fs e4 \divisioMinima \bar ""  \break
g8 a e fs e d4 fs8  \bar ""  g fs e4 b'8\rest  \finalis \bar "" 

%Mors et vita
b8 d e b a b b4 \divisioMaior \bar "" 
b8 a b a g fs e4 \divisioMinima \bar "" 
g8 a e fs e \bar "" d4 fs8 g fs e4 \finalis \bar ""

%Dic nobis
b'8\rest b, d e g a fs[-- e] \divisioMinima \bar "" 
d g fs[ e] fs d e4 b'8\rest \finalis \bar ""

%Sepulcrum
g8 b a b \bar ""  g a g[ fs] e4 \divisioMaior \bar ""
e8 a g a b a g a g[ fs] e4 \finalis \bar ""

%Angelicos
b'8\rest b, d e g a fs[-- e] \divisioMinima \bar "" \break
d8 g fs e fs d e4 b'8\rest \finalis \bar ""

%Surrexit Christus spes mea
g8 b a b g a g[ fs] e4 \divisioMaior \bar "" \break
e8 a g a b[ a] \bar ""  g a g[ fs] e4 \finalis \bar ""

b'8\rest b d e \bar "" \break b b a b b4 \divisioMinima \bar ""
b8 d a g fs e4 \divisioMaior \bar ""
d8 g fs  a b b4 \divisioMinima \bar ""
g8 a g[ fs] e4 b'8\rest \finalis \bar ""

%Amen
e,8[ fs e] d4( e) \divisioMinima \bar ""
d8 g fs[ e] e4 \finalis \bar ""
}

alto = \relative c' {
\global
b2 c b4~ 
b2.~ b4.

g'2. fs4
d2. b4~
b8 c4 b a4. b4~b4.

e2.~ e4
b2.~ b4.
c4 b a4. b2

b8\rest b8~ b4 c b
d2~ d4 b4.

e2 c b4.
e4~ e4. d4 c b 

%Angelicos
s8 b~ b4 c b
d2 b4~ b4.

e2 d4 c b
e8~ e4~ e4. d4 c b

e g fs e d4.~ d2 b4.
d4 c b
d2 b4.~ 

b4. a4 b
d2 b4
}

tenor = \relative c' {
\global
g2~ g4 a g 
fs2. g4. \finalis

b2.~ b4
fs g a g4~ 
g8~ g2 a4.~
a4 g4.~ \finalis

g2~ g4~ g~
g fs e g4.~
g2
a4.~ a4 g~ \finalis

g2.~ g4 b2 a4 g4. \finalis

b4 c b a g4. a4 c4. b4 a g~ \finalis

g~ g2~ g4
b a~ a g4. \finalis

b4 c b a g4~
g8 a4 c4.
b4 a g~ \finalis

g b~ b c b4.
a2 g4.
g2~ g4~ g a g4.~ \finalis

g4. a4 g~ 
g a g \finalis
}

bass = \relative c {
\global
 e2~ e~ e4
d2. e4.

e2. d4~
d2. e4~
e8~ e2 fs4. e4~ e4.

g2 fs4 e~
e d e~ e4.~ e2 fs4. e2~

e2.~ e4
b2. e4.~

e2~ e~ e4 
d8 c4~ c4. e2~ e4~

e~ e2~ e4
b d e~ e4.~

e1~ e4 
d8 c4~ c4. e2~ e4~

e4~ e d c g'4.
fs4 d e4.
b4 a g
b d e4.

g4. fs4 e b d e
}

verseOne = \lyricmode {

Chris -- tians, to the Pas -- chal Vic -- tim
Of -- fer your thank -- ful prais -- es!

A Lamb the sheep re -- deems;
Christ, who on -- ly is sin -- less,
Re -- con -- ci -- les sin -- ners to the Fa -- ther.

Death and life have con -- tend -- ed 
in that com -- bat stu -- pen -- dous:
The Prince of life, who died, reigns im -- mor -- tal.

Speak, Ma -- ry, de -- clar -- ing
What you saw, way -- far -- ing.

“The tomb of Christ, who is liv -- ing,
The glo -- ry of Je -- sus’ re -- sur -- rec -- tion;

bright an -- gels at -- test -- ing,
The shroud and nap -- kin rest -- ing.

Yes, Christ my hope is a -- ris -- en;
to Ga -- li -- lee he goes be -- fore you.”

Christ in -- deed from death is ri -- sen, 
our new life ob -- tain -- ing.
Have mer -- cy, vic -- tor King, 
ev -- er reign -- ing!

A -- men. Al -- le -- lu -- ia.
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
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
 % \bottom
}
