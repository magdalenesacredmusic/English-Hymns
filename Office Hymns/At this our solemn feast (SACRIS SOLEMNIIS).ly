\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {SACRIS SOLEMNIIS, 12 12 12 8}
    }
    \right-column{
      \line {Gregorian, Mode IV}
      \line {Harm. Henri Potiron (1882-1972)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Sacris solemniis"}
      \line {Thomas Aquinas; Tr. John David Chambers (1806–1876)}
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
  d8[ a'^- b] a a[ g] a[^- b\prall c] b[ a g] a4 \bar "'"
  a8 f g g f e4 \hb 
  f8 g f8[ g a] f e d4 \bar "'"
  f8 d c e[ f] d d4 \bar "|"
  a'8 b c[ b] g a g4 \bar "'"
  b8[ a] b c[ b] a g a4 \hb
  d,8[ a'^- bf] a g f8[ e d] e f[ g] f e4 \bar "||"
  
  e8[ f e] d4( e) \bar "||"
}

alto = \relative c' {
  \global
  d2 e4~ e4. d4. e4.
  e4 d c~
  c4~ c4.~ c4 d4.
  d8 c~ c4. a4
  e'2.~ e4~ 
  e4.~ e2~ e4
  d4.~ d4 a2 d4. c4
  
  c4. a4 c
}

tenor = \relative c {
  \global
  f2 a4~ a2.~ a4.~
  a2~ a4~
  a4~ a4.~ a4~ a4.~
  a4 g4. f4
  a2. b4 
  g4.~ g4 b a
  f4.~ f4~ f2 a4.~ a4
  
  g4. f4 e
}

bass = \relative c {
  \global
 d2 c4 f2. c4.~
 c4 d a 
 a'4~ a4. g4 f4.~
 f4 c4. d4
 c4 a c e~
 e4.~ e2 c4
 d4.~ d4~ d2~ d4. a4
 
 a4.~ a2
}

verseOne = \lyricmode {
  \vOne
  At this our sol -- emn feast
  Let ho -- ly joys a -- bound,
  And from the in -- most breast
  Let songs of priase re -- sound;
  Let an -- cient rites de -- part,
  And all be new a -- round
  In ev' -- ry deed, in voice, in heart.
}

verseTwo = \lyricmode {
  \vTwo
  Re -- mem -- ber we that eve
  When, the Last Sup -- per spread,
  Christ, as we all be -- lieve,
  The lamb with leav'n -- less bread
  A -- mongst his breth -- ren shared
  And thus the Law o -- beyed,
  Of old un -- to their sires de -- clared.
}

verseThree = \lyricmode {
  \vThree
  The typ -- ic lamb con -- sumed, 
  The Pas -- chal feast com -- plete,
  The Lord un -- to the Twelve
  His Bod -- y gave to eart;
  The whole to all, no less
  The whole to each, did mete
  With his own hands, as we con -- fess.
}

verseFour = \lyricmode {
  \vFour
  He gave them, weak and frail, 
  His Flesh their food to be;
  On them, down -- cast and sad,
  His Blood be -- stow -- ed he;
  And thus to them he spake,
  'Re -- ceive this Cup from me,
  And all of you this par -- take.'
}

verseFive = \lyricmode {
  \vFive
  So he this Sac -- ri -- fice
  To in -- sti -- tute did will,
  And charged his priest a -- lone
  That of -- fice to ful -- fill
  In them he did con -- fide:
  To whom per -- tain -- eth still
  To take, and to the rest di -- vide.
}

verseSix = \lyricmode {
  \vSix
  Thus an -- gel's Bread is made
  The Bread of man to -- day;
  The Liv -- ing BRead from heav'n 
  With fig -- ures doth a -- way:
  O won -- drous gift in -- deed!
  The poor and low -- ly, may
  Up -- on their Lord and Mas -- ter feed.
}

verseSeven = \lyricmode {
  \vSeven
  O Tri -- une De -- i -- ty,
  To thee we meek -- ly pray,
  So may'st thou vis -- it us,
  As we our hom -- age pay;
  And in thy foot -- steps bright
  Con -- duct us on our way
  To where thou dwell'st in cloud -- less light.
  A -- men.
}

\book {
  \include "hymn_paper_multipage.ly"
  \paper {
   ragged-bottom = ##t 
  }
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
%\pageBreak
    \score {
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics \lyricsto soprano \verseSix
      \new Lyrics \lyricsto soprano \verseSeven
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
