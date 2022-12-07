\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \tiny {
  \fill-line {
    \column {
      \line {SPLENDOR PATERNAE, LM}
    }
    \right-column{
      \line {Sarum Plainsong, Mode I}
      \line {Harm. \italic "Hymnal, 1940"}
    }
  }
}
}

bottom = \markup  {
  \tiny {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Aeterna coeli gloria"}
      \line {6th cent.; Tr. John Mason Neale}
    }
  }
}
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f8 f g a bf a g a4 \bar "'"
  a8 g c c g \bar "" \break a bf a4( g) \hb
  a8 a g a g f e f4 \bar "'"
  g8 a g f e f[ g] e d4 \bar "||"
  
  d8[ e d] c4( d) \bar "||"
}

alto = \relative c' {
  \global
  s4. f4 e f
  c8~ c2~ c8 d e2
  c8 d4 e s s
  c8~ c2 d4 c8 a4
  
  bf4. a2
}

tenor = \relative c' {
  \global
  a8~ a4 s s s4. 
  s2 s4 s2
  s8 s4 s a8[ g] a4
  s8 s4 s bf4 g8 f4
  
  g4. e4 f4
}

bass = \relative c {
  \global
 f8 d2 c4 f4.
 e2 f4 c2
 a8 bf4 c d2
 e8 f4 c bf c8 d4
 
 g,4. a4 d
}

verseOne = \lyricmode {
  \vOne
  E -- ter -- nal Glo -- ry of the sky,
  Blest hope of frail hu -- man -- i -- ty,
  The Fa -- ther's sole -- be -- got -- ten One,
  Yet born a spot -- less Vir -- gin's Son!
}

verseTwo = \lyricmode {
  \vTwo
  Up -- lift us with thine arm of might,
  And let our hearts rise pure and bright,
  And, ar -- dent in God's prais -- es, pay
  The thanks we owe him ev -- 'ry day.
}

verseThree = \lyricmode {
  \vThree
  The day -- star's rays are glit -- t'ring clear,
  And tell that day it -- self is near:
  The shad -- ows of the night de -- part;
  Thou, ho -- ly Light, il -- lume the heart!
}

verseFour = \lyricmode {
  \vFour
  With -- in our sens -- es ev -- er dwell,
  And world -- ly dark -- ness thence ex -- pel;
  Long as the days of life en -- dure,
  Pre -- serve our souls de -- vout and pure.
  
  \set stanza = "6." A -- men.
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
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
            "The faith that first must be possest,"
            "Root deep within our inmost breast;"
            "And joyous hope in second place,"
            "Then charity, thy greatest grace."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "All laud to God the Father be,"
            "All praise, eternal Son, to thee;"
            "All glory, as is ever meet,"
            "To God the holy Paraclete.  Amen."
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
