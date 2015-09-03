% Version 1.0
% Last edit: April 22, 2013
% The music and words produced by this source code are believed
% to be in the public domain in the United States. The source
% code itself is covered by the Creative Commons Attribution-
% NonCommercial license,
% http://creativecommons.org/licenses/by-nc/2.5/
% Attribution: David O'Donnell

\version "2.16.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup { \fontsize #4 \smallCaps "Glory Be To Jesus" }
  meter = \markup { \small { Music: CASWALL (WEM IN LEIDENSTAGEN), 6.5.6.5; Friedrich Filiz, 1847 } }
  piece = \markup { \small {Text: \italic "Viva, Viva Jesu;" Italian, c. 18th cent.; tr. Edward Caswall, 1857 }}
  %breakbefore
  %copyright = ""
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


\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranos { \voiceOne << \melody >> }
      \context Voice =
      altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
      \context Lyrics = two \lyricsto sopranos \verseTwo
      \context Lyrics = three \lyricsto sopranos \verseThree
      \context Lyrics = four \lyricsto sopranos \verseFour
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenor >> }
      \context Voice =
      basses { \voiceTwo << \bass >> }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 84 4)
    }
  }
  \layout {}
}

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



%{
	Per _Westminster Hymnal_, #56
%}


