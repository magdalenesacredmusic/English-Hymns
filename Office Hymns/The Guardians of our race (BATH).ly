\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {BATH  66 66 66 8}
    }
    \right-column{
      \line {\italic "Harmonia Perfecta," 1730}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Custodes hominum psallimus Angelos"}
      \line {Robert Bellarmine (1542-1621), Tr. Thomas Isaac Ball (1838-1916) }
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  c |
  c d e fs |
  g2. g4 |
  a g a b |
  c2. \bar "" \break d4 |
  c b a g |
  fs2. g8[ a] |
  b4 a8[ g] g4 fs |
  g2. \bar "" \break b4 |
  c c d d |
  e2. \bar ""  c4 |
  c b a b8[ c] |
  d4 c b c8[ d] |
  e4 d8[ c] c4 b |
  \time 3/4 c2. \bar "||" %\break

  \time 4/4 c2 c2
\bar "|."
}

alto = \relative c' {
  \global
  g4 
  g d' c c 
  d2. c4 
  c g' f d 
  e2. d4
  e d cs cs 
  d2. b4
  d e d4. c8 
  b2. g'4
  g f f g
  g2. f4
  e d c d8[ e] 
  f4 e d g
  g a g4. f8 
  e2.
  
  f2 e
}

tenor = \relative c {
  \global
  e4 
  e g g a 
  b2. c4
  a c a g
  g2. g4
  g g g a 
  a2. g4
  g c a a 
  g2. d'4
  c a a b 
  c2. a4
  g f8[ e] a4 g
  f e8[ a] b4 e8[ e] 
  c4 f8[ e] d4 d 
  c2.
  
  a2 g2
}

bass = \relative c {
  \global
 c4
 c b c a 
 g2. e'4 
 f e d g
 c,2. b4
 c d e a, 
 d2. e4
 b c d d 
 g,2. g'4 
 e f d g
 c,2. f4
 c d8[ e] f4 e
 d e8[ f] g4 a8[ b] 
 c4 f, g g
 c,2.
 
 f,2 c'2
}

verseOne = \lyricmode {
  \vOne
The guard -- ians of our race, our An -- gel Guides we hail;
Our Fath -- er send -- eth forth to aid our na -- ture frail
These heav'n -- ly friends, lest we should suf -- fer o -- ver -- throw
Through cun -- ning of our sub -- tle foe.
}

verseTwo = \lyricmode {
  \vTwo
For he, who just -- ly lost the hon -- or once his own,
The trait -- or an -- gel, rues his lost and va -- cant throne,
With burn -- ing en -- vy strives to make them fall a -- way
Whom God doth call to heav'n -- ly day.
}

verseThree = \lyricmode {
  \vThree
Then, watch -- ful Guard -- ian, spread thy wings and cleave the air,
Haste hith -- er to our home com -- mit -- ted to thy care;
Drive thence each nox -- ious ill that might the soul in -- fest,
Nor suf -- fer dan -- ger here to rest.
}

verseFour = \lyricmode {
  \vFour
Now to the ho -- ly Three your praise de -- vout -- ly pour;
His glo -- rious God -- head guides and gov -- erns ev -- er -- more
This tri -- ple fame; to him as -- cribe we all our praise
Who reigns through ev -- er -- last -- ing days. 
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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 110 4)
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
