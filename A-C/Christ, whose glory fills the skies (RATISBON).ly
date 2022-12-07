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
        Text: Charles Wesley (1707-88)
      }
      \wordwrap {
        Music: RATISBON, 77 77 77, Leipzig \italic "Choralbuch," 1815; Harm. W.H. Havergal (1793-1870)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {RATISBON  77 77 77}
    }
    \column{
      \line {Leipzig \italic "Choralbuch," 1815}
      \line {Harm. W.H. Havergal (1793-1870)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Charles Wesley (1707-88)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a4 a b cs |
  d d cs2 |
  b4 d a fs |
  g e d2 |
  
  fs4 fs e fs |
  g g fs2 |
  fs4 b as b |
  cs cs b2 |
  
  d4 b a fs |
  g g fs2 |
  b4 b a fs |
  e e d2
\bar "|."
}

alto = \relative c' {
  \global
  d4 d d g |
  fs fs e2 |
  d4 fs e d |
  d cs d2 |
  
  d4 d cs d |
  d e d2 |
  d4 fs fs8[ e] d4 |
  g fs d2 |
  
  d4 d cs d |
  d e8[ d] cs2 |
  fs4 d e d |
  d cs d2
}

tenor = \relative c {
  \global
  fs4 a g g |
  a a a2 |
  fs4 fs a a |
  b a fs2 |
  
  a4 a a a |
  b a a2 |
  a4 d cs b |
  b as b2 |
  
  b4 g e b' |
  b cs8[ b] as2 |
  b4 fs a a |
  b a fs2
}

bass = \relative c {
  \global
  d4 fs g e |
  d d a2 |
  b4 b cs d |
  g, a d2 |
  
  d4 d a d |
  b cs d2 |
  d4 b fs' g |
  e fs4 b,2 |
  
  g4 g a b |
  e e fs2 |
  d4 b cs d |
  g, a d2
}

verseOne = \lyricmode {
  \vOne
  Christ, whose glo -- ry fills the skies,
  Christ, the true, the on -- ly light,
  Sun of Right -- eous -- ness, a -- rise,
  Tri -- umph o'er the shades of night;
  Day -- spring from on high, be near;
  Day -- star, in my heart ap -- pear.
}

verseTwo = \lyricmode {
  \vTwo
  Dark and cheer -- less is the morn
  Un -- ac -- com -- pan -- ied by thee;
  Joy -- less is the day's re -- turn,
  Till thy mer -- cy's beams I see;
  Till they in -- ward light im -- part,
  Glad my eyes, and warm my heart.
}

verseThree = \lyricmode {
  \vThree
  Vis -- it then this soul of mine,
  Pierce the gloom of sin and grief;
  Fill me, ra -- dian -- cy di -- vine,
  Scat -- ter all my un -- be -- lief;
  More and more thy -- self dis -- play,
  Shin -- ing to the per -- fect day.
}

verseFour = {}
verseFive = {}

\include "hymn_scores.ly"