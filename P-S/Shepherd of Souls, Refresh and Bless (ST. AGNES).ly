\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Vs. 1-3, Anon.; vs. 4,5 James Montgomery (1771-1854), 1825
      }
      \wordwrap {
        Music: ST. AGNES  CM, John Bacchus Dykes (1823-76), 1866
      }
    }
  }
}


global = {
  \key g \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  b4 b b |
  a2 b4 |
  c2 fs,4 |
  g2. |
  d4 d d |
  b'2 a4 |
  a2. \bar ""

  c4 c b |
  a2 g4 |
  fs2 e4 |
  d2. |
  d4 e g |
  b2 a4 |
  g2. \bar "|."
}

alto = \relative c' {
  \global
  d4 d d |
  e2 d4 |
  c( e) d |
  d2. |
  d4 d d |
  d2 cs4 |
  d2. |

  c4 e d |
  c2 cs4 |
  d2 cs4 |
  d2. |
  d4 d c |
  b2 c4 |
  b2.
}

tenor = \relative c' {
  \global
  b4 b g |
  c2 g4 |
  a2 a4 |
  b2. |
  c4 b a |
  g2 g4 |
  fs2. |

  e4 fs gs |
  a2 a4 |
  a2 g4 |
  fs2. |
  g4 g g |
  g2 fs4 |
  g2.
}

bass = \relative c' {
  \global
  g4 g b, |
  c2 b4 |
  a2 d4 |
  g2. |
  a4 g fs |
  g2 e4 |
  d2. |

  a4 a a |
  a2 a4 |
  d2 d4 |
  d2( c4) |
  b4 c e |
  d2 d4 |
  g,2.
}

verseOne = \lyricmode {
  \vOne
  Shep -- herd of souls, re -- fresch and bless
  Thy cho -- sen pil -- grim flock
  With man -- na in the wil -- der -- ness,
  With wa -- ter from the rock.
}

verseTwo = \lyricmode {
  \vTwo
  Hun -- gry and thir -- sty, faint and weak,
  As Thou when here be -- low,
  Our souls the joys ce -- les -- tial seek
  Which from Thy sor -- rows flow.
}

verseThree = \lyricmode {
  \vThree
  We would not live by bread a -- lone,
  But by that word of grace,
  In strength of which we tra -- vel on
  To our a -- bid -- ing -- place.
}

verseFour = \lyricmode {
  \vFour
  Be known to us in break -- ing bread,
  But do not then de -- part;
  Sa -- viour, a -- bide with us, and spread
  Thy ta -- ble in our heart.
}

verseFive = \lyricmode {
  \vFive
  There sup with us in love Di -- vine;
  Thy Bo -- dy and Thy Blood,
  That liv -- ing bread, that heav -- 'nly wine,
  Be our im -- mor -- tal food.
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
      \new Lyrics \lyricsto soprano \verseFive
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
      \new Lyrics \lyricsto "tune" { \verseFive}
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
