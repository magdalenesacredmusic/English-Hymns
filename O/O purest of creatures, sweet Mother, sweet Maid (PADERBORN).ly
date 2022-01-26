\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {PADERBORN, 11 11 11 11}
    }
    \right-column{
      \line {\italic "Paderborn Gesangbuch," 1765, alt.}
      \line {Harm. Healey Willan, 1958}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Frederick W. Faber (1814-1863)}
      \line {alt. Fr. Irvin, O.F.M. CAP., 1958}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  c4
  f f g
  a a bf
  c a g
  f2 \bar "" \break
    c4
  f f g 
  a a bf
  c a g
  f2 \bar "" \break
    a4
  c a c
  bf8[ a] g4 bf
  a f a
  g2 \bar ""
    c,4
  f4 f g
  a a bf
  c a g
  f2 \bar "|."
}

alto = \relative c' {
  \global
  c4
  c c e
  f f f
  f f e
  f2 c4
  c c e
  f f f
  f f e
  f2 f4
  f f c
  d e g
  f f f
  e2 c4
  c c e
  f f f
  f f e
  f2
}

tenor = \relative c {
  \global
  c4 
  a' a c
   c c bf
   a c bf
   a2 c,4 
   a'4 a c 
   c c bf 
   a c bf
   a2 c4
   c c a 
   bf c c 
   c c c 
   c2 c,4
   a'4 a c
   c d d 
   c c bf 
   a2
}

bass = \relative c {
  \global
  c4
  f f c 
  f f d
  c c c 
  f2 c4
  f f c 
  f f d
  c c c 
  f2 f4
  a4 f a 
  g c, e
  f a f 
  c2 c4
  f f c 
  f d bf
  a c c 
  f,2
}

verseOne = \lyricmode {
  \vOne
  O pur -- est of crea -- tures, sweet Moth -- er, sweet Maid,
  The one spot -- less womb where -- in Je -- sus was laid.
  All lost in the dark -- ness we call up -- on thee,
  And look to thy shin -- ing, bright Star of the Sea.
}

verseTwo = \lyricmode {
  \vTwo
  O fair -- est of vir -- gins, sweet Moth -- er, sweet Maid,
  Whom God in his good -- ness with beau -- ty ar -- rayed.
  He love -- ing -- ly chose thee his moth -- er to be;
  He shone in thy shin -- ing, bright Star of the Sea.
}

verseThree = \lyricmode {
  \vThree
  Oh, may thy pure light on our souls ev -- er shine;
  And keep them un -- sul -- lied and sin -- less as thine,
  Till af -- ter this ex -- ile u -- nit -- ed we be,
  Through a -- ges un -- end -- ing, in glo -- ry with thee.
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
#(define output-suffix "Hymnal")
\book {
  \include "hymn_hymnal_paper.ly"
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
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
