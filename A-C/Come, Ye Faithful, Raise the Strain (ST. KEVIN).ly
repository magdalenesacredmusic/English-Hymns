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
        Text: \italic "ασωμεν παντες λαοι," St. John Damascene, 780; Tr. John Mason Neale (1818-66), 1862
      }
      \wordwrap {
        Music: ST. KEVIN, 76 76 D, Arthur Sullivan (1842-1900), 1872
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {ST. KEVIN  76 76 D}
    }
    \right-column{
      \line {Arthur Sullivan, 1872}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "ασωμεν παντες λαοι"}
      \line {St. John Damascene, 780; tr. J.M Neale, 1862}
    }
  } 
}


global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  b4 b b8[ a] g4 |
  b c d2 |
  g,4 a b c |
  b2 a |
  a4 a cs8[ b] a4 |
  d d fs,2 |
  a4 a b a8[ g] |
  fs2 d |
  a'4 a a8[ g] a4 |
  b a b2 |
  b4 b c8[ d] e4 |
  g,2 fs2 |
  b4 b b8[ a] g4 |
  b c d2 |
  g,4 a b c |
  a2 g \bar "|."
}

alto = \relative c'' {
  \global
  g4 g g8[ fs] g4 |
  g fs g2 |
  e4 fs g a |
  g2 fs2 |
  g4 g e e |
  d d d2 |
  fs4 fs g fs8[ e] |
  d2 d2 |
  fs4 fs fs8[ e] d4 |
  d fs g2 |
  gs4 gs a e |
  d2 d |
  g4 g g8[ fs] g4 |
  g g g2 |
  g4 g g g |
  fs2 g |
}

tenor = \relative c' {
  \global
  d4 d d8[ c] b4 |
  d d d2 |
  b4 d d e |
  d2 d |
  cs4 cs a8[ b] cs4 |
  d a d2 |
  d4 d cs cs |
  d2 d, |
  c'4 c4 c8[ b] a4 |
  g d' d2 |
  e4 e e8[ d] c4 |
  b2 a |
  d4 d d8[ c] b4 |
  d4 d f2 |
  e4 e d c |
  c2 b |
}

bass = \relative c' {
  \global
  g4 g g g |
  g a b2 |
  e,4 d g c, |
  d2 d |
  e4 e g g |
  fs fs b2 |
  a4 a a, a |
  d2 d |
  d4 d d8[ e] fs4 |
  g d g2 |
  e4 e a c, |
  d2 d |
  g4 g g g |
  g a b2 |
  c4 c b a |
  d,2 g2 |
}

verseOne = \lyricmode {
  \vOne
  Come, ye faith -- ful, raise the strain
  Of tri -- um -- phant glad -- ness!
  God hath brought His Is -- ra -- el
  In -- to joy from sad -- ness
  Loosed from Pha -- raoh’s bit -- ter yoke
  Ja -- cob’s sons and daugh -- ters;
  Led them with un -- moist -- ened foot
  Through the Red Sea wa -- ters.
}

verseTwo = \lyricmode {
  \vTwo
  ’Tis the Spring, of souls to -- day;
  Christ hath burst His pris -- on;
  And from three days’ sleep in death,
  —As a sun, hath ris -- en.
  All the win -- ter of our sins,
  Long and dark, is fly -- ing
  From His Light, to Whom we give
  Laud and praise un -- dy -- ing.
}

verseThree = \lyricmode {
  \vThree
  Now the Queen of Sea -- sons, bright
  With the day of Splen -- dour,
  With the roy -- al Feast of feasts,
  Comes its joy to ren -- der;
  Comes to glad Je -- ru -- sa -- lem,
  Who with true af -- fec -- tion
  Wel -- comes, in un -- wea -- ried strains,
  Je -- su’s Res -- ur -- rec -- tion.
}

verseFour = \lyricmode {
  \vFour
  Nei -- ther might the gates of death,
  Nor the tomb’s dark por -- tal,
  Nor the watch -- ers, nor the seal,
  Hold Thee as a mor -- tal:
  But to -- day a -- midst the Twelve
  Thou didst stand, be -- stow -- ing
  That Thy peace, which ev -- er -- more
  Pass -- eth hu -- man know -- ing.
}

verseFive = {}

\include "hymn_scores.ly"