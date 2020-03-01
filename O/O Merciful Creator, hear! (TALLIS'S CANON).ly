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
      \line {TALLIS'S CANON}
    }
    \right-column{
      \line {Thomas Tallis 1505-1585}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Audi, benigne Conditor," St. Gregory the Great}
      \line {tr. John Mason Neale}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
\partial 4
g4 |
g fs g g |
a a b g |
c c b b |
a a g \bar "" \break

d' |
c a b b |
a a g d |
e fs g b |
\partial 2. a a g \bar "||"

g2 g2 \bar "|."
}

alto = \relative c' {
  \global
\partial 4 
d4 |
d d b d |
 e d d g |
 e fs g d |
 e d d 
 
 g |
 e d d d |
 e fs g g, |
 e' d b d |
 c a b
 
 c2 b2
}

tenor = \relative c' {
  \global
\partial 4
b4 |
a a g g  | 
g fs g g |
a a b g |
c c b 

b |
a a g d' |
c a b b |
a a g d |
e fs g

e2 d2
}

bass = \relative c {
  \global
\partial 4 
g4 |
 d' d e b |
 c d g, b |
 a a g g' |
 g fs g
 
 g |
  a fs g g, |
 c d g, b |
  c d e b |
  c d g,
  
  c2 g2
}

verseOne = \lyricmode {
  \set stanza = "1."
  O Mer -- ci ful Cre -- a -- tor, hear!
  To us in pit -- y bow thine ear:
  Ac -- cept the tear -- ful prayer we raise
  In this our fast of for -- ty days.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Our hearts are o -- pen, Lord, to thee;
  Thou know -- est our in -- firm -- i -- ty;
  Pour out on all who seek thy face
  A -- bun -- dance of thy par -- d'ning grace.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Our sins are man -- y, this we know;
  Spare us, good Lord, thy mer -- cy show;
  And for the hon -- or of thy Name
  Our faint -- ing souls to life re -- claim.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Give us the self -- con -- trol that springs
  From dis -- ci -- pline of out -- ward things,
  That fast -- ing in -- ward, se -- cret -- ly
  The soul may pure -- ly dwell with thee.
}


verseFive = \lyricmode {
  \set stanza = "5."
  We pray thee, Ho -- ly Trin -- i -- ty, 
  One God, un -- chang -- ing U -- ni -- ty,
 That we, from this our ab -- sti -- nence
  May reap the fruits of pen -- i -- tence.
  A -- men.
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
