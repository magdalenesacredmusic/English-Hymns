\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
\fill-line {
      \column {
          \line {EIN KIND GEBOR'N,  LM}
      }
      \column{
      \line {Old German Carol}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {\italic "Jesus refulsit omnium"}
     \line {Tr. John David Chambers (1805-93) }
   }
  } 
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
 \partial 4 
 g4 |
 g2 g4 |
 a2 a4 |
 bf2 g4 |
 f2 \bar ""
 
 f4 |
 bf2 d4 | \break
 c2 c4 |
 bf2 bf4 |
 bf2 \bar ""
 
 bf4 |
 d2 d4 |
 c2 c4 |
 bf2 a4 |
 g2 \bar ""
 
 g4 |
 c2 c4 |
 d2 c4 |
 bf2 a4 |
 \cadenzaOn g2 \bar "||" \break
 
 g2 g2 \bar "|."
}

alto = \relative c' {
   \global
\partial 4
d4 
d2 d4
f2 f4 
f2 ef4 
d2

d4
d2 f4 
g2 f4
d2 ef4 
d2

f4 
f2 f4 
f2 f4
d2 d4
bf2

bf4 
ef2 f4 
f2 ef4
d2 d4 
bf2

c2 b
}

tenor = \relative c' {
  \global
\partial 4
bf4
bf2 bf4
c2 c4
bf2 bf4
bf2

bf4 
bf2 bf4
bf2 a4
bf2 g4
bf2

d4
bf2 bf4
a2 a4
g2 fs4 
g2

g4
g2 a4 bf2 g4 
g( e) fs 
g2

ef2 d
}

bass = \relative c' {
  \global
  \partial 4
  g4 
  g2 g4
  f2 f4
  d2 ef4
  bf2
  
  bf'4 
  g2 d4
  ef2 f4
  bf,2 ef4
  bf2
  
  bf4
  bf2 d 4
  f2 f4
  g2 d4
  ef2
  
  ef4
  c2 f4
  bf,2 c4
  d2 d4 
  g,2
  
  c2 g2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Lo, Je -- sus to the world ap -- pears,
  The gen -- tiles with re -- demp -- tion cheers;
  Let all the faith -- ful, as is meet,
  His won -- drous acts with hon -- or greet.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Whose birth the Star's bright rays re -- vealed,
  Re -- splen -- dent in th'e -- the -- real field;
  And guide the Ma -- gi in the way,
  To him who in the man -- ger lay.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Pro -- strate the in -- fant they a -- dore,
  With lin -- en mean -- ly swath -- èd o'er;
  Con -- fess him ve -- ry God, and bring
  A mys -- tic tri -- bute to their King.
}

verseFour = \lyricmode {
  \set stanza = "4."
 When thir -- ty cir -- cling years were gone,
 Then per -- fect man -- hood he put on,
 And sought the Fount of Bap -- tism, free
 From taint of all im -- pur -- i -- ty.
}

verseFive = \lyricmode {
  \set stanza = "5."
  How blest was John, who feared to lave
  That Sa -- vior in the cleans -- ing wave,
  Whose Blood should be the might -- y mean
  To wash the~of -- fence of na -- ture clean.
  
\set stanza = "9."
A -- men.
}


\book {
  \include "hymn_paper_multipage.ly"
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
        tempoWholesPerMinute = #(ly:make-moment 152 4)
      }
    }
    \include "hymn_layout_ragged.ly"
  }

    \markup {
              \vspace #1
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "6. "
          \column {
            "The Father's mandate, from the skies,"
            "His royal sonship testifies;"
            "The Spirit's power upon his head"
            "In plenitude of grace is shed."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "Be thou, with suppliant hearts we pray,"
            "O Christ, our everlasting stay;"
            "Whose wonderworking word divine"
            "Bade waters redden into wine."
          }
        }
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "On us in mercy here below,"
            "Thy help and comfort e'er bestow;"
            "Exalt us, raised from death's domain,"
            "Withthee above the stars to reign."
                }
        }
        \vspace #1
        \line {
          \bold "9. "
          \column {
            "Due praise great Trinity, to thee,"
            "All honor, power, and glory be;"
            "Whom all created things adore,"
            "Now henceforth and for evermore."
            "Amen."
          }
        }
      }
      \hspace #1.0

    }
  }
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
   \markup {
              \vspace #1
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "6. "
          \column {
            "The Father's mandate, from the skies,"
            "His royal sonship testifies;"
            "The Spirit's power upon his head"
            "In plenitude of grace is shed."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "Be thou, with sup -- pliant hearts we pray,"
            "O Christ, our ev -- er -- last -- ing stay;"
            "Whose won -- der -- work -- ing word di -- vine"
            "Bade wa -- ters red -- den in -- to wine."
          }
        }
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "On us in mercy here below,"
            "Thy help and comfort e'er bestow;"
            "Exalt us, raised from death's domain,"
            "Withthee above the stars to reign."
                }
        }
        \vspace #1
        \line {
          \bold "9. "
          \column {
            "Due praise great Tri -- ni -- ty, to thee,"
            "All hon -- or, power, and glo -- ry be;"
            "Whom all cre -- a -- ted things a -- dore,"
            "Now hence -- forth and for ev -- er -- more."
            "Amen."
          }
        }
      }
      \hspace #1.0

    }
  }
}
  \bottom
}
