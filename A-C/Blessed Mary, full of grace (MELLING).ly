\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Anonymous
      }
      \wordwrap {
        Music: MELLING, 77 77, John Fawcett in \italic "A new set of Sacred Music," 1822; Harm. Geoffrey Shaw (1879-1943)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {MELLING   77 77}
    }
    \right-column{
      \line {John Fawcett in \italic "A new set of Sacred Music," 1822}
      \line {Harm. Geoffrey Shaw (1879-1943)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Anon.}
      \line {}
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

melody = \relative c'' {
  \global
  g4 d g8[ a b] c |
  b4 a g2 |
  a4 b8[ g] e4 a8[ g] |
  fs4 e d2 |
  
  g4 g8[ a] b[ g] e[ fs] |
  g[ a] b[ g] a2 |
  b8[ d] c[ e] d4. c8 |
  b4 a g2  \bar "|."
}

alto = \relative c' {
  \global
  d4 d e8[ fs g] g |
  g4 fs g2 |
  fs4 d cs d8[ e] |
  d4 cs d2 |
  
  d4 e d e8[ d] |
  d4. cs8 d2 |
  d4 fs g4. a8 |
  g4 fs d2
}

tenor = \relative c' {
  \global
  b4 a b8( d4) e8 |
  d4 d b2 |
  d4 b a a8[ b] |
  a4 a fs2 |
  
  g4 c b g8[ a] |
  b[ a] g4 g4( fs) |
  d'8[ b] c4 b8.[ c16 d8] e8 |
  d4 d b2
}

bass = \relative c' {
  \global
  g4 fs e8[ d g] c, |
  d4 d g,2 |
  d'4 g a8[ g] fs[ g] |
  a4 a, d2 |
  
  b4 c g c |
  b e d2 |
  g4 a b8.[ a16 b8] c |
  d4 d, g2
}

verseOne = \lyricmode {
  \vOne
  Bless -- èd Mar -- y, full of grace,
  Gaz -- ing in -- to Je -- sus' face:
  O! That I his face may see,
  Moth -- er Mar -- y, pray for me.
}

verseTwo = \lyricmode {
  \vTwo
  Bless -- èd Mar -- y, far a -- bove,
  Us poor sin -- ners in thy love;
  O! That I might love like thee,
  Moth -- er Mar -- y, pray for me.
}

verseThree = \lyricmode {
  \vThree
  Bless -- èd Mar -- y, un -- de -- filed,
  Sleep -- ing may I be thy child,
  Pure and ho -- ly may I be,
  Moth -- er Mar -- y, pray for me.
}

verseFour = \lyricmode {
  \vFour
  Bless -- èd Mar -- y, when I wake,
  Guard my thoughts for Je -- sus' sake,
  That of him my first may be,
  Moth -- er Mar -- y, pray for me.
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
            "Blessèd Mary, thou didst show,"
            "  Patience under blame and woe."
            "That, I too, may silent be,"
            "  Mother Mary, pray for me."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "Blessèd Mary, borne to rest,"
            "  On thy Son and Savior's breast;"
            "Till his welcome I shall see,"
            "  Mother Mary, pray for me."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}

%%%%
%%%%%
%%%%%%

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  %\top
  \score { \transpose c bf,
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
 \extraVerses
 \markup {
   \vspace #0.5
 }
  %\bottom
  \refs
}

%%%%%%
%%%%%%
%%%%%%
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
 % \top
  \score {
    \transpose c bf,
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
  %\bottom
  \refs
 % \bottom
}
