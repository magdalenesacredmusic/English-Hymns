\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {LUX AETERNA}
    }
    \right-column{
      \line {Gregorian Mode 8}
      \line {Arr. Fr. Samuel Weber}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {}
      \line {}
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
  e8 e fs e d e4 \bar "'"
  a8 gs e fs d e4 \hb
  
  fs8 a \bar "" \break
    fs d e4 e \hb
  e8 cs d e[ fs] fs e4 \bar "||" s1 s1 s1 \bar "" s1 s1 \bar "" \break
  
  e8 fs a a4 a8 a b b a a4 \bar "|"
  fs8 a a a a a a4 \bar "" \break
    gs8 a fs e4 \bar "|"
  fs8 a fs d e4 e \bar "'"
  e8 cs d e8[ fs] fs e4 \bar "||"
}

alto = \relative c' {
  \global
  cs4~ cs4. b4
  cs4. d4 b4
  d4~ d4~ d4 e4~
  e8 cs d~ d4. b4 
    s1 s1 s1 s1 s1
  
  r8 d2 e4.~ e4 cs4~
  cs8 fs4~ fs4.~ fs4
  e4 d8 b4
  
  d2~ d4 e4~
  e8 cs d~ d4. b4
}

tenor = \relative c' {
  \global
  a4~ a4. gs4
  a4.~ a4 gs4
  a4~
    a4~ a4~ a4~
    a8~ a4~ a4. gs4
    s1 s1 s1 s1 s1
    
  r8 a2~ a4. gs4 a4~
  a8 cs4~ cs4.~ cs4~
  cs4 a8 gs4
  
  b2~ b4 a4~
  a8~ a4~ a4. gs4
}

bass = \relative c' {
  \global
 a4~ a4. gs4
 fs4.~ fs4 e4
 d4~
 d4~ d4 cs4~ 
 cs8 fs4 d4. e4
 s1 s1 s1 s1 s1
 r8 d2 cs4. e4 fs4~
 fs8~ fs4~ fs4.~ fs4
 
 cs4 d8 e4
 b2~ b4 cs4~ 
 cs8 fs4 d4. e4
}

verseOne = \lyricmode {
  Let per -- pe -- tu -- al light \set stanza = "*"
  shine up -- on them, O Lord,
  with your saints for ev -- er, for you are mer -- ci -- ful.
  
  \set stanza = "℣." E -- ter -- nal rest grant un -- to them, O Lord,
  and let per -- pe -- tu -- al light shine up -- on them.
  \set stanza = "*"
  With your saints for -- ev -- er, for you are mer -- ci -- ful.

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
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
