\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {ALS CHRISTUS MIT SEINER LEHR  77 77}
    }
    \right-column{
      \line {Boehemian Brethren, 1566}
      \line {Harm. George R. Woodward (1843-1934)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Aeterne rector siderum"}
      \line {Robert Bellarmine (1541-1621)}
      \line {Tr. Edward Caswall (1814-1878)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  e,2 b'4 |
  a2 fs4 |
  g2 fs4 |
  e2. |
  
  b'2 cs4 |
  d2 cs4 |
  b2 as4 |
  b2. |
  
  e2 e4 |
  d2 b4 |
  a2 g4 |
  fs2. |
  
  e2 b'4 |
  a2 fs4 |
  g2 fs4 |
  e2. \bar "||"\break
  
  \time 4/4 e2 e2 \bar "|."
}

alto = \relative c' {
  \global
  e2 e4 |
  e2 ds4 |
  e2 ds4 |
  e2. |
  
  g2 a4 |
  a2 a4 |
  fs( g) fs |
  fs2. |
  
  e2 g4 |
  fs2 g4 |
  e2 d4 |
  d2. |
  
  b2 g'4 |
  e2 d4 |
  b( e) ds |
  e2.
  
  cs2 b2
}

tenor = \relative c' {
  \global
  g2 b4 |
  c2 b4 |
  b2 a4 |
  g2. |
  
  e'2 e4 |
  fs2 e4 |
  d( e) cs |
  d2. |
  
  b2 4 |
  d2 d4 |
  cs2 b4 |
  a2. |
  
  g2 d'4 |
  a2 a4 |
  g4 b2 |
  g2.
  
  a2 gs2
}

bass = \relative c {
  \global
  e2 g,4 |
  a2 b4 |
  g( a) b |
  e2. |
 
  e2 a4 |
  d,2 a4 |
  b( e) fs |
  b,2. |
 
  g'2 e4 |
  b2 g4 |
  a2 b4 |
  d2. |
 
  e2 b4 |
  c2 d4 |
  e( g,) b |
  e2.
 
  a,2 e'2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Ru -- ler of the dread im -- mense,
  Ma -- ker of this might -- y frame,
  Whose e -- ter -- nal prov -- i -- dence
  Guides it, as from thee it came:
  
  \set stanza = "6."
  A -- men.
}

verseTwo = \lyricmode {
  \vTwo
  Low be -- fore thy throne we bend;
  Hear our sup -- pli -- cat -- ing cries,
  And thy light ce -- les -- tial send
  With the fresh -- ly dawn -- ing skies.
}

verseThree = \lyricmode {
  \vThree
  King of kings and Lord most high,
  This of thy dear love we pray:
  May thy guar -- dian an -- gel nigh
  Keep us from all sin this day.
}

verseFour = \lyricmode {
  \vFour
  May he crush the dead -- ly wiles
  Of the en -- vious ser -- pent's art,
  Ev -- er spread -- ing cun -- ning toils
  Round a -- bout the thought -- less heart.
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
        tempoWholesPerMinute = #(ly:make-moment 126 4)
      }
    }
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \vspace #2.0
    \large {
      \fill-line {
        \hspace #1.0
        \column {
          \line {
            \bold "7. "
            \column {
              "May he scatter ruthless war"
              "Ere to this our land it come"
              "Plague and famine drive away,"
              "Fix securely peace at home."
            }
          }
          \vspace #0.5
          \line {
            \bold "8. "
            \column {
              "Father, Son, and Spirit blest,"
              "One eternal Trinity,"
              "May he guard at thy behest"
              "Us who put our trust in thee!"
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
      \new Lyrics \lyricsto "tune" { \verseFour}
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
