\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Richard Rolle (c. 1290-1349)
      }
      \wordwrap {
        Music: WORD OF FIRE, LM, Noel Jones (1947- )
      }
    }
  }
}


top = \markup {
  \fill-line {
    \column {
      \line {WORD OF FIRE, LM}
    }
    \right-column{
      \line {Noel Jones (1947- )}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Richard Rolle (c. 1290-1349)}
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

melody = \relative c' {
  \global
  c2 c4 d 
  f2 e4( d) 
  e4 f g2 
  a2 g4 f
  bf a f g 
  e1
  
  d2 d4 c 
  f2 f4( e) 
  a g f2
  f2 e4 f
  d e d c 
  c1 \bar "|."
}

alto = \relative c' {
  \global
  g2 g4 b
  c2 c4( b) 
  c d d2
  cs2 e4 d
  g4 f d cs
  cs1
  
  a2 a4 g 
  c2 c
  cs4 e d2
  c c4 c 
  bf a bf bf 
  g1
}

tenor = \relative c {
  \global
  e2 e4 f
  f2 f
  g4 g g2
  e2 a4 a 
  d c g g 
  g1
  
  f2 f4 e
  a2 a4( g)
  g bf bf( a)
  a2 g4 a 
  f f f f
  e1
}

bass = \relative c {
  \global
 c2 a4 g 
 a2 g
 c4 b bf2
 a cs4 d
 g, a bf bf 
 a1
 
 d2 d4 d 
 c2 bf
 a4 cs d2
 c2 a4 a
 bf f g g 
 c1
}

verseOne = \lyricmode {
  \vOneL
  Lord Je -- sus, when I think of thee,
  And look up -- on thy cross a -- right,
  Thy bo -- dy stained with blood I see,
  Lord, pierce my heart with that sad sight!
}

verseTwo = \lyricmode {
  \vTwoL
  Je -- sus, true love I owe to thee
  Who on the cross didst show that tide,
  The crown of thorns, the sharp nails three,
  The cru -- el spear that pierced thy side.
}

verseThree = \lyricmode {
  \vThreeL
  Je -- sus, love made thy tears to fall,
  'Twas love that made thy blood to flow,
  For love was scourged adn smit -- ten all,
  For love thy life thou didst for -- go.
}

verseFour = \lyricmode {
  \vFourL
  Ma -- ry, I pray, as thou art free,
  A part of this thy grief I'll bear,
  That I may sor -- row here with thee,
  And bliss with thee here -- af -- ter share!
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
  \score { %\transpose c bf,
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
  \score { %\transpose c bf,
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
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}