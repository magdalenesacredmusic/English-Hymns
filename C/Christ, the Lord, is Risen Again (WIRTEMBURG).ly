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
      \line {WIRTEMBERG   77 77 4}
    }
    \column{
      \line {from \italic "Straf mich nicht," Dresden, 1694; adapt. W.H. Monk}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Christus ist erstanden"}
      \line {Michael Weisse, 1531; tr. Catherine Winkworth, 1858}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key e \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  gs4 gs b b |
  e, fs gs2 \bar "|"

  cs4 ds e gs, |
  fs fs e2 \bar "|"

  b'4 fs gs gs |
  cs gs as2 \bar "|"

  b4 fs gs8[ as] b4 |
  cs cs b2 \bar "|"

  cs4( ds e) gs,4 |
  fs2 e \bar "||"
  e2 e \bar "|."
}

alto = \relative c' {
  \global
  e4 e fs ds |
  e ds e2
  e4 fs e e |
  e ds e2
  ds4 fs e fs |
  es gs fs2

  fs4 ds e ds |
  g fs8[ e] ds2 |

  fs2( e4) e |
  e( ds) e2 |

  cs2 b
}

tenor = \relative c' {
  \global
  b4 b b a |
  gs b b2 |

  cs4 a gs cs |
  cs b gs2 |

  fs4 b b bs |
  cs cs cs2 |
  b4 b b b |
  b as b2 |
  a2( gs4) cs4 |
  cs( b) gs2 |

  a2 gs
}

bass = \relative c {
  \global
  e4 e ds b |
  cs b e2 |

  a4 fs cs cs |
  a b e2 |

  b4 ds e ds |
  cs es fs2 |

  ds4 b e gs |
  e fs b,2 |

  fs4( b cs4.) b8 |
  a4( b) e2 |

  a,2 e'
}

verseOne = \lyricmode {
  \set stanza = "1."
  Christ the Lord is ris'n a -- gain;
  Christ hath bro -- ken ev' -- ry chain
  Hark! an -- gel -- ic voi -- ces cry,
  Sing -- ing ev -- er -- more on high,
  Al -- le -- lu -- ia!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  He Who gave for us His life,
  Who for us en -- dured the strife,
  Is our Pas -- chal Lamb to -- day;
  We too sing for joy, and say:
  Al -- le -- lu -- ia!
}

verseThree = \lyricmode {
  \set stanza = "3."
  He Who bore all pain and loss
  Com -- fort -- less up -- on the Cross,
  Lives in glo -- ry now on high,
  Pleads for us, and hears our cry:
  Al -- le -- lu -- ia!
}

verseFour = \lyricmode {
  \set stanza = "4."
  He Who slum -- bered in the grave,
  Is ex -- alt -- ed now to save;
  Through the u -- ni -- verse it rings
  That the Lamb is King of kings,
  Al -- le -- lu -- ia!
}


verseFive = \lyricmode {
  \set stanza = "5."
  Now he bids us tell a -- broad,
  How the lost may be re -- stored,
  How the pen -- i -- tent for -- giv'n,
  How we too may en -- ter heav'n.
  Al -- le -- lu -- ia!
}

verseSix = \lyricmode {
  \set stanza = "6."
  Thou, our Pas -- chal Lamb in -- deed,
  Christ, Thy ran -- somed peo -- ple feed;
  Take our sins and guilt a -- way,
  That we all may sing for aye:
  Al -- le -- lu -- ia!

  A -- men.
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
      \new Lyrics \lyricsto soprano \verseFour
      \new Lyrics \lyricsto soprano \verseFive
      \new Lyrics \lyricsto soprano \verseSix 
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 72 4)
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
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive}
      \new Lyrics \lyricsto "tune" {\verseSix }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

