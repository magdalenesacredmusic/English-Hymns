\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Anonymous, \italic "Hymns for the Bestivals and Saints' Days of the Church of England," 1846
      }
      \wordwrap {
        Music: SWABIA  SM, J.M. Spiess, 1745; arr. W.H. Havergal, 1847
      }
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

melody = \relative c'' {
  \global
  \partial 4
  a4 |
  fs g e e |
  d2. e4 |
  fs8[ gs] a4 a gs |
  a2. \bar "" \break

  a4 |
  b a b cs |
  d d d \breathe a4 |
  g fs e e |
  d2. \bar "||" \break
  \cadenzaOn
  d2 d2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  fs4 |
  d d d cs |
  d2. cs4 |
  d e8[ fs] e4 e |
  e2.

  fs4 |
  g fs g g |
  fs g fs fs |
  e d d cs |
  d2.
  b2 a2
}

tenor = \relative c' {
  \global
  \partial 4
  d4 |
  a b a a |
  fs2. a4 |
  a cs b b |
  cs2.

  d4 |
  d4 d d e |
  d b a d |
  b8[ cs] d4 a a |
  fs2.
  g2 fs2
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  d g, a a |
  b2. a4 |
  d cs8[ d] e4 e |
  a,2.

  d4 |
  g4 d g e |
  b' g d d |
  e fs8[ g] a4 a, |
  d2.
 g,2 d'2
}

verseOne = \lyricmode {
  \vOne
Praise we the Lord this day,
This day so long fore -- told,
Whose prom -- ise shone with cheer -- ing ray
On wait -- ing saints of old.
}

verseTwo = \lyricmode {
  \vTwo
The pro -- phet gave the sign
For faith -- ful men to read;
A vir -- gin born of Da -- vid's line
Shall bear the prom -- ised seed.
}

verseThree = \lyricmode {
  \vThree
Ask not how this sould be,
But wor -- ship and a -- dore,
Like her whom hea -- ven's Ma -- jes -- ty
Came down to sha -- dow o'er.
}

verseFour = \lyricmode {
  \vFour
Meek -- ly she bowed her head
To hear the gra -- cious word,
Ma -- ry, the pure and low -- ly maid,
The fa -- vored of the Lord.

\vOff
\set stanza = "6."
A -- men.
}

verseFive = \lyricmode {
  \vFive
Bless -- ed shall be her name
In all the Church on earth,
Through whom that won -- drous mer -- cy came,
The_in -- car -- nate Sa -- vior's birth.
}

verseSix = \lyricmode {
  \vSix
  Je -- sus, the Vir -- gin's Son,
  We praise thee and a -- dore,
  Who art with God the Fa -- ther One
  And Spir -- it ev -- er -- more.
  A -- men.
}

extraVerses =
  \markup {
    \vspace #1
  \fontsize #0.2 {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "Blessed shall be her name"
"In all the Church on earth,"
"Through whom that wondrous mercy came,"
"The_incarnate Savior's birth."
          }
        }
  \vspace #1
        \line {
          \bold "6. "
          \column {
            "Jesus, the Virgin's Son,"
  "We praise thee and adore,"
  "Who art with God the Father One"
  "And Spirit evermore.   Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
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
      % \new Lyrics \lyricsto soprano \verseFive
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
    \include "hymn_layout_ragged.ly"
  }
 
\extraVerses
\markup {
  \vspace #0.5
}

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
      % \new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \include "hymn_hymnal_layout_ragged.ly"
  }    
\extraVerses
\markup {
  \vspace #0.5
}
  \refs
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
      % \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup { 
    \vspace #0.5 
  }
\extraVerses
\markup {
  \vspace #0.5
}

  \refs
}
