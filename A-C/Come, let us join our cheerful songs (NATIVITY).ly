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
      \line {NATIVITY  CM}
    }
    \column{
      \line {Hanry Lahee (1826-1912)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Isaac Watts (1674-1748)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d4 d8[ d] f4 f |
  bf bf d4. c8 |
  bf4 g g c |
  bf2( a4) \bar "" \break
  
    f4 |
    g a bf f |
    g a bf c |
    d d c c |
    bf1

\bar "|."
}

alto = \relative c' {
  \global
  bf4 bf8[ bf] c4 c |
  d d d4. d8 |
  d4 d ef g |
  f2. 
  
  f4 |
  ef ef f f |
  f ef d f |
  f f g f8[ ef] |
  d1
}

tenor = \relative c {
  \global
  f4 f8[ f] f4 c' |
  bf bf a4. a8 |
  bf 4 bf bf ef |
  d2( c4) 
  
    bf4 |
    bf c f, d' |
    bf c bf a |
    bf bf bf a | 
    bf1
}

bass = \relative c {
  \global
 bf4 bf8[ bf] a4 a' |
 g4 g fs4. fs8 |
 g4 g ef ef |
 f2. 
 
   d4 |
   ef c d bf |
   ef c g' f |
   bf d, ef f |
   bf,1
}

verseOne = \lyricmode {
  \set stanza = "1."
  Come, let us join our cheer -- ful songs
  With an -- gels round the throne;
  Ten thou -- sand thou -- sand are their tongues,
  But all their joys are one.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  'Wor -- thy the Lamb that died,' they cry,
  'To be ex -- alt -- ed thus;'
  'Wor -- thy the Lamb', our lips re -- ply,
  'For he was slain for us.'
}

verseThree = \lyricmode {
  \set stanza = "3."
  Je -- sus is wor -- thy to re -- ceive
  Ho -- nor and power di -- vine;
  And bless -- ings more than we can give
  Be, Lord, for ev -- er thine.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Let all cre -- a -- tion join in one
  To bless the sa -- cred name
  Of him that sits up -- on the throne,
  And to a -- dore the Lamb.
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
  \bottom
}
