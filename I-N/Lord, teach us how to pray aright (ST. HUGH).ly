\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: James Montgomery (1771-1854)
      }
      \wordwrap {
        Music: ST. HUGH, CM, Edward John Hopkins (1818-1901) 
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {ST. HUGH  CM}
    }
    \right-column{
      \line {E. J. Hopkins (1818-1901)}
      \line {}
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

melody = \relative c' {
  \global
  \partial 4
  ef4 |
  ef f g ef |
  bf' f g g |
  af c bf ef, |
  f2. \bar "" \break
  
  bf4 |
  ef d c bf |
  af g f c' |
  bf ef, f4. f8 |
  ef2. \bar "|."
}

alto = \relative c' {
  \global
  bf4 |
  c bf bf ef |
  ef4. d8 ef4 ef |
  ef d ef ef |
  d2.
  
  d4 |
  ef g g ef |
  ef ef ef d |
  ef ef ef d |
  ef2.
}

tenor = \relative c' {
  \global
  g4 |
  af af g g |
  g af g bf |
  af af bf4. a8 |
  bf2.
  
  af4 |
  g b c g |
  af bf c f, |
  bf4 g f af |
  g2.
}

bass = \relative c {
  \global
 ef4 |
 c d ef c |
 bf bf ef df |
 c f g c, |
 bf2.
 
 bf4 |
 c d ef df |
 c bf a bf |
 g4 c af bf |
 ef2.
}

verseOne = \lyricmode {
  \vOne
  Lord, teach us how to pray a -- right
  With rev -- 'rence and with fear;
  Though dust and ash -- es in thy sight,
  We may, we must draw near.
}

verseTwo = \lyricmode {
  \vTwo
  We per -- ish if we cease from prayer;
  O grant us power to pray;
  And when to meet thee we pre -- pare,
  Lord, meet us by the way.
}

verseThree = \lyricmode {
  \vThree
  God of all grace, we come to thee
  With bro -- ken con -- trite hearts;
  Give, what thine eye de -- lights to see,
  Truth in the in -- ward parts;
}

verseFour = \lyricmode {
  \vFour
  Faith in the on -- ly sac -- ri -- fice
  That can for sin a -- tone;
  To cast our hopes, to fix our eyes,
  On Christ, on Christ a -- lone;
}

extraVerses = 
   \markup {
  \fontsize #0.2 {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "Patience to watch, and wait and weep"
            "  Though mercy long delay;"
            "Courage our fainting souls to keep,"
            "  And trust thee though thou slay."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "Give these, and then thy will be done;"
            "  Thus, strengthened with all might,"
            "We, through thy Spirit and thy Son,"
            "  Shall pray, and pray aright."
          }
        }
      }
      \hspace #1.0

    }
  }
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
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
  %  \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
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
  \extraVerses
  \markup {
    \vspace #0.5
  }
  \refs
}