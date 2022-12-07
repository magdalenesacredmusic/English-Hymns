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
        Text: \italic "Victis sibi cognomina," Paris Breviary, 1736; Tr. John Chandler (1806-1876), 1837; Alt. \italic "The English Hymnal," 1906
      }
      \wordwrap {
        Music: INNOCENTS, 77 77, French melody; Arr. W.H. Monk, \italic "The Parish Choir," 1850
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {INNOCENTS  77 77}
    }
    \right-column{
      \line {French melody}
      \line {arr. W.H. Monk, \italic "The Parish Choir," 1850}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Victis sibi cognomina"}
      \line {Paris Breviary, 1736; tr. John Chandler, 1837}
      \line {alt. \italic "The English Hymnal," 1906}
    }
  } 
}

global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 2
  fs4. g8 |
  a4 d cs b |
  a2 d,4. e8 |
  fs4 a g fs |
  e2 \bar ""% \break

  fs4. g8 |
  a4 d cs b |
  a2 d,4. e8 |
  fs4 g fs e |
  d2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 2
  d4. cs8 |
  d4 fs e d8[ e] |
  fs2 d4. cs8 |
  d4 a b8[ cs] d4 |
  cs2 d4. cs8 |
  d4 fs e e8[ d] |
  cs2 d4. cs8 |
  d4 e d cs |
  a2
}

tenor = \relative c' {
  \global
  \partial 2
  a4. g8 |
  fs4 a g8[ a] b8[ cs] |
  d2 fs,4. a8 |
  a4 fs g a |
  a2 a4. g8 |
  fs4 fs8[ gs] a4 gs4 |
  a2 a4. g8 |
  a4 b a g fs2
}

bass = \relative c {
  \global
  d4. e8 |
  fs4 d e8[ fs] g4 |
  d2 b4. a8 |
  d4 fs e d |
  a2 d4. e8 |
  fs4 b, cs8[ d] e4 |
  a4( g) fs4. e8 |
  d4 g, a a |
  d2
}

verseOne = \lyricmode {
  \vOne
  Con -- qu'ring kings their ti -- tles take
  From the lands they cap -- tive make;
  Je -- sus, thine was giv -- en thee
  For a world thou mad -- est free.
}

verseTwo = \lyricmode {
  \vTwo
  Not an -- other -- er name is giv'n
  Pow'r pos -- sess -- ing un -- der heav'n,
  Strong to call dead souls to rise
  And ex -- alt them to the skies.
}

verseThree = \lyricmode {
  \vThree
  That which Christ so hard -- ly wrought,
  That which he so dear -- ly bought,
  That sal -- va -- tion, mor -- tals, say,
  Will ye mad -- ly cast a -- way?
}

verseFour = \lyricmode {
  \vFour
  Rath -- er glad -- ly for that name
  Bear the Cross, en -- dure the shame;
  Joy -- ful -- ly for him to die
  Is not death but vic -- to -- ry.
}

verseFive = \lyricmode {}

verseSix = \lyricmode {}

extraVerses = 
\markup {
  \vspace #1
  \fontsize #1 {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "Jesus, if thou condescend"
            "To be called the sinner's Friend,"
            "Ours the joy and glory be"
            "Thus to make our boast of thee."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "Glory to the Father be,"
            "Glory, Virgin-born, to thee,"
            "Glory to the Holy Ghost,"
            "Ever from the heav'nly host."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}

\include "hymn_scores_extra.ly"

%{
Jesus, who dost condescend
To be called the sinner’s friend,
Hear us, as to thee we pray,
Glorying in the Name today.

Glory to the Father be,
Glory, Virgin-born, to thee,
Glory to the Holy Ghost
From the saints and angel host. Amen. %}