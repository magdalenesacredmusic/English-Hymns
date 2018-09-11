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
      \line {ST. THEODULPH 76 76 D}
    }
    \right-column{
      \line {Melchior Teschner; harm. J.S.Bach; \italic "The English Hymnal"}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {H. Nelson, 1864, \italic "The Sarum Hymnal"}
    }
  } 
}

\header {
  tagline = ""
}

lal =  \once \override LyricText.self-alignment-X = #LEFT

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
    c4 |
    g' g a b |
    c2 c4 e |
    d c c b |
    c2. \bar "||" \break
    
        c,4 |
    g' g a b |
    c2 c4 e |
    d c c b |
    c2. \bar "||" \break
    
  c4 |
  e4 e d c |
  b4( a4) g b4 |
  c b a a |
  g2. \bar "||" \break

  g4 |
  e4 g4 a g |
  g( f) e g4 |
  f e d d |
  c2. \bar "||"
}

alto = \relative c' {
  \global
  \partial 4
c4 |
d e f f |
f( e8[ d]) e4 

  g |
g8[ f] e4 d d |
e2. 

c4 |
d e f f |
f( e8[ d]) e4 

  g |
g8[ f] e4 d d |
e2. 
  
  e4 |
  g a8[ g] fs4 g8[ a] |
  g4( fs) g 
  
    g |
  e8[ fs] g4 g fs |
  g2. 
  
    d4 |
  c c f e |
  d( b) c 
  
    c |
  c c c b |
  c2.
}

tenor = \relative c {
  \global
  \partial 4
  c4 |
  g' c c g |
  g2 g4 
  
    c |
  b c a g |
  g2.

  c,4 |
  g' c c g |
  g2 g4 
  
    c |
  b c a g |
  g2.
  
  g4 |
  c c8[ b] a4 d |
  d( c) b 
  
    e |
  c d e d8[ c] |
  b2.
  
    g4 |
  g c c c |
  g2 g4 
  
    g |
  a g g4. f8 |
  e2.
}

bass = \relative c {
  \global
  \partial 4
    c4 |
    b c f d |
    c2 c4

      c4 |
    g' a f g |
    c,2.

    c4 |
    b c f d |
    c2 c4

      c4 |
    g' a f g |
    c,2.
    
    c4 |
  c c d e8[ fs] |
  g4( d) e 
  
    e |
  a, b c d |
  g2. 
  
    b,4 |
  c e f c |
  b( g) c 
  
    e |
  f c g g |
  c2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  From all Thy Saints in war -- fare, for all Thy Saints at rest,
  To Thee, O bless -- èd Je -- sus, all prais -- es be ad -- dressed.
  Thou, Lord, didst win the bat -- tle that they might con -- querors be.
  Their crowns of liv -- ing glo -- ry are lit with rays from Thee.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  \lal \i "Choose proper verse below."
}

verseThree = \lyricmode {
  \set stanza = "3."
  A -- pos -- tles, Proph -- ets, Mar -- tyrs, and all the sa -- cred throng,
  Who wear the spot -- less rai -- ment, who raise the cease -- less song;
  For these, passed on be -- fore us, Sav -- iour! we Thee a -- dore,
  And, walk -- ing in their foot -- steps, would serve Thee more and more.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Then praise we God the Fath -- er, and praise we God the Son,
  And God the Ho -- ly Spi -- rit, e -- ter -- nal Three in One;
  Till all the ran -- somed num -- ber fall down be -- fore the Throne,
  And hon -- or, pow'r, and glo -- ry a -- scribe to God a -- lone.
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
  \bottom
}

\markup {
  \bold Evangelists
}

\markup {
  \large {
    \line { St. Matthew	}
    \fill-line {
      \hspace #1.0
      \column {
        "Praise, Lord, for him whose Gospel Thy human life declared,"
        "Who, worldly gains forsaking, Thy path of suffering shared."
        "From all unrighteous mammon, O give us hearts set free,"
        "That we, what'er our calling, may rise and follow Thee."
      }
      \hspace #1.0
    }
  }
}

\markup {
  \vspace #1
  \large {
    \line { St. Mark	}
    \fill-line {
      \hspace #1.0
      \column {
        "For him, O Lord, we praise Thee, the weak by grace made strong,"
        "Whose labours and whose Gospel enrich our triumph-song."
        "May we in all our weakness find strength from Thee supplied,"
        "And all, as fruitful branches, in Thee, the Vine, abide."
      }
      \hspace #1.0
    }
  }
}
\markup {
  \large {
    \center-column { St. Luke }
    \fill-line {
      \hspace #1.0
      \column {
        "For that 'Beloved Physician,' all praise! whose Gospel shows"
        "The Healer of the nations, the Sharer of our woes."
        "Thy wine and oil, O Savior, on bruised hearts deign to pour,"
        "And with true Balm of Gilead, anoint us evermore."
      }
      \hspace #1.0
    }
  }
}
\markup {
  \large {
    \center-column { St. John 	}
    \fill-line {
      \hspace #1.0
      \column {
        "Praise for the loved Disciple, exile on Patmos' shore;"
        "Praise for the faithful record he to Thy Godhead bore."
        "Praise for the mystic vision, through him to us reveal'd;"
        "May we, in patience waiting, with Thine elect be seal'd."
      }
      \hspace #1.0
    }
  }
}
%%%%
%%%%
%%%%
\markup {
  \bold Apostles
}

\markup {
  \large {
    \center-column { St. Peter 	}
    \fill-line {
      \hspace #1.0
      \column {
        "Praise for Thy great Apostle, the eager and the bold;"
        "Thrice falling, yet repentant, thrice charged to feed Thy fold."
        "Lord, make Thy pastors faithful, to guard their flocks from ill;"
        "And grant them dauntless courage with humble, earnest will."
      }
      \hspace #1.0
    }
  }
}

