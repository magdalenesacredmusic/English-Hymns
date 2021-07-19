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
          \line {GLORIA 7 7 7 7 with refrain}
      }
      \column{
      \line {French, harm. Edward Shippen Barnes}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {French Carol; tr. James Chadwick, 1862}
   }
  } 
}

\header {
  tagline = ""
}


global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a4 a a c | \noBreak
  c4. bf8 a2 | \noBreak
  a4 g a c | \noBreak
  a4. g8 f2 \bar "|" \break

  a4 a a c | \noBreak
  c4. bf8 a2 | \noBreak
  a4 g a c | \noBreak
  a4. g8 f2 \bar "||" \break

  c'2(^\markup {Refrain} d8[ c bf a] |
  bf2 c8[ bf a g] |
  a2 bf8[ a g f] |
  g4.) c,8 c2 |
  f4 g a bf |
  a2 g2 \bar "|" \break

  c2( d8[ c bf a] |
  bf2 c8[ bf a g] |
  a2 bf8[ a g f] |
  g4.) c,8 c2 |
  f4 g a bf |
  a2( g2)
  f1 \bar "|."
}

melodya = \relative c'' {
  \global
  a4 a a c | 
  c4. bf8 a2 |
  a4 g a c | 
  a4. g8 f2 \bar "|" 

  a4 a a c | %\noBreak
  c4. bf8 a2 | 
  a4 g a c | %\noBreak
  a4. g8 f2 \bar "||" \break

  c'2(^\markup {Refrain} d8[ c bf a] |
  bf2 c8[ bf a g] |
  a2 bf8[ a g f] |
  g4.) c,8 c2 |
  f4 g a bf |
  a2 g2 \bar "|" \break

  c2( d8[ c bf a] |
  bf2 c8[ bf a g] |
  a2 bf8[ a g f] |
  g4.) c,8 c2 |
  f4 g a bf |
  a2( g2)
  f1 \bar "|."
}

alto = \relative c' {
  \global
  f4 f f f |
  g e f2 |
  f4 e f f |
  f e f2 |

  f4 f e f |
  f g f2 |
  e4 d f g |
  f e f2 |

  f4( a8[ g] f2~ |
  f4 g8[ f] e2~ |
  e4 f8[ e] d2 |
  c4.) c8 c2 |
  c4 e f f |
  f2 e2 |

  f4( a8[ g] f2~ |
  f4 g8[ f] e2~ |
  e4 f8[ e] d2 |
  c4.) c8 c2 |
  c4 e f f |
  f2 e2 |
  c1 \bar "|."
}

tenor = \relative c' {
  \global
  c4 c c a |
  g c c2 |
  c4 c c c |
  c4. bf8 a2 |

  c4 c c a |
  a c c2 |
  c4 d d c |
  c4. bf8 a2 |

  a2( d~ |
  d c~ |
  c bf4. a8 |
  g4) f e2 |
  f4 c' c d |
  c2 c |

  a2( d~ |
  d c~ |
  c bf4. a8 |
  g4) f e2 |
  f4 c' c d |
  c2.( bf4)
  a1 \bar "|."
}

bass = \relative c {
  \global
  f4 f f f |
  e c f2 |
  f4 c f a |
  c4 c, f2 |

  f4 f a f |
  d e f2 |
  a,4 bf d e |
  f c f2 |

  f2( d4 f |
  g2 c,4 e |
  f2 bf,4 d |
  e) d c( bf) |
  a c f bf, |
  c2 c |

  f2( d4 f |
  g2 c,4 e |
  f2 bf,4 d |
  e) d c( bf) |
  a c f bf, |
  c1 |
  f1 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  An -- gels we have heard on high
  Sweet -- ly sing -- ing o’er the plains,
  And the moun -- tains in re -- ply
  Ech -- o back their joy -- ous strains.

  Gló -- ri -- a in ex -- cél -- sis De -- o!
  Gló -- ri -- a in ex -- cél -- sis De -- o!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Shep -- herds, why this ju -- bi -- lee?
  Why your joy -- ous strains pro -- long?
  What the glad -- some tid -- ings be
  Which in -- spire your heav'n -- ly song?
}

verseThree = \lyricmode {
  \set stanza = "3."
  Come to Beth -- le -- hem and see
  Christ Whose birth the an -- gels sing;
  Come, a -- dore on bend -- ed knee,
  Christ the Lord, the new -- born King.
}

verseFour = \lyricmode {
  \set stanza = "4."
  See Him in a man -- ger laid,
  Whom the choirs of an -- gels praise;
  Ma -- ry, Jo -- seph, lend your aid,
  While our hearts in love we raise.
}


\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 60 2)
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
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

