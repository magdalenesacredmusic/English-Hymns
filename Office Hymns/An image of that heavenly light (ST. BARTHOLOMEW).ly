\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {ST. BARTHOLOMEW, LM}
    }
    \right-column{
      \line {Henry Duncalf, c. 1762}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Caelestis formam gloriae"}
      \line {15th cent.; Tr. Richard Ellis Roberts (1879-1953)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  f4
  bf2 f4 
  c'2 f,4 
  d'4( c) bf
  c2 f,4
  bf2 a4 
  g2 f4
  g( f) e 
  f2 \bar ""
    a4 
  bf4.( a8) g4
  d'2 d,4 
  ef4.( d8) ef4
  d2 f4
  bf( f) g
  f( ef) d
  c'( bf) a 
  \time 2/4 bf2 \bar "||"
  
  \time 4/4 bf2 bf2  \bar "|."
}

alto = \relative c' {
  \global
  d4
  f2 f4
  f2 f4
  f2 e4
  f2 f4
  e2 f4
  d2 f4 
  d( c) c 
  a2
    d4
  d2 d4 
  d2 d4
  c2 a4
  bf2 c4
  f2 ef4
  bf( a) bf
  c( d) ef
  d2
  
  ef2
  d
}

tenor = \relative c' {
  \global
  bf4 
  d2 d4
  c2 c4
  bf4( c) g 
  a2 c4
  bf2 c4
  d2 c4
  bf( a) g 
  f2
    fs4
  g4.( a8) bf4
  a2 bf4
  g2 f4
  f2 a4
  bf2 bf4
  f2 f4
  g( f) c'
  bf2
  
  g2
  f
}

bass = \relative c {
  \global
 bf4
 bf'2 bf4
 a2 a4
 bf( a) g
 f2 a,4
 g2 f4
 bf2 a4
 bf( c) c 
 f2
   d4
 g2 g4
 fs2 g4
 c,2 f4
 bf,2 f'8.[ ef16]
 d2 ef4
 d4( c) bf
 ef f2
 bf,2
 
 ef2
 bf
}


verseOne = \lyricmode {
  \vOne
  An im -- age of that heav'n -- ly light,
  The goal the Church keeps ay in -- sight,
  Christ on the ho -- ly mount dis -- plays
  Where he out -- shines the sun's bright rays.
}

verseTwo = \lyricmode {
  \vTwo
  Let ev -- 'ry age pro -- claim -- er be
  How, on this day, the cho -- sen three
  With Mo -- ses and E -- li -- as heard
  The Lord speak man -- y~a gra -- cious word
}

verseThree = \lyricmode {
  \vThree
  As wit -- ness -- es to grace are nigh
  Those twain, the Law and Pro -- phe -- cy;
  And to the Son, from out the cloud,
  The Fa -- ther's re -- cord thun -- ders loud.
}

verseFour = \lyricmode {
  \vFour
  With gar -- ments whit -- er than the snows,
  And shin -- ing face, Lord Je -- sus shows
  What glo -- ry for those saints shall be
  Who joy in God wiht pi -- e -- ty.
  
  \set stanza = "6." A -- men.
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_layout.ly"
  }
   \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "The vision and the mystery"
            "Make faithful hearts beat quick and high,"
            "So on this solemn day of days"
            "The cry goes up of prayer and praise."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "O God the Father, God the Son,"
            "And Holy Spirit, Three in One,"
            "Vouchsafe to bring us, by thy grace,"
            "To see thy glory face to face.   Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
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
