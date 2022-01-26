\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {JESU REDEMPTOR OMNIUM, LM}
    }
    \right-column{
      \line {Sarum Plainsong, Mode VIII}
      \line {Harm. David O'Donnell, 2022}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Jesu, Corona Virginum" }
      \line {Ambrose of Milan (304-97); Tr. John Mason Neale}
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
  g8 a8[ b] c b[ a] g a f g4 \hb
  b8 d c b d \bar "" \break c b8[ a] g4 \bar "|"
  
  g8 a f g e f e8[ d] c4 \hb
  g'8 a8[ b] c b[ a] g a f g4 \bar "||"
  
  g8[ a g] f4( g4) \bar "||"
}

alto = \relative c' {
  \global
  e8~ e4.~ e4. c8 d~ d4~
  d8 f2
  g8~ g8[ f] d4~
  d8 c4~ c d4. a4
  b8 c4. e4. c4 d
  
  e4. d4 d
}

tenor = \relative c' {
  \global
  c8~ c4. g8[ a b] c a b4
  g8 a2
    e'8~ e[ c] b4~
    b8 c a8 c4 a8[ g f] e4
    e8~ e4. g8[ a b] a c b4
    
    c4. a4 b
}

bass = \relative c {
  \global
 c8 a4. e'4. c8 d g4~
 g8 d2 c8 e8[ f] g4~
 g8 f4 e d4. a4
 e'8 a,4. e'4. f8 a g4
 
 c,4. d4 g
}

verseOne = \lyricmode {
  \vOne
  Je -- sus the Vir -- gin's Crown, do thou
  Ac -- cept us as in prayer we bow;
  Born of that Vir -- gin whom a -- lone
  The Moth -- er and the Maid we own.
}

verseTwo = \lyricmode {
  \vTwo
  A -- mongst the li -- lies thou dost feed,
  With Vir -- gin choirs ac -- com  -- pan -- ied-
  With glo -- ry decked, the spot -- less brides
  Whose bri -- dal gifts thy love pro -- vides.
}

verseThree = \lyricmode {
  \vThree
  They, where -- so -- e'er thy foot -- steps bend,
  With hymns and prais -- es still at -- tend:
  In bless -- èd troops they fol -- low thee,
  With dance, and song, and mel -- o -- dy.
}

verseFour = \lyricmode {
  \vFour
  We pray thee there -- fore to be -- stow
  Up -- on our sens -- es here be -- low
  They grace, that so we may en -- dure
  From taint of all cor -- rup -- tion pure.
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
