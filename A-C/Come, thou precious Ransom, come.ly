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
        Text: \italic "Komm, du wertes Lösegeld," Johann, G. Olearius, 1664; Tr. August Crull (1845-1923), alt.
      }
      \wordwrap {
        Music: MEINEM JESUM LASS ICH NICHT, 78 78 77, \italic "Neuverfertiges Gesangbuch," Darmstadt, 1699
      }
    }
  }
}

top = \markup {
\fill-line {
      \column {
          \line {MEINEM JESUM LASS ICH NICHT  78 78 77}
      }
      \column{
      \line {\italic "Neuverfertiges Gesangbuch"}
      \line {Darmstadt, 1699}
      }
}
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Komm, du wertes Lösegeld"}
      \line {Johann, G. Olearius, 1664; tr. August Crull (1845-1923), alt.}
    }
  } 
}

\header {
  tagline = ""
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
g4 g fs g \bar "|"
e fs g2 \bar "|"
b4 b a d \bar "|"
c b a2 g2 \bar "|"

g4 g fs g \bar "|"
e fs g2 \bar "|"
b4 b a d \bar "|"
c b a2 g2 \bar "|"

b4 a g a \bar "|"
b4 b a2 \bar "|"
b4 d c b \bar "|"
a4 a g2 \bar "|."
}

alto = \relative c' {
   \global
d4 cs d d
c c d2
d4 d d d 
e d d2 d

d4 cs d d 
c c d2 
d4 d d d 
e d d2 d

d4 fs e d 
d d d2
d4 g g g 
g fs d2
}

tenor = \relative c' {
  \global
b4 g a b 
g a b2
g4 g fs g 
g g g( fs) b2

b4 g a b 
g a b2
g4 g fs g 
g g g( fs) b2

g4 d' b a 
g g fs2
g4 d' e d 
e d b2
  
}

bass = \relative c' {
  \global
  g4 e d b 
  c a g2
  g4 g' d b 
  c g d'2 g,
  
    g'4 e d b 
  c a g2
  g4 g' d b 
  c g d'2 g,
  
  g'4 d e fs
  g b, d2 
  g4 b, c g 
  c d g,2
}

verseOne = \lyricmode {
  \vOne
  Come, thou pre -- cious Ran -- som, come,
On -- ly hope for sin -- ful mor -- tals!
Come, O Sa -- vior of the world!
O -- pen are to thee all por -- tals.
Come, thy beau -- ty let us see;
An -- xious -- ly we wait for thee.
}

verseTwo = \lyricmode {
  \vTwo
En -- ter now my wait -- ing heart,
Glo -- rious King and Lord most ho -- ly.
Dwell in me and ne'er de -- part,
Though I am but poor and low -- ly.
Ah, what rich -- es will be mine
When Thou art my guest di -- vine!
}

verseThree = \lyricmode {
  \vThree
My ho -- san -- nas and my palms
Gra -- cious -- ly re -- ceive, I pray thee;
Ev -- er -- more, as best I can,
Sa -- vior, I will hom -- age pay thee,
And in faith I will em -- brace,
Lord, thy mer -- it through thy grace.
}

verseFour = \lyricmode {
  \vFour
Hail! Ho -- san -- na, Da -- vid's Son!
Je -- sus, hear our sup -- pli -- ca -- tion!
Let thy king -- dom, scep -- ter, crown,
Bring us bless -- ing and sal -- va -- tion,
That for -- ev -- er we may sing:
Hail! Ho -- san -- na to our King.
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
