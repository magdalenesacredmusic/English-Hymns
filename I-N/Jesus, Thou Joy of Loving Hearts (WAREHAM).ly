%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/
%}

\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Jesu dulcis memoria," St. Bernard, 11th cent.; Tr. Ray Palmer (1808-87), 1858
      }
      \wordwrap {
        Music: WAREHAM  LM, Adapt. from William Knapp 1698-1768; Harm. \italic "The English Hymnal," 1906
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {WAREHAM  LM}
    }
    \right-column{
      \line {adapt. from W. Knapp; harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Jesu dulcis memoria"}
      \line {St. Bernard, 11th cent.; tr. Ray Palmer, 1858}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  bf4 |
  bf( a) g |
  f2 bf4 |
  c( bf) a |
  bf2 \bar ""

  c4 |
  d( c) bf |
  a( bf) c |
  bf( a) g |
  f2 \bar ""

  f4 |
  g( f) g8[ a] |
  bf2 a4 |
  bf2 c4 |
  d2 \bar ""

  c8[ d] |
  ef4( d) c |
  bf( a) bf |
  c( bf) a |
  bf2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  d2 ef4 |
  f2 d4 |
  g( f) f |
  f2
  f4 |
  f2 f8[ e] |
  f2 f4 |
  f2 e4 |
  f2
  f4 |
  ef4( f) ef |
  f2 f4 |
  d2 g4 |
  fs2

  g8[ f!] |
  ef4 ( f) g |
  g( fs) g |
  g( f) f |
  f2
}

tenor = \relative c' {
  \global
  \partial 4
  bf4 |
  f2 a4 |
  bf2 bf4 |
  ef4( d) c |
  d2
  a4 |
  bf( c) d8[ bf] |
  c4( d) c |
  d( c) c8[ bf] |
  a2
  bf4 |
  bf2 ef4 |
  d2 c4 |
  bf( a) g |
  a2

  g8[ b] |
  c4( b) c |
  d2 d4 |
  ef( d) c |
  d2
}

bass = \relative c {
  \global
  \partial 4
  bf4 |
  bf2 c4 |
  d2 g4 |
  ef( f) f, |
  bf2
  f'4 |
  bf( a) g |
  f( d) a |
  bf( c) c |
  f2
  d4 |
  ef( d) c |
  bf( d) f |
  g( f) ef |
  d2
  ef8[ d] |
  c4( d) ef |
  g( d) g |
  ef( f) f |
  bf,2
}

verseOne = \lyricmode {
  \vOne
  Je -- sus, Thou joy of lov -- ing hearts!
  Thou Fount of life! Thou Light of men!
  From the best bliss that earth im -- parts
  We turn un -- filled to Thee a -- gain.
}

verseTwo = \lyricmode {
  \vTwo
  Thy truth un -- changed hath ev -- er stood;
  Thou sav -- est those that on Thee call;
  To them that seek Thee, Thou art good,
  To them that find Thee, all in all.
}

verseThree = \lyricmode {
  \vThree
  We taste Thee, O Thou liv -- ing Bread!
  And long to feast up -- on Thee still;
  We drink of Thee, the Foun -- tain Head,
  And thirst from Thee our souls to fill.
}

verseFour = \lyricmode {
  \vFour
  Our rest -- less spi -- rits yearn for Thee,
  Wher -- e'er our change -- ful lot is cast;
  Glad when Thy gra -- cious smile we see,
  Blest when our faith can hold Thee fast.
}


verseFive = \lyricmode {
  \vFive
  O Je -- sus, ev -- er with us stay!
  Make all our mo -- ments calm and bright!
  Chase the dark night of sin a -- way!
  Shed o'er the world Thy ho -- ly light!
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