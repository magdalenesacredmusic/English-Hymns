%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Francis Pott (1832-1909), 1861
      }
      \wordwrap {
        Music: ANGEL VOICES, 85 85 843. Edwin George Monk (1819-1900), 1861
      }
    }
  }
}


%{
This hymn text, published 1861, was written by Francis Pott (1832-1909) 
to cel­e­brate a new or­gan at the Church of St. John the Evan­gel­ist at Win­gate, Lan­ca­shire, Eng­land.
%}

global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  fs4 a b a |
  d b a fs \bar "|"
  
  d e fs g |
  e1 \bar "|" \break
  
  fs4 a d b |
  e4. d8 cs4 a \bar "|"
  
  b fs a gs |
  a1 \bar "|"
  
  a4 a a b |
  g g g a \bar "|"
  
  fs a b d |
  e2. cs4 |
  d1 \bar "|."
}

alto = \relative c' {
  \global
  d4 fs g g8[ fs] |
  g4 g e cs |
  
  d d d d |
  d2( cs) |
  
  d4 d d fs |
  e gs a e |
  
  fs fs fs e |
  e1 |
  
  a4 gs fs fs |
  g fs e e |
  
  fs d g fs |
  a2. g4 |
  fs1
}

tenor = \relative c' {
  \global
  a4 d cs d |
  b g a a |
  
  fs g a b |
  a1 |
  
  a4 d d d |
  b e e e |
  
  d d d d |
  d( cs8[ b] cs2) |
  
  cs4 cs cs b |
  b b b a |
  a d d d |
  d2( cs4) e |
  d1
}

bass = \relative c {
  \global
  d4 d d d |
  d d cs a |
  
  b b a g |
  a1 |
  
  d4 fs b4. a8 |
  gs4 e a cs, |
  
  d4 d8[ cs] b4 e |
  a,1 |
  
  fs'4 e ds ds |
  e d cs cs |
  
  d fs g b |
  a2. <a, a'>4 |
  <<{	 \voiceTwo d1 }\\{ \voiceTwo  \teeny \once \override NoteColumn.force-hshift = 5  a'1}>>
}

verseOne = \lyricmode {
  \vOne
An -- gel voic -- es, ev -- er sing -- ing,
Round Thy throne of light,
An -- gel harps, for -- ev -- er ring -- ing,
Rest not day or night;
Thou -- sands on -- ly live to bless Thee,
And con -- fess Thee
Lord of might.

}

verseTwo = \lyricmode {
  \vTwo
Thou Who art be -- yond the farth -- est
Mor -- tal eye can scan,
Can it be that Thou re -- gard -- est
Songs of sin -- ful man?
Can we feel that Thou art near us
And wilt hear us?
Yea, we can.
}

verseThree = \lyricmode {
  \vThree
Yea, we know Thy love re -- joic -- es
O’er each work of Thine;
Thou didst ears and hands and voic -- es
For Thy praise com -- bine;
Crafts -- man’s art and mu -- sic’s mea -- sure
For Thy plea -- sure
 All com -- bine.
}

verseFour = \lyricmode {
  \vFour
Here, great God, to -- day we of -- fer
Of Thine own to Thee;
And for Thine ac -- cept -- ance prof -- fer,
All un -- wor -- thi -- ly,
Hearts and minds, and hands and voic -- es,
In our choic -- est
Mel -- o -- dy.
}

verseFive = \lyricmode {
  \vFive
Ho -- nour, glo -- ry, might and mer -- it,
Thine shall ev -- er be,
Fa -- ther, Son, and Ho -- ly Spir -- it,
Bless -- éd Tri -- ni -- ty;
Of the best that Thou hast giv -- en
Earth and Heav -- en
Ren -- der Thee.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
      }
    }
    \include "hymn_layout.ly"
  }
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
      \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #1
  }
 \refs
}
