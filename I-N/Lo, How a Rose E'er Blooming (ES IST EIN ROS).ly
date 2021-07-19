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
      \line {ES IST EIN' ROS' ENTSPRUNGEN 76 76 676}
    }
    \right-column{
      \line {German, harm. Michael Praetorius}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Es ist ein Reis entsprungen,"}
      \line {German, st. 1-2 tr. Theodore Baker, 1894, st. 2-3 tr. H.R. Kraugh}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \cadenzaOn
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  c2 \bar "|"
  c4 c d c \bar "|"
  c2 a bf \bar "|"
  a4 g2 f e4 \bar "|"
  f2. \bar "|" \break

  c'2 \bar "|"
  c4 c d c \bar "|"
  c2 a bf \bar "|"
  a4 g2 f e4 \bar "|"
  f2. \bar "|" \break

  a4 \bar "|"
  g e f d \bar "|"
  c2. \bar "|"

  c'4 \bar "|"
  c c d c \bar "|"
  c2 a bf \bar "|"
  a4 g2 f e4 \bar "|"
  f2. \bar "|."
}

melodya = \relative c'' {
  \global
  c2 \bar "|"
  c4 c d c \bar "|"
  c2 a bf \bar "|"
  a4 g2 f e4 \bar "|"
  f2. \bar "|" %\break

  c'2 \bar "|"
  c4 c d c \bar "|"
  c2 a bf \bar "|"
  a4 g2 f e4 \bar "|"
  f2. \bar "|" %\break

  a4 \bar "|"
  g e f d \bar "|"
  c2. \bar "|"

  c'4 \bar "|"
  c c d c \bar "|"
  c2 a bf \bar "|"
  a4 g2 f e4 \bar "|"
  f2. \bar "|."
} 
alto = \relative c'' {
  \global
  a2
  a4 f f f
  e2 d d
  c d4. a8 c2
  c2.

  a'2
  a4 f f f
  e2 d d
  c d4. a8 c2
  c2.

  f4
  d c c b
  c8[( d] e2)

  e4
  g f f f
  e2 d d
  f4 d( e) f( g) c,
  c2.
}

tenor = \relative c' {
  \global
  c2
  c4 a bf a
  g2 f f
  a4( c) bf a2 g4
  a2.

  c2
  c4 a bf a
  g2 f f
  a4( c) bf a2 g4
  a2.

  c4
  bf a a g
  g2.

  g4
  g a bf a
  g2 fs g
  c4 bf a2 g
  a2.
}

bass = \relative c {
  \global
  f2
  f4 f bf f
  c2 d bf
  f'4 e d2 c
  f2.

  f2
  f4 f bf f
  c2 d bf
  f'4 e d2 c
  f2.

  f4
  g a f g
  c,2.

  c4
  e f bf, f'
  c2 d g,
  a4 bf c2 c << {\stemDown \override Stem #'length = #4.0  f2.} \\ {\teeny \override Stem #'length = #5.6 f,2. } >>

}

verseOne = \lyricmode {
  \set stanza = "1."
  Lo, how a rose e'er bloom -- ing,
  From tend -- er stem hath sprung!
  From Jes -- se’s lin -- eage com -- ing,
  As men of old have sung.

  It came, a flow' -- ret bright,
  A -- mid the cold of win -- ter
  When half spent was the night
}

verseTwo = \lyricmode {
  \set stanza = "2."
  I -- sa -- iah 'twas fore -- told it,
  The Rose I have in mind
  With Ma -- ry we be -- hold it,
  The Vir -- gin mo -- ther kind

  To show God's love a -- right,
  She bore to men a Sa -- vior
  When half spent was the night
}

%{ verseThree = \lyricmode {
	\set stanza = "3."
	The shep -- herds heard the sto -- ry
	Pro -- claimed by an -- gels bright,
	How Christ, the Lord of Glo -- ry
	Was born on earth this night.

		To Beth -- le -- hem they sped
		And in the man -- ger found him,
		As an -- gel her -- alds said.
} %}

%% or v. 4
verseFour = \lyricmode {
  \set stanza = "3."
  This Flow'r, whose fra -- grance ten -- der
  With sweet -- ness fills the air,
  Dis -- pels with glo -- rious splen -- dor
  The dark -- ness ev' -- ry -- where;

  True man, yet ve -- ry God,
  From sin and death he saves us,
  And light -- ens ev' -- ry load.
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
      %\new Lyrics  \lyricsto soprano \verseThree
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
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
     % \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

