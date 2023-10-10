\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Macht hoch die Tür," Georg Weissel (1590-1635), 1642; Tr. Catherine Winkworth (1829-78)
      }
      \wordwrap {
        Music: MACHT HOCH DIE TUR, 88 88 88 66, Freylinghausen's \italic "Gesangbuch," 1704
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {MACHT HOCH DIE TUR.  88 88 88 66}
    }
    \right-column{
      \line {Freylinghausen's \italic "Gesangbuch," 1704}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Macht hoch die Tür"}
      \line {Georg Weissel (1590-1635), 1642}
      \line {Tr. Catherine Winkworth (1829-78)}
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

melody = \relative c'' {
  \global
\partial 4
  a4 |
  c2 bf4 a2 g4 |
  f( g) a g2 c4 |
  bf2 bf4 a( g) a 
  g( f) g f2 \bar "" \break 
    a4 |
  g2 g4 a( b) c |
  c( d) b c2 \bar ""
  
  g4 |
  a2 g4 a( b) c |
  c( d) b c2 \bar "" 
    c4 |
  d2 c4 d2 c4 |
  d( c) bf a2 c4 |
  d2 c4 d2 c4 |
  d( c) bf a2 \bar ""
  c4 |
  f,2 f4 bf2 a4 |
  g2.~ g2 c4 |
  bf2 a4 g( f) g |
  f2.~ f2
\bar "|."
}

melodya = \relative c'' {
  \global
\partial 4
  a4 |
  c2 bf4 a2 g4 |
  f( g) a g2 c4 |
  bf2 bf4 a( g) a 
  g( f) g f2 \bar "" %\break 
    a4 |
  g2 g4 a( b) c |
  c( d) b c2 \bar ""
  
  g4 |
  a2 g4 a( b) c |
  c( d) b c2 \bar "" 
    c4 |
  d2 c4 d2 c4 |
  d( c) bf a2 c4 |
  d2 c4 d2 c4 |
  d( c) bf a2 \bar ""
  c4 |
  f,2 f4 bf2 a4 |
  g2.~ g2 c4 |
  bf2 a4 g( f) g |
  f2.~ f2
\bar "|."
}

alto = \relative c' {
  \global
  f4 |
  f2 d4 f2 e4 |
  d2 f4 e2 f4 |
  f2 e4 f2 f4 |
  d2 e4 c2 f4 |
  e2 g4 f2 g4 |
  f2 d4 e2 e4 |
  f2 e4 f2 g4 |
  f2 d4 e2 f4 |
  f( e) f f( e) f |
  f2 g4 f2 f4 |
  f2 f4 f2 g4 |
  fs2 g4 f2 g4 |
  c,2 d4 d( e) f |
  e2.~ e2 f4 |
  f( e) f d2 e4 |
  c2.~ c2
}

tenor = \relative c' {
  \global
  c4 |
  a2 bf4 c2 c4 |
  a2 c4 c2 a4 |
  bf2 bf4 c2 d4 |
  bf2 c4 a2 c4 |
  c2 c4 c2 c4 |
  a2 g4 g2 c4 |
  c2 c4 c2 c4 |
  a2 g4 g2 a4 |
  bf2 c4 bf2 c4 |
  bf( c) d d2 a4 |
  bf2 a4 bf2 g4 |
  a2 bf4 d2 c4 |
  a2 a4  bf2 c4 |
  c2.~ c2 a4 |
  bf2 c4 d2 c4 |
  a2.~ a2
}

bass = \relative c {
  \global
 f4 |
 f2 g4 f2 c4 |
 d2 a4 c2 f4 |
 g2 g4 f2 d4 |
 g2 c,4 f2 f4 |
 c2 e4 f2 e4 |
 d2 g4 c,2 c4 |
 f2 c4 f2 e4 |
 d2 g4 c,2 f4 |
 bf2 a4 bf2 a4 |
 bf( a) g d2 f4 |
 bf,2 f'4 bf,2 ef4 |
 d2 d4 d2 e4 |
 f2 d4 g,2 a4 |
 c2.~ c2 f,4 |
 g2 a4 bf2 c4 |
 f2.~ f2
}

verseOne = \lyricmode {
  \vOne
  Lift up your heads, ye might -- y gates;
  Be -- hold the King of Glo -- ry waits!
  The King of kings is draw -- ing near;
  The Sav -- ior of the world is here;
  Life and sal -- va -- tion he doth bring,
  Where -- fore re -- joice and glad -- ly sing:
  We praise thee, Fa -- ther, now,
  Cre -- a -- tor, wise art thou.
}

verseTwo = \lyricmode {
  \vTwo
  The Lord is just, a help -- er tried,
  With mer -- cy ev -- er at his side;
  His king -- ly crown is ho -- li -- ness,
  His scep -- tre, pit -- y in dis -- tress,
  The end of all our woe he brings;
  Where -- fore the earth is glad and sings:
  We praise thee, Sav -- ior now,
  Might -- y in deed art thou.
}

verseThree = \lyricmode {
  \vThree
  O blest the land, the cit -- y blest,
  Where Christ the Ru -- ler is con -- fessed!
  O hap -- py hearts and hap -- py homes
  To whom this King of tri -- umph comes!
  The cloud -- less Sun of joy he is,
  Who bring -- eth pure de -- light and bliss:
  O Com -- for -- ter di -- vine,
  What bound -- less grace is thine.
}

verseFour = \lyricmode {
  \vFour
  Re -- deem -- er, come! I o -- pen wide
  My heart to thee: here, Lord, a -- bide!
  Let me thy in -- ner pres -- ence feel:
  Thy grace and love in me re -- veal.
  Thy Ho -- ly Spir -- it guide us on,
  Un -- til our glo -- rious goal is won:
  E -- ter -- nal praise and fame
  We of -- fer to thy Name.
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
        \new Voice = "soprano" { \voiceOne \melodya }
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
        \melodya
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