\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {SALVATOR MUNDI DOMINE}
    }
    \right-column{
      \line {Sarum Plainsong, Mode viii}
      \line {Harm. \italic "Hymnal, 1940"}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Salvator mundi Domine"}
      \line {7th cent.; Tr. George Radcliff Woodward (1848-1934)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key a \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  e8 fs e[ d] e fs[ e] a b[ a] a4 \hb 
  a8 e fs \bar "" \break
    a b[ a] b[ cs] b[ a] b4 \bar "|"
  a8 b8[ cs] a[ gs] fs[ e] a[ b] e,8 fs a4 \hb
  gs8[ a] fs[ e d] fs fs[ gs fs] e d e8 e4 \bar "||" \break
  
  e8[ fs e] d4( e) \bar "||"
}

alto = \relative c' {
  \global
  s8 s4. s4. cs8 d4 cs
  e4.~ e4. e4 cs4 d4
  cs8 e2 fs8[ e] fs4 \bar "" \break 
      e8[ d] cs4
  e4 fs8[ e d8]~ d8~ d4 cs b b
  
  cs4. b2
}

tenor = \relative c' {
  \global
  gs8 a4.~ a4. fs8~ fs4 e4 a4.~ a4. gs4 fs4~ fs
  fs8 gs4 a~ a8[ gs] fs4 a4~ a
  e4 a2 b4 s4 fs4 gs
  
  a4.fs4 gs
}

bass = \relative c {
  \global
 e8 d fs4 cs4. fs8 d4 a 
 cs4.~ cs4. e4 fs b,4
 fs'8 e4 cs d8[ e] d4 cs8[ d] <a e'>4
 cs d2 b4 a b e
 
 a,4. b4 e
}

verseOne = \lyricmode {
  \vOne
  O Sa -- vior of the world, whose arm
  Hath kept us safe to -- day from harm,
  De -- fend and bring us, God of might, 
  Safe through the com -- ing hours of night.
}

verseTwo = \lyricmode {
  \vTwo
  Stand, while we sleep, in mer -- cy nigh;
  Lord, heark -- en to thy peo -- ple's cry:
  Thou do our count -- less sins a -- way,
  Thou turn our dark -- ness in -- to day.
}

verseThree = \lyricmode {
  \vThree
  In sleep of death seal not our eyes,
  And let no foe the soul sur -- prise;
  No e -- vil dream dis -- turb our rest,
  No powers of mal -- ice us mo -- lest.
}

verseFour = \lyricmode {
  \vFour
  New strength to wea -- ry limbs im -- part;
  We pray thee, Lord, in hand and heart,
  That free from sin we may a -- rise
  To pay our morn -- ing sac -- ri -- fice.
}

verseFive = \lyricmode {
  \vFive
  All laud to God the Fa -- ther be;
  All praise, E -- ter -- nal Son, to thee;
  All glo -- ry, as is ev -- er meet,
  To God the Ho -- ly Par -- a -- clete.
  
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_layout_ragged.ly"
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
    \include "hymn_layout_ragged.ly"
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
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
