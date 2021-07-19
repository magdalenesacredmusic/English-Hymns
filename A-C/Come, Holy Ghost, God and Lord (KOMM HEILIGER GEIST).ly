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
    \right-column {
      \line {KOMM, HEILIGER GEIST, HERRE GOTT  }
      \line {L M D with alleluias}
    }
    \right-column{
      \line {melody, 15th cent.}
      \line {\italic "Erfurt Gesangbuch," 1524}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Komm, Heiliger Geist, Herre Gott"}
      \line {Martin Luther 1524; tr. Catherine Winkworth and others}
    }
  } 
}

global = {
  \key f \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global

  c4 \bar "|"
  d c a( c) g2 a4( b) \bar "|"
  c2 b4\rest c4 \bar "|"
  d c g \once \override Voice.Accidental.stencil = ##f bf a g \bar "|"
  f2 b4\rest f4 \bar "|"
  g bf a8[ bf] c4 g f8[ d] \bar "|"
  c2 b'4\rest c,4 \bar "|"
  f g a8( c4) bf8 a4 g \bar "|"
  a2 b4\rest \bar "||"

  a4 \bar "|"
  c d c g a b \bar "|"
  c2 b4\rest c \bar "|"
  d c g \once \override Voice.Accidental.stencil = ##f bf a g \bar "|"
  f2 b4\rest f4 \bar "|"
  g bf a8[ bf] c4 g f8[ d] \bar "|"
  c2 b'4\rest c,4 \bar "|"
  f g a8( c4) bf8 a4 g d e \bar "|"
  f2 b4\rest g8 g \bar "|"
  a4( f) d g8 g a4( g) \bar "|"
  f2 b4\rest \bar "|."
}

alto = \relative c' {
  \global
  f4 |
  f f f f g2 f |
  e s4 f4 |
  f f d e f e |
  c2 s4 d4 |
  d e f f e a, |
  c2 s4 c |
  d e f4. f8 f4 d |
  e2 s4 |

  f4 |
  f f f g f f |
  e2 s4 f |
  f f d e f e |
  c2 s4 d4 |
  d e f f e a, |
  c2 s4 c |
  d e f4. f8 f4 d bf c |
  c2 s4 c8 c8 |
  d2 d4 c8 c c4. bf8 |
  a2 s4
}

tenor = \relative c' {
  \global
  a4 |
  bf a c a c2 f, |
  g d4\rest a'4 |
  bf a bf bf c c |
  a2 d,4\rest a'4 |
  bf bf c c c f, |
  g2 d4\rest a'4 |
  a c c4. c8 c4 d |
  cs2 d,4\rest |

  c'4 |
  a bf a c f, f |
  g2 d4\rest a'4 |
  bf a bf bf c c |
  a2 d,4\rest a' |
  bf bf c c c f, |
  g2 d4\rest a'4 |
  a c c4. c8 c4 bf g4 g |
  a2 d,4\rest g8 g |
  f4( a) bf e,8 e f4( e) |
  f2 d4\rest
}

bass = \relative c {
  \global
  f4 |
  f f f f e2 d |
  c s4 f4 |
  f f g g f c |
  f2 s4 d |
  g g f a c, d |
  e2 s4 |
  f d c f8( a4) g8 f4 bf |
  a2 s4 |

  f4 |
  f4 f f e d d |
  c2 s4 f |
  f f g g f c |
  f2 s4 d |
  g g f a c, d |
  e2 s4 f4 |
  d c f8( a4) g8 f4 g g c, |
  f2 s4 e8 e |
  f2 bf,4 c8 c a8[( bf] c4) |
  f,2 s4
}

verseOne = \lyricmode {
  \set stanza = "1."
  Come, Ho -- ly Ghost, God and Lord!
  Be all Thy grac -- es now out -- poured
  On each be -- liev -- er’s mind and heart;
  Thy fer -- vent love to them im -- part.
  Lord, by the bright -- ness of Thy light
  Thou in the faith dost men u -- nite
  Of ev -- 'ry land and ev -- 'ry tongue;
  This to Thy praise, O Lord, our God, be sung.
  Hal -- le -- lu -- jah! Hal -- le -- lu -- jah!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Thou ho -- ly Light, Guide di -- vine,
  Oh, cause the Word of Life to shine!
  Teach us to know our God a -- right
  And call Him Fa -- ther with de -- light.
  From ev -- 'ry er -- ror keep us free;
  Let none but Christ our Mas -- ter be
  That we in liv -- ing faith a -- bide,
  In Him, our Lord, with all our might con -- fide.
  Hal -- le -- lu -- jah! Hal -- le -- lu -- jah!
}

verseThree = \lyricmode {
  \set stanza = "3."
  Thou ho -- ly Fire, Com -- fort true,
  Grant us the will Thy work to do
  And in Thy ser -- vice to a -- bide;
  Let tri -- als turn us not a -- side.
  Lord, by Thy power pre -- pare each heart
  And to our weak -- ness strength im -- part
  That brave -- ly here we may con -- tend,
  Through life and death to Thee, our Lord, as -- cend.
  Hal -- le -- lu -- jah! Hal -- le -- lu -- jah!
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
