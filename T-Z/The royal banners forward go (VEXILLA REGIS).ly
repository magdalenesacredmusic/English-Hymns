\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \tiny {
  \fill-line {
    \column {
      \line {VEXILLA REGIS}
    }
    \right-column{
      \line {\italic "Antiphonale Romanum," Mode I}
      \line {Harm. David O'Donnell, 2022}
    }
  }
  }
}

bottom = \markup  {
  \tiny {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Vexilla Regis prodeunt"; %}
      %\line {
      Venantius Fortunatus (530-609); %}
      %\line { 
      Tr. \italic "Episcopal Hymnal, 1940" }
    }
  }
  }
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g8 a8[ b] c b8[ a g] a a[ b a] g fs4( e) \hb
  a8 a b g8[ e] g \bar "" \break
  fs8[ g] e d4( e) \bar "|"
  e8 e g e8[ d] g g[ a b] a a4( g) \hb
  g8 g8[ b c b a] b g8[ e] g fs[ g] e d4( e) \bar "||"
  
  e8[ fs e] d4( e) \bar "||"
}

alto = \relative c' {
  \global
 e8~ e4. g4. fs8~ fs4. d8 d4 b
 d4. b4. d4 c8 b4~ b4
 c4. b4 d8 e4. d8~ d4~ d4
 d8 e4 c4. d8 b4. d4 b8~ b4~ b
 
 b4.~ b4~ b4
}

tenor = \relative c' {
  \global
  b8 c4. d8[ c b] d d4. b8 a4 g
  fs4. g4. b4 g8 g4~ g4
  g4. g4 b8~ b8[ a g] d'~ d4 b
  b8 g4 e4. fs8 g4. b4 g8 fs4 g
  
  g8[ a g] fs4 g
}

bass = \relative c {
  \global
 e8 a4. g4. d8~ d4.~ d8~ d4 e4
 d4. e4. b4 c8 g'4 e
 c4 e8 g4. e4. fs8~ fs4 g
 g8 e4 a,4. d8 e4. b4.~ b4 e
 
 e4. b4 e
}

verseOne = \lyricmode {
  \vOne
  The roy -- al ban -- ners for -- ward go,
  The cross shines forth in mys -- tic glow;
  Where he in flesh, our flesh who made,
  Our sen -- tence bore, our ran -- som paid:
}

verseTwo = \lyricmode {
  \vTwo
  Where deep for us the spear was dyed,
  Life's tor -- rent rush -- ing from his side,
  To wash us in that pre -- cous flood,
  Where min -- gled Wa -- ter flowed, and Blood.
}

verseThree = \lyricmode {
  \vThree
  Ful -- filled is all that Da -- vid told
  In true pro -- phe -- tic song of old;
  A -- midst the na -- tions, God, saith he,
  Hath reigned and tri -- umphed from the tree.
}

verseFour = \lyricmode {
  \vFour
  O Tree of beau -- ty, Tree of light!
  O Tree with roy -- al pur -- ple dight!
  E -- lect on whose tri -- um -- phal breast
  These ho -- ly limbs should find their rest.
  
  \set stanza = "7." A -- men.
}

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { %\transpose c a,
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
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
		 "On whose dear arms so widely flung,"
            "The weight of this world's ransom hung:"
            "The price of humankind to pay,"
            "And spoil the spoiler of his prey."
        }
     	}
    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "6. "
		\column {
		  "O Cross, our one reliance, hail!"
            "So may thy power with us avail"
            "To give new virtue to the saint,"
            "And pardon to the penitent."

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
            "To thee, eternal Three in One,"
            "Let homage meet by all be done:"
            "Whom by the Cross thou dost restore,"
            "Preserve and govern evermore.   Amen."
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
		 "On whose dear arms so widely flung,"
            "The weight of this world's ransom hung:"
            "The price of humankind to pay,"
            "And spoil the spoiler of his prey."
        }
     	}
    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "6. "
		\column {
		  "O Cross, our one reliance, hail!"
            "So may thy power with us avail"
            "To give new virtue to the saint,"
            "And pardon to the penitent."

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
            "To thee, eternal Three in One,"
            "Let homage meet by all be done:"
            "Whom by the Cross thou dost restore,"
            "Preserve and govern evermore.   Amen."
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
		 "On whose dear arms so widely flung,"
            "The weight of this world's ransom hung:"
            "The price of humankind to pay,"
            "And spoil the spoiler of his prey."
        }
     	}
    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "6. "
		\column {
		  "O Cross, our one reliance, hail!"
            "So may thy power with us avail"
            "To give new virtue to the saint,"
            "And pardon to the penitent."

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
            "To thee, eternal Three in One,"
            "Let homage meet by all be done:"
            "Whom by the Cross thou dost restore,"
            "Preserve and govern evermore.   Amen."
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
