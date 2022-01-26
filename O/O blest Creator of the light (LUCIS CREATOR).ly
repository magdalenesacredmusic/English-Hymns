\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {LUCIS CREATOR, LM}
    }
    \right-column{
      \line {Sarum Plainsong, Mode VIII}
      \line {Harm. \italic "Hymnal, 1940"}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Lucis Creator optime"}
      \line {6th cent.; Tr. John Mason Neale}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f8[( g] f4) ef8 g[ bf] bf f g[ f] ef[ f] f4 \hb
  f8[ c'] c[ d c] bf \bar "" \break
  
  bf8[ a] g bf[ a] g[ f] f8[( g] f4) \bar "|"
  c8 c8[ ef d] ef[ f] f[ g] f[ ef] \bar "" \break
  
  f8 f8[ g] g4 \hb 
  bf8 bf8[ c bf] g af[ g] f g[ f] ef[ f] f4 \bar "||"
  f8[ g f] ef4( f) \bar "||"
}

alto = \relative c' {
  \global
  a2 bf4.~ <bf f'>4~ bf4 c4~ c
  c4 f4. d8
  f4 ef8 d2 c4 d4
  a8 g4. f4 bf4. c8
  
  a4. bf4
  d8 ef2 c4.~ c2~ c4
  d4. c4~ c
}

tenor = \relative c {
  \global
  s2 s4 s8 s4 ef8[ f] g4 a
  a~ a4. s8
  
  s4. f4 g a bf
  s8 s4. s4 s4. s8
  
  d,4.~ d4
  g8~ g2 f4. ef8[ f] g4 a
  
  bf4. g4 a4
}

bass = \relative c, {
  \global
 f2 g4 g'8 d4 ef4 c f
 a f4. g8
 d4 ef8 bf2~ bf
 f'8 c4.~ c4 d4. c8
 d4. g,4
 
 g'8 ef2 f4 af,8 c2
 f,4
 
 bf4. c4 f,
}

verseOne = \lyricmode {
  \vOne
  O blest Cre -- a -- tor of the light,
  Who mak'st the day with ra -- diance bright,
  And o'er the form -- ing world didst call
  The light from cha -- os first of all;
}

verseTwo = \lyricmode {
  \vTwo
  Whose wid -- dom joined in meet ar -- ray
  The morn and eve, and named them day:
  Night comes wiht all its dark -- ling fears;
  Re -- gard thy peo -- ple's prayers and tears,
}

verseThree = \lyricmode {
  \vThree
  Lest, sunk in sin, and whelm'd with strife,
  They lose the gift of end -- less life;
  While think -- ing but the thoughts of time,
  They weave new chains of woe and crime.
}

verseFour = \lyricmode {
  \vFour
  But grant them grace that they may strain
  The heav'n -- ly gate and prize to gain:
  Each harm -- ful lure a -- side to cast,
  And purge a -- way each er -- ror past.
}

verseFive = \lyricmode {
    \vFive
    O Fa -- ther, that we aks be done,
    Through Je -- sus Christ, thine on -- ly Son;
    Who, with the Ho -- ly Ghost and thee,
    Doth live and reign e -- ter -- nal -- ly.
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
      \new Lyrics \lyricsto soprano \verseFive
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
      \new Lyrics \lyricsto soprano \verseFive
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
       \new Lyrics \lyricsto "tune" { \verseFive }
    >>
   
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
