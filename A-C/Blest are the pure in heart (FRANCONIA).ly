\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: John Keble (1792-1866)
      }
      \wordwrap {
        Music: FRANCONIA SM, William Henry Havergal (1793-1870), from a melody by J.B. Konig
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {FRANCONIA   SM}
    }
    \right-column{
      \line {William Henry Havergal (1793-1870)}
      \line {from a melody by J.B. Konig}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {John Keble (1792-1866)}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  e fs g a |
  fs2. a4
  b4 d g, fs |
  e2. \bar ""  \break
  
  a4 |
  d cs b a |
  b b a  a |
  d, fs e e |
  d2.

\bar "|."
}

alto = \relative c' {
  \global
  a4 
  cs d d cs 
  d2. d4 
  d d cs d 
  cs2.
  
  e4 
  d4 e fs cs 
  e e cs cs 
  d d d cs 
  d2.
}

tenor = \relative c {
  \global
  fs4 
  a a g e 
  fs2. fs4
  g a g a 
  a2.
  
  cs4
  a a d a 
  a gs a a
  fs a b a 
  fs2.
}

bass = \relative c {
  \global
 d4
 a d b a 
 d2. d4
 g fs e d 
 a2.
 
 a'4 
 fs a d, fs 
 e e a, a
 b fs g a 
 d2.
}

verseOne = \lyricmode {
  \vOne
  Blest are the pure in heart,
  For they shall see our God,
  The se -- cret of the Lord is theirs,
  Their soul is Christ's a -- bode.
}

verseTwo = \lyricmode {
  \vTwo
  The Lord, who left the heav'ns
  Our life and peace to bring,
  To dwell in low -- li -- ness with men,
  Their Pat -- tern and their King;
}

verseThree = \lyricmode {
  \vThree
  Still to the low -- ly soul
  He doth him -- self im -- part,
  And for his dwell -- ing and his throne
  Choos -- eth the pure in heart.
}

verseFour = \lyricmode {
  \vFour
  Lord, we thy pre -- sence seek;
  May ours this bless -- ing be;
  Give us a pure and low -- ly heart
  A tem -- ple meet for thee.
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
