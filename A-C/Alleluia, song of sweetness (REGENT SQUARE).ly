%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Alleluia, dulce carmen," 11th cent.; Tr. J.M. Neale (1818-66), alt.
      }
      \wordwrap {
        Music: REGENT SQUARE, 87 87 87, Henry Smart (1813-79), 1866
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {REGENT SQUARE 87 87 87}
    }
    \column{
      \line {Henry Smart, 1866}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Alleluia, dulce carmen"}
      \line {11th cent. tr. J.M. Neale; alt.}
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
  f4 d bf' f |
  d'4. c8 bf4 f |
  g g f bf |
  f ef d2 \bar "|"

  f4 d bf' f |
  d'4. c8 bf4 a |
  bf a g a8[ bf] |
  a4 g f2 \bar "|"

  c'4. c8 a4 f |
  d'4. c8 bf4 g |
  ef' d c bf |
  bf a bf2 \bar "|."
}

alto = \relative c' {
  \global
  d4 bf f' d |
  f4. f8 f4 f |
  bf, bf bf bf |
  c a bf2 |

  d4 bf f' f8[ ef] |
  d4. ef8 d4 d |
  d d d d |
  f e f2 |

  f4. f8 f4 c |
  d4. d8 ef4 ef |
  g f ef d8[ ef] |
  f4. ef8 d2 
}

tenor = \relative c' {
  \global
  bf4 f f bf |
  bf4. a8 bf4 bf |
  g bf f g |
  f f f2 |

  bf4 bf f f |
  bf4. a8 g4 fs |
  g fs d' c8[ bf] |
  c4 bf a2 |

  a4. a8 c4 a |
  bf4. af8 g4 bf |
  c f, g8[ a] bf4 |
  c c bf2 
}

bass = \relative c {
  \global
  bf4 bf d bf |
  f'4. ef8 d4 d |
  ef ef d g, |
  a f bf2 |

  bf'4 f d d8[ c] |
  bf4. c8 d4 d |
  g d bf g |
  c c f,2 |

  f'4. f8 f4 f |
  bf,4. bf8 ef4 ef |
  c d ef8[ f] g4 |
  f f, bf2 
}

verseOne = \lyricmode {
  \vOne
  Al -- le -- lu -- ia, song of sweet -- ness,
  Voice of joy that can -- not die;
  Al -- le -- lu -- ia is the an -- them
  Ev -- er dear to choirs on high;
  Which the An -- gels sing, who ev -- er
  In the house of God a -- bide.
}

verseTwo = \lyricmode {
  \vTwo
  Al -- le -- lu -- ia thou re -- sound -- est,
  True Je -- ru -- sa -- lem and free;
  Al -- le -- lu -- ia, joy -- ful moth -- er,
  All thy chil -- dren sing with thee;
  But by Ba -- by -- lon’s sad wa -- ters
  Mourn -- ing ex -- iles now are we.
}

verseThree = \lyricmode {
  \vThree
  Al -- le -- lu -- ia can -- not al -- ways
  Be our song while here be -- low;
  Al -- le -- lu -- ia our trans -- gres -- sions
  Make us for a -- while fore -- go;
  For the sol -- emn time is com -- ing
  When our tears for sin must flow.
}

verseFour = \lyricmode {
  \vFour
  There -- fore in our hymns we pray thee,
  Grant us, bless -- ed Trin -- i -- ty,
  At the last to keep thine Eas -- ter
  In our home be -- yond the sky,
  There to thee for ev -- er sing -- ing
  Al -- le -- lu -- ia joy -- ful -- ly.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
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
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
%\bottom
\refs
}
