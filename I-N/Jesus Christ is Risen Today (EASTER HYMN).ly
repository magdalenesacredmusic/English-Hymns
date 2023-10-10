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
        Text: Based on \italic "Surrexit Christus hodie," 14th cent., Traditional text, various authors
      }
      \wordwrap {
        Music: EASTER HYMN, 77 77 with Alleluias, Alt. from \italic "Lyra Davidica," 1708
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {EASTER HYMN 7 7 7 7 with Alleluias}
    }
    \right-column{
      \line {alt. from \italic "Lyra Davidica," 1708}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Based on \italic "Surrexit Christus hodie," 14th cent.}
      \line {traditional text, various authors }
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
  c4 e g c, |
  f a a( g) |
  e8[( f g c,] f4) e8[ f] |
  e4( d) c2 | \break

  f4 g a g |
  f e e( d) |
  e8[( f g c,] f4) e8[ f] |
  e4( d) c2 | \break

  b'4 c d g, |
  c d e2 |
  b8[( c d g,] c4) b8[ c] |
  b4( a) g2 | \break

  g8[ a] b[ g] c4 e, |
  f a a( g) |
  c8[( b c g] a[ b]) c[ d] |
  c4( b) c2 \bar "|."
}

melodya = \relative c' {
  \global
  c4 e g c, |
  f a a( g) |
  e8[( f g c,] f4) e8[ f] |
  e4( d) c2 | %\break

  f4 g a g |
  f e e( d) |
  e8[( f g c,] f4) e8[ f] |
  e4( d) c2 | %\break

  b'4 c d g, |
  c d e2 |
  b8[( c d g,] c4) b8[ c] |
  b4( a) g2 | %\break

  g8[ a] b[ g] c4 e, |
  f a a( g) |
  c8[( b c g] a[ b]) c[ d] |
  c4( b) c2 \bar "|."
}

alto = \relative c' {
  \global
  c4 c d c |
  c f f( e) |
  c2~( c8[ b]) c4 |
  c( b) c2 |

  c4 c c c |
  c8[ b] c4 c( b) |
  c2~( c8[ b]) c4 |
  c( b) c2 |

  g'4. fs8 g4 g |
  g f! e2 |
  g2~( g8[ fs]) g4 |
  g( fs) g2 |

  b,8[ c] d[ b] c4 c |
  c f f( e) |
  e8[( f g e] f4) e8[ f] |
  e4( g8[ f]) e2
}

tenor = \relative c {
  \global
  e4 g g e |
  c' c c2 |
  g( a8[ f]) g[ f] |
  g4.( f8) e2 |

  f4 e f g |
  a8[ f] g4 g2 |
  g( a8[ f]) g[ f] |
  g4.( f8) e2 |

  d'4 c b b |
  c4. b8 c2 |
  d2~ d4 d8[ c] |
  d4.( c8) b2 |

  g4 g g c8[ b] |
  c4 c c2 |
  g4.( c8~ c[ d]) c[ a] |
  g2 g
}

bass = \relative c {
  \global
  c4 c b c |
  a' f c2 |
  c8[( d] e4 d) c8[ a] |
  g2 c |

  a4 c f e |
  d c g2 |
  c8[( d] e4 d) c8[ a] |
  g2 c |

  g4 a b g'8[ f!] |
  e4 d c2 |
  g'8[( a] b4 a) g8[ e] |
  d2 g, |

  g'4. f8 e4 c'8[ b] |
  a4 f c2 |
  c8[( d e c] f[ d]) e[ f] |
  g4( g,) c2
}

verseOne = \lyricmode {
  \vOneL
  Je -- sus Christ is ris'n to -- day, Al -- le -- lu -- ia!
  Our tri -- um -- phant ho -- ly day; Al -- le -- lu -- ia!
  Who did once, up -- on the cross, Al -- le -- lu -- ia!
  Suf -- fer to re -- deem our loss. Al -- le -- lu -- ia!
}

verseTwo = \lyricmode {
  \vTwoL
  Hymns of praise then let us sing Al -- le -- lu -- ia!
  Un -- to Christ our heav'n -- ly King: Al -- le -- lu -- ia!
  Who en -- dured the cross and grave, Al -- le -- lu -- ia!
  Sin -- ners to re -- deem and save. Al -- le -- lu -- ia!
}

verseThree = \lyricmode {
  \vThreeL
  But the pains which he en -- dured Al -- le -- lu -- ia!
  Our sal -- va -- tion hath pro -- cured: Al -- le -- lu -- ia!
  Now a -- bove the sky he's King, Al -- le -- lu -- ia!
  Where the an -- gels ev -- er sing. Al -- le -- lu -- ia!
}

verseFour = \lyricmode {
  \vFourL
  Sing we to our God a -- bove— Al -- le -- lu -- ia!
  Praise e -- ter -- nal as his love; Al -- le -- lu -- ia!
  Praise him all ye heav'n -- ly host, Al -- le -- lu -- ia!
  Fa -- ther, Son, and Ho -- ly Ghost. Al -- le -- lu -- ia!
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