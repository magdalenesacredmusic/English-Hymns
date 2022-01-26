\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {AUCTOR SALUTIS UNICE LM}
    }
    \right-column{
      \line {Gregorian, Mode VIII}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Auctor Salutis Unicus"}
      \line {Holy Saturday, Vespers. Tr. John David Chambers}
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

melody = \relative c'' {
  \global
  g8 g f e d f[ a] a g^- \bar "'"
  g8 g a b g a g f4 \hb
  f8 g f g a c g a[ b a]^- \bar "'"
  a8 a g a f e f g4 \bar "||" \break
  
  g8[ a g] f4( g) \bar "||"
}

alto = \relative c' {
  \global
  d4. b4 c4. e4
  e4~ e4 d~ d4~
  d8~ d4~ d4 c4 c4.
  d4. c4~ c4 d4
  
  e4. d4~ d
}

tenor = \relative c' {
  \global
a4. g4 a4. c4~
c4 g4 f8[ g] a4~
a8~ a4 f e a4.
f4. a4 c b

c4. a4 b
}

bass = \relative c {
  \global
 d4. g4 f4. c4~
 c4 e d~ d~
 d8~ d4~ d4 e4 a4.
 d,4. f4 a g
 
 c,4. d4 g
}

verseOne = \lyricmode {
  \vOne
  Thou on -- ly Sa -- vior! Might -- y Lord!
  Whose love a ru -- ined world re -- stored;
  Bless now O Christ! in year -- ly course,
  To us the glo -- ry of thy Cross.
}

verseTwo = \lyricmode {
  \vTwo
  Who spit -- ting, stripes, the chain, the spear,
  And cru -- el buf -- fet -- ings didst bear;
  And will to~as -- cend the Cross of pain
  For us sal -- va -- tion to ob -- tain.
}

verseThree = \lyricmode {
  \vThree
  Thus death by death was ov -- er -- thrown,
  Our life re -- cov -- ered by thine own,
  And Sa -- tan van -- quished, craft -- y foe!
  The min -- i -- ster fo death and woe.
}

verseFour = \lyricmode {
  \vFour
  All -- glo -- rious now, at God's right hand,
  Thou dost a hal -- lowed vic -- tim stand;
  Hear our pe -- ti -- tions! spare our guilt,
  For which thy pre -- cious blood was spilt.
  
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
      }
    }
    \include "hymn_layout_ragged.ly"
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
            "Henceforth may we unflinching run"
            "That holy course by thee begun;"
            "And, shield from all offence and loss,""Lift up the Banner of the Cross!"
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "Bestow our prayer, blest Trinity!"
            "Grant, undivided Unity,"
            "That all the gifts thy Cross imparts,"
            "May profit our repentant hearts.   Amen."
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
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
