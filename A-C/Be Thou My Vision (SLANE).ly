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
          \line {SLANE 10 10 9 10}
      }
      \column{
      \line {Irish traditional}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line { \italic "Rop tú mo Baile," D. Forgaill, 6th cent.}
     \line { tr. M.E. Byrne, 1905; versified E.H. Hull, 1912}
   }
  } 
}

\header {
  tagline = ""
}

\paper {
  page-count = 1
}

global = {
  \key ef \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"

}

melody = \relative c' {
  \global
  ef4 ef f8[ ef] |
  c4 bf bf8[ c] |
  ef4 ef f |
  g2. | \break

  f4 f f |
  f g bf |
  c bf g |
  bf2. | \break

  c4 c8[ d] ef[ d] |
  c4( bf) g |
  bf ef, d |
  c2( bf4) | \break
  
  ef4 g bf |
  c8[ bf] g4 ef8[ g] |
  f4 ef ef |
  ef2. \bar "|."
}

alto = \relative c' {
  \global
  bf4 bf c |
  g bf bf8[ c] |
  c4 c ef |
  ef2. |

  bf4 ef d |
  c d ef |
  ef f ef |
  ef( d g) |

  af4 af g |
  g2 d4 |
  d c bf |
  c2( bf4) |

  c4 ef d |
  ef bf4 bf |
  c c c |
  bf2.
}

tenor = \relative c' {
  \global
  g4 g af |
  ef f g |
  g g c |
  bf2. |
  
  f4 a bf |
  f bf g |
  g f bf |
  bf2( d4) |
  
  c4 c c |
  g d' bf |
  g g f |
  g( af f) |
  
  g ef f |
  ef ef ef |
  af g f |
  g2.
}

bass = \relative c {
  \global
  ef4 ef af, |
  c d ef |
  c bf af |
  <<{\voiceTwo ef'2.}\\{\voiceFour \tiny s2 g8[ ef] }>>
  
  d4 c bf |
  a g ef' |
  c d ef |
  bf2( bf'4) |
  
  af4 f c8[ d] |
  ef4 g g |
  bf, c d |
  ef( f d) |
  
  c4 c bf8[ af] |
  g4 ef g |
  af8[ bf] c4 af |
  ef'2.
}

verseOne = \lyricmode {
  \set stanza = "1."
Be thou my vi -- sion, O Lord of my heart;
Naught be all else to me, save that thou art.
Thou my best thought, by day or by night,
Wak -- ing or sleep -- ing, thy pre -- sence my light.
}

verseTwo = \lyricmode {
  \set stanza = "2."
Be thou my Wis -- dom, and thou my true Word;
I ev -- er with thee and thou with me, Lord;
Thou my great Fa -- ther, I thy true son;
Thou in me dwell -- ing, and I with thee one.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Be thou my bat -- tle shield, sword for the fight;
Be thou my dig -- ni -- ty, thou my de -- light;
Thou my soul’s shel -- ter, thou my high tow'r:
Raise thou me heav'n -- ward, O pow'r of my pow'r.
}

verseFour = \lyricmode {
	\set stanza = "4."
Rich -- es I heed not, nor man’s emp -- ty praise,
Thou mine in -- her -- i -- tance, now and al -- ways:
Thou and thou on -- ly, first in my heart,
High King of Heav -- en, my trea -- sure thou art.
}

verseFive = \lyricmode {
	\set stanza = "5."
High King of heav -- en, my vic -- to -- ry won,
May I reach Heav -- en’s joys, O bright Heav'n’s Sun!
Heart of my \set ignoreMelismata = ##t own heart, \unset ignoreMelismata what -- ev -- er be -- fall,
Still be my vi -- sion, O rul -- er of all.	
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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 88 4)
      }
    }
    \include "hymn_layout.ly"
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
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}