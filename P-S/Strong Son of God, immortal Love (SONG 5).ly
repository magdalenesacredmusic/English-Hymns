\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Alfred Tennyson (1809-92)
      }
      \wordwrap {
        Music: SONG 5, LM, Orlando Gibbons (1583-1625); Rhythm slightly adapted, \italic "The English Hymnal," 1906
      }
    }
  }
}


\header {
  tagline = ""
}

global = {
  \key af \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  c4 c c 
  df2 bf4 
  c2 af4
  g2.
  
  g4 af bf
  c2 f,4
  bf2 a4
  bf2.
  
  c4 df bf
  ef2 af,4 
  c2 bf4
  c2 \bar ""
  
  g4
  g( af) f
  bf2 ef,4
  af4 g2 
  f2.

\bar "|."
}

alto = \relative c' {
  \global
  f4 f f
  f2 ef4
  c2 c4
  c2.
  
  c4 c ef
  ef2 f4
  ef( df) c
  df2.
  
  f4 f ef
  ef2 c4
  ef2 f4
  e2
  
  e4
  e( f) d
  ef2 ef4
  f2 e4
  f2.
}

tenor = \relative c' {
  \global
  af4 af af
  bf2 g4
  g( f) f 
  e2.
  
  e4 f g
  af2 af4
  gf( f) f 
  f2.
  
  a4 bf g 
  af2 af4
  af( g) f 
  g2
  
  c4
  c2 bf4 
  bf2 c4
  c4 c2
  af2.
}

bass = \relative c {
  \global
 f4 f f 
 bf,2 ef4
 af,2 af8[ bf]
 c2.
 
 c4 f ef
 af,2 df4
 ef( f) f 
 bf,2.
 
 f'4 bf, ef
 c2 f4
 ef2 df4
 c2
 
 c4
 c( f) bf
 g2 af4
 f4 c2 
 f2.
}

verseOne = \lyricmode {
  \vOne
  Strong Son of God, im -- mor -- tal Love,
  Whom we, that have not seen thy face,
  By faith, and faith a -- lone, em -- brace,
  Be -- liev -- ing where we can -- not prove:
}

verseTwo = \lyricmode {
  \vTwo
  Thou wilt not leave us in the dust;
  Thou mad -- est man, he knows not why;
  He thinks he was not made to die:
  And thou hast made him, thou art just.
}

verseThree = \lyricmode {
  \vThree
  Thou seem -- est hu -- man and di -- vine,
  The high -- est, ho -- liest man -- hood thou:
  Our wills are ours, we know not how;
  Our wills are ours, to make them thine.
}

verseFour = \lyricmode {
  \vFour
  Our lit -- tle sys -- tems have their day;
  They have their day and cease to be:
  They are but bro -- ken lights of thee,
  And thou, O Lord, art more than they.
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
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
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
      % \new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \include "hymn_hymnal_layout.ly"
  }    
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
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
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
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
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}
