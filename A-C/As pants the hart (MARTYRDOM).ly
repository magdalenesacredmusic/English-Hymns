%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Psalm 42," Tate and Brady's "New Version of the Psalms," 1696
      }
      \wordwrap {
        Music: MARTYRDOM, CM, Hugh Wilson (1766-1824), 1824
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {MARTYRDOM  CM}
    }
    \column{
      \line {Hugh Wilson, 1824}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Psalm 42"}
      \line {"N. Tate and N. Brady, New Version, 1696"}
    }
  } 
}

global = {
  \key c \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  g2 e4 |
  d2 g8[ a] |
  b2 a4 |
  g2 b4 |
  d2 b4 |
  g2 b4 |
  a2 \bar ""
  
  d4 |
  b2 a4 |
  g2 b4 |
  c2 b4 |
  a2 b4 |
  d,( e) g8[ a] |
  b2 a4 |
  g2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  d2 c4 |
  b2 d8[ e] |
  d2 d8[ c] |
  b2 d4 |
  d2 d4 |
  e2 d4 |
  d2 
  
  a'4 |
  a4( g) fs |
  g2 f4 |
  e2 d8[ e] |
  fs2 g4 |
  d( c) b8[ c] |
  d2 d8[ c] |
  b2
}

tenor = \relative c' {
  \global
  \partial 4 
  b4 |
  g2 g4 |
  g2 g4 |
  g( e) fs |
  g2 g4 |
  a2 g4 |
  b2 g4 |
  fs2
  
  d'4 |
  d2 d4 |
  b2 d4 |
  g,4.( a8) b8[ c] |
  d2 d4 |
  g,2 g4 |
  g( e) fs |
  g2
}

bass = \relative c {
  \global
  \partial 4
  g4 |
  b2 c4 |
  g4.( a8) b8[ c] |
  d2 d4 |
  g,2 g'4 |
  fs2 g4 |
  e2 b8[ c] |
  d2 
  
  fs4 |
  g2 d4 |
  e2 d4 |
  c2 g'4 |
  d2 g,4 |
  b( c) e |
  d2 d4 |
  g,2
}


verseOne = \lyricmode {
  \set stanza = "1."
  As pants the hart for cool -- ing streams
  When heat -- ed in the chase,
  So longs my soul, O God, for thee,
  And thy re -- fresh -- ing grace.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  For thee, my God, the liv -- ing God,
  My thirst -- y soul doth pine:
  O when shall I be -- hold thy face,
  Thou Ma -- jes -- ty Div -- ine!
}

verseThree = \lyricmode {
  \set stanza = "3."
  Why rest -- less, why cast down, my soul?
  Hope still, and thou shalt sing
  The praise of him who is thy God,
  Thy health's e -- ter -- nal spring.
}

verseFour = \lyricmode {
  \set stanza = "4."
  To Fath -- er, Son, and Ho -- ly Ghost,
  The God whom we a -- dore,
  Be glo -- ry, as it was, is now,
  And shall be ev -- er -- more. 
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  %\top
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
        tempoWholesPerMinute = #(ly:make-moment 84 4)
      }
    }
    \include "hymn_layout.ly"
  }
  %\bottom
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
      %\new Lyrics \lyricsto soprano \verseFive
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
  %\top
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
  %\bottom
  \refs
}
