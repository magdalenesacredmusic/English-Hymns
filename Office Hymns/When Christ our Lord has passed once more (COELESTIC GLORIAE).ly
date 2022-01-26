\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {COELESTIS GLORIAE, LM}
    }
    \right-column{
      \line {Mode I, Sarum}
      \line {Harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Jam Christus astra ascenderat"}
      \line {c. 4th cent.; Tr. Percy Dearmer, 1906}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d4 d f d d( c) f g a2 \bar "|"
  a4( g) c c( d) \bar "" \break
  c4 c( b) a g a2 \bar "|"
  a4 a a( c b a) g( f) e( d) \bar "" \break
  f4 e( d) d( e2) \bar "|"
  c4 e( d) g g( a g) f( e) d c d2 \bar "||"

  d4( e) d( c d2) \bar "|."
}

alto = \relative c' {
  \global
  a4^\markup {Unison.} bf2~ bf4 a2 c2~ c2
  f4 e g~ g f
  e~ e2~ e2~ e2
  e2 d1 b2~ b
  c2 b4~ b2.
  c2 d4 b c2. a2~ a2~ a2
  
  a4 c a2.
}

tenor = \relative c {
  \global
  f4 f d f~ f2~ f4 e f2
  c'2~ c a4
  a c2~ c4 b c2
  c4 a f1 g2~ g
  a4 g2~ g2.
  e2 g4~ g4
  e2. f2~ f4 e f2
  
  f4 g f e f2
}

bass = \relative c {
  \global
 d4 bf2~ bf4 f2 a4 c f2
 f4 c e2 d4
 a'4~ a2~ a4 e a,2
 a4 c d1 e2~ e4 g
 f c g g e2
 a2 b4 g c2. d2~ d4 a d,2
 
 d'4 a d a d,2
}

verseOne = \lyricmode {
  \vOne
  When Christ our Lord had passed once more
  In -- to the heaven he left be -- fore,
  He sent a Com -- for -- ter be -- low
  The Fa -- ther's prom -- ise to be -- stow.
}

verseTwo = \lyricmode {
  \vTwo
  The sol -- emn time was soon to fall
  Which told the num -- ber mys -- ti -- cal;
  For since the Res -- ur -- rec -- tion day
  A week of weeks had passed a -- way.
}

verseThree = \lyricmode {
  \vThree
  At the third hour a rush -- ingnoise
  Came like the tem -- pest's sud -- den voice,
  And min -- gled with the~Ap -- ost -- les' prayer,
  Pro -- claim -- ing loud that God was there.
}

verseFour = \lyricmode {
  \vFour
  From out the Fa -- ther's light it came,
  That beau -- ti -- ful and kind -- ly flame,
  To kin -- dle ev -- 'ry Chris -- tian heart,
  And fer -- vor of the Word im -- part. 
  
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
            "As then, O LOrd, thou didst fulfil,"
            "Each holy heart to do thy will,"
            "So now do thou our sins forgive"
            "And make the world in peace to live."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "To God the Father, God the Son,"
            "And God the Spirit, praise be done;"
            "May Christ the Lord upon us pour"
            "The Spirit's gift for evermore.   Amen."
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
