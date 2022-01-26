\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \tiny {
  \fill-line {
    \column {
      \line {CREATOR ALME SIDERUM,  LM}
    }
    \right-column{
      \line {\italic "Antiphonale Romanum," Mode I }
      \line {Harm. after Winfred Douglas}
    }
  }
  }
}

bottom = \markup  {
  \tiny {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Vox clara ecce intonat"}
      \line {Tr. John Mason Neale}
    }
  }
}
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  fs8 d fs a b cs b b^- \bar "'"
  a8 b cs d \bar "" \break 
  cs[ a] b cs b4 \once \override ChoirStaff.BarLine.bar-extent = #'( -1 . 1 )
  \bar "|"
  b8 b cs a fs[ a] g fs e^- \bar "'"
  fs8 d fs a b cs b b4 \bar "||" %\break
  
  b8[ cs b] a4( b) \bar "||"
}

alto = \relative c' {
  \global
  s8 d2 e4 d8~
  d8 d4. a'4~ a g~
  g8 fs4.~ fs4 d cs8~
  cs8 d4 fs a fs
  
  e4. cs4 d
}

tenor = \relative c' {
  \global
  a4. fs4 a fs8~
  fs8 fs4. fs8 d'~ d2~
  d8 cs4.~ cs4 b a8~
  a8 b4 cs~ cs d4
  
  g,4. fs4~ fs4
}

bass = \relative c {
  \global
 d4.~ d8[ b8] a4 b8~
 b8 d4. fs4 g2~
 g8 fs4.~ fs4 g a8~
 a8 b4 a fs b
 
 e,4. fs4 b,
 
}

verseOne = \lyricmode {
  \set stanza = "1."
  A thrill -- ing voice by Jor -- dan rings
  Re -- buk -- ing guilt and dark -- some things:
  Vain dreams of sin and vis -- ions fly;
  Christ in his might shines forth on high.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Now let each wear -- y soul a -- rise
  That sunk in guilt and wound -- ed lies;
  See, the new Star's re -- ful -- gent ray
  Shall chase dis -- ease and sin a -- way.
}

verseThree = \lyricmode {
  \set stanza = "3."
  The Lamb de -- scends from heav'n a -- bove
  To par -- don sin with free -- st love:
  For such in -- dul -- gent mer -- cy shown
  With tear -- ful joy our thanks we own.
}

verseFour = \lyricmode {
  \set stanza = "4."
  That when a -- gain he shines re -- vealed
  And tremb -- ling worlds to ter -- ror yield,
  He give not sin its just re -- ward
  But in his love pro -- tect and guard.
}

verseFive = \lyricmode {
  \set stanza = "5."
  To God the Fa -- ther, God the Son, 
  And God the Spir -- it, Three in One,
  Praise, hon -- or, might  and glo -- ry be
  From age to age e -- ter -- nal -- ly.
  
  \set stanza = "5." A -- men.
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
    %\include "hymn_layout_ragged.ly"
    \include "hymn_layout.ly"
  }
  \bottom
}
%%%%%%%%
%%%%%%%%
%%%%%%%%
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
    \include "hymn_hymnal_layout.ly"
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
      \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
