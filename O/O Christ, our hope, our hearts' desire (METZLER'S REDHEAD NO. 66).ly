\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {METZLER'S REDHEAD NO. 66}
    }
    \right-column{
      \line {Richard Redhead (1820-1901)}
      \line {\italic "Ancient Hymn Melodies," 1859, published G. Meztler}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic Jesu nostra redemptio}
      \line {c. 8th cent.; Tr. John Chanderl (1806-76)}
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

melody = \relative c' {
  \global
  \partial 4
  fs4
  e d d' a 
  b b a a 
  b cs d cs 
  b2. \bar ""
    b4
  b a b a8[ g]
  fs4 e a d, 
  g fs e e 
  \time 3/4 d2.
  
  \time 4/4 d2 d \bar "|."

\bar "|."
}

alto = \relative c' {
  \global
  d4
  cs d d d
  d e fs fs
  d g fs4. e8 
  d2.
  
    d4
  d d d e
  d cs d b
  b8[ cs] d4 d cs 
  d2.
  
  b2 a
}

tenor = \relative c' {
  \global
  a4
  a fs a d
  b cs d d
  d cs8[ b] b4 as
  b2.
  
  g4
  g fs g b 
  a a a b 
  g a a4. g8 
  fs2.
  
  g2 fs
}

bass = \relative c {
  \global
 d4
 a b fs fs'
 g g d d
 g e fs fs, 
 b2.
 
 g'4
 g d g e
 a4. g8 fs4 g
 e d a a 
 d2.
 
 g,2 d'2
}

verseOne = \lyricmode {
  \vOne
  O Christ, our hope, our hearts' de -- sire,
  Re -- demp -- tion's on -- ly spring;
  Cre -- a -- tor of the world art thou,
  Its Sa -- vior and its King.
}

verseTwo = \lyricmode {
  \vTwo
  How vast the mer -- cy and the love
  Which laid our sins on thee,
  And led thee to a cru -- el death
  To set thy peo -- ple free.
}

verseThree = \lyricmode {
  \vThree
  But now the bonds of death are burst,
  The ran -- som has been paid;
  And thou art on thy Fa -- ther's throne
  In glo -- rious robes ar -- rayed.
}

verseFour = \lyricmode {
  \vFour
  O may thy might -- y love pre -- vail
  Our sin -- ful souls to spare;
  O may we come be -- fore thy throne,
  And find ac -- cep -- tance there! \set stanza = "6." A -- men.
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
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "O Christ, be thou our present joy,"
            "  Our future great reward;"
            "Our only glory may it be"
            "  To glory in the Lord."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "All praise to thee, ascended Lord;"
            "  All glory ever be"
            "To Father, Son, and Holy Ghost,"
            " Through all eternity.   Amen."
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
    \include "hymn_layout.ly"
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
  \bottom
}
