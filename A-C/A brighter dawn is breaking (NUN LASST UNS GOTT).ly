\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
  \left-column {
  \line {
    Text: Percy Dearmer (1867-1936)
  }
  \wordwrap {
    Music: NUN LASST UNS GOTT, 77 77, Later form of a melody fromSelnecker's \italic "Christliche Psalmen," Leipzig, 1587
  }
}
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {NUN LASST UNS GOTT, 77 77}
    }
    \right-column{
      \line {Later form of a melody from Selnecker's \italic "Christliche Psalmen," Leipzig, 1587}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Percy Dearmer (1867-1936)}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key a \major
  \time 6/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  a4
  a2 gs4 fs( gs) a
  b2. a2 \bar "" a4
  a2 b4 gs( fs) e 
  a2. gs2 \bar "" \break
   gs4 
   a2 a4 b2 cs4
   b2.  b2 \bar "" cs4
   d2 cs4 b2 a4
   b2. a2 \bar "|."
}

hmelody = \relative c'' {
  \global
  \partial 4
  a4
  a2 gs4 fs( gs) a
  b2. a2 \bar "" \break a4
  a2 b4 gs( fs) e 
  a2. gs2 \bar "" \break
   gs4 
   a2 a4 b2 cs4
   b2.  b2 \bar "" \break cs4
   d2 cs4 b2 a4
   b2. a2 \bar "|."
}

alto = \relative c' {
  \global
  e4
  e2 e4 d2 e4
  e2. cs2 cs4
  e2 fs4 e2 b4
  cs2( ds4) e2
    es4
  fs2 fs4 d2 cs4
  ds4.( cs8 ds4) e2 gs4
  a2 a4 fs2 a4
  e2( d4) cs2
}

tenor = \relative c' {
  \global
  cs4
  cs2 cs4 a2 a4
  a2( gs4) a2 a4
  a2 fs4 b2 b4
  a2. b2
    cs4
  cs2 fs,4 fs( gs) a
  a2. gs2 e'4
  d2 e4 d2 cs4
  gs2. a2
}

bass = \relative c {
  \global
 a4
 a2 cs4 d2 cs4
 e2. a,2 a4
 cs2 ds4 e2 gs4
 fs2. e2
   cs4
 fs2 d4 b2 a4
 b2. e2 e4
 fs2 a4
 d,4.( e8 fs4)
 e2. a,2
}

verseOne = \lyricmode {
  \vOne
 A bright -- er dawn is break -- ing
 And earth with praise is wak -- ing
 For thou, O King most high -- est
 The power of death de -- fi -- est;
}

verseTwo = \lyricmode {
  \vTwo
  And thou hast come vic -- to -- rious,
  With ris -- en Bod -- y glo -- rious,
  Who now for ev -- er liv -- est,
  And life a -- bun -- dant giv -- est.
}

verseThree = \lyricmode {
  \vThree
  O free the world from blind -- ness,
  And fill the world with kind -- ness,
  Give sin -- ners res -- ur -- rec -- tion,
  Bring striv -- ing to per -- fec -- tion;
}

verseFour = \lyricmode {
  \vFour
  In sick -- ness give us heal -- ing,
  In doubt thy clear re -- veal -- ing,
  That praise to thee be giv -- en
  In earth as in thy heav -- en.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  %\top
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
%  \bottom
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
        \new Voice = "soprano" { \voiceOne \hmelody }
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
  %\bottom
  \refs
}

%%%%%%
%%%%%%
%%%%%%

#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  %\top
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
  \refs
 % \bottom
}
