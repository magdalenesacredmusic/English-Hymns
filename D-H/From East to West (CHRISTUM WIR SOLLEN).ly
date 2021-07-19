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
      \line {CHRISTUM WIR SOLLEN LOBEN SCHON  LM}
    }
    \right-column{
      \line {Geistliche Lieder, Wittenberg, 1535}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "A solis ortus cardine"}
      \line {c. 450; tr. John Ellerton, 1871}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key c \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
  \set Staff.extraNatural = ##f
}

melody = \relative c' {
  \global
  d2 f4 g \bar "|"
  a d, g f \bar "|"
  e2 b'4\rest g4 a c \bar "|"
  c4. b8 a4 b \bar "|"
  c2 b4\rest \bar "||"

  g4 c d \bar "|"
  c b a g \bar "|"
  a2 b4\rest d,4 a' a \bar "|"
  c a g8[ a] f4 \bar "|"
  e1 \bar "|."
}

alto = \relative c' {
  \global
  d2 d4 e
  e d d d
  c2 s4 b4 d e
  f g f f
  e2 s4

  e4 e g
  e e c8[ d] e4
  f2 s4 d e f
  g f e d
  b1
}

tenor = \relative c' {
  \global
  a2 a4 c
  c bf bf a
  a2 d,4\rest g f g
  a c c f,
  g2 d4\rest

  c'4 c b
  a g a b
  d2 d,4\rest f4 a d
  c c c a
  gs1
}

bass = \relative c {
  \global
  f4( e) d c
  a bf g d'
  a2 s4 e'4 d c
  f e f d
  c2 s4

  \override Voice.Accidental.stencil = ##f c'8[ b] a4 g
  a e f e
  d2 s4
  d4 c d
  e f c d
  e1
}

verseOne = \lyricmode {
  \set stanza = "1."
  From east to west, from shore to shore,
  Let ev' -- ry heart a -- wake and sing
  The ho -- ly Child Whom Ma -- ry bore,
  The Christ, the ev -- er -- last -- ing King.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Be -- hold, the world’s Cre -- a -- tor wears
  The form and fash -- ion of a slave;
  Our ve -- ry flesh our Mak -- er shares,
  His fal -- len crea -- ture, man, to save.
}

verseThree = \lyricmode {
  \set stanza = "3."
  For this how won -- drous -- ly He wrought!
  A maid -- en, in her low -- ly place,
  Be -- came, in ways be -- yond all thought,
  The cho -- sen ves -- sel of His grace.
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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
      }
    }
    \include "hymn_layout.ly"
  }
  \bottom
  
  \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "4. "
          \column {
            "She bowed her to the angel’s word"
            "  Declaring what the Father willed,"
            "And suddenly the promised Lord"
            "  That pure and hallowed temple filled."
          }
        }
        \vspace #1
        \line {
          \bold "5. "
          \column {
            "He shrank not from the oxen’s stall,"
            "  He lay within the manger bed,"
            "And He whose bounty feedeth all"
            "  At Mary’s breast Himself was fed."
          }
        }
      }
      \hspace #0.1  % adds horizontal spacing between columns;
      % if they are still too close, add more " " pairs
      % until the result looks good
      \column {
        \line {
          \bold "6. "
          \column {
            "And while the angels in the sky"
            "  Sang praise above the silent field,"
            "To shepherds poor the Lord Most High,"
            "  The one great Shepherd, was revealed."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "All glory for this blessèd morn"
            "  To God the Father ever be;"
            "All praise to Thee, O Virgin-born,"
            "  All praise, O Holy Ghost, to Thee."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
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
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "4. "
          \column {
            "She bowed her to the angel’s word"
            "  Declaring what the Father willed,"
            "And suddenly the promised Lord"
            "  That pure and hallowed temple filled."
          }
        }
        \vspace #1
        \line {
          \bold "5. "
          \column {
            "He shrank not from the oxen’s stall,"
            "  He lay within the manger bed,"
            "And He whose bounty feedeth all"
            "  At Mary’s breast Himself was fed."
          }
        }
      }
      \hspace #0.1  % adds horizontal spacing between columns;
      % if they are still too close, add more " " pairs
      % until the result looks good
      \column {
        \line {
          \bold "6. "
          \column {
            "And while the angels in the sky"
            "  Sang praise above the silent field,"
            "To shepherds poor the Lord Most High,"
            "  The one great Shepherd, was revealed."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "All glory for this blessèd morn"
            "  To God the Father ever be;"
            "All praise to Thee, O Virgin-born,"
            "  All praise, O Holy Ghost, to Thee."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}


 
}

