\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {TEMPLE  66 84}
    }
    \right-column{
      \line {Henry Walford Davies (1869-1941)}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Greek, c. 8th cent.}
      \line {Tr. John Brownlie (1857-1925)}
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
  a'4. a8 b4 fs |
  a2. a4 |
  cs a gs4. fs8 |
  fs2.  \bar "" \break
  
  fs4 |
  g a b cs |
  \time 3/4 d( cs) b |
  d( a) fs8[ g] |
  \time 3/2 a4 a b2( a) \bar "|."
}

alto = \relative c' {
  \global
  d4 |
  a'4. a8 <d, fs>2 |
  <cs fs>2. fs4 |
  fs fs es4. cs8 |
  cs2. 
  
  d4 cs d g fs8[ e] |
  d8[( e] fs4) g a2 fs8[ e] |
  d4 <d fs> fs1 
}

tenor = \relative c {
  \global
  d4 |
  a'4. a8 b4 fs |
  a2. cs4 |
  cs cs cs4. a8 |
  a2. 
  
  a4 |
  g fs d' cs |
  b( cs) d |
  d2 a8[ g] |
  fs4 a d1
}

bass = \relative c {
  \global
 d4 |
 a'4. a8 <b, fs'>2 |
 <fs cs' fs>2. fs'4 |
 a fs cs4. fs8 |
 fs2. 
 
 d4 |
 e fs g a |
 b( a) g |
 fs2 d8[ e] |
 fs4 d b2( d)
}

verseOne = \lyricmode {
  \vOne
  O King en -- throned on high,
  Thou Com -- for -- ter di -- vine,
  Blest Spir -- it of all truth, be nigh
  And make us thine.
}

verseTwo = \lyricmode {
  \vTwo
  Thou art the Source of life,
  Thou art our trea -- sure -- store;
  Give us thy peace, and end our strife
  For ev -- er -- more.
}

verseThree = \lyricmode {
  \vThree
  Des -- cend, O heav'n -- ly Dove,
  A -- bide with us al -- way;
  And in the full -- ness of thy love
  Cleanse us, we pray.
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
      %\new Lyrics \lyricsto soprano \verseFour
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
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
     % \new Lyrics \lyricsto soprano \verseFour
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
      %\new Lyrics \lyricsto "tune" { \verseFour}
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
