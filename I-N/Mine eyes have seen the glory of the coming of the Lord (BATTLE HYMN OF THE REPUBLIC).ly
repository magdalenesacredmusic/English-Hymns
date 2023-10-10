\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Julia Ward Howe (1819-1910), 1862
      }
      \wordwrap {
        Music: BATTLE HYMN OF THE REPUBLIC, William Steffe (c.1830-c.1890), 1852
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {BATTLE HYMN OF THE REPUBLIC}
    }
    \right-column{
      \line {William Steffe (), 1852}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Julia Ward Howe (),1862}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  f8. f16 
  f8 f f8. ef16 d8. f16 bf8. c16
  d8. d16 d8. c16 bf4 \bar "" \break
  
   bf8. a16
   g8. g16 g8. a16 bf8. a16 bf8. g16
   f8. g16 f8. d16 f4 \bar "" \break
   
   f8. f16
   f8. f16 f8. ef16 d8. f16 bf8. c16
   d8. d16 d8. c16 bf4 \bar "" \break
   
   bf4
   c c bf a 
   bf1 \bar "||"
   
   f4. ef8 d8. f16 bf8. c16 
   d2 bf
   g4. a8 bf8. a16 bf8. g16
   f2 d
   f4. ef8 d8. f16 \bar "" \break
   bf8. c16
   d2 bf4 bf 
   c c bf a 
   bf2.  \bar "|."
}

alto = \relative c' {
  \global
  d8. d16
  d8 d d8. c16 bf8. d16 f8. f16
  f8. f16 f8. ef16 d4
  
  f8. f16
  ef8. ef16 ef8. f16 g8. f16 g8. ef16
  d8. ef16 d8. bf16 d4
  
  d8. d16
  d8. d16 d8. c16 bf8. d16 f8. f16
  f8. f16 f8. ef16 d4
  
  f4
  g g f f 
  f1
  
  d4. c8 bf8. d16 d8. ef16
  f2 f
  ef4. f8 g8. f16 g8. ef16
  d2 bf
  d4. c8 bf8. d16
  d8. ef16
  f2 f4 f 
  g g f f 
  f2.
}

tenor = \relative c' {
  \global
  bf8. bf16
  bf8 bf bf8. f16 f8. bf16 bf8. a16
  bf8. bf16 bf8. a16 bf4
  
  bf8. bf16
  bf8. bf16 bf8. bf16 ef8. ef16 ef8. bf16 
  bf8. bf16 bf8. f16 bf4
  
  bf8. bf16
  bf8. bf16 bf8. f16 f8. bf16 bf8. a16 
  bf8. bf16 bf8. a16 bf4
  
  bf4
  bf ef d c 
  d1
  
  bf4. bf8 f8. bf16 bf8. bf16
  bf2 bf
  bf4. bf8 bf8. bf16 bf8. bf16
  bf2 f
  bf4. bf8 f8. f16
  f8. f16 
  bf2 bf4 bf 
  ef c d ef
  d2.
}

bass = \relative c {
  \global
 bf8. bf16
 bf8 bf bf8. bf16 bf8. bf16 d8. f16
 bf8. bf16 bf8. f16 bf,4
 
 d8. d16
 ef8. ef16 ef8. ef16 ef8. ef16 ef8. ef16
 bf8. bf16 bf8. bf16 bf4
 
 bf8. bf16
 bf8. bf16 bf8. bf16 bf8. bf16 d8. f16
 bf8. bf16 f8. f16 bf,4
 
 d4
 ef ef f f 
 bf,1
 
 bf4. bf8 bf8. bf16 bf8. bf16 
 bf2 d
 ef4. ef8 ef8. ef16 ef8. ef16
 bf2 bf
 bf4. bf8 bf8. bf16
 bf8. bf16
 bf2 d4 d 
 ef ef f f 
 bf,2.
}

verseOne = \lyricmode {
  \vOne
 _ Mine eyes have seen the glo -- ry of the com -- ing of the Lord;
 He is tramp -- ling out the vin -- age where the grapes of wrath are stored;
 He hath loosed the fat -- ful light -- ning of his ter -- ri -- ble swift sword;
 His truth is march -- ing on.
 
 \vOff
   \override Lyrics.LyricText.font-shape = #'italic
  \override LyricText.extra-offset = #'(0 . -4)
  \override LyricExtender.extra-offset = #'(0 . -4)
  \override LyricHyphen.extra-offset = #'(0 . -4) 
 Glo -- ry! glo -- ry! Hal -- le -- 
 
 \override LyricText.extra-offset = #'(0 . 0)
  \override LyricExtender.extra-offset = #'(0 . 0)
  \override LyricHyphen.extra-offset = #'(0 . 0) lu -- jah!
 Glo -- ry! glo -- ry! Hal -- le -- lu -- jah!
 Glo -- ry! glo -- ry! Hal -- le -- lu -- jah!
 His truth is march -- ing on.
}

verseTwo = \lyricmode {
  \vTwo
  I have seen him in the watch -- fires of a hun -- dred cir -- cling camps;
  They have build -- ed him an al -- tar in the eve -- ning dews and damps;
  I can read his right -- eous sen -- tence by the dim and flr -- ing lamps,
  His day is march -- ing on.
}

verseThree = \lyricmode {
  \vThree
  He has sound -- ed forth the trum -- pet that shall nev -- er call re -- treat;
  He is sift -- ing out the hearts of men be -- fore his judg -- ment seat;
  O be swift, my soul, to an -- swer him; be ju -- bi -- lant, my feet!
  Our God is march -- ing on.
}

verseFour = \lyricmode {
  \vFour
  In the beau -- ty of the lil -- ies Christ was born a -- cross the sea,
  With a glo -- ry in his bos -- om that trans -- gif -- ures you and me;
  As he died to make men ho -- ly, let us die to make men free!
  While God is march -- ing on.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper_multipage.ly"
  \header {
    tagline = ""
  }
  % \top
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
     % \new Lyrics \lyricsto soprano \verseFive
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
  % \bottom
  \refs
}

%%%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 16)
#(define output-suffix "Hymnal")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  %\top
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
    %  \new Lyrics \lyricsto soprano \verseFive
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
    \include "hymn_hymnal_layout.ly"
  }    
  \refs
  %\bottom
}
%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  %  \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
     % \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}
