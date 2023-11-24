\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Anima Christi," Anon., 14th cent.; Tr. Traditional
      }
      \wordwrap {
        Music: DOBICI  76 76 D, Lorenzo Dobici; Arr. Nicola A. Montani (1880-1948), \italic "The Saint Gregory Hymnal," 1920
      }
    }
  }
}



global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a2 bf4 a |
  g2 g |
  g4 a f g |
  a1 |
  c2 d4 c |
  bf2 a |
  a4 g f a |
  g1 |
  g2 a4 g |
  f2 f |
  a4 a bf a |
  g1 |
  d'2 c4 bf |
  bf2 a |
  g4 a bf g |
  f1 \bar "|."
}

alto = \relative c' {
  \global
  f2 f4 f |
  d2 d |
  c4 e d e |
  f1 |
  f2 f4 f |
  f( e) f2 |
  f4 f f f |
  f2( e) |
  e e4 e |
  e( d) d2 |
  ef4 ef d c |
  bf2( d) |
  e2 e4 e |
  f2 ef |
  d4 c bf bf |
  a1
}

tenor = \relative c' {
  \global
  c2 d4 c |
  bf2 bf |
  c4 c bf bf |
  a2( c) |
  c f4 c |
  d( c) c2 |
  b4 b a b |
  c1 |
  d2 cs4 a |
  a2 a |
  a4 g fs fs |
  g2( bf2) |
  bf a4 g |
  f2 fs |
  g4 fs g8[ f] e4 |
  f1
}

bass = \relative c {
  \global
  f2 f4 f |
  f2 f |
  e4 c c c |
  f1 |
  a2 bf4 a |
  g2 f |
  d4 d d g, |
  c1 |
  bf2 a4 cs |
  d2 d |
  c4 c d d |
  g,2( g') |
  g c,4 cs |
  d2 c |
  bf4 a g c |
  f1
}


verseOne = \lyricmode {
  \vOne
  Soul of my Sa -- vior sanc -- ti -- fy my breast,
  Bod -- y of Christ, be Thou my sav -- ing guest,
  Blood of my Sa -- vior, bathe me in Thy tide,
  Wash me, ye wa -- ters flow -- ing from His side.
}

verseTwo = \lyricmode {
  \vTwo
  Strength and pro -- tec -- tion may thy pas -- sion be,
  O bles -- sèd Je -- sus, hear and an -- swer me;
  Deep in Thy wounds, Lord, hide and shel -- ter me,
  So shall I nev -- er, nev -- er part from Thee.
}

verseThree = \lyricmode {
  \vThree
  Guard and de -- fend me from the foe ma -- lign,
  In death's dread mo -- ments make me on -- ly Thine;
  Call me and bid me come to Thee on high
  Where I may praise Thee with Thy saints for aye.
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
      %\new Lyrics \lyricsto soprano \verseFour
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
      %\new Lyrics \lyricsto soprano \verseFour
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
      %\new Lyrics \lyricsto "tune" { \verseFour }
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
