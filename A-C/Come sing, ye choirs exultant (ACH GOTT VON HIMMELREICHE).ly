\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Plausu chorus laetabundo," Adam of St. Victor, c. 1170; Tr. Jackson Mason (1833-88)
      }
      \wordwrap {
        Music: ACH GOTT VON HIMMELREICHE, 76 76 D, Melody by Michael Praetorius (1571-1621), \italic "The English Hymnal"
      }
    }
  }
}

top = \markup {
  \tiny {
  \fill-line {
    \column {
      \line {ACH GOTT VON HIMMELREICHE, 76 76 D}
    }
    \right-column{
      \line {Melody by Michael Praetorius (1571-1621)}
      \line {\italic "The English Hymnal"}
    }
  }
}
}

bottom = \markup  {
  \tiny {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Plausu chorus laetabundo"}
      \line {Adam of St. Victor, c. 1170; Tr. Jackson Mason (1833-88)}
    }
  }
}
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \time 6/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  g2 g4 a2 c4
  b4.( a8 b4) a2 a4
  g2 g4 c2 b4
  a2.~ a2 \bar "" \break
  
  a4 
  e2 fs4 g2 a4
  fs4.( e8 fs4) d2 b'4
  b2 d4 c2 c4
  b2.~ b2 \bar ""
  
  b4 |
  b2 d4 a2 b4
  c4.( d8 c4) b2 b4
  b2 d4 c2 b4
  a2.~ a2 \bar ""
  
  b4 |
  a2 g4 a2 fs4
  g4.( fs8 g4) a2 b4
  d2 b4 c a2
  \time 5/4 g2.~ g2 \bar "|."
  
  %\time 4/4 g2 g \bar "|."
}

alto = \relative c' {
  \global
  d4
  d2 e4 fs2 g4
  g2. fs2 fs4
  g2 e4 e2 d4
  fs2.~ fs2
  
  e4
  c2 c4 d2 e4
  d2. d2 d4
  g2 a4 g2 fs4
  g2.~ g2
  
  g4
  g2 g4 fs2 g4
  e2. ds2 ds4
  e2 f4 e2 e4
  c2.~ c2
  
  d4 
  e2 e4 fs2 d4
  d2( cs4) d2 d4
  d2 d4 g fs2
  g2.~ g2
  
 % c,2 b2
}

tenor = \relative c' {
  \global
  a4
  b2 b4 d2 e4
  d2. d2 d4
  d2 c4
  g4.( a8) b4
  d2.~ d2
  
  c4
  g2 a4 g2 c4
  a4.( g8 a4) fs2 g4
  d'2 d4 g,2 a4
  b2.~ b2
  
  d4
  d2 d4 d2 d4
  a2( g4) fs2 fs4
  g2 a4 a2 gs4
  a2.~ a2
  
  fs4
  a2 b4 d2 a4
  g2. fs2 g4
  a2 b4 e d( c)
  b2.~ b2
  
  %e,2 d
}

bass = \relative c {
  \global
 fs4
 g2 e4 d2 c4
 g2( b4) d2 c4
 b2 c4 e4.( fs8) g4
 d2.~ d2
 
 a4 |
 c2 a4 b2 c4
 d2. d2 g4
 g2 fs4 e2 d4
 g2.~ g2
 
 g4 |
 g2 b,4 d2 b4
 a2. b2 b4 |
 e2 d4 a4.( c8) e4
 a,2.~ a2
 
 d4 |
 c2 e4 d2 c4
 b2( e4) d2 g4
 fs2 g4 c, d2 
 g,2.~ g2
 
 %c2 g
}

verseOne = \lyricmode {
  \vOne
  Come sing, ye choirs ex -- ult -- ant,
  Those mess -- en -- gers of God,
  Through whom the liv -- ing Gos -- pels
  Came sound -- ing all a -- broad!
  Whose voice pro -- claimed sal -- va -- tion
  That poured up -- on the night,
  And drove a -- way the shad -- ows,
  And flushed the world with light.
}

verseTwo = \lyricmode {
  \vTwo
  He chose them, our Good Shep -- herd,
  And, tend -- ing ev -- er -- more
  His flock through earth's four quar -- ters,
  In wis -- dom made them four;
  True Law -- giv -- er, he bade them
  Their heal -- ing mess -- age spread,
  One char -- ter  for all na -- tions,
  One glo -- rious ti -- tle -- deed.
}

verseThree = \lyricmode {
  \vThree
  In one har -- mo -- nious wit -- ness
  The cho -- sen Four com -- bine,
  While each his own com -- mis -- sion
  Ful -- fils in ev -- 'ry line;
  As, in the Pro -- phet's vi -- sion,
  From out the am -- ber flame
  In form of vis -- age di -- verse
  Four liv -- ing crea -- tures came.
}

verseFour = \lyricmode {
  \vFour
  Lo, these the wing -- ed cha -- riots
  That bring Em -- man -- uel nigh;
  The gol -- den staves up -- lift -- ing
  The ark of God on high;
  And these the four -- fold riv -- er
  Of Pa -- ra -- dise a -- bove,
  Whence flow for eall the na -- tions
  New mys -- ter -- ies of love.
}

verseFive = \lyricmode {
  \vFive
 Four -- square on this foun -- da -- tion
 The Church of Christ re -- mains,
 A house to stand un -- sha -- ken
 By floods or winds or rains.
 O glo -- rious hap -- py por -- tion
 In this safe home to be,
 By God, true Man, u -- nit -- ed
 With God e -- ter -- nal -- ly!
}

\include "hymn_scores.ly"