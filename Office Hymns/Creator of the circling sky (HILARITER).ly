\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {HILARITER (DIE GANZE WELT)  LM}
    }
    \right-column{
      \line {Cologne \italic "Kirchengesäng," 1623}
      \line {Harm. Martin Shaw (1875-1958) }
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Orbis patrator optime"}
      \line {Robert Bellarmine (1542-1621), Tr. uncertain }
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key af \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  f4
  af2 g4
  f2 c'4 
  ef2 d4
  c2 bf4
  bf2 ef4
  d2 c4 
  c2 b4
  c2 \bar ""
  
  c4
  c2 c4
  af2 c4
  bf2 bf4
  af2 ef4
  ef2 af4
  g2 f4
  f2 e4
  \time 2/4 f2 \bar "||" \break
  
  \time 4/4 f2 f2

\bar "|."
}

alto = \relative c' {
  \global
  c4
  f2 e4
  f2 af4
  bf2 bf4
  g2 g4
  ef2 g4
  f2 f4
   g2 g4
   e2
   
   e4
   f2 g4
   af2 af4
   f2 g4
   af2 ef4 
   ef2 ef4
   ef2 c4
   c2 c4
   c2
   
   d2 c
}

tenor = \relative c' {
  \global
  af4 
  c2 c 4
  c2 f4
  ef2 f4
  ef2 ef4
  bf2 bf4
  bf2 c4
  d2 g,4 
  g2
  
  g4
  af2 c4
  f2 ef4
  df4.( c8) bf4 
  c2 
  ef,4
  ef2 c'4 
  bf2 af4
  g2 g4
  a2
  
  bf a
}

bass = \relative c {
  \global
 f4
 f2 c4
 af2 f4
 g2 bf4
 c2 ef4
 g2 ef4
 bf'2 af4
 g2 g4
 c,2
 
 c4 
 f2 ef4
 df2 c4 
 df2 ef4
 af2
 ef4
 ef2 af,4 
 ef'2 f4
 c2 c4
 f,2
 
 bf f
}

verseOne = \lyricmode {
  \vOne
Cre -- at -- or of the circ -- ling sky,
Who mad -- est all by power most high,
Thy Prov -- i -- dence will nev -- er cease
To rule Thy works in might and peace.
}

verseTwo = \lyricmode {
  \vTwo
Be pre -- sent when we cry to Thee,
A sin -- ful peo -- ple though we be;
And as the day -- dawn grows a -- pace,
Il -- lume our minds with light of grace.
}

verseThree = \lyricmode {
  \vThree
O send Thine An -- gel thith -- er -- ward
As -- signed by Thee to be our guard,
That now his pres -- ence may be -- gin
To keep us from all stain of sin.
}

verseFour = \lyricmode {
  \vFour
Let him des -- troy that hid -- den snare
The ea -- ger ser -- pent doth pre -- pare,
Lest we be ta -- ken in the net
Be -- fore our heed -- less bos -- oms set. \set stanza = "6." A -- men.
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
        tempoWholesPerMinute = #(ly:make-moment 110 4)
      }
    }
    \include "hymn_layout_ragged.ly"
  }
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
            "At his command let every fear"
"  Of hostile foemen disappear;"
"Let civil strife give way to peace,"
"  And pestilence and famine cease."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "To God the Father glory be;"
"  For those the Savior setteth free,"
"Anointed by the Holy Ghost,"
"  Are guarded by the Angel host.   Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}
  \bottom
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Hymnal")
\book {
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  \top
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
    \include "hymn_layout_ragged.ly"
  }    
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
            "At his command let every fear"
"  Of hostile foemen disappear;"
"Let civil strife give way to peace,"
"  And pestilence and famine cease."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "To God the Father glory be;"
"  For those the Savior setteth free,"
"Anointed by the Holy Ghost,"
"  Are guarded by the Angel host.   Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
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
      \new Lyrics \lyricsto "tune" { \verseFour}
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \vspace #0.5
  }
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
            "At his command let every fear"
"  Of hostile foemen disappear;"
"Let civil strife give way to peace,"
"  And pestilence and famine cease."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "To God the Father glory be;"
"  For those the Savior setteth free,"
"Anointed by the Holy Ghost,"
"  Are guarded by the Angel host.   Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}
  \bottom
}
