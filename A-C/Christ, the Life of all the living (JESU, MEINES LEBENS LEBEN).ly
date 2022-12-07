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
        Text: \italic "Jesu, meines Lebens Leben," Ernst Christoph Homburg (1605-81); Tr. Catherine Winkworth (1829-78), alt.
      }
      \wordwrap {
        Music: JESU, MEINES LEBENS LEBEN 87 87 77 77, Darmstadt \italic "Gesangbuch," 1687
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {JESU, MEINES LEBENS LEBEN 87 87 77 77 }
    }
    \column{
      \line {Darmstadt \italic "Gesangbuch," 1687}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Jesu, meines Lebens Leben"}
      \line {Ernst Christoph Homburg, 1605-81}
      \line {Tr. Catherine Winkworth, 1829-78 alt.}
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
  g4. g8 fs4 d |
  e fs g g |
  b d c b |
  a4. g8 a2 | 
  
    g4. g8 fs4 d |
  e fs g g |
  b d c b |
  a4. g8 a2 | 
  
  b4. c8 d4 g, |
  fs e fs2 |
  b4. b8 a4 a |
  g e fs2 |
  
  g4 g a a |
  b4. b8 c2 |
  b4 a g8[ a] b4 |
  a4. g8 g2

\bar "|."
}

alto = \relative c' {
  \global
  d4. d8 d4 d |
  c c c b |
  d d e d |
  e4. g8 fs2 |
  
    d4. d8 d4 d |
  c c c b |
  d d e d |
  e4. g8 fs2 |
  
  d4 g fs d |
  d cs d2 |
  d4 d d d |
  b cs4 d2 |
  
  b4 d e d |
  d4. f8 e2 |
  d4 d e g |
  e d b2
}

tenor = \relative c' {
  \global
  b4. b8 a4 fs |
  g a d, d |
  g a g b |
  c b d2 |
  
    b4. b8 a4 fs |
  g a d, d |
  g a g b |
  c b d2 |
  
  b4 g a b |
  a a a2 |
  g4 g g fs |
  g a a2 |
  
  g4 g g fs |
  g4. d'8 c2 |
  g4 a b8[ a] g4 |
  g fs g2
}

bass = \relative c {
  \global
  g4 b d d |
  c a g g |
  g' fs e g |
  c, e d2 |
  
    g,4 b d d |
  c a g g |
  g' fs e g |
  c, e d2 |
  
  g4 e d b |
  d a d2 |
  g,4 b d d |
  e a, d2 |
  
  g,4 b c d |
  g4. g8 c,2 |
  g'4 fs e4. d8 |
  c4 d g,2
}

verseOne = \lyricmode {
  \vOne
  Christ, the Life of all the liv -- ing, 
  Christ the Death of death, our foe,
  Who thy -- self for us once giv -- ing
  To the dark -- est depths of woe,
  Pa -- tient -- ly didst yield thy breath
  But to save my soul from death;
  Praise and glo -- ry ev -- er be,
  Bless -- ed Je -- sus, un -- to thee.
}

verseTwo = \lyricmode {
  \vTwo
  Thou, O Christ, hast ta -- ken on thee
  Bit -- ter strokes, a cru -- el rod;
  Pain and scorn were heaped up -- on thee,
  O thou sin -- less Son of God,
  On -- ly thus for me to win
  Res -- cue from the bonds of sin;
  Praise and glo -- ry ev -- er be,
  Bless -- ed Je -- sus, un -- to thee.
}

verseThree = \lyricmode {
  \vThree
  Thou didst bear the smit -- ing on -- ly
  That it might not fall on me;
  Stood -- est false -- ly charged and lone -- ly
  That I might be safe and free;
  Com -- fort -- less that I might know
  Com -- fort from thy bound -- less woe.
  Praise and glo -- ry ev -- er be,
  Bless -- ed Je -- sus, un -- to thee.
}

verseFour = \lyricmode {
  \vFour
  Then for all that wrought our par -- don,
  For thy sor -- rows deep and sore,
  For thine an -- guish in the gar -- den,
  I will thank thee ev -- er -- more;
  Thank thee with my lat -- est breath
  For thy sad and cru -- el death,
  For that last and bit -- ter cry
  Praise thee ev -- er -- more on high.
}

verseFive = {}

\include "hymn_scores.ly"