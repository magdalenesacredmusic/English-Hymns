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
      \line {PUER NOBIS NASCITUR  LM}
    }
    \right-column{
      \line {Michael Praetorius; harm. G.R. Woodward, 1902}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Veni, Redemptor gentium"}
      \line {St. Ambrose; tr. J.M. Neale, as per \italic "The English Hymnal," 1906}
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

melody = \relative c' {
  \global
  \partial 4
  d4 |
  d2 e4 |
  fs2 g4 |
  fs2 e4 |
  d2 d4 |
  a'2 a4 |
  a4( b) cs |
  d2 d4 |
  d2 \bar "|"

  a4 |
  d2 d4 |
  cs2 a4 |
  b2 b4 |
  a2 g4 |
  a2 fs4 |
  e2 fs4 |
  d2 cs4 |
  d2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  a4 |
  d2 cs4 |
  d2 d4 |
  d2 a4 |
  fs2 d'4 |
  d( g) fs |
  e2 e4 |
  fs2 g4 |
  fs2 \bar "||"

  e4 |
  d( fs) e |
  e2 d4 |
  b2 d4 |
  d2 b4 |
  e2 d4 |
  cs2 d4 |
  b2 a4 |
  a2 \bar "|."
}

tenor = \relative c {
  \global
  \partial 4
  fs4 |
  fs2 a4 |
  a2 d,4 |
  a'4( b) cs |
  d2 d4 |
  d2 a4 |
  a2 a4 |
  a2 b4 |
  a2 \bar "||"

  a4 |
  b2 b4 |
  a( g) fs |
  g2 g4 |
  fs2 g4 |
  e2 a4 |
  a2 a4 |
  g( fs) e |
  fs2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  b2 a4 |
  d( cs) b |
  a( g) a |
  d2 g4 |
  fs( e) d |
  cs2 a4 |
  d2 d4 |
  d2 \bar "||"

  cs4 |
  b( a) gs |
  a2 d4 |
  g,2 b4 |
  d2 e4 |
  cs2 d4 |
  a( g) fs |
  g2 a4 |
  d2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  Come, Thou Re -- deem -- er of the earth,
  And man -- i -- fest Thy vir -- gin birth:
  Let ev' -- ry age a -- dor -- ing fall;
  Such birth be -- fits the God of all.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Be -- got -- ten of no hu -- man will,
  But of the Spi -- rit, Thou art still
  The Word of God in flesh ar -- rayed,
  The pro -- mised Fruit to man dis -- played.
}

verseThree = \lyricmode {
  \set stanza = "3."
  The vir -- gin womb that bur -- den gained
  With vir -- gin ho -- nor all un -- stained;
  The ban -- ners there of vir -- tue glow;
  God in His tem -- ple dwells be -- low.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Forth from His cham -- ber go -- eth He,
  That roy -- al home of pur -- i -- ty,
  A giant in two -- fold sub -- stance one,
  Re -- joic -- ing now His course to run.
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
        tempoWholesPerMinute = #(ly:make-moment 112 4)
      }
    }
    \include "hymn_layout.ly"
  }
  \bottom
  
  \markup {
            \vspace #3
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "From God the Father He proceeds,"
            "To God the Father back He speeds;"
            "His course He runs to death and hell,"
            "Returning on God’s throne to dwell."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "O equal to the Father, Thou!"
            "Gird on Thy fleshly mantle now;"
            "The weakness of our mortal state"
            "With deathless might invigorate."
          }
        }
      }
      \hspace #0.1  % adds horizontal spacing between columns;
      % if they are still too close, add more " " pairs
      % until the result looks good
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
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "All laud to God the Father be,"
            "All praise, eternal Son, to Thee;"
            "All glory, as is ever meet,"
            "To God the Holy Paraclete."

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
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "From God the Father He proceeds,"
            "To God the Father back He speeds;"
            "His course He runs to death and hell,"
            "Returning on God’s throne to dwell."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "O equal to the Father, Thou!"
            "Gird on Thy fleshly mantle now;"
            "The weakness of our mortal state"
            "With deathless might invigorate."
          }
        }
      }
      \hspace #0.1  % adds horizontal spacing between columns;
      % if they are still too close, add more " " pairs
      % until the result looks good
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
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "All laud to God the Father be,"
            "All praise, eternal Son, to Thee;"
            "All glory, as is ever meet,"
            "To God the Holy Paraclete."

          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}

}

