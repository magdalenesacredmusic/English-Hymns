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
      \line {DARWALL'S 148TH  66 66 44 44}
    }
    \right-column{
      \line {John Darwall (1731-1789}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Richard Baxter (1615-1691) and others}
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

melody = \relative c' {
  \global
\partial 4
  c |
e c g' e |
c'2. b4 |
a g f e |
d2. \bar"||"

d4 |
e c a' g |
fs4 d d' c |
b2 c2 |
d2. \bar "||"

g,4 |
a2 b |
c2. \bar "||"

c,4 |
d e f g |
c b c d |
c2 b |
c2. \bar "|."
}

alto = \relative c' {
  \global
\partial 4
c4 |
c c d e |
e2. e4 |
f c b c |
b2. 

b4 |
c c e d |
d d d e |
d2 d |
d2.

e4 |
f2 f |
e2. 

c4 |
 b c c c |
c f e d |
e2 d |
e2. 
}

tenor = \relative c {
  \global
  \partial 4
e4 |
g e g g |
a2. b4 |
c g g g |
g2.

g4 |
g g c b |
a fs g g |
g2 fs4( c') |
b2.

c4 |
c2 d |
c2.

g4 |
g g f e |
f f g a |
g2 g |
g2.
}

bass = \relative c {
  \global
\partial 4
c4 |
c c b c |
a'2. 

g4 |
f e d c |
g2. 

g4 |
c e a, b8[ c] |
d4 d8[ c] b4 c |
d2 d2 |
g,2.

c4 |
f2 d |
a2. 

e'4 |
d c a c |
f d e f |
g2 g, |
c2.
}

verseOne = \lyricmode {
  \set stanza = "1. "
Ye ho -- ly an -- gels bright, 
  Who wait at God's right hand,
Or through the realms of light
  Fly at your Lord's com -- mand,
    As -- sist our song,
      For else the theme 
      Too high doth seem
    For mor -- tal tongue.
}

verseTwo = \lyricmode {
  \set stanza = "2. "
Ye bless -- èd souls at rest,
  Who ran this earth -- ly race,
And now, from sin re -- leased,
  Be -- hold the Sav -- ior's face,
    God's prais -- es sound,
      As in his sight
      With sweet de -- light
    Ye do a -- bound.
}

verseThree = \lyricmode {
  \set stanza = "3. "
Ye saints, who toil be -- low,
  A -- dore your heav'n -- ly King,
And on -- ward as ye go
  Some joy -- ful an -- them sing;
    Take what the gives
      And praise him still,
      Through good or ill,
    Who ev -- er lives!
}

verseFour = \lyricmode {
  \set stanza = "4. "
My soul, bear thou thy part,
  Tri -- umph in God a -- bove:
And with a well -- tuned heart
  Sing thou the songs of love!
    Let all thy days
      Till life shall end,
      What -- e'er he send,
    Be filled with praise.
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
        tempoWholesPerMinute = #(ly:make-moment 92 4)
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
