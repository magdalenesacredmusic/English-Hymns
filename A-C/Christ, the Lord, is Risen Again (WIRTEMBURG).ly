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
        Text: \italic "Christus ist erstanden," Michael Weisse (ca. 1488-1534), 1531; Tr. Catherine Winkworth (1827-78), 1858
      }
      \wordwrap {
        Music: WIRTEMBERG, 77 77 4, from \italic "Straf mich nicht," Dresden, 1694; Adapt. William Henry Monk (1823-89)
      }
    }
  }
}

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
  fs2 e \bar "|."
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

}

verseOne = \lyricmode {
  \vOne
  Christ the Lord is ris'n a -- gain;
  Christ hath bro -- ken ev' -- ry chain
  Hark! an -- gel -- ic voi -- ces cry,
  Sing -- ing ev -- er -- more on high,
  Al -- le -- lu -- ia!
}

verseTwo = \lyricmode {
  \vTwo
  He Who gave for us His life,
  Who for us en -- dured the strife,
  Is our Pas -- chal Lamb to -- day;
  We too sing for joy, and say:
  Al -- le -- lu -- ia!
}

verseThree = \lyricmode {
  \vThree
  He Who bore all pain and loss
  Com -- fort -- less up -- on the Cross,
  Lives in glo -- ry now on high,
  Pleads for us, and hears our cry:
  Al -- le -- lu -- ia!
}

verseFour = \lyricmode {
  \vFour
  He Who slum -- bered in the grave,
  Is ex -- alt -- ed now to save;
  Through the u -- ni -- verse it rings
  That the Lamb is King of kings,
  Al -- le -- lu -- ia!
}


verseFive = \lyricmode {

}

verseSix = \lyricmode {

}

extraVerses =
\markup {
  \vspace #1
  \fontsize #1 {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "Now he bids us tell abroad,"
            "How the lost may be restored,"
            "How the penitent forgiv'n,"
            "How we too may enter heav'n."
            "Alleluia!"
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "Thou, our Paschal Lamb indeed,"
            "Christ, Thy ransomed people feed;"
            "Take our sins and guilt away,"
            "That we all may sing for aye:"
            "Alleluia!"
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}

\include "hymn_scores_extra.ly"