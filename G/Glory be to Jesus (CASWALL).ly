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
      \line {CASWALL (WEM IN LEIDENSTAGEN) 65 65}
    }
    \right-column{
      \line {Friedrich Filiz, 1847}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Viva, Viva Jesu"}
      \line {Italian, c. 18th cent.; tr. Edward Caswall, 1857}
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

melody = \relative c'' {
  \global
  a4 a g g |
  f2 e2 |
  f4 f g g |
  a1 \bar "||"

  c4 c bf bf |
  a2 g2
  a4 a g g |
  f1 \bar "||"
}

alto = \relative c' {
  \global
  f4 f f e |
  e( d) cs2 |
  d4 f f e |
  f1 |

  e4 f d g |
  g( f) e2 |
  f4 f f e |
  f1
}

tenor = \relative c' {
  \global
  c4 c c c |
  a2 a |
  a4 a c c |
  c1 \bar "||"

  c4 a bf c |
  c2 c |
  c4 c d c |
  a1 \bar "||"
}

bass = \relative c {
  \global
  f4 f c c |
  d2 a |
  d4 d c c |
  f1 |

  a4 f g e |
  f2 c |
  f4 a, bf c |
  f1 |
}

verseOne = \lyricmode {
  \set stanza = "1. "
  Glo -- ry be to Je -- sus,
  Who in bit -- ter pains
  Poured for me the life -- blood
  From his sa -- cred veins!
}

verseTwo = \lyricmode {
  \set stanza = "2. "
  Grace and life e -- ter -- nal
  In that blood I find,
  Blest be His com -- pas -- sion,
  In -- fi -- nite -- ly kind!
}

verseThree = \lyricmode {
  \set stanza = "3. "
  Blest through end -- less a -- ges
  Be the pre -- cious stream,
  Which from end -- less tor -- ments
  Does the world re -- deem!
}

verseFour = \lyricmode {
  \set stanza = "4. "
  A -- bel's blood for ven -- geance
  Plead -- ed to the skies;
  But the Blood of Je -- sus
  For our par -- don cries.
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
  \bottom
  
  \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #3.0
      \column {
        \line {
          \bold "5. "
          \column {
            "Oft as earth exulting"
            "  Wafts its praise on high,"
            "Angel-hosts, rejoicing,"
            "  Make their glad reply."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "Lift ye then your voices;"
            "  Swell the mighty flood;"
            "Louder still and louder,"
            "  Praise the precious Blood!"
          }
        }
      }
      \hspace #3.0
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
      \hspace #3.0
      \column {
        \line {
          \bold "5. "
          \column {
            "Oft as earth exulting"
            "  Wafts its praise on high,"
            "Angel-hosts, rejoicing,"
            "  Make their glad reply."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "Lift ye then your voices;"
            "  Swell the mighty flood;"
            "Louder still and louder,"
            "  Praise the precious Blood!"
          }
        }
      }
      \hspace #3.0
    }
  }
}
}





%{
	Per _Westminster Hymnal_, #56
%}


