\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {BEATA NOBIS GAUDIA  LM}
    }
    \right-column{
      \line {\italic "Psalterium Chorale"}
      \line {harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Beate Martyr, prospera"}
      \line {Prudentius; Tr. Athelstan Riley}
    } 
  }
}

%%generates the breathmarks
breathmark = {
  \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
  \override Score.RehearsalMark #'Y-offset = #'4.0
  \override Score.RehearsalMark #'X-offset = #'-0.5
  \mark \markup {\fontsize #4 ","}
}



global = {
  \key ef \major
  \cadenzaOn
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  bf'4 ^\markup { \italic "To be sung in unison." }  g ef \bar "!"
  f( g af g) f( ef) c d \bar "!"
  ef2 \breathmark \bar "||"

  ef4 g af \bar "!"
  bf4 c( bf af) bf c \bar "!"
  d( c bf)^\fermata \bar "||"

  bf c( d ef) bf \bar "!"
  g ef af( g) f \bar "!"
  g( f ef)^\fermata \bar "||" f c ef \bar "!"
  ef ef( d)
  f( g af g) f( ef) \bar "!"
  ef2. \bar "||" \break
  
  ef4( f ef d ef) ef2 \bar "||"
}


alto = \relative c' {
  \global
  ef4 d ef
  <af, c>1 <g c>2 af4 bf
  g2

  ef'2. ~
  ef4 g( f2 ) d4 f
  d2.

  f4 f2( ef4) f
  ef ef c2 d4
  bf2 g4

  c2.
  bf2. c1 d2
  ef2.
  
  c2 bf2. bf2
}

tenor = \relative c {
  \global
  s4 s4 s4
  s1 s2 f2
  ef2

  g4 bf af
  g4 c2. s4 s4
  s2.

  s4 s2 s4 s4
  bf4 c f,2 d4
  s2 s4

  af'2 g4 ~
  g4 f2 af1 <f bf>2
  <g bf>2.
  
  g4 af g f g g2
}

bass = \relative c {
  \global
  <ef g>4 <bf bf'> <c g'>
  f1 c2 f,4 bf
  ef,2

  ef'2. ~
  ef4 ef( f2) <g bf>4 <f a>
  <bf, f'>2.

  <bf' d>4 \set doubleSlurs = ##t <af! c >2( <g bf>4) <d bf'>
  ef c af2 bf4
  <g d'>2 <c ef>4 _\fermata

  af2.
  bf2. f'1 bf,2
  ef2.
  
  c4 f, g bf ef, ef2
}

verseOne = \lyricmode {
  \vOne
  Blest Mar -- tyr, let thy tri -- umph -- day
  God's fa -- v'ring grace to us con -- vey;
  The day on which thy life -- blood flowed
  And he thy crown in meed be -- stowed.
}

verseTwo = \lyricmode {
  \vTwo
  Thy soul to heav'n -- ly man -- sions sped
  While this world's gloom -- y shad -- ows fled;
  The judge and tor -- tur -- er o'er -- thrown,
  Christ claimed the vic -- tor for his own.
}

verseThree = \lyricmode {
  \vThree
  Now con -- sort of the An -- gels birght
  Thou shin -- est clothed in robes of white;
  Robes thou hast washed in streams of blood,
  A daunt -- less Mar -- tyr for thy God.
}

verseFour = \lyricmode {
  \vFour
  Be thou on this thy ho -- ly -- day
  Our strong up -- hold -- er; while we pray
  That from our guilt we may be freed,
  Stand thou be -- fore the throne and plead.
}

verseFive = \lyricmode {
  \vFive
  All laud to God the Fa -- ther be,
  All praise, e -- ter -- nal Son, to thee;
  All glo -- ry, as is ev -- er meet,
  To God the ho -- ly Par -- a -- clete.
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
    \include "hymn_layout_ragged.ly"
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
      \new Lyrics \lyricsto soprano
      \verseFour
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
    \include "hymn_layout_ragged.ly"
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
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
