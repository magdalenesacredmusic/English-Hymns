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
      \line {PICARCY    87 87 87}
    }
    \right-column{
      \line {French Carol}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Pange, lingua, gloriosi proelium certaminis"}
      \line {Fortunatus; tr. P. Dearmer and J.M. Neale}
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

melody = \relative c' {
  \global
  d4 e f g |
  a2 a4( g) |
  a2 a \bar "||"

  a4 a bf c |
  bf2 a4( g) |
  a1 \bar "||"

  d,4 e f g |
  a2 a4( g) |
  a2 a \bar "||"

  a4 a bf c |
  bf2 a4( g) |
  a1 \bar "||"

  a4 a d a |
  g2. f4 |
  d( f a f) |
  e1 \bar "||"

  a4 a d a |
  g2 e4( f) |
  d1 \bar "|."
}

soprano = \relative c' {
  \global
  d4 e f g |
  a2 <f a>4( <e g>) |
  a2 a \bar "||"

  a4 a bf c |
  bf2 a4( g) |
  a1 \bar "||"

  d,4 e f g |
  a2 a4( g) |
  a2 a \bar "||"

  a4 a bf c |
  bf2 a4( g) |
  a1 \bar "||"

  a4 a d a |
  g2. f4 |
  d( f a f) |
  e1 \bar "||"

  a4 a d a |
  g2 e4( f) |
  d1 \bar "|."
}

alto = \relative c' {
  \global
  <a d>1~ |
  <a d>2 d2
  <c f>1 |

  f2 ef |
  <d f>2. e4~ |
  <cs e>1 |

  d1 |
  <c f>2 <bf d> |
  <d f>1 |

  f2 ef |
  <d f>2. e4 |
  <c f>1 |

  <d~ a'>1 |
  <bf d> |
  d |
  e |

  <d a'> |
  <bf d>2 <g c~>4 <a c> |
  a1 \bar "|."
}

tenor = \relative c {
  \global
  f1~ |
  f2 s2 |
  s1 |

  f1~ |
  f2. e4~ |
  e1 |

  f1~ |
  f2. e4 |
  d1 |

  f1~ |
  f2. e4 |
  f1 |

  d1~ |
  d1 |
  a'2. bf4 |
  c1 |

  d,1~ |
  d2 c4 s |
  <d f>1 \bar "|."
}

bass = \relative c {
  \global
  d1~ |
  d2 bf |
  f1 |

  d'2 c4 a |
  bf1 |
  a1 \bar "||"

  bf1 |
  f2 g |
  d1 |

  d'2 c4 a |
  bf1 |
  f |

  fs |
  g |
  <d' f> |
  <c g'> |

  f, |
  g2 c4 a |
  d,1 \bar "|."
}



refrain = \lyricmode {
  Faith -- ful Cross, a -- bove all o -- ther
  One and on -- ly no -- ble tree:
  None in fo -- liage, none in blos -- som,
  None in fruit thy peer may be;
  Sweet -- est wood and sweet -- est i -- ron,
  Sweet -- est weight is hung on thee.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Sing, my tongue, the glo -- rious bat -- tle,
  Sing the end -- ing of the fray;
  Now a -- bove the Cross, the tro --  phy,
  Sound the loud tri -- um -- phant lay:
  Tell how Christ, the world's Re -- deem -- er,
  As a Vic -- tim won the day.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  God in pit -- y saw man fal -- len,
  Shamed and sunk in mis -- er -- y,
  When he fell on death by tast -- ing
  Fruit of the for -- bid -- den tree;
  Then an -- oth -- er tree was cho -- sen
  Which the world from death should free.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Thus the scheme of our sal -- va -- tion
  Was of old in or -- der laid,
  That the man -- i -- fold de -- ceiv -- er's
  Art by art might be out -- weighed,
  And the lure the foe put for -- ward
  In -- to means of heal -- ing made.
}

verseFour = \lyricmode {
  \set stanza = "4."
  There -- fore when the_ap -- point -- ed full -- ness
  Of the ho -- ly time was come,
  He was sent who mak -- eth all things
  Forth from God's e -- ter -- nal home;
  Thus he came to earth, in -- car -- nate,
  Off -- spring of a mai -- den's womb.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Lo! he lies, an in -- fant weep -- ing,
  Where the nar -- row man -- ger stands:
  While the Mo -- ther -- maid his mem -- bers
  Wraps in mean and low -- ly bands:
  And the swad -- dling clothes are wind -- ing
  Round God's help -- less feet and hands.
}

verseSix = \lyricmode {
  \set stanza = "6."
  Thir -- ty years a -- mong us dwel -- ling,
  His ap -- point -- ed time ful -- filled,
  Born for this, He meets His Pas -- sion,
  For that this He free -- ly willed,
  On the Cross the Lamb is lift -- ed
  Where his life -- blood shall be spilled.
}

