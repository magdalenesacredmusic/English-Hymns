\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {WHITEHALL, LM}
    }
    \right-column{
      \line {Melody by H. Lawes (1596-1662)}
      \line {Harm. \italic "The English Hymnal," 1916}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "O nata Lux de lumine"}
      \line {Tr. Laurence Housman (1865-1959)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key a \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a2 gs4 fs \bar "|"
  a cs, d fs \bar "|"
  e2 \bar "|"
  
  e2 fs4 gs  \bar "|"
  a gs fs cs' \bar "|"
  b2 \bar "|"
  b2 d4 cs \bar "|"
  fs, gs a b \bar "|"
  cs2 \bar "|"
  cs2 e4 b \bar "|"
  d cs b b \bar "|"
  a2  \bar "|."
}

alto = \relative c' {
  \global
  e2 e4 d 
  cs a a d
  a2
  cs2 d4 d 
  e e d e 
  e2
  
  e2 fs4 e 
  e d cs fs 
  e2
  fs2 gs4 g
  fs4 fs8[ e] d4 e4
  cs2
}

tenor = \relative c' {
  \global
  cs2 cs4 a 
  a gs fs gs 
  a2
  a2 a4 b 
  a4 a a a 
  gs2
  
  g2 fs4 a 
  a e' e d 
  cs2 
  
  a2 b4 b 
  a a a gs 
  a2
}

bass = \relative c {
  \global
  a2 cs4 d 
  fs e d b 
  cs2
  a2 d4 b 
  cs cs d a 
  e'2
  
  e2 b4 cs 
  d e fs gs 
  a2
  fs2 e4 g 
  d fs b, e
  a,2
}

verseOne = \lyricmode {
  \vOne
  O Light of light, by love in -- clined,
  Je -- sus, Re -- deem -- er of man -- kind,
  With lov -- ing -- kind -- ness deign to hear
  From sup -- pliant voic -- es praise and prayer.
}

verseTwo = \lyricmode {
  \vTwo
  Thou who to raise our souls from hell
  Didst deign in flesh -- ly form to dwell,
  Vouch -- safe us when our race is run,
  In thy fair Bo -- dy to be one.
}

verseThree = \lyricmode {
  \vThree
  More bright than day thy face did show,
  Thy rai -- ment whit -- er than the snow,
  When on th emount to mor -- tals blest
  Man's Mak -- er thou wast man -- i -- fest.
}

verseFour = \lyricmode {
  \vFour
  Two pro -- phets, that had faith to see,
  With thine e -- lect found com -- pan -- y,
  Where un -- to each, di -- vine -- ly shown,
  The God -- head veiled in form was known.
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
    \include "hymn_layout.ly"
  }
      \markup {
	\large {
  \fill-line {
    \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
     \column {
      \line { \bold "5. "
		\column {
		 "The heavens above his glory named,"
		 "The Father's voice the Son proclaimed;"
		 "To whom, the King of glory now,"
		 "All faithful hearts adoring bow."
        }
     	}
    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "6. "
		\column {
		  "May all who seek thy praise aright"
		  "Through purer lives show forth thy light;"
		  "So to the brightness of the skies"
		  "By holy deeds our hearts shall rise."

        }
      	}
    }
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
  }
}
}
   \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "7. "
          \column {
            "Eternal God, to thee we raise,"
            "The King of kings, our hymn of praise,"
            "Who Three in One and One in Three"
            "Doth live and reign eternally.   Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}
  \markup {
    \vspace #0.5
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
    \include "hymn_layout.ly"
  }   
        \markup {
	\large {
  \fill-line {
    \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
     \column {
      \line { \bold "5. "
		\column {
		 "The heavens above his glory named,"
		 "The Father's voice the Son proclaimed;"
		 "To whom, the King of glory now,"
		 "All faithful hearts adoring bow."
        }
     	}
    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "6. "
		\column {
		  "May all who seek thy praise aright"
		  "Through purer lives show forth thy light;"
		  "So to the brightness of the skies"
		  "By holy deeds our hearts shall rise."

        }
      	}
    }
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
  }
}
}
   \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "7. "
          \column {
            "Eternal God, to thee we raise,"
            "The King of kings, our hymn of praise,"
            "Who Three in One and One in Three"
            "Doth live and reign eternally.   Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}
  \markup {
    \vspace #0.5
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
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
        \markup {
	\large {
  \fill-line {
    \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
     \column {
      \line { \bold "5. "
		\column {
		 "The heavens above his glory named,"
		 "The Father's voice the Son proclaimed;"
		 "To whom, the King of glory now,"
		 "All faithful hearts adoring bow."
        }
     	}
    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "6. "
		\column {
		  "May all who seek thy praise aright"
		  "Through purer lives show forth thy light;"
		  "So to the brightness of the skies"
		  "By holy deeds our hearts shall rise."

        }
      	}
    }
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
  }
}
}
   \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "7. "
          \column {
            "Eternal God, to thee we raise,"
            "The King of kings, our hymn of praise,"
            "Who Three in One and One in Three"
            "Doth live and reign eternally.   Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}
  \markup {
    \vspace #0.5
  }
  \bottom
}
