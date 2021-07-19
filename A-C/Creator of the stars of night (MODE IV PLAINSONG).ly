%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {PLAINSONG, MODE IV}
    }
    \column{
      \line {harm. after Winfred Douglas }
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Conditor alme siderum"}
      \line {tr. John Mason Neale}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key ef \major
  %\time 4/4
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g8 ef g bf bf c af bf \bar "'" \noBreak
  bf8 c af bf af g f g4 \once \override ChoirStaff.BarLine.bar-extent = #'( -1 . 1 )
  \bar "|"
  bf8 af f g af g f ef \bar "'" 
  ef8 g af bf af g f g4 \bar "||" \break
  
  g8[ af g] f4( g) \bar "||"
}

melodya = \relative c'' {
  \global
  g8 ef g bf bf c af bf \bar "'" 
  bf8 c af bf af g f g4 \once \override ChoirStaff.BarLine.bar-extent = #'( -1 . 1 )
  \bar "|"
  bf8 af f g af g f ef \bar "'" 
  ef8 g af bf af g f g4 \bar "||" \break
  
  g8[ af g] f4( g) \bar "||"
}

alto = \relative c' {
  \global
  d8 ef4~ ef2~ ef8
  d8 c2 d4 ef
  ef8 c2 d4 ef8
  c8~ c2~ c4 bf4
  
  ef4. c4 d
}

tenor = \relative c {
  \global
  g8 c4 g'~ g8[ af] g8~ 
  g8 af4 f bf~ bf 
  g8 f2 bf4 g8~ 
  g8 ef4 f c d

  g4. af4 bf
}

bass = \relative c {
  \global
 s4.ef4 c ef8~ 
 ef8 af,2 bf4 ef
 ef8 f2
 bf,4 c8~
 c8 c4 f,4 af g
 
 c4. af4 g
}

verseOne = \lyricmode {
  \set stanza = "1."
 Cre -- a -- tor of the stars of night,
 Thy peo -- ple's ev -- er last -- ing light,
 Je -- sus, Re -- deem -- er, save us all,
 And hear thy ser -- vants when they call.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Thou, griev -- ing that the an -- cient curse
  Should doom to death a u -- ni -- verse,
  Hast found the med' -- cine, full of grace,
  To save and heal a ru -- ined race.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Thou cam'st, the Bride -- groom of the bride,
  As drew the world to eve -- ning -- tide;
  Pro -- ceed -- ing from a Vir -- gin shrine,
  The spot -- less Vic -- tim all di -- vine.
}

verseFour = \lyricmode {
  \set stanza = "4."
  At whose dread name, ma -- jest -- ic now,
  All knees must bend, all hearts must bow;
  And things ce -- les -- tial thee shall own,
  And things ter -- res -- trial, Lord a -- lone.
  

}


verseFive = \lyricmode {
    \set stanza = "5."
    O thou whose com -- ing is in dread
    To judge and doom the quick and dead,
  Pre -- serve us, while we dwell be -- low,
    From ev -- 'ry in -- sult of the foe.
}

verseSix = \lyricmode {
  \set stanza = "6."
   To God the Fa -- ther, God the Son,
    And God the Spir -- it, Three in One,
  Laud, ho -- nor, might, and glo -- ry be
   From age to age e -- ter -- nal -- ly.
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
      \new Lyrics \lyricsto soprano \verseSix
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
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour}
      \new Lyrics \lyricsto "tune" { \verseFive }
      \new Lyrics \lyricsto "tune" { \verseSix }
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
