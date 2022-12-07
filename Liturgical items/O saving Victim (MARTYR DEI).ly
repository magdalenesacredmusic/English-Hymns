\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {MARTYR DEI, L.M.}
    }
    \right-column{
      \line {Mediaeval Plainsong, Mode VI}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "O Salutaris hostia"}
      \line {Thomas Aquinas; tr. J.M. Neale, E. Caswall, and others}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f8 f g[ a] a g[ a] g g f4 \bar "'"
  a8 c c c g a \bar "" \break
  bf8 a4( g) \hb
  
  f8 f g d[ c] f g[ a] g f4 \bar "'"
  f8 f g[ a] a g[ a] g g f4 \bar "||"
  
  f8[ g f] e4( f) \bar "||"
}

melodya = \relative c' {
  \global
   \override Stem #'length = #0
  f4 f g( a) a g( a) g g f2 \bar "'" \break
  a4 c c c g a \bar ""% \break
  bf4 a2( g) \hb
  
  f4 f g d( c) f g( a) g f2 \bar "'"
  f4 f g( a) a g( a) g g f2 \bar "||" \break
  
  f4( g f) e2( f) \bar "||"
}

alto = \relative c' {
  \global
  c2~ c4.~ c4 a
  f'8 e4 c4.
  
  d8 e2
  
  a,8 bf4 a4 c8 d4.~ d4
  c2~ c4.~ c4 a
  
  d4. c2
}

tenor = \relative c' {
  \global
  a4. f8~ f4. e4 f
  f8 a4 e4.
  f8 e2
  
  d8~ d4 f4. d4 bf'8 a4
  a4. f8~ f4.~ f8[ e] f4
  bf4. g4 a
}

bass = \relative c {
  \global
 f2 a,4. c4 d
 d8 a4 c4.
 bf8 c2
 d8 bf4 f a8 bf4. d4
 f2 a,4. c4 <f, c'>
 
 bf4. c4 f,
}

verseOne = \lyricmode {
  \vOne
  O sav -- ing Vic -- tim! o -- pen wide
  The gate of heav'n to man be -- low,
  Our foes press on from ev' -- ry side,
  Thine aid sup -- ply, thy strength be -- stow.
}

verseTwo = \lyricmode {
  \vTwo
  All praise and thanks to thee as -- cend
  For ev -- er -- more, blest One in Three;
  O grant us life that shall not end
  In our true na -- tive land with Thee.
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
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }

    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
