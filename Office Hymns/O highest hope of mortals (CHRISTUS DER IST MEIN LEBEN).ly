\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {CHRISTUS DER IST MEIN LEBEN}
    }
    \right-column{
      \line {Melchior Vulpius (1560-1616)}
      \line {Harm. J.S. Bach (1685-1750)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "O lux beata caelitum"}
      \line {Tr. Marquess of Bute's \italic Breviary}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key ef \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  ef4 |
  g f g af |
  bf2 g4 c |
  bf af g f |
  g2.  \bar "" \break
  
  bf4 |
  c d ef d |
  c2 bf4 g |
  af g f f |
\time 3/4  ef2. \bar "||"
  
 \time 4/4 ef2 ef

\bar "|."
}

melodya = \relative c' {
  \global
  \partial 4
  ef4 |
  g f g af |
  b2 g4 c |
  bf af g f |
  g2.  \bar "" %\break
  
  bf4 |
  c d ef d |
  c2 bf4 g |
  a g f f |
\time 3/4  ef2. \bar "||" \break
  
  \time 4/4 ef2 ef

\bar "|."
}

alto = \relative c' {
  \global
  bf4 |
  ef f ef ef |
  d8[ ef f d] ef4 ef |
  ef4. d8 ef4. d8 |
  ef2. 
  
  g4 |
  g8[ f] f[ bf] g4 g |
  g( f) f ef |
  ef8[ d] ef4 ef d4 |
  ef2.
  
  c2 bf2
}

tenor = \relative c' {
  \global
  g4 |
  bf bf bf c |
  f,( bf) bf af |
  bf c8[ af] bf4 bf |
  bf2. 
  
  ef4 |
  ef d d8[ c] bf4 |
  bf( a) d bf |
  af! bf c bf |
  g2.
  
  af2 g
}

bass = \relative c {
  \global
 ef4 |
 ef d df c |
 bf8[ c d bf] ef4 af |
 g f ef8[ g] bf4 |
 ef,2. 
 
 ef4 |
 a, bf c8[ ef] g[ f] |
 ef[( c] f4) bf, ef |
 f g af bf |
 ef,2.
 
 af,2 ef'2
}

verseOne = \lyricmode {
  \vOne
  O High -- est Hope of mor -- tals,
Blest Light of Saints a -- bove,
O Je -- sus, on whose boy -- hood
Home smiled with kind -- ly love;
}

verseTwo = \lyricmode {
  \vTwo
  And thou whose bos -- om nursed Him,
O Ma -- ry, high -- ly graced,
Whose breast gave milk to Je -- sus,
Whose arms thy God em -- braced;
}

verseThree = \lyricmode {
  \vThree
  And thou of all men cho -- sen
To guard the Vir -- gin’s fame,
To whom God’s Son re -- fused not
A Fath -- er’s gra -- cious name;
}

verseFour = \lyricmode {
  \vFour
  Born for the na -- tion’s heal -- ing,
Of Jes -- se's lin -- eage high,
Be -- hold the sup -- pliants kneel -- ing,
O hear the sin -- ners’ cry!

\set stanza = "7." A -- men.
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
            "The sun returned to evening,"
"Dusks all the twilight air:"
"We, lingering here before you,"
"Pour out our heartfelt prayer."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "Your home was a garden"
"Made glad with fairest flowers;"
"May life thus blossom sweetly"
"In every home of ours."
          }
        }
         \vspace #1
        \line {
          \bold "7. "
          \column {
            "Jesus, to Thee be glory,"
"The Maiden-Mother’s Son,"
"With Father and with Spirit"
"While endless ages run.  Amen."
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
            "The sun returned to evening,"
"Dusks all the twilight air:"
"We, lingering here before you,"
"Pour out our heartfelt prayer."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "Your home was a garden"
"Made glad with fairest flowers;"
"May life thus blossom sweetly"
"In every home of ours."
          }
        }
         \vspace #1
        \line {
          \bold "7. "
          \column {
            "Jesus, to Thee be glory,"
"The Maiden-Mother’s Son,"
"With Father and with Spirit"
"While endless ages run.  Amen."
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
        \melodya
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
            "The sun returned to evening,"
"Dusks all the twilight air:"
"We, lingering here before you,"
"Pour out our heartfelt prayer."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "Your home was a garden"
"Made glad with fairest flowers;"
"May life thus blossom sweetly"
"In every home of ours."
          }
        }
         \vspace #1
        \line {
          \bold "7. "
          \column {
            "Jesus, to Thee be glory,"
"The Maiden-Mother’s Son,"
"With Father and with Spirit"
"While endless ages run.  Amen."
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
