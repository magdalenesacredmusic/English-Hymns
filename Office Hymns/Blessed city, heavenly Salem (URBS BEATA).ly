\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \tiny {
  \fill-line {
    \column {
      \line {URBS BEATA}
    }
    \right-column{
      \line {Sarum Plainsong, Mode II}
      \line {Harm. \italic "Episcopal Hymnal," 1916}
    }
  }
}
}

bottom = \markup  {
  \tiny {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Urbs beata Jerusalem"}
      \line {Latin, c. 7th cent.; Tr. John Mason Neale (1818-66)}
    }
  }
}
}

\header {
  tagline = ""
}

global = {
  \key ef \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  c8 c c bf8[ af] bf c c f,4 \bar "'" 
  af8 bf g af f ef f4 \bar "|"
  af8 f \bar "" \break
  
  g8 af bf c bf8[ af g] f4 \bar "'" 
  g8 af g f g f ef4 \bar "|"
  c8 ef8[ f] f f[ ef] \bar "" \break
  
  af8 bf bf af4 \bar "'"
  c8 bf af[ g] af[ bf af g] f ef f4 \bar "||"
  f8[ g f] ef4( f) \bar "||"
}

alto = \relative c' {
  \global
  f4 ef4.~ ef4~ ef8 df4
  ef4~ ef df!8[ c]~ c4
  c8[ d]
  
  ef4~ ef4 df4. c4~
  c2 d4 ef4
  c8 ef[ f] df c4
  
  ef8[ f] ef8 c4
  ef4~ ef~ ef2 df!8[ c]~ c4
  
  df4. c2
}

tenor = \relative c' {
  \global
  af4 g af8 g4 af4.~
  af4 c af4~ af
  af4
  
  bf8[ af] g4 f g8 af4
  ef af~ af g
  af8 bf4 af4.~
  
  af8[ f] g f4
  g af4~ af2~ af4~ af4
  
  af4.~ af4~ af
}

bass = \relative c {
  \global
 f4 c4. ef4 af,8 df4 
 c4~ c df!8[ af'] f4
 f4
 
 ef4~ ef bf4. af4
 c4 af bf ef
 af8 g4 f8 af4
 
 c,8[ df!] ef f4
 c~ c~ c2 df!8[ af] f4
 
 df'!4. af'8[ g] f4
}

verseOne = \lyricmode {
  \vOne
  Bless -- èd ci -- ty, heav'n -- ly Sa -- lem,
  Vi -- sion dear of peace and love,
  Who, of liv -- ing stones art build -- ed
  In the height of heav'n a -- bove,
  And, with an -- gel hosts en -- cir -- cled,
  As a bride dost earth -- ward move.
}

verseTwo = \lyricmode {
  \vTwo
  From ce -- les -- tial realms des -- cend -- ing,
  Bri -- dal glo -- ry round thee thed,
  Meet for him whose love es -- poused thee,
  To thy Lord shalt thou be led;
  All thy streets and all thy bul -- warks
  of pur gold are fash -- ion -- èd.
}

verseThree = \lyricmode {
  \vThree
  Bright thy gates of pearl are shin -- ing,
  They are o -- pen ev -- er -- more;
  And by vir -- tue of his mer -- its
  Thith -- er faith -- ful souls do soar,
  Who, for Christ's dear Name, in this world
  Pain and tri -- bu -- la -- tion bore.
}

verseFour = \lyricmode {
  \vFour
  Man -- y~a blow and bit -- ing sculp -- ture
  Pol -- ished well those stones e -- lect,
  In their plac -- es now com -- pact -- ed
  By the heav'n -- ly Ar -- chi -- tect,
  Who there -- with hath willed for ev -- er
  That his pal -- ace should be decked.
}

verseFive = \lyricmode {
  \vFive
  Laud and hon -- or to the Fa -- ther,
  Laud and hon -- or to the Son,
  Laud and hon -- or to the Spir -- it,
  Ev -- er Three, and ev -- er One,
  Con -- sub -- stan -- tial, Co -- e -- ter -- nal,
  While un -- end -- ing a -- ges run.  A -- men.
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
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