%{ verseSeven = \lyricmode {
  \set stanza = "7."
  He en -- dured the nails, the spit -- ting,
  Vin -- e -- gar, and spear, and reed;
  From that ho -- ly Bo -- dy bro -- ken
  Blood and wa -- ter forth pro -- ceed:
  Earth, and stars, and sky, and o -- cean
  By that flood from stain are freed.
}

verseEight = \lyricmode {
  \set stanza = "8."
  Bend thy boughs, O Tree of Glo -- ry!
  Thy re -- lax -- ing sin -- ews bend;
  For a -- while the an -- cient ri -- gour
  That thy birth be -- stowed, sus -- pend;
  And the King of heav'n -- ly beau -- ty
  On thy bo -- som gen -- tly tend!
}

verseNine = \lyricmode {
  \set stanza = "9."
  Thou a -- lone was count -- ed wor -- thy
  This world's ran -- som to up -- hold;
  For a ship -- wreck'd race pre -- par -- ing
  Har -- bour, like the Ark of old;
  With the sa -- cred Blood a -- noint -- ed
  From the smit -- ten Lamb that rolled.
}

verseTen = \lyricmode {
  \set stanza = "10."
  To the Tri -- ni -- ty be glo -- ry
  Ev -- er -- last -- ing, as is meet;
  E -- qual to the Fa -- ther, e -- qual
  To the Son, and Par -- a -- clete:
  Tri -- nal U -- ni -- ty, whose prais -- es
  All cre -- a -- ted things re -- peat.
}

%}

\book {
  \include "hymn_paper_multipage.ly.ly"
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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
      }
    }
    \include "hymn_layout.ly"
  }
  \markup {
  \large {
    \fill-line {
      %\hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "7. "
          \column {
            " He endured the nails, the spitting,"
            "Vinegar, and spear, and reed;"
            "From that holy Body broken"
            "Blood and water forth proceed:"
            "Earth, and stars, and sky, and ocean"
            "By that flood from stain are freed."
          }
        }
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "Bend thy boughs, O Tree of Glory!"
            "Thy relaxing sinews bend;"
            "For awhile the ancient rigour"
            "That thy birth bestowed, sus -- pend;"
            "And the King of heav'nly beauty"
            "On thy bosom gently tend!"
          }
        }
      }
      \hspace #0.1  % adds horizontal spacing between columns;
      % if they are still too close, add more " " pairs
      % until the result looks good
      \column {
        \line {
          \bold "9. "
          \column {
            "Thou alone was counted worthy"
            "This world's ransom to uphold;"
            "For a shipwreck'd race preparing"
            "Harbour, like the Ark of old;"
            "With the sacred Blood anointed"
            " From the smitten Lamb that rolled."
          }
        }
        \vspace #1
        \line {
          \bold "10. "
          \column {
            "To the Trinity be glory"
            "Everlasting, as is meet;"
            "Equal to the Father, equal"
            "To the Son, and Paraclete:"
            "Trinal Unity, whose praises"
            "All created things repeat."
          }
        }
      }
      % \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
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
      \new Lyrics \lyricsto "tune" { \verseSix }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \markup {
  \large {
    \fill-line {
      %\hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "7. "
          \column {
            " He endured the nails, the spitting,"
            "Vinegar, and spear, and reed;"
            "From that holy Body broken"
            "Blood and water forth proceed:"
            "Earth, and stars, and sky, and ocean"
            "By that flood from stain are freed."
          }
        }
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "Bend thy boughs, O Tree of Glory!"
            "Thy relaxing sinews bend;"
            "For awhile the ancient rigour"
            "That thy birth bestowed, sus -- pend;"
            "And the King of heav'nly beauty"
            "On thy bosom gently tend!"
          }
        }
      }
      \hspace #0.1  % adds horizontal spacing between columns;
      % if they are still too close, add more " " pairs
      % until the result looks good
      \column {
        \line {
          \bold "9. "
          \column {
            "Thou alone was counted worthy"
            "This world's ransom to uphold;"
            "For a shipwreck'd race preparing"
            "Harbour, like the Ark of old;"
            "With the sacred Blood anointed"
            " From the smitten Lamb that rolled."
          }
        }
        \vspace #1
        \line {
          \bold "10. "
          \column {
            "To the Trinity be glory"
            "Everlasting, as is meet;"
            "Equal to the Father, equal"
            "To the Son, and Paraclete:"
            "Trinal Unity, whose praises"
            "All created things repeat."
          }
        }
      }
      % \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}
  \bottom
}


\markup {
  \large {
    \fill-line {
      %\hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "7. "
          \column {
            " He endured the nails, the spitting,"
            "Vinegar, and spear, and reed;"
            "From that holy Body broken"
            "Blood and water forth proceed:"
            "Earth, and stars, and sky, and ocean"
            "By that flood from stain are freed."
          }
        }
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "Bend thy boughs, O Tree of Glory!"
            "Thy relaxing sinews bend;"
            "For awhile the ancient rigour"
            "That thy birth bestowed, sus -- pend;"
            "And the King of heav'nly beauty"
            "On thy bosom gently tend!"
          }
        }
      }
      \hspace #0.1  % adds horizontal spacing between columns;
      % if they are still too close, add more " " pairs
      % until the result looks good
      \column {
        \line {
          \bold "9. "
          \column {
            "Thou alone was counted worthy"
            "This world's ransom to uphold;"
            "For a shipwreck'd race preparing"
            "Harbour, like the Ark of old;"
            "With the sacred Blood anointed"
            " From the smitten Lamb that rolled."
          }
        }
        \vspace #1
        \line {
          \bold "10. "
          \column {
            "To the Trinity be glory"
            "Everlasting, as is meet;"
            "Equal to the Father, equal"
            "To the Son, and Paraclete:"
            "Trinal Unity, whose praises"
            "All created things repeat."
          }
        }
      }
      % \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}