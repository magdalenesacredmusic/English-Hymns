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
      \line {WICKLOW  86 84}
    }
    \column{
      \line {Irish Traditional Melody}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Harriet Auber (1773-1826)}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
\partial 4
f8[ g] |
a4 d c8[ a] g[ f] |
d4 d c f8[ g] | \break
a4 g8[ f] d4 d |
d2. 

  f8[ g] |
  a4 d c8[ a] g[ f] |
  d4 d c f8[ g] |
  a2 g4( f) |
  d2.

\bar "|."
}

alto = \relative c' {
  \global
  d8[ e] |
  f[ e] f[ g] e4 d |
  bf bf c bf |
  c c bf c8[ bf] |
  a2. d4 |
  c8[ d] e4 f d |
  d bf8[ a] c4 d |
  d2 d2 |
  d2.
}

tenor = \relative c' {
  \global
  a8[ bf] |
  a8[ g] a[ bf] g4 a |
  g f e d8[ e] |
  f4 e8[ f] g4 g |
  f2. f4 |
  f bf c a |
  bf f e a |
  a2 bf |
  f2.
}

bass = \relative c {
  \global
 d4 d d d d |
 g, g a bf |
 f a bf g |
 d'2. bf4 |
 f' g a d, |
 bf g c d8[ e] |
 f2 g |
 d2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Our blest Re -- deem -- er, ere he breathed
  His ten -- der last fare -- well,
  A guide, a com -- for -- ter, be -- queathed
  With us to dwell.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  He came in tongues of liv -- ing flame
  To teach, con -- vince, sub -- due,
  All power -- ful as the wind he came
  As view -- less too.
}

verseThree = \lyricmode {
  \set stanza = "3."
  He came sweet in -- fluence to im -- part,
  A gra -- cious, will -- ing Guest,
  While he can find one hum -- ble heart
  Where -- in to rest.
}

verseFour = \lyricmode {
  \set stanza = "4."
  And his that gen -- tle voice we hear,
  Soft as the breath of ev'n,
  That checks each fault, that calms each fear,
  And speaks of Heav'n.
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
            "And every virtue we possess,"
            "And every conquest won,"
            "And every thought of holiness,"
            "Are his alone."
          }
        }
  \vspace #1
        \line {
          \bold "6. "
          \column {
            "Spirit of purity and grace,"
            "Our weakness, pitying, see:"
            "O make our hearts thy dwelling place"
            "And worthier thee."
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
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "And every virtue we possess,"
            "And every conquest won,"
            "And every thought of holiness,"
            "Are his alone."
          }
        }
  \vspace #1
        \line {
          \bold "6. "
          \column {
            "Spirit of purity and grace,"
            "Our weakness, pitying, see:"
            "O make our hearts thy dwelling place"
            "And worthier thee."
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
