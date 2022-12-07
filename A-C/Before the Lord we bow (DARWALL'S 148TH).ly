%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Francis Scott Key (1779-1843)
      }
      \wordwrap {
        Music: DARWALL'S 148TH, 66 66 44 44, John Darwall (1731-1789
      }
    }
  }
}

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
      \line {Francis Scott Key (1779-1843)}
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
d2. \bar"" \break

d4 |
e c a' g |
fs4 d d' c |
b2 c2 |
d2. \bar "" \break

g,4 |
a2 b |
c2. \bar "" \break

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
  \vOne
Be -- fore the Lord we bow,
The God who reigns a -- bove,
And rules the world be -- low,
Bound -- less in power and love;
Our thanks we bring
In joy and praise,
Our hearts we raise
To heaven's high King.
}

verseTwo = \lyricmode {
  \vTwo
The na -- tion thou hast blest
May well thy love de -- clare,
From foes and fears at rest,
Pro -- tect -- ed by thy care.
For this fair land,
For this bright day,
Our thanks we pay--
Gifts of thy hand.
}

verseThree = \lyricmode {
  \vThree
May ev -- 'ry moun -- tain height,
Each vale and for -- est green,
Shine in thy word's pure light,
And its rich fruits be seen!
May ev -- 'ry tongue
Be tuned to praise,
And join to raise
A grate -- ful song.
}

verseFour = \lyricmode {
  \vFour
Earth! hear thy mak -- er's voice,
The great Re -- deem -- er own,
Be -- lieve, o -- bey, re -- joice,
And wor -- ship him a -- lone;
Cast down thy pride,
Thy sin de -- plore,
And bow be -- fore
The Cru -- ci -- fied.
}

verseFive = \lyricmode {
  \vFive
  And when in power he comes,
O may our na -- tive land,
From all its rend -- ing tombs,
Send forth a glo -- rious band;
A count -- less throng
Ev -- er to sing
To heaven's high King
Sal -- va -- tion's song.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
 % \top
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
        tempoWholesPerMinute = #(ly:make-moment 92 4)
      }
    }
    \include "hymn_layout.ly"
  }
 % \bottom
 \refs
}

%%%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 16)
#(define output-suffix "Hymnal")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  %\top
  \score { %\transpose c d
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_hymnal_layout.ly"
  }    
  \refs
  %\bottom
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
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
 % \bottom
 \refs
}
