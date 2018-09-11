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
      \line {OLD 104TH   10 10 11 11}
    }
    \right-column{
      \line {Thomas Ravenscroft's  \italic "Whole Book of Psalmes," 1621}
      \line {harm. R. Vaughan Williams}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Supreme, quales, Arbiter", Jean-Baptiste de Santeuil (1630-97)}
      \line {tr. Isaac Williams (1802-65), alt. \italic "The English Hymnal," 1906}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
\partial 4 
d4 |
f e d |
a'2 f4 |
g bf a |
g2 \bar "||"

g4 |
a c b |
c2 f,4 |
a g g |
f2 \bar "||"

f4 |
f f g |
a f f |
g bf a |
g2 \bar "||"

d'4 |
c f, bf |
a g f |
g a e |
d2 \bar "|."
}

alto = \relative c' {
  \global
\partial 4 
d4 |
d a a |
cs2 d4 |
d4. e8 f4 |
e2

e4 |
f e g |
g2 f4 f f e |
f2

c4 |
d c e |
f c d |
d g fs |
g2 

f4 |
f f e |
f e d |
d4. cs16[ b] cs4 |
d2
}

tenor = \relative c {
  \global
\partial 4 
f4 |
a a f |
e2 bf'4 |
bf bf c |
c2 

c4 |
c c d |
e2 d4 |
c d c |
a2 

a4 |
bf c bf |
c a bf |
bf d d  |
bf2 

bf4 |
c d bf |
c4. bf8 a4 |
bf a a8[ g] |
f2
}

bass = \relative c {
  \global
d4 |
d cs d |
a2 bf4 |
g g' f |
c2 

c4 |
f a g |
c,2 d4 |
f bf, c |
f,2 

f'4 |
bf a g |
f f bf |
g g d |
g2 

bf4 |
a bf g |
f c d |
g,4 f8[ g] a4 |
f2
}

verseOne = \lyricmode {
  \set stanza = "1. "
Dis -- pos -- er sup -- reme, and Judge of the earth
  Who choos -- est for thine the weak adn the poor;
  To frail earth -- en ves -- sels, and things of no worth,
  En -- trust -- ing thy rich -- es which ay shall en -- dure;
}

verseTwo = \lyricmode {
  \set stanza = "2. "
Those ves -- sels soon fail, though full of thy light,
And at thy de -- cree are bro -- ken adn gone;
Then bright -- lly ap -- pear -- eth the arm of thy might,
As through the clouds break -- ing the light -- nings have shone.
}

verseThree = \lyricmode {
  \set stanza = "3. "
Like clouds are they borne to do thy great will,
And swift as the winds a -- bout the world go;
All full of thy God -- head, while earth li -- eth still,
They thun -- der, they light -- en, the wa -- ters o'er -- flow.
}

verseFour = \lyricmode {
  \set stanza = "4. "
Their sound go -- eth forth, 'Christ Je -- sus is Lord!'
Then Sa -- tan doth fear, his cit -- a -- dels fall:
As when the dread trum -- pets went forth at thy word,
And one long blast shat -- tered the Can -- aan -- ites wall.
}

verseFive = \lyricmode {
  \set stanza = "5. "
 O loud be their trump, and stir -- ring the sound,
 To rouse us, O Lord, from sin's dead -- ly sleep;
 May lights which thou kind -- lest in dark -- ness a -- round
 The dull soul a -- wak -- en her vi -- gils to keep!
}

verseSix = \lyricmode {
  \set stanza = "6."
  All ho -- nor and praise, do -- min -- ion and might,
  To thee, Three in One, e -- ter -- nal -- ly be,
  Who pour -- ing a -- round us thy glo -- ri -- ous light,
  Dost call us from dark -- ness thy glo -- ry to see.
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
      \new Lyrics \lyricsto soprano \verseSix
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
      \new Lyrics \lyricsto "tune" { \verseSix }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
