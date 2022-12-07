\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: John Cennick (1718-55)
      }
      \wordwrap {
        Music: John Fawcett in \italic "A new set of Sacred Music," 1822; Harm. Geoffrey Shaw (1879-1943)
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
      \line {John Cennick (1718-55)}
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
  Chil -- dren of the heav'n -- ly King,
  As ye jour -- ney sweet -- ly sing;
  Sing your Sa -- vior's wor -- thy praise,
  Glo -- rious in his works and ways.
}

verseTwo = \lyricmode {
  \vTwo
  We are travell -- ing home to God,
  In the way the fa -- ther's trod;
  They are hap -- py now, and we
  Soon their hap -- pi -- ness shall see.
}

verseThree = \lyricmode {
  \vThree
  Fear not, breth -- ren; joy -- ful stand
  On the bord -- ers of your land:
  Je -- sus Christ your Fa -- ther's Son,
  Bids you un -- dis -- mayed go on.
}

verseFour = \lyricmode {
  \vFour
  Lord, o -- be -- dient -- ly we go,
  Glad -- ly leav -- ing all be -- low:
  On -- ly thou our Lead -- er be
  And we still will fol -- low thee.
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
  % \bottom
  \refs
}
