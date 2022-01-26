\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {GRACE CHURCH  LM}
    }
    \right-column{
      \line {adapt. from Ignaz Joseph Pleyel (1757-1831)}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Rex Christe, factor omnium"}
      \line {attr. Gregory the Great (540-604); Tr. Ray Palmer (1808-87}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a4 a g |
  f2 e4 |
  f2 g4 |
  a2. |
  c4 c bf | \break
  a2 g4 |
  f2 e4 |
  f2. |
  
  g4 g a |
  bf2 a4 |
  g2 fs4 |
  g2. |
  bf4 bf a |
  d2 c4 |
  bf( a) g |
  f2.

\bar "|."
}

alto = \relative c' {
  \global
  f4 f d |
  c2 c4 |
  c( b) c |
  c2. |
  c4 f e |
  f2 d4 |
  c2 c4 |
  c2. |
  
  c4 d d |
  bf2 ef4 |
  d2 d4 |
  d2. |
  c4 g' f |
  f2 f4 |
  g( f) e |
  f2.
}

tenor = \relative c' {
  \global
  c4 c bf |
  a2 g4 |
  f2 e4 |
  f2. |
  a4 c c |
  c2 bf4 |
  a2 g4 |
  a2. |
  
  e4 g fs |
  g( d') c |
  bf2 a4 |
  bf2. |
  g4 c c |
  bf2 c4 |
  d( c) bf |
  a2.
}

bass = \relative c {
  \global
 f4 f bf, |
 c2 c4 |
 d2 c4 |
 f,2. 
 f'4 a g |
 f2 bf,4 |
 c2 c4 |
 f,2. |
 
 c'4 bf a |
 g2 c4 | 
 d2 d4 |
 g,2.
 e'4 e f |
 bf,2 a4 |
 bf( c) c |
 f2.
}

verseOne = \lyricmode {
  \vOne
O Christ, our King, Cre -- at -- or, Lord,
Sa -- vior of all who trust thy Word,
To them who seek thee ev -- er near,
Now to our prais -- es bend thine ear.
}

verseTwo = \lyricmode {
  \vTwo
In thy dear cross a grace is found
It flows from ev -- 'ry stream -- ing wound,
Whose pow'r our in -- bred sin con -- trols,
Breaks the firm bond, and frees our souls.
}

verseThree = \lyricmode {
  \vThree
Thou didst cre -- ate the stars of night;
Yet thou hast veiled in flesh thy light,
Hast deigned a mor -- tal form to wear,
A mor -- tal's pain -- ful lot to bear.
}

verseFour = \lyricmode {
  \vFour
When thou didst hang up -- on the tree,
The quak -- ing earth ac -- know -- ledged thee;
When thou didst there yield up thy breath,
The world grew dark as shades of death.
}

verseFive = \lyricmode {
  \vFive 
   Now in the Fath -- er's glo -- ry high,
Great Con -- qu'ror, nev -- er -- more to die,
Us by thy might -- y pow'r de -- fend,
And reign through a -- ges with -- out end.
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
