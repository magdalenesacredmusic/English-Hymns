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
          \line {CRUEGER  76 76 D}
      }
      \column{
      \line {adapted by W.H. Monk (1823-89) from}
      \line {a chorale by J. Crüger (1598-1662)}
      }
}
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {James Montgomery (1771-1854)}
      \line {based on Psalm 72}
    }
  } 
}

\header {
  tagline = ""
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
\partial 4
c4 |
d c bf a |
g2 a4 a4 |
f f g c |
a2. \bar "||" \break

c4 |
d c bf a |
g2 a4 a4 |
f f g c |
a2. \bar "||" \break

a4 |
bf a g f |
e2 f4 a |
g g a f |
e2. \bar "||" \break

a4 |
a g a d |
c2 a4 c |
bf a g g |
f2. \bar "|."
}

alto = \relative c' {
   \global
\partial 4 
f4 |
f f f f |
f( e) f f |
c f f e |
f2.

f4 |
f f f f |
f( e) f f |
c f f e |
f2.

f4 |
f f e d |
d( cs) d f |
e d cs d |
cs2.

c4 |
f e f f |
e2 f4 f |
f f f e |
f2.
}

tenor = \relative c' {
  \global
\partial 4
a4 |
bf c d c |
c2 c4 c |
a a c c |
c2.

a4 |
bf c d c |
c2 c4 c |
a a c c |
c2.

c4 |
bf c c8[ bf] a4 |
a2 a4 c |
c g e f8[ g] |
a2.

a4 |
c4 c c bf8[ a] |
g4( c) c c |
d c c c8[ bf] |
a2.
}

bass = \relative c {
  \global
  \partial 4
  f4 |
  bf, a bf f' |
  c2 f4 f |
  a f c c |
  f2.
  
    f4 |
  bf, a bf f' |
  c2 f4 f |
  a f c c |
  f2.
  
  f4 |
  d f c d |
  a2 d4 f, |
  c' bf a d |
  a2.
  
  f'4 |
  f c f bf, |
  c2 f4 a, |
  bf f' c c |
  f,2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Hail to the Lord's A -- noint -- ed!
  Great Da -- vid's great -- er Son;
  Hail, in the time ap -- point -- ed,
  His reign on eath be -- gun!
  He comes to break op -- pres -- sion,
  To set the cap -- tive free;
  To take a -- way trans -- gres -- sion,
  And rule in e -- qui -- ty.
}

verseTwo = \lyricmode {
  \set stanza = "2."
He comes with suc -- cor speed -- y
To those who suf -- fer wrong;
To help the poor and need -- y,
and bid the weak be strong;
To give them songs for sigh -- ing,
Their dark -- ness turn to light,
Whose souls, con -- demned and dy -- ing,
Were pre -- cious in his sight.
}

verseThree = \lyricmode {
  \set stanza = "3."
He shall come down like show -- ers
Up -- on the fruit -- ful earth,
And love, joy, hope, like flow -- ers,
Spring in his path to birth:
Be -- fore him on the moun -- tains
Shall peace the her -- ald go;
And right -- eous -- ness in foun -- tains
From hill to val -- ley flow.
}

verseFour = \lyricmode {
  \set stanza = "4."
Kings shall fall down be -- fore him,
And gold and in -- cense bring;
All na -- tions shall a -- dore him,
His praise all peo -- ple sing;
To him shall prayer un -- ceas -- ing
And dai -- ly vows as -- cend;
His king -- dom still in -- creas -- ing,
A king -- dom with -- out end.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Oer ev -- 'ry foe vic -- to -- rious,
  He on his throne shall rest,
  From age to age more glo -- rious,
  All -- bless -- ing and all -- blest:
  The tide of time shall nev -- er
  His cov -- e -- nant re -- move;
  His name shall stand for ev -- er;
  That name to us is Love.
}

\book {
  \include "hymn_paper_multipage.ly.ly"
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
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
