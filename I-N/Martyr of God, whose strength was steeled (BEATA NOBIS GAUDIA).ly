\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {BEATA NOBIS GAUDIA}
    }
    \right-column{
      \line {Sarum Plainsong, Mode I}
      \line {Harm. David O'Donnell, 2022}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Martyr Dei qui unicum"}
      \line {c. 10th cent.; Tr. Percy Dearmer}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key af \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  ef8[ f] f[ c'^- df] c8 c c8[ bf] bf[ c] bf bf4( af) \hb
  c8 \bar "" \break c bf af8[ g] f g[ af] f[ ef] ef4( f) \bar "|"
  c8 ef8[ f] f f[ af] af[ f] g8 f ef4 \hb
  bf'8 bf af bf8[ c bf] g[ f] g[ af] f[ ef] ef4( f) \bar "||"
  
  f8[ g f] ef4( f) \bar "||"
}

alto = \relative c' {
  \global
  c4 f2 ef4.~ ef4.~ ef4 c4.
  ef4 f4. ef4 df bf af4.
  c4.~ c2 ef2
  ef4 c8 ef4.~ ef8[ c] ef4 df4 c2
  
  d4. c4~ c
}

tenor = \relative c' {
  \global
  af4~ af2~ af4. g4.~ g4 f4.
  af4 c8[ bf af] c4 af ef4 c4.
  af'4.~ af2 bf8[ af] g4
  g4 f8 g4. bf8[ af] c4 af4 g4 af
  
  bf4. g4 af
}

bass = \relative c' {
  \global
 af4 f2 c4.~ c4. ef4 f4.
 af4 f4. c4 df4 g, f4.
 af'4. f2 ef2
 ef4 f8 ef4.~ ef8[ f8] c4 df4 c4 f,
 
 bf4. c4 f
}

verseOne = \lyricmode {
  \vOne
  Mar -- tyr of God, whose strength was steeled
  To fol -- low close God's on -- ly Son,
  Well didst thou brave thy bat -- tle -- field,
  And well thy heav'n -- ly bliss was won!
}

verseTwo = \lyricmode {
  \vTwo
  Now join thy prayers with ours, who pray
  That God may par -- don us and bless;
  For prayer keeps e -- vil's plague a -- way,
  And draws from life its wear -- i -- ness.
}

verseThree = \lyricmode {
  \vThree
  Long, long a -- go, were loosed the chains
  That held thy bod -- y once in thrall;
  For us how man -- y~a bond re -- mains!
  O Love of God re -- lease us all.
}

verseFour = \lyricmode {
  \vFour
  All praise to God the Fa -- ther be,
  All praise to thee, e -- ter -- nal Son;
  All praise, O Ho -- ly Ghist, to thee,
  While nev -- er -- end -- ing a -- ges run.
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
  \bottom
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Hymnal")
\book {
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  \top
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
      \new Lyrics \lyricsto "tune" { \verseFour}
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
