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
      \line {PLAINSONG MODE I  LM}
    }
    \column{
      \line {Harm. }
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Christe, Redemptor omnium"}
      \line {Tr. Henry W. Baker}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d8 e fs8[ a] a[ g] fs[ e fs] g fs e4 \once \override ChoirStaff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|"
  d8[ fs] a b b a b8[^- cs^\prall d] cs8[ b a] b4 \bar "|"
  b8[ cs] a g[ a] fs e[ d] e e[ fs] fs4 \once \override ChoirStaff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|"
  d8 e fs[ a] a[ g] fs[ e fs] g fs e4 \bar "||" \break
  
  e8[ fs e] d4( e) \bar "||"
}

alto = \relative c' {
  \global
  d4~ d4 b d4. e4~ e
  d4 fs e d4. e4. d4~
  d4. b4. e8[ d] e e4 d4
  d2~ d4~ d4. b4~ b4
  
  b4.~ b2
}

tenor = \relative c {
  \global
  fs8[ g] a[ fs] e4 b'4.~ b8[ a] g4
  a4~ a4~ a fs4. g4. fs4~
  fs4. g4. a4. b4~ b
  a4~ a b4 a4.~ a4 g4
  
  fs4.~ fs4 g
}

bass = \relative c {
  \global
 d2 e4 b4. e4~ e
 fs4 d cs b2.~ b4
 d4. e4. fs4. g4 b
 fs4 d b~ b4. e4~ e
 
 b4. e2
}

verseOne = \lyricmode {
  \set stanza = "1."
  O Christ, Re -- deem -- er of our race,
  Thou bright -- ness of the Fa -- ther's face,
  Of him, and with him ev -- er One,
  Ere times and sea -- sons had be -- gun.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Thou that art ver -- y Light of Light,
  Un -- fail -- ing hope in sin's dark night,
  Hear thou the prayers thy peo -- ple pray
  The wide world o'er this bless -- ed day.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Re -- mem -- ber, Lord of life and grace,
  How once, to save a ru -- ined race,
  Thou didst our ver -- y flesh as -- sume
  In Mar -- y's un -- de -- fil -- ed womb.
}

verseFour = \lyricmode {
  \set stanza = "4."
  This day, as year by year its light
  Sheds o'er the world a ra -- diance bright,
  Tells how, de -- scend -- ing from the throne,
  Thou sav -- edst man, and thou a -- lone.
}

verseFive = \lyricmode {
  \set stanza = "5."
  The heav'ns a -- bove, the roll -- ing main
  And all that earth's wide realms con -- tain,
  With joy -- ous voice now loud -- ly sing
  The glo -- ry of their new -- born King.
  
  \set stanza = "7." A -- men.
}

\book {
  \include "hymn_paper_multipage.ly"
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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 76 4)
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
          \bold "6. "
          \column {
            "And we, who by thy Precious Blood"
            "From sin redeemed are marked for God,"
            "On this the day that saw thy birth"
            "Sing the new song of ransomed earth."
          }
        }
        \vspace #0.5
        \line {
          \bold "7. "
          \column {
            "All honor, praise, and glory be,"
            "O Jesus, Virgin-born, to thee;"
            "All glory, as is ever meet,"
            "To Father, and to Paraclete."
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
      \new Lyrics \lyricsto "tune" { \verseFive }
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
          \bold "6. "
          \column {
            "And we, who by thy Precious Blood"
            "From sin redeemed are marked for God,"
            "On this the day that saw thy birth"
            "Sing the new song of ransomed earth."
          }
        }
        \vspace #0.5
        \line {
          \bold "7. "
          \column {
            "All honor, praise, and glory be,"
            "O Jesus, Virgin-born, to thee;"
            "All glory, as is ever meet,"
            "To Father, and to Paraclete."
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
