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
      \line {PLAINSONG, MODE II   LM}
    }
    \column{
      \line {Harm. after Paul Benoit}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic" Veni, Redemptor gentium"}
      \line {Ambrose of Milan, Tr. John Mason Neale}
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

melody = \relative c' {
  \global
  e8 e e d e g fs e^- \bar "'"
  g8 a a a g a a b4 \once \override ChoirStaff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|"
  b8 b a b g a g e^- \bar "'"
  e8 d e g a e d e4 \bar "||" \break

  e8[ fs e] d4( e) \bar "||"
}

alto = \relative c' {
  \global
  c8 b2~ b4~ b8~
  b8 e2 d4 d~
  d8 e4~ e e c8~
  c8 a4 d b~ b
  
  c4. b4~ b
}

tenor = \relative c' {
  \global
 a8 g2 a4 g8~ 
 g8 a4 g fs g~
 g8 a4 g a g8~ 
 g8 fs4 g fs g
 
 a4. fs4 g
}

bass = \relative c' {
  \global
 a8 e2~ e4~ e8~
 e8 c2 d4 g4~
 g8 e4~ e c~ c8~ |
 c8 d4 b4~ b4 e
 
 c4. b4 e4
}

verseOne = \lyricmode {
  \set stanza = "1."
  Come, thou Re -- deem -- er of the earth,
  And man -- i -- fest thy vir -- gin birth:
  Let ev' -- ry age a -- dor -- ing fall;
  Such birth be -- fits the God of all.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Be -- got -- ten of no hu -- man will,
  But of the Spir -- it, thou art still
  The Word of God in flesh ar -- rayed,
  The prom -- ised fruit to man dis -- played.
}

verseThree = \lyricmode {
  \set stanza = "3."
  The vir -- gin womb that bur -- den gained
  With vir -- gin hon -- or all un -- stained;
  The ban -- ners there of vir -- tue glow;
  God in his tem -- ple dwells be -- low.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Forth from his cham -- ber go -- eth he,
  That roy -- al home of pur -- i -- ty,
  A giant in two -- fold sub -- stance one,
  Re -- joic -- ing now his course to run.
}

verseFive = \lyricmode {
  \set stanza = "5."
  From God the Fa -- ther he pro -- ceeds,
  To God the Fa -- ther back he speeds;
  His course he runs to death and hell,
  Re -- turn -- ing on God's throne to dwell.
}

verseSix = \lyricmode {
  \set stanza = "6."
  O e -- qual to the Fa -- ther thou!
  Gird on thy flesh -- ly man -- tle now;
  The weak -- ness of our  mor -- tal state
  With death -- less might in -- vig -- or -- ate.
  
  \set stanza = "8."
  A -- men.
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
      \new Lyrics \lyricsto soprano \verseFive
      \new Lyrics \lyricsto soprano \verseSix
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
            "Thy cradle here shall glitter bright,"
            "And darkness breathe a newer light,"
            "Where endless faith shall shine serene,"
            "And twilight never intervene."
          }
        }
        \vspace #0.5
        \line {
          \bold "8. "
          \column {
            "All laud to God the Father be,"
            "All praise, eternal Son, to thee:"
            "All glory, as is ever meet,"
            "To God the Holy Paraclete."
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
      \new Lyrics \lyricsto "tune" { \verseFive}
      \new Lyrics \lyricsto "tune" { \verseSix}
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \vspace #0.5
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
            "Thy cradle here shall glitter bright,"
            "And darkness breathe a newer light,"
            "Where endless faith shall shine serene,"
            "And twilight never intervene."
          }
        }
        \vspace #0.5
        \line {
          \bold "8. "
          \column {
            "All laud to God the Father be,"
            "All praise, eternal Son, to thee:"
            "All glory, as is ever meet,"
            "To God the Holy Paraclete."
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
