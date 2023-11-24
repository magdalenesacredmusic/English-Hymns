\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Ermuntert euch, ihr Frommen," Laurentius Laurenti (1660-1722), 1700; Tr. Sarah B. Findlater (1823-1907), 1854, alt. \italic "Hymnal 1940"
      }
      \wordwrap {
        Music: LLANGLOFFAN, 76 76 D, Melody from the Welsh Hymnal \italic "Hymnau a Thornau," 1865, Anon.; Harm. \italic "The English Hymnal," 1906
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {}
    }
    \right-column{
      \line {}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d |
  g4 g a a |
  bf4.( a8) g4 g |
  c c bf bf |
  a2. \bar "" \break
  
  d,4 |
  g g a a |
  bf4.( a8) d4 c |
  bf g a fs |
  g2. \bar "" \break
  
  d'4 |
  d bf a c |
  bf4.( bf8) a4 g |
  fs g c bf |
  a2. \bar ""
  
  d,4 |
  g g a a |
  bf4.( c8) d4 c |
  bf g a fs |
  g2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  g d ef d |
  bf4.( c8) d4 d |
  c ef d d |
  d2.
  
  d8[ c] |
  bf4 ef ef f |
  f( g) f ef |
  d bf ef d |
  d2.
  
  g4 |
  f f ef c |
  f4.( f8) f4 c |
  d d c d |
  d2.
  
  d4 |
  g d ef d |
  d4.( d8) g4 g |
  f ef ef d |
  d2.
}

tenor = \relative c {
  \global
  \partial 4
  d4 |
  g g g fs |
  g4.( a8) bf4 bf |
  g g g g |
  fs2.
  
  fs4 |
  g bf c c |
  d bf bf8[ a] g4 |
  f g c a |
  bf2.
  
  bf8[ c] |
  d4 d c g8[ a] |
  bf4.( bf8) c4 g |
  a g fs g |
  g2( fs4) 
  
  d4 |
  g g g fs |
  g4.( a8) bf4 ef |
  d bf c a |
  bf2.
}

bass = \relative c {
  \global
  \partial 4
 d4 |
 g bf, c d |
 g,4.( g8) g'4 f |
 ef c g bf |
 d2.
 
 d4 |
 ef ef8[ d] c4 f |
 d( ef) bf c |
 d ef c d |
 g2. 
 
 g8[ a] |
 bf4 bf, c ef |
 d4.( d8) f4 ef |
 d8[ c] bf4 a g |
 d'2.
 
 d4 |
 g bf, c d |
 g,4.( g8) g'4 c,4 |
 d ef c d |
 g,2.
}

verseOne = \lyricmode {
  \vOne
  Re -- joice, re -- joice, be -- liev -- ers!
  And let your lights ap -- pear;
  The eve -- ning is ad -- vanc -- ing,
  And dark -- er night is near.
  The Bride -- groom is a -- ris -- ing,
  And soon he will draw night;
  Up, watch in ex -- pec -- ta -- tion!
  At mid -- night comes the cry.
}

verseTwo = \lyricmode {
  \vTwo
  See that your lamps are burn -- ing;
  Re -- plen -- ish them with oil;
  Look now for your sal -- va -- tion,
  The end of sin and toil.
  The watch -- ers on the moun -- tain 
  Pro -- claim the Bride -- groom near;
  Go meet him as he com -- eth,
  With al -- le -- lu -- ias clear.
}

verseThree = \lyricmode {
  \vThree
  O wise and ho -- ly vir -- gins,
  Now raise your voic -- es higher,
  Un -- til in songs of tri -- umph
  Ye meet the an -- gels choir.
  The mar -- riage -- feast is wait -- ing,
  The gates wide o -- pen stand;
  Rise up, ye heirs of glo -- ry!
  The Bride -- groom is at hand.
}

verseFour = \lyricmode {
  \vFour
  Our hope and ex -- pec -- ta -- tion,
  O Je -- sus, now ap -- pear;
  A -- rise, thou Sun so longed for,
  O'er this be -- night -- ed sphere!
  With hearts and hands up -- lift -- ed,
  We plead, O Lord, to see
  The day of earth's re -- demp -- tion,
  And ev -- er be with thee!
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  %\top
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
%  \bottom
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
  %\bottom
  \refs
}

%%%%%%
%%%%%%
%%%%%%

#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  %\top
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
  \refs
 % \bottom
}
