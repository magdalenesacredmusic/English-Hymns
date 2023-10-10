\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Dignare me, O Jesu, rogo te," 17th cent.; Tr. Henry W. Baker (1821-1877)
      }
      \wordwrap {
        Music: SONG 13, 77 77, Orlando Gibbons (1583-1625), original melody and bass
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {SONG 13   77 77}
    }
    \right-column{
      \line {Orlando Gibbons (1583-1625)}
      \line {original melody and bass}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Dignare me, O Jesu, rogo te"}
      \line {17th cent.; Tr. Henry W. Baker (1821-1877)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key ef \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  b4\rest g2 af4 \bar "|"
  bf c f,4. ef8 \bar "|"
  g2  \bar "|"
  
  b4\rest bf2 c4 |
  d ef c c \bar "|"
  bf2 \bar "|"
  
  b4\rest g2 af4 \bar "|"
  bf4 c af g \bar "|"
  f2 \bar "|"
  
  b4\rest bf2 af8[ g] \bar "|"
  f4 ef8.[ f32 g] f4 f \bar "|"
  ef2

\bar "|."
}

alto = \relative c' {
  \global
  s4 ef2 ef4 |
  d ef ef d |
  ef2
  
  s4 ef2 ef4 |
  d g f4. ef8 |
  d2
  
  s4 ef2 ef4 |
  d c df8[ c] bf[ ef] |
  d2 
  
  s4 ef2 ef4 |
  d ef ef d |
  ef2
}

tenor = \relative c' {
  \global
  s4 bf2 ef,4 |
  f af8[ g] f4 bf 
  bf2
  
  s4 g2 a4 |
  bf bf bf a |
  bf2
  
  s4 bf2 ef,8[ f] 
  g4 af f g8[ af]
  bf2
  
  s4 bf2 c4 
  f, g bf4. af8 
  g2
}

bass = \relative c {
  \global
 d4\rest ef2 c4 
 bf af bf bf 
 ef2
 
 d4\rest ef2 c4
 bf ef f f 
 bf,2
 
 d4\rest ef2 c4 
 bf af df ef
 bf2
 
 s4 g2 af4 
 bf ef bf bf
 ef2
}

verseOne = \lyricmode {
  \vOne
  Je -- sus, grant me this, I pray,
  Ev -- er in thy heart to stay;
  Let me ev -- er -- more a -- bide
  Hid -- den in thy wound -- ed side.
}

verseTwo = \lyricmode {
  \vTwo
  If the e -- vil one pre -- pare,
  Or the world, a tempt -- ing snare,
  I am safe when I a -- bide
  In thy heart and wound -- ed side.
}

verseThree = \lyricmode {
  \vThree
  If the flesh, more dan -- grous still,
  Tempt my soul to deeds of ill,
  Naught I fear when I a -- bide
  In thy heart and wound -- ed side.
}

verseFour = \lyricmode {
  \vFour
  Death will come one day to me;
  Je -- sus, cast me not from thee:
  Dy -- ing let me still a -- bide
  In thy heart and wound -- ed side.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
  \score { %\transpose c bf,
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
  \score { %\transpose c bf,
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
  \refs
}