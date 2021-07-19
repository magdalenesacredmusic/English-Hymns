%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {ANDERNACH}
    }
    \column{
      \line {\italic "Andernach Gesangbuch," 1608}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Vs. 1-5 \italic "Vexilla Regis prodeunt"}
      \line {Venantius Fortunatus; tr. J.M. Neale}
    } 
  }
}

global = {
  \key g \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g2^\markup { \italic "To be sung in unison." } \bar "|"
  g4 g fs d \bar "|"
  e2 fs \bar "|"
  g \bar "||" \break

  b \bar "|"
  a c \bar "|"
  b4 a g a \bar "|"
  b2. \bar "||" \break

  g4 \bar "|"
  a g a b \bar "|"
  g a g2 \bar "||" \break

  b \bar "|"
  d2. c4 \bar "|"
  \time 3/2 b4 g b2 a \bar "|"
  g \bar "|."

}

alto = \relative c' {
  \global
  d2
  d4 <b d> c d
  d c b a
  <b d>2

  <d g>
  d4 fs g <d a'>
  <d g> <d fs> d <d fs>
  <d g>2.

  e4
  fs e fs fs
  e <c e> e2

  <d g>2
  a'4 g fs a
  g e d e fs2
  d \bar "|."

}

tenor = \relative c' {
  \global
  b4 a
  g d fs g
  g2 d'4 c
  <g b>2
  b
  d c4 a
  g a b a
  g2.
  b4
  d b d d
  b a b2
  g
  d'2. <a e>4
  d c <g b>2 <a d>
  <g b>
}

bass = \relative c {
  \global
  g4 a
  b g a b
  c2 d
  g,
  g'
  fs4 d e fs
  g d b d
  g2.
  e4
  d e d b
  e a, e'2
  g
  fs4 e d a
  b c d2 d
  g,
}

verseOne = \lyricmode {
  \set stanza = "1."
  The Roy -- al Ban -- ners for -- ward go,
  The Cross shines forth in mys -- tic glow;
  Where He in flesh, our flesh Who made,
  Our sen -- tence bore, our ran -- som paid.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Where deep for us the spear was dyed,
  Life’s tor -- rent rush -- ing from His side,
  To wash us in that pre -- cious flood,
  Where min -- gled wa -- ter flowed, and blood.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Ful -- filled is all that Da -- vid told
  In true pro -- phet -- ic song of old,
  A -- midst the na -- tions, God, saith he,
  Hath reigned and tri -- umphed from the tree.
}

verseFour = \lyricmode {
  \set stanza = "4."
  O Tree of Beau -- ty, Tree of light!
  O Tree with roy -- al pur -- ple dight!
  E -- lect on whose tri -- um -- phal breast
  Those ho -- ly limbs should find their rest.
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
        tempoWholesPerMinute = #(ly:make-moment 84 4)
      }
    }
    \include "hymn_layout.ly"
  }
  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5."
          \column {
            "On whose dear arms, so widely flung,"
            "The weight of this world's ransom hung:"
            "The price of humankind to pay,"
            "And spoil the spoiler of his prey."
          }
        }
        \vspace #0.5
        \line {
          \bold "6."
          \column {
            "O Cross, our one reliance, hail!"
            "This holy Passiontide, avail"
            "To give fresh merit to the saint,"
            "And pardon to the penitent."
          }
        }
        \vspace #0.5
        \line {
          \bold "7."
          \column {
            "To Thee, Eternal Three in One,"
            "Let homage meet by all be done:"
            "As by the Cross Thou dost restore,"
            "Preserve and govern evermore."
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5."
          \column {
            "On whose dear arms, so widely flung,"
            "The weight of this world's ransom hung:"
            "The price of humankind to pay,"
            "And spoil the spoiler of his prey."
          }
        }
        \vspace #0.5
        \line {
          \bold "6."
          \column {
            "O Cross, our one reliance, hail!"
            "This holy Passiontide, avail"
            "To give fresh merit to the saint,"
            "And pardon to the penitent."
          }
        }
        \vspace #0.5
        \line {
          \bold "7."
          \column {
            "To Thee, Eternal Three in One,"
            "Let homage meet by all be done:"
            "As by the Cross Thou dost restore,"
            "Preserve and govern evermore."
          }
        }
      }
      \hspace #1.0

    }
  }
}
  \bottom
}



%{ verse 6 is found alternately thus in the English Hymnal, 1906:
"O Cross, our one reliance, hail!"
		"Still may thy power with us avail"
		"To give new virtue to the saint,"
		"And pardon to the penitent."
%}
