%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: John Byrom (1692-1763), 1773
      }
      \wordwrap {
        Music: ECCLES 66 66, Bertram Luard-Selby (1853-1918), 1904
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {ECCLES  66 66}
    }
    \column{
      \line {Bertram Luard-Selby, 1904}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {John Byrom, 1773}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  e4 |
  ds e fs fs |
  g2. g4 |
  fs g a a |
  b2. \bar "" \break  b4 |
  a d c b |
  a c b a8[ g] |
  g2. fs4 |
  g2.

\bar "|."
}

alto = \relative c' {
  \global
  \partial 4 
  c4 |
  b b d d |
  d2. e4 |
  d c a d |
  d2. d4 |
  d a' g f |
  e fs8[ e] ds4 e |
  d2 d2 |
  d2.
}

tenor = \relative c' {
  \global
  a4 |
  fs g a a |
  b2. c4 |
  a g g fs |
  g2. g4 |
  a4. b8 c4 gs |
  a4. g8 fs4 e8[ c'] |
  b4( a8[ g]) a2 |
  b2.
}

bass = \relative c {
  \global
 a4 |
 b e d d |
 g,2. c4 |
 d e d d |
 g2. g4 |
 fs f e d |
  c a b c |
  d2 d |
  g,2. 
}

verseOne = \lyricmode {
  \vOne
  My spir -- it longs for thee
  With -- in my trou -- bled breast,
  Though I un -- wor -- thy be
  Of so di -- vine a Guest.
}

verseTwo = \lyricmode {
  \vTwo
Of so di -- vine a Guest
  Un -- wor -- thy though I be,
  Yet has my heart no rest,
  Un -- less it come from thee.
}

verseThree = \lyricmode {
  \vThree
Un -- less it come from thee,
  In vain I look a -- round;
  In all that I can see
  No rest is to be found.
}

verseFour = \lyricmode {
  \vFour
 No rest is to be found
  But in thy bless -- ed love:
  O let my wish be crowned,
  And send it from a -- bove.
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
    %  \new Lyrics \lyricsto soprano \verseFive
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
  % \bottom
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
    %  \new Lyrics \lyricsto soprano \verseFive
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
    \include "hymn_hymnal_layout.ly"
  }    
  \refs
  %\bottom
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
      \new Lyrics \lyricsto "tune" { \verseOne }
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
  % \bottom
  \refs
}
