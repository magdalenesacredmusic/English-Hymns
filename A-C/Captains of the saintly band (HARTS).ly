\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Caelestis aulae principes," J.-B. de Santeuil, (1630-97); Tr. Henry W. Baker (1821-77)
      }
      \wordwrap {
        Music: HARTS, 77 77; Benjamin Milgrove (1731-1810)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {HARTS, 77 77}
    }
    \right-column{
      \line {Benjamin Milgrove (1731-1810)}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Caelestis aulae principes"}
      \line {J.-B. de Santeuil, (1630-97); Tr. Henry W. Baker}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d4 d g g 
  a4 a b2
  g4 g c b8[ a] 
  g8.[ a16] b4 a2
  d4. d8 b4 b 
  c4. c8 a2
  b8.[ c16 b8] c8 d4 c 
  b a g2 \bar "||"
  
  g2 g \bar "|."
}

alto = \relative c' {
  \global
  b4 b d d 
  e d d2
  d4 b e d 
  d d d2
  fs8.[ e16 fs8] d g4 g 
  e8.[ d16 e8] c d2
  d4. e8 g4 e
  d d8.[ c16] b2
  
  c2 b
}

tenor = \relative c' {
  \global
  g4 g g b8[ g]
  g4 fs g2
  g4 g g fs 
  g g fs2
  b4. b8 g4 g 
  a4. a8 fs2
  g8.[ a16 g8] g d'4 g,
  g fs g2
  
  e2 d
}

bass = \relative c {
  \global
  g4 g b g 
  c d g,2
  b4 e a, d8[ c] 
  b8.[ a16 g8] b d2
  b8.[ c16 d8] b e4 e 
  a,8.[ b16 c8] a d2
  g4. e8 b4 c
  d d g,2
  
  c2 g
}

verseOne = \lyricmode {
  \vOne
  Cap -- tains of the saint -- ly band,
  Lights who light -- en ev -- 'ry land,
  Prin -- ces who with Je -- sus dwell,
  Jud -- ges of his Is -- ra -- el.
}

verseTwo = \lyricmode {
  \vTwo
  One the na -- tions sunk in night
  Ye have shed the Gos -- pel light;
  Sin and er -- ror flee a -- way;
  Truth re -- veals the prom -- ised day.
}

verseThree = \lyricmode {
  \vThree
  Not by war -- rior's spear and sword,
  Not by art of hu -- man word,
  Preach -- ing but the Cross of shame,
  Re -- bel hearts for Christ ye tame.
}

verseFour = \lyricmode {
  \vFour
  Earth, that long in sin and pain
  Groaned in Sa -- tan's dead -- ly chain,
  Now to serve its God is free
  In the law of li -- ber -- ty.
  
  \set stanza = "6." A -- men.
}

extraVerses =
    \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "Distant lands with one acclaim"
            "Tell the honor of your name,"
            "Who, wherever man has trod,"
            "Teach the mysteries of God."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "Glo -- ry to the Three in One"
            "While eternal ages run,"
            "Who from deepest shades of night"
            "Called us to his glorious light.  Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
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
  \extraVerses
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}
