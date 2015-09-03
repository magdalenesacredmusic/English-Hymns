
%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup { \fontsize #4 \smallCaps "O Let Him Whose Sorrow" }
  meter = \markup { \small { Music: CASWALL (WEM IN LEIDENSTAGEN), 6.5.6.5; Friedrich Filiz, 1847 } }
  piece = \markup { \small {Text: \large \override #'(font-name . "CloisterBlack")  "Wem in Leidenstagen," H.S. Oswald, 1826; tr. F.E. Cox, 1841 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key f \major
  \time 4/4
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
  Oh! let him whose sor -- row
  No re -- lief can find,
  Trust in God, and bor -- row
  Ease for heart and mind.
}

verseTwo = \lyricmode {
  \set stanza = "2. "
  Where the mourn -- er weep -- ing
  Sheds the se -- cret tear,
  God His watch is keep -- ing,
  Though none else be near.
}

verseThree = \lyricmode {
  \set stanza = "3. "
  God will ne -- ver leave thee,
  All thy wants He knows,
  Feels the pains that grieve thee,
  Sees thy cares and woes.
}

verseFour = \lyricmode {
  \set stanza = "4. "
  Raise thine eyes to hea -- ven
  When thy spi -- rits quail,
  When, by tem -- pests driv -- en,
  Heart and cou -- rage fail.
}


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
      tempoWholesPerMinute = #(ly:make-moment 80 4)
    }
  }
  \layout { }
}

\markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "When in grief you languish,"
            "He will dry the tear,"
            "Who His children’s anguish"
            "Soothes with succour near."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "All thy woe and sadness"
            "In this world below,"
            "Balance not the gladness"
            "Thou in heaven shalt know,"
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "When thy gracious Saviour,"
            "In the realms above,"
            "Crowns thee with His favour,"
            "Fills thee with His love."
          }
        }
      }
      \hspace #1.0
    }
  }
}

%{
the text is altered in The English Hymnal as follows:
	5.	"When in grief we languish,"
		"He will dry the tear,"
		"Who His children’s anguish"
		"Soothes with succour near."

	6.	"All our woe and sadness"
		"In this world below,"
		"Balance not the gladness"
		"We in heaven shalt know,"

	7. 	"Jesu, gracious Saviour,"
		"In the realms above,"
		"Crowns with us Thy favour,"
		"Fills us with Thy love."
%}
