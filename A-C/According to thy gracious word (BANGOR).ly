\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \line {
        Text: James Montgomery (1771-1854)
      }
      \wordwrap {
        Music: BANGOR, CM, Ps. xii in \italic "Harmony of Sion," 1734, William Tans'ur
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {BANGOR  CM}
    }
    \right-column{
      \line {Ps. xii in \italic "Harmony of Sion," 1734}
      \line {William Tans'ur}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {James Montgomery (1771-1854)}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key ef \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 2
  g2 |
  ef4 d c g' |
  c bf8[ af] g4 g |
  g bf g fs |
  g2 \bar ""
  
  g2 |
  c4 b c ef8[ d] |
  c4 bf8[ af] g4 g |
  c g8[ f] ef4 d |
  c2 \bar "|."
}

alto = \relative c' {
  \global
  b2 |
  c4 b c ef |
  ef f ef f |
  ef d ef d8[ c] |
  b2
  
  d |
  c4 f ef ef |
  ef d ef ef |
  ef c c b |
  c2
}

tenor = \relative c {
  \global
  d2 |
  ef4 f g c |
  c c c d |
  c g c a |
  g2
  
  b |
  g4 f g bf |
  af8[ g] f[ bf] bf4 bf |
  c c c,8[ ef] g[ f] |
  ef2
}

bass = \relative c {
  \global
  g2 |
  c4 d ef c'8[ bf] |
  af[ g] f4 c b |
  c bf c d |
  g,2
  
  g'4( f) |
  ef d c g |
  af bf ef ef8[ d] |
  c[ bf] af4 g g |
  c2
}

verseOne = \lyricmode {
  \vOne
  Ac -- cord -- ing to thy gra -- cious word,
  In meek hu -- mil -- i -- ty,
  This will I do, my dy -- ing Lord,
  I will re -- mem -- ber thee.
}

verseTwo = \lyricmode {
  \vTwo
  Thy bod -- y, bro -- ken for my sake,
  My bread from heaven shall be;
  Thy tes -- ta -- men -- tal cup I take,
  And thus re -- mem -- ber thee.
}

verseThree = \lyricmode {
  \vThree
  Geth -- se -- ma -- ne can I for -- get?
  Or there thy con -- flict see,
  Thine a -- go -- ny and blood -- y sweat,
  And not re -- mem -- ber thee?
}

verseFour = \lyricmode {
  \vFour
  When to the cross I turn mine eyes
  And rest on Cal -- va -- ry
  O Lamb of God, my sac -- ri -- fice,
  I must re -- mem -- ber thee:
}

extraVerses =
 \markup {
  \fontsize #1 {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "Remember thee, and all thy pains,"
            "  And all thy love to me;"
            "Yea, while a breath, a pulse remains,"
            "  Will I remember thee."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "And when these failing lips grow dumb,"
            "  And mind and memory flee,"
            "When thou shalt in thy kingdom come,"
            "  Jesus, remember me."
          }
        }
      }
      \hspace #1.0

    }
  }
 }
  
  %%%%%%%
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
      }
    }
    \include "hymn_layout.ly"
  }  
\extraVerses
\markup {
    \vspace #0.5
}
\refs
  %\bottom
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
    \include "hymn_hymnal_layout.ly"
  }    
\extraVerses
\markup {
    \vspace #0.5
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
      \new Lyrics \lyricsto "tune" { \verseFour}
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
}
\extraVerses
\markup {
    \vspace #0.5
}
\refs
}
