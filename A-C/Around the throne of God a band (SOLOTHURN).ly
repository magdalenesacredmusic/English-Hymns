%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: John Mason Neale (1818-66)
      }
      \wordwrap {
        Music: SOLOTHURN, LM, Swiss Traditional Melody, Harm. \italic "The English Hymnal," 1906
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {SOLOTHURN  LM}
    }
    \right-column{
      \line {Swiss Traditional Melody}
      \line {harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {John Mason Neale, 1818-66}
    }
  } 
}


\paper {
  page-count = 1
}

global = {
  \key ef \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
 \partial 4
  ef4 |
  ef f g ef |
  bf'2 f |
  ef2. bf'4 |
  bf c d bf |
  ef2 c |
  bf2. \bar ""
  
    bf4 |
    ef d c bf |
    ef c bf 
    
    bf |
    ef, f g af |
    bf2 f |
    ef2.
\bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  bf4^\markup {\italic Unison.} |
  <bf ef>2 <c ef> |
  <bf ef> <bf d> |
  bf2. ef4 |
  <d bf'>2 d |
  <ef g> <ef f> |
  <d f>2. 
  
  <d f>4 |
  <ef bf'>2 af4 f |
  ef f g 
  
    d |
    ef2 ef |
    <bf ef> <bf d> |
    bf2.
}

tenor = \relative c' {
  \global
  \partial 4
  g4 |
  g2 g |
  ef af |
  g2. 
  
    g4 |
    f2 bf |
    bf a |
    bf2.
    
    bf4 |
    bf2 c4 d |
    af2 g4 
    
    af4 |
    bf2 bf |
    ef, af |
    g2.
}

bass = \relative c {
  \global
  ef4 |
  ef2 c |
  g bf |
  ef2. 
  
    ef4 |
    bf2 g' |
    c, f |
    bf,2.
    
    af'4 |
    g2 af4 bf |
    c, d ef 
    
    f |
    g2 ef2 |
    g, bf |
    ef2.
}

verseOne = \lyricmode {
  \vOne
  A -- round the throne of God a band
  Of glo -- rious An -- gels al -- ways stand;
  Bright things they see, sweet harps they hold,
  And on their heads are crowns of gold.
}

verseTwo = \lyricmode {
  \vTwo
  Some wait a -- round him, read -- y still
  To sing his praise and do his will;
  And some, when he com -- mands them, go
  To guard his ser -- vants here be -- low.
}

verseThree = \lyricmode {
  \vThree
  Lord, give thy an -- gels ev -- 'ry day
  Com -- mand to guide us on our way,
  And bid them ev -- 'ry eve -- ning keep
  Their watch a -- round us while we sleep.
}

verseFour = \lyricmode {
  \vFour
  So shall no wick -- ed thing draw near,
  To do us harm or cause us fear;
  And we shall dwell, when life is past,
  With An -- gels round they throne at last.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  %#(set-global-staff-size 20)
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
        tempoWholesPerMinute = #(ly:make-moment 120  4)
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
%%%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 16)
#(define output-suffix "Hymnal")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_hymnal_paper.ly"
  %#(set-global-staff-size 14)
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
      %\new Lyrics \lyricsto soprano \verseFive
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
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  %#(set-global-staff-size 14)
 % \top
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
