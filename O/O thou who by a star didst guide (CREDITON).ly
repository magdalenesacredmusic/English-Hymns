\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {CREDITON   CM}
    }
    \right-column{
      \line {Adapted from Thomas Clark (1775-1859)}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {John Mason Neale (1818-66)}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4 
  g |
  c b c g |
  a g8[ f] e4 g |
  a8[ b] c4 f, e |
  d2.  \bar "" \break
  
  g4 |
  g a8[ b] c4 e |
  d c b g |
  a8[ b] c4 d b |
  c2. \bar "|."
}

alto = \relative c' {
  \global
  e4 |
  e4 f g e |
  f e8[ d] c4 c |
  c c b c |
  b2. 
  
  d4 |
  g f e g |
  f e d g |
  f g f d |
  e2.
}

tenor = \relative c' {
  \global
  g4 |
  g g g c |
  c b c c8[ b] |
  a4 g g g |
  g2.
  
  b4 |
  c f, g g |
  g g b c |
  c8[ d] c4 a g |
  g2.
}

bass = \relative c {
  \global
 c4 |
 c d e c |
f g c, e |
  f e d c |
  g2.
  
  g'8[ f] |
  e4 d c c |
  b c g' e |
  f e f g |
  c,2.
}

verseOne = \lyricmode {
  \vOne
  O thou, who by a star didst guide
  The wise men on their way,
  Un -- til it came and stood be -- side
  The place where Je -- sus lay;
}

verseTwo = \lyricmode {
  \vTwo
  Al -- though by stars thou dost not lead
  Thy serv -- ants now be -- low,
  Thy Ho -- ly Spir -- it, when they need,
  Will show them how to go.
}

verseThree = \lyricmode {
  \vThree
  As yet we know thee but in part,
  But still we trust thy word
  That bless -- èd are the pure in heart,
  For they shall see the Lord.
}

verseFour = \lyricmode {
  \vFour
  O Sa -- vior, give us then thy grace
  To make us pure in heart,
  That we may see thee, face to face,
  Here -- af -- ter as thou art.
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
