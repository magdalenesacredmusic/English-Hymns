\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Mundi salus affutura," 15th cent.; Tr. Laurence Housman (1865-1959)
      }
      \wordwrap {
        Music: COLLAUDEMUS  87 87 87, French Carol, \italic "The English Hymnal," 1906
      }
    }
  }
}


\header {
  tagline = ""
}

global = {
  \key f \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f2 g4 |
  f( e) f |
  g2 g4 |
  a2 f4 |
  a4( bf) c |
  bf( a ) g |
  f2 g4 |
  g2. | %\break
  
  g4( a) bf |
  c2 c4 |
  f,4( e) f |
  g2 g4 |
  a( bf) a |
  g2 g4 |
  f( d) e |
  f2. | %\break
  
  g4( a) bf4 |
  c2 c4 |
  f,( e) f |
  g2 g4 |
  a( bf) a |
  g2 g4 |
  f( d) e |
  f2.

\bar "|."
}

alto = \relative c' {
  \global
c2 c4 |
c2 c4 |
e2 e4 |
f2 c4 |
f2 f4 |
e( f) c |
c2 b4 |
c2. |

g'4( f) e |
f2 c4 |
c2 b4 |
c2 c4 |
c( d) c |
b2 b4 |
bf2 bf4 |
a2. |

g'4( f) e |
f2 c4 |
c2 b4 |
c2 c4 |
c( d) c |
b2 b4 |
bf2 bf4 |
a2.
}

tenor = \relative c' {
  \global
  a2 bf4 |
  a( g) a |
  bf2 bf4 |
  c2 a4 |
  c2 c4 |
  c2 g4 |
  a2 f4 |
  e2. |
  
  c'2 c4 |
  c2 f,4 |
  a2 f4 |
  f2 e4 |
  f2 f4 |
  f2 f4 |
  g2 g4 |
  f2. |
  
  c'2 c4 |
  c2 f,4 |
  a2 f4 |
  f2 e4 |
  f2 f4 |
  f2 f4 |
  g2 g4 |
  f2.
}

bass = \relative c {
  \global
 f2 f4 |
 f2 f4 |
 c2 c4 |
 f2 f4 |
 f( g) a |
 g( f) e |
 d2 d4 |
 c2. |
 
 e4( f) g |
 a2 a,4 |
 d2 d4 |
 c2 c4 |
 f2 f4 |
 d2 d4 |
 c2 c4 |
 f,2. |
 
 e'4( f) g |
 a2 a,4 |
 d2 d4 |
 c2 c4 |
 f2 f4 |
 d2 d4 |
 c2 c4 |
 f,2.
}

verseOne = \lyricmode {
  \vOne
  Por -- tal of the world's sal -- va -- tion,
  Lo, a vir -- gin pure and mild,
  Hum -- ble -- heart -- ed, high in sta -- tion,
  Form of beau -- ty un -- de -- filed,
  Crown of earth's an -- ti -- cip -- a -- tion,
  Comes the Moth -- er -- maid with child.
}

verseTwo = \lyricmode {
  \vTwo
  Here the ser -- pent's power sub -- du -- ing,
  See the Bush un -- burned by fire,
  Gid -- eon's Fleece of heav -- en's im -- buing,
  Aa -- ron's Rod of bright at -- tire,
  Fair, and pure, and peace -- en -- su -- ing,
  Spouse of So -- lo -- mon's de -- sire.
}

verseThree = \lyricmode {
  \vThree
  Jes -- se's Branch re -- ceived its Flow -- er,
  Moth -- er of Em -- man -- u -- el,
  Por -- tal sealed and mys -- tic Bow -- er
  Prom -- ised by E -- zek -- i -- el,
  Rock of Dan -- iel's dream, whose pow -- er
  Smote, and low, the im -- age fell!
}

verseFour = \lyricmode {
  \vFour
  See in flesh so great a won -- der
  By the power of God or -- dained,-
  Him, whose feet all worlds lay un -- der,
  In a Vir -- gin's womb con -- tained;-
  So on earth, her bonds to sun -- der, 
  Right -- eous -- ness from heav'n hath rained.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
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
      % \new Lyrics \lyricsto soprano \verseFive
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
    \include "hymn_layout.ly"
  }
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}

%%%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 16)
#(define output-suffix "Hymnal")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  %\top
  \score { %\transpose c d
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
      \new Lyrics \lyricsto soprano \verseFour
      % \new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \include "hymn_hymnal_layout.ly"
  }    
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}
%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  %  \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
      % \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}
