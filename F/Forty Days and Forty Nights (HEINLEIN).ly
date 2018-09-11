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
      \line {AUS DER TIEFE 77 77}
    }
    \right-column{
      \line {Martin Herbst, (1654-1581) harm. \italic "The English Hymnal"}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {G. H. Smyttan, (1825-1870), alt. F. Potts }
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key d \minor
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a4 a d, e |
  f g a2 \bar "||"
  a4 a8[ b] c4 c |
  b4. a8 a2 \bar "||"
  a4 a bf! bf |
  g g a2 \bar "||"
  a4 a g f |
  e4. e8 d2 \bar "|."
}

alto = \relative c' {
  \global
  d4 d d cs |
  d4. e8 d4( cs) |
  d d8[ f] e4 f |
  f8[ e] d4 cs2 |
  fs4 fs g g8[ f] |
  e[ d] c4 c2 |
  c8[ bf] c[ d] e4 d |
  d cs d2 |
}

tenor = \relative c {
  \global
  f4 f8[ g] a4 a |
  a4. g8 e2 \bar "||"
  f8[ g] a[ d] c4 a |
  a gs a2 \bar "||"
  a4 d d d |
  c4. bf8 a2 \bar "||"
  a8[ g] a[ bf] c4 a |
  a8[ g] e4 f2 \bar "|."
}

bass = \relative c {
  \global
  d4 d8[ e] f4 a4 |
  d,8[ c] bf4 a2 |
  d8[ e] f[ g] a4 f8[ e] |
  d4 e a,2 |
  d8[ c] bf[ a] g4 bf |
  c e f2 |
  f4 f c d |
  a a d2 |
}

verseOne = \lyricmode {
  \set stanza = "1."
  For -- ty days and for -- ty nights
  Thou wast fast -- ing in the wild;
  For -- ty days and for -- ty nights
  Tempt -- ed, and yet un -- de -- filed:
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Sun -- beams scorch -- ing all the day;
  Chil -- ly dew- -- drops night -- ly shed;
  Prowl -- ing beasts a -- bout thy way;
  Stones thy pil -- low, earth thy bed.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Shall we not thy watch -- ings share,
  And from earth -- ly joys ab -- stain,
  Fast -- ing with un -- ceas -- ing prayer,
  Glad with thee to suf -- fer pain?
}

verseFour = \lyricmode {
  \set stanza = "4."
  And if Sa -- tan, vex -- ing sore,
  Flesh or spi -- rit should as -- sail,
  Thou, his van -- quish -- er be -- fore,
  Grant we may not faint or fail.
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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 92 4)
      }
    }
    \include "hymn_layout.ly"
  }
  \bottom
  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "So shall we have peace divine;"
            "  Holier gladness ours shall be;"
            "Round us too shall Angels shine,"
            "  Such as ministered to thee."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "Keep, O keep us, Saviour dear,"
            "  Ever constant by thy side;"
            "That with thee we may appear"
            "  At the_eternal Eastertide."
          }
        }
      }
      \hspace #1.0

    }
  }
}
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
  \bottom
  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "So shall we have peace divine;"
            "  Holier gladness ours shall be;"
            "Round us too shall Angels shine,"
            "  Such as ministered to thee."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "Keep, O keep us, Saviour dear,"
            "  Ever constant by thy side;"
            "That with thee we may appear"
            "  At the_eternal Eastertide."
          }
        }
      }
      \hspace #1.0

    }
  }
}
}






