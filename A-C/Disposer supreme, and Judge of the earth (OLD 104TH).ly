\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Supreme, quales, Arbiter," J.-B. de Santeuil (1630-97); Tr. Isaac Williams (1802-1865), alt.
      }
      \wordwrap {
        Music: OLD 104TH, 55 55 65 65, \italic "Ravencroft's Psalter," 1621; Harm. R. Vaughan Williams 1906
      }
    }
  }
}

top = \markup {
  \tiny {
  \fill-line {
    \column {
      \line {OLD 104TH, 55 55 65 65}
    }
    \right-column{
      \line {\italic "Ravencroft's Psalter," 1621}
      \line {Harm. R. Vaughan Williams 1906}
    }
  }
}
}

bottom = \markup  {
  \tiny {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Supreme, quales, Arbiter"}
      \line {J.-B. de Santeuil (1630-97); Tr. I. Williams, alt.}
    }
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
  d4 
  f e d
  a'2 f4
  g bf a 
  g2 g4
  a c b
  c2 f,4
  a g g 
  f2 f4
  f f g 
  a f f 
   g bf a
   g2 d'4
   c f, bf
   a g f 
   g a e
   \time 2/4 d2 \bar "||"
   
   \time 4/4 d2 d \bar "|."
}

alto = \relative c' {
  \global
  d4
  d a a 
  cs2 d4
  d4. e8 f4
  e2 e4
  f e g
  g2 f4
  f f e
  f2 c4
  d c e 
  f c d
  d g fs
  g2 f4
  f f e 
  f e d 
  d4. cs16[ b] cs4
  d2
  
  bf2 a
}

tenor = \relative c {
  \global
  f4
  a a f
  e2 bf'4
  bf4 bf c
  c2 c4
  c c d
  e2 d4
  c d c 
  a2 a4
  bf c bf
  c a bf
  bf d d
  bf2 bf4
  c d bf
  c4. bf8 a4
  bf a a8[ g] 
  f2
  
  g2 fs
}

bass = \relative c {
  \global
  d4
  d cs d
  a2 bf4 
  g g' f 
  c2 c4
  f a g
  c,2 d4
  f bf, c
  f,2 f'4
  bf a g 
  f f bf
   g g d 
   g2 bf4
   a bf g 
   f c d
   g, f8[ g] a4
   d2
   
   g,2 d'
}

verseOne = \lyricmode {
  \vOne
  Dis -- pos -- er su -- preme, and Judge of the earth,
  Who choos -- est for thine the weak and the poor;
  To frail earth -- en ves -- sels, and things of no worth,
  En -- trust -- ing thy rich -- es which ay shall en -- dure.
}

verseTwo = \lyricmode {
  \vTwo
  Those ves -- sels soon fail, though full of thy light,
  And at thy de -- cree are bro -- ken and gone;
  Then bright -- ly ap -- pear -- eth the arm of thy might,
  As through the clouds break -- ing the light -- nings have shone.
}

verseThree = \lyricmode {
  \vThree
  Like clouds are they borne to do thy great will,
  And swift as the winds a -- bout the world go;
  All full of thy God -- head, while earth li -- eth still,
  They thun -- der, they light -- en, the wa -- ters o'er -- flow.
}

verseFour = \lyricmode {
  \vFour
  Their sound go -- eth forth, 'Christ Je -- sus is Lord!'
  Then Sa -- tan doth fear, his cit -- a -- dels fall:
  As when the dread trum -- pets went forth at thy word,
  And one long blast shat -- tered the Ca -- naan -- ites' wall.
  
  \set stanza = "6." A -- men.
}

verseFive = {}

extraVerses =
 \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "O loud be their trump, and stirring the sound,"
            "  To rouse us, O Lord, from sin's deadly sleep;"
            "May lights which thou kindlest in darkness around"
            "  The dull soul awaken her vigils to keep!"
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "All honor and praise, dominion and might,"
            "  To thee, Three in One, eternally be,"
            "Who pouring around us thy glorious light,"
            "  Dost call us from darkness thy glory to see.  Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}

\include "hymn_scores_extra.ly"