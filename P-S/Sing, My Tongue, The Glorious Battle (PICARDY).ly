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
      \line {PICARDY  87 87 87}
    }
    \right-column{
      \line {French Carol}
      \line {harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Pange, lingua, gloriosi/ Proelium certaminis"}
      \line {Fortunatus; vs. 1-4 tr. Percy Dearmer; vs. 6-10 tr. J.M. Neale}
    } 
  }
}


global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody
= \relative c' {
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
  \teeny d1 |

  \normalsize d'2 c4 a |
  bf1 |
  f |

  fs |
  g |
  <d' f> |
  <c g'> |

  f, |
  g2 c4 a |
  \teeny d,1 \bar "|."
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
  Thir -- ty years a -- mong us dwel -- ling,
  His ap -- point -- ed time ful -- filled,
  Born for this, He meets His Pas -- sion,
  For that this He free -- ly willed,
  On the Cross the Lamb is lift -- ed
  Where his life -- blood shall be spilled.
}


\book {
  \include "hymn_paper_multipage.ly"
  \paper {
    ragged-bottom = ##t
  }
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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 84 4)
      }
    }
    \include "hymn_layout.ly"
  }
      \markup {
	\large {
  \fill-line {
    \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
     \column {
      \line { \bold "5. "
		\column {
		 "Thirty years among us dwelling,"
 " His appointed time fulfilled,"
  "Born for this, He meets His Passion,"
  "For that this He freely willed,"
  "On the Cross the Lamb is lifted"
  "Where his life blood shall be spilled."
        }
     	}
     	\vspace #0.5
      \line { \bold "7. "
		\column {
		  "Faithful Cross! above all other,"
            "  One and only noble tree!"
            "None in foliage, none in blossom,"
            "  None in fruit thy peer may be;"
            "Sweetest wood and sweetest iron!"
            "  Sweetest weight is hung on thee."
        }
     	}
\vspace #0.5
      \line { \bold "9. "
		\column {
		 "Thou alone was counted worthy"
            "  This world's ransom to uphold;"
            "For a shipwreck'd race preparing"
            "  Harbour, like the Ark of old;"
            "With the sacred Blood anointed"
            "  From the smitten Lamb that rolled."
        }
     	}
    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "6. "
		\column {
		   "He endured the nails, the spitting,"
            "  Vinegar, and spear, and reed;"
            "From that holy Body broken"
            "  Blood and water forth proceed:"
            "Earth, and stars, and sky, and ocean"
            "  By that flood from stain are freed."
        }
      	}
\vspace #0.5
      \line { \bold "8. "
		\column {
		  "Bend thy boughs, O Tree of Glory!"
            "  Thy relaxing sinews bend;"
            "For awhile the ancient rigour"
            "  That thy birth bestowed, suspend;"
            "And the King of heav'nly beauty"
            "  On thy bosom gently tend!"
        }
      	}
\vspace #0.5
      \line { \bold "10. "
		\column {
  "To the Trinity be glory"
            "  Everlasting, as is meet;"
            "Equal to the Father, equal"
            "  To the Son, and Paraclete:"
            "Trinal Unity, whose praises"
            "  All created things repeat."
        }
      	}
    }
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
  }
}
}
\markup {
  \vspace #1
}
  \bottom
}
%%%%%%%%%%%%%
#(define output-suffix "Hymnal")
\book {
  \include "hymn_hymnal_paper.ly"
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
        \markup {
	\large {
  \fill-line {
    \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
     \column {
      \line { \bold "5. "
		\column {
		 "Thirty years among us dwelling,"
 " His appointed time fulfilled,"
  "Born for this, He meets His Passion,"
  "For that this He freely willed,"
  "On the Cross the Lamb is lifted"
  "Where his life blood shall be spilled."
        }
     	}
     	\vspace #0.5
      \line { \bold "7. "
		\column {
		  "Faithful Cross! above all other,"
            "  One and only noble tree!"
            "None in foliage, none in blossom,"
            "  None in fruit thy peer may be;"
            "Sweetest wood and sweetest iron!"
            "  Sweetest weight is hung on thee."
        }
     	}
\vspace #0.5
      \line { \bold "9. "
		\column {
		 "Thou alone was counted worthy"
            "  This world's ransom to uphold;"
            "For a shipwreck'd race preparing"
            "  Harbour, like the Ark of old;"
            "With the sacred Blood anointed"
            "  From the smitten Lamb that rolled."
        }
     	}
    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "6. "
		\column {
		   "He endured the nails, the spitting,"
            "  Vinegar, and spear, and reed;"
            "From that holy Body broken"
            "  Blood and water forth proceed:"
            "Earth, and stars, and sky, and ocean"
            "  By that flood from stain are freed."
        }
      	}
\vspace #0.5
      \line { \bold "8. "
		\column {
		  "Bend thy boughs, O Tree of Glory!"
            "  Thy relaxing sinews bend;"
            "For awhile the ancient rigour"
            "  That thy birth bestowed, suspend;"
            "And the King of heav'nly beauty"
            "  On thy bosom gently tend!"
        }
      	}
\vspace #0.5
      \line { \bold "10. "
		\column {
  "To the Trinity be glory"
            "  Everlasting, as is meet;"
            "Equal to the Father, equal"
            "  To the Son, and Paraclete:"
            "Trinal Unity, whose praises"
            "  All created things repeat."
        }
      	}
    }
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
  }
}
}
\markup {
  \vspace #1
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "6. "
          \column {
            "He endured the nails, the spitting,"
            "  Vinegar, and spear, and reed;"
            "From that holy Body broken"
            "  Blood and water forth proceed:"
            "Earth, and stars, and sky, and ocean"
            "  By that flood from stain are freed."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "Faithful Cross! above all other,"
            "  One and only noble tree!"
            "None in foliage, none in blossom,"
            "  None in fruit thy peer may be;"
            "Sweetest wood and sweetest iron!"
            "  Sweetest weight is hung on thee."
          }
        }
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "Bend thy boughs, O Tree of Glory!"
            "  Thy relaxing sinews bend;"
            "For awhile the ancient rigour"
            "  That thy birth bestowed, suspend;"
            "And the King of heav'nly beauty"
            "  On thy bosom gently tend!"
          }
        }
        \vspace #1
        \line {
          \bold "9. "
          \column {
            "Thou alone was counted worthy"
            "  This world's ransom to uphold;"
            "For a shipwreck'd race preparing"
            "  Harbour, like the Ark of old;"
            "With the sacred Blood anointed"
            "  From the smitten Lamb that rolled."
          }
        }
        \vspace #1
        \line {
          \bold "10. "
          \column {
            "To the Trinity be glory"
            "  Everlasting, as is meet;"
            "Equal to the Father, equal"
            "  To the Son, and Paraclete:"
            "Trinal Unity, whose praises"
            "  All created things repeat."
          }
        }
      }
      \hspace #1.0

    }
  }
}
  \bottom
}