\markup {
  \large {
    \center-column { St. Andrew 	}
    \fill-line {
      \hspace #1.0
      \column {
        "Praise, Lord, for Thine Apostle, the first to welcome Thee,"
        "The first to lead his brother the very Christ to see."
        "With hearts for Thee made ready, watch we throughout the year,"
        "Forward to lead our brethren to own Thine Advent near."
      }
      \hspace #1.0
    }
  }
}

\markup {
  \large {
    \center-column { "St. James" "the Greater" 	}
    \fill-line {
      \hspace #1.0
      \column {
        "For Him, O Lord, we praise Thee, who, slain by Herod's sword,"
        "Drank of Thy cup of suffering, fulfilling thus Thy word,"
        "Curb we all vain impatience to read Thy veil'd decree,"
        "And count it joy to suffer, if so brought nearer Thee."
      }
      \hspace #1.0
    }
  }
}

\markup {
  \large {
    \center-column { "Sts. Philip" and "James the" Lesser 	}
    \fill-line {
      \hspace #1.0
      \column {
        %\bold \italic "St. Andrew"
        "All praise for Thine Apostle, bless'd guide to Greek and Jew,"
        "And him surnamed Thy brother; keep us thy brethren true."
        "And grant the grace to know Thee, the Way, the Truth, the Life;"
        "To wrestle with temptations till victors in the strife."
      }
      \hspace #1.0
    }
  }
}

\markup {
  \large {
    \center-column { St. Bartholomew 	}
    \fill-line {
      \hspace #1.0
      \column {
        %\bold \italic "St. Andrew"
        "All praise for Thine Apostle, the faithful, pure, and true,"
        "Whom underneath the fig tree Thine eye all-seeing knew."
        "Like him may we be guileless, true Israelites indeed;"
        "That Thine abiding Presence our longing souls may feed."
      }
      \hspace #1.0
    }
  }
}

\markup {
  \large {
    \center-column { St. Thomas 	}
    \fill-line {
      \hspace #1.0
      \column {
        "All praise for Thine Apostle, whose short-lived doubtings prove"
        "Thy perfect two-fold nature, the fullness of Thy love."
        "On all who wait Thy coming shed forth Thy peace, O Lord,"
        "And grant us faith to know Thee, true Man, true God, adored."
      }
      \hspace #1.0
    }
  }
}

\markup {
  \large {
    \center-column { Sts. Simon and Jude 	}
    \fill-line {
      \hspace #1.0
      \column {
        "Praise Lord, for Thine Apostles, who sealed their Faith today:"
        "One love, one zeal impelled them to tread the sacred way."
        "May we with zeal as earnest the faith of Christ maintain,"
        "And, bound in love as brethren, at length Thy rest attain."
      }
      \hspace #1.0
    }
  }
}

\markup {
  \large {
    \center-column { St. Matthias 	}
    \fill-line {
      \hspace #1.0
      \column {
        "Lord, Thine abiding Presence directs the wondrous choice:"
        "For one in place of Judas the faithful now rejoice."
        "Thy Church from false Apostles for evermore defend,"
        "And, by thy parting promise, be with her to the end."
      }
      \hspace #1.0
    }
  }
}

\markup {
  \large {
    \center-column { St. Paul in His Conversion 	}
    \fill-line {
      \hspace #1.0
      \column {
        "Praise for the light from Heaven, praise for the voice of awe,"
        "Praise for the glorious vision the persecutor saw."
        "Thee, Lord, for his conversion, we glorify today:"
        "So lighten all our darkness with Thy true Spirit's ray."
      }
      \hspace #1.0
    }
  }
}

\markup {
  \large {
    \center-column { St. Barnabas	}
    \fill-line {
      \hspace #1.0
      \column {
        %\bold \italic "St. Andrew"
        "The Son of Consolation, moved by Thy law of love,"
        "Forsaking earthly treasures, sought riches from above."
        "As earth now teams with increase, let gifts of grace descend,"
        "That Thy true consolations may through the world extend."
      }
      \hspace #1.0
    }
  }
}

%%%%
%%%%
%%%%
\markup {
  \bold "Other Martyrs"
}

\markup {
  \large {
    \center-column { Holy Innocents 	}
    \fill-line {
      \hspace #1.0
      \column {
        %\bold \italic "St. Andrew"
        "Praise for Thine infant Martyrs, by Thee with tend'rest love"
        "Called early from the warfare to share the rest above."
        "O Rachel, cease thy weeping; they rest from pains and cares:"
        "Lord, grant us hearts as guileless, and crowns as bright as theirs."
      }
      \hspace #1.0
    }
  }
}

\markup {
  \large {
    \center-column { St. John the Baptist 	}
    \fill-line {
      \hspace #1.0
      \column {
        %\bold \italic "St. Andrew"
        "We praise Thee for the Baptist, Forerunner of the Word,"
        "Our true Elias, making a highway for the Lord."
        "Of prophets last and greatest, he saw Thy dawning ray,"
        "Make us the rather blessèd, who love Thy glorious Day."
      }
      \hspace #1.0
    }
  }
}

\markup {
  \large {
    \center-column { St. Stephen 	}
    \fill-line {
      \hspace #1.0
      \column {
        %\bold \italic "St. Andrew"
        "Praise for the first of Martyrs, who saw Thee ready stand,"
        "To aid in midst of torment, to plead at God's right hand."
        "Share, we with him, if summoned by death our Lord to own,"
        "On earth the faithful witness, in heav'n the martyr-crown."
      }
      \hspace #1.0
    }
  }
}