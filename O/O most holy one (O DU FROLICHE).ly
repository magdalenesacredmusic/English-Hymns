\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {O DU FRÖLICHE  }
    }
    \right-column{
      \line {Traditional German Melody}
      \line {Harm. Healey Willan, 1958 }
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Tr. James Martin Raker (1864-1947)}
    }
  } 
}

%{ Text from the St. Gregory Hymnal. 
"Rev. J. M. Raker, formerly a minister of the Protestant Episcopal Church, 
was ordained to the priesthood on December 22 in St. Joseph's Cathedral, 
La Crosse, Wisconsin, United States, by Bishop Schwebach, 
and celebrated his first High Mass there on Christmas Day."  
https://paperspast.natlib.govt.nz/periodicals/NZT19120425.2.17 %}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a2 b |
  a4. g8 fs4( g) |
  a2 b |
  a4. g8 fs4( g) |
  a2 a |
  b cs4 d |
  cs2( b) |
  a1 |
  e4.( fs8) e4 fs |
  g4.( a8) g2 |
  fs4.( g8) fs4 g |
  \set melismaBusyProperties = #'() a4.( b8) a2 |
  \unset melismaBusyProperties d4( cs) b( a) |
  d( b) a4 g |
  fs2( e) |
  d1 \bar "|."
}

alto = \relative c' {
  \global
  fs2 g |
  fs4. e8 d4( e) |
  fs2 g |
  e4. e8 d4( e) |
  fs2 e |
  e e4 d |
  e2( gs) |
  e1 |
  cs4.( d8) cs4 d |
  e4.( fs8) e2 |
  d4.( e8) d4 e |
  fs4.( g8) fs4( g) |
  a2 g4( e) |
  d( g) fs d |
  d2( cs) |
  d1
}

tenor = \relative c' {
  \global
  d2 d |
  d4. a8 a2 |
  d d |
  cs4. cs8 a2 |
  a a |
  gs a4 a |
  a2( d) |
  cs1 |
  
  a2 a4 a |
  a2 a |
  a2 a4 a |
  a2 a4( cs) |
  d( a) b( cs) |
  d2 d4 b |
  a2( g) |
  fs1
}

bass = \relative c {
  \global
  d2 d |
  d4. d8 d2 |
  d g |
  a4. a8 d,2 |
  d cs |
  e a4 fs |
  e2~ e |
  a,1 |
  
  a2 a4 a |
  a2 b4( cs) |
  d2 d4 d |
  d2 d4( e) |
  fs2 g4( a) |
  b4( g) d g |
  a2( a,) |
  d1
}

verseOne = \lyricmode {
  \vOne
  O most ho -- ly one,
  O most low -- ly one,
  Dear -- est Vir -- gin \override Lyrics.LyricText.font-shape = #'italic Ma -- ri -- a!
  
  \revert Lyrics.LyricText.font-shape
  Moth -- er of fair Love,
  Home of the Spir -- it Dove, 
  \override Lyrics.LyricText.font-shape = #'italic O -- ra, o -- ra pro no -- bis.
}

verseTwo = \lyricmode {
  \vTwo
  Help in sad -- ness drear,
  Port of glad -- ness near,
  Vir -- gin Moth -- er, \override Lyrics.LyricText.font-shape = #'italic Ma -- ri -- a!
  
  \revert Lyrics.LyricText.font-shape
  Let us not lan -- guish,
  Heal thou our an -- _ guish,
  \override Lyrics.LyricText.font-shape = #'italic O -- ra, o -- ra pro no -- bis.
}

verseThree = \lyricmode {
  \vThree
  Call we fear -- ful -- ly,
  Sad -- ly, tear -- ful -- ly,
  Save us now 	\override Lyrics.LyricText.font-shape = #'italic O Ma -- ri -- a!
  
  \revert Lyrics.LyricText.font-shape
  Let us not lan -- guish, 
  Heal thou our an -- _ guish,
  \override Lyrics.LyricText.font-shape = #'italic O -- ra, o -- ra pro no -- bis.
}

verseFour = \lyricmode {
  \vFour
  Moth -- er, Maid -- en fair,
  Look with lov -- ing care,
  Hear our prayer, \override Lyrics.LyricText.font-shape = #'italic O Ma -- ri -- a!
  
  \revert Lyrics.LyricText.font-shape
  Our sor -- row feel -- ing,
  Send us thy heal -- _ ing,
  \override Lyrics.LyricText.font-shape = #'italic O -- ra, o -- ra pro no -- bis.
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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
      }
    }
    \include "hymn_layout.ly"
  }
  \bottom
}

%%%%%
%%%%%
%%%%%
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
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
