\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Based on Augustine of Hippo, 5th Cent.; F.B.P., 16th cent., in \italic "Song of Mary, London," 1601
      }
      \wordwrap {
        Music: LAND OF REST, 86 86, Traditional American Melody; Harm. Annabel Morris Buchanan (1889-1983), 1938
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {LAND OF REST.  86 86}
    }
    \right-column{
      \line {Traditional American Melody}
      \line {Harm. Annabel Morris Buchanan (1889-1983), 1938}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Based on Augustine of Hippo, 5th Cent.}
      \line {F.B.P., 16th cent., in \italic "Song of Mary, London," 1601}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 6/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  c4 |
  f2 f4 g( a) c |
  f,2 f4 d( c) c |
  f2 f4 g( a) c |
  c2.~ c2 \bar "" \break
    c4 |
  d2 c4 a4.( bf8) c4 |
  f,2 f4 d( c) c |
  f2 a4 bf( a) g |
  f2.~ f2 \bar "|."
}

melodya = \relative c' {
  \global
  \partial 4
  c4 |
  f2 f4 g( a) c |
  f,2 f4 d( c) \bar "" \break c |
  f2 f4 g( a) c |
  c2.~ c2 \bar "" \break
    c4 |
  d2 c4 a4.( bf8) c4 |
  f,2 f4 d( c) \bar "" \break c |
  f2 a4 bf( a) g |
  f2.~ f2 \bar "|."
}

alto = \relative c' {
  \global
  c4 |
  c2 c4 e( f) c |
  d2 d4 d( c) c |
  d2 d4 e2 g4 |
  f2.( e2) e4 |
  f2 c4 d( f) e |
  d2 bf4 a2 bf4 |
  a( c) f f2 c4 |
  c2.~ c2
}

tenor = \relative c' {
  \global
  g4 |
  a2 a4 c2 a4
  bf2 bf4 a2 g4
  a( g) a c2 e,4
  f2.( a2) a4 
  a( bf) g a( d) c 
  bf( f) f f2 g4 
  a2 c4 d( c) bf 
  bf2.( a2)
}

bass = \relative c {
  \global
 f4
 f2 f4 f2 f4 
 f2 f4 f2 e4
 d2 d4 c2 bf4 
 a2.~ a2 a4
 d2 e4 f2 a,4
 bf2 d4 f2 f4
 f2 f4 c2 c4 
 f2.~ f2
}

verseOne = \lyricmode {
  \vOne
  Je -- ru -- sa -- lem, my hap -- py home,
  When shall I come to thee?
  When shall my sor -- rows have an end?
  Thy joys, when shall I see?
}

verseTwo = \lyricmode {
  \vTwo
  O hap -- py har -- bor of the saints,
  O sweet and pleas -- ant soil!
  In you no sor -- row may be found,
  No grief, no care, no toil.
}

verseThree = \lyricmode {
  \vThree
  Your gar -- dens and your gal -- lant walks 
  Con -- tin -- ual -- ly are green;
  There grow such sweet and pleas -- ant flow'rs
  As no -- where else are seen.
}

verseFour = \lyricmode {
  \vFour
  There, trees for -- ev -- er -- more bear fruit
  And ev -- er -- more do spring,
  There, ev -- er -- more the an -- gels sit
  And ev -- er -- more do sing.
}

verseFive = \lyricmode {
  \vFive
  Je -- ru -- sa -- lem, Je -- ru -- sa -- lem,
  God grant that I may see
  Your end -- less joy, and of the same
  Par -- tak -- er ev -- er be!
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
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}