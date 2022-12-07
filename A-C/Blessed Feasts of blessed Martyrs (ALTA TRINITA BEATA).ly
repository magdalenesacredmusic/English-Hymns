\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "O beata beatorum," before 12th cent.; Tr. J.M. Neale (1818-66)
      }
      \wordwrap {
        Music: ALTA TRINITA BEATA, 87 87 D, Adapted from a melody in "Laudi Spirituali," \italic 14th cent., Florence; Harm. "The English Hymnal," 1906
      }
    }
  }
}

top = \markup {
  \tiny {
  \fill-line {
    \column {
      \line {ALTA TRINITA BEATA, 87 87 D}
    }
    \right-column{
      \line {Adapted from a melody in "Laudi Spirituali,"} 
      \line {\italic 14th cent., Florence; Harm. "The English Hymnal," 1906 }
    }
  }
}
}

bottom = \markup  {
  \tiny {
  \fill-line {
    \null
    \right-column {
      \line {\italic "O beata beatorum"}
      \line {before 12th cent.; Tr. J.M. Neale}
    }
  }
}
}

\header {
  tagline = ""
}

global = {
  \key ef \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  ef2 ef4( f) |
  g2 f4( ef) |
  af2 g4( f) |
  g2 g 
  f2 g4( af) 
  g2 \tuplet 3/2 { g4( f ef) } 
  f4( af) g( f) |
  ef1 
  
  bf'2 bf4( c) 
  af2 af
  bf4( af) g( f)
  g2 g 
  f4( ef) af( f) 
  ef2 af4( g)
  f4( ef) af( f) 
  ef1
  
  bf'2 bf4( c) 
  af2 bf4( c)
  df4( c) \tuplet 3/2 { bf4( af g) }
  af2 bf 
  ef,2 f4( g)
  af2 g
  f4( ef) af( f) 
  ef1
  
   bf'2 bf4( c) 
  af2 bf4( c)
  df4( c) \tuplet 3/2 { bf4( af g) }
  af2 bf 
  ef,2 f4( g)
  af2 g
  f4( ef) af( f) 
  ef1 \bar "|."
}

alto = \relative c' {
  \global
  ef2. d4
  ef2 d4( c)
  ef2. d4
  ef1
  d2. c4
  d2 c~
  c4( f) ef( d)
  ef1
  
  ef1
  c
  ef2 d4( f)
  ef1
  bf4 c2~ c8[ d]
  ef2. d4
  c2. d4 
  bf1
  
  ef2 ef 
  c f 
  f4( ef) df2
  c ef 
  ef c4( ef)
  f2 ef 
  c4( bf) c( d)
  ef1
  
  ef2 ef 
  c f 
  f4( ef) df2
  c ef 
  ef c4( ef)
  f2 ef 
  c4( bf) c( d)
  ef1
}

tenor = \relative c' {
  \global
  g2 bf
  bf2. g4
  c2 bf
  bf1
  bf2 g4( ef)
  d2 ef
  c' bf
  g1
  
  g1
  af
  ef4.( f8) g4( c)
  c1
  f,4( g) af2
  bf c4( bf)
  g2 f
  g1
  
  g2 g 
  af df
  af \tuplet 3/2 { f2( g4) }
  f2 g
  g2 af4( bf)
  c1
  f,4( g) af( bf)
  g1
  
  g2 g 
  af df
  af \tuplet 3/2 { f2( g4) }
  f2 g
  g2 af4( bf)
  c1
  f,4( g) af( bf)
  g1
}

bass = \relative c {
  \global
 ef2 g,4( bf)
 ef2 bf4( c)
 af2 ef'4( bf)
 ef2 ef, 
 bf'2. af4
 bf2 c 
 af4( f) g( bf)
 ef1
 
 ef2. c4
 f1 c2 bf4( af)
 c1 
 d4( c) f,2
 g af4( bf)
 c2 f,4( bf)
 ef1
 
 ef2 ef4( c)
 f2 bf,
 f4( af) bf2 
 f' ef
 c af4( g) 
 f2 c'
 af4( g) f( bf)
 ef,1
 
 ef'2 ef4( c)
 f2 bf,
 f4( af) bf2 
 f' ef
 c af4( g) 
 f2 c'
 af4( g) f( bf)
 ef,1
}

verseOne = \lyricmode {
  \vOne
  Bless -- èd Feasts of bless -- èd Mar -- tyrs,
  Saint -- ly days of saint -- ly men,
  With af -- fec -- tion's rec -- ol -- lec -- tions
  Greet we your re -- turn a -- gain.
  
  %2
  Might -- y deeds they wrought, and won -- ders,
  while a frame of flesh they bore;
  We with meet -- est praise and sweet -- est
  Hon -- or them for ev -- er -- more.
}

verseTwo = \lyricmode {
  \vTwo
  Faith un -- blench -- ing, hope un -- quench -- ing,
  Well -- loved Lord, and sin -- gle heart,
  Thus they glo -- rious and vic -- to -- rious
  Bore the Mar -- tyr's hap -- py part.
  
  Blood in slaugh -- ter poured like wa -- ter,
  Tor -- ments long in heav -- y chain,
  Flame, and axe, and lac -- er -- a -- tion,
  They en -- dured, and con -- quered pain.
}

verseThree = \lyricmode {
  \vThree
  While they passed through di -- vers tor -- tures,
  Till they sank by death op -- prest,
  Earth's re -- ject -- ed were e -- lect -- ed
  To have por -- tions with the blest.

  By con -- tempt of world -- ly plea -- sures,
  And by might -- y bat -- tles done,
  Have they mer -- i -- ted with An -- gels
  To be knit for ay in one.
}

verseFour = \lyricmode {
  \vFour
  Where -- fore made co -- heirs of glo -- ry,
  Ye that sit with Christ on high,
  Join to ours your sup -- pli -- ca -- tions,
  As for grace and peace we cry;
  
  That, this wea -- ry life com -- plet -- ed,
  And its man -- y la -- bors past,
  We may mer -- it to be seat -- ed
  In our Fa -- ther's home at last.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}
