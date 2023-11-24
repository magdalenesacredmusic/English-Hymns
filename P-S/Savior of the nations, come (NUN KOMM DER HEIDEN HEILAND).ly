\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Veni, Redemptor gentium," Ambrose of Milan, 4th cent.; Tr. Martin Luther: \italic "Nun komm der heiden heiland;" Tr. William M. Reynolds, (1812-1876)
      }
      \wordwrap {
        Music: NUN KOMM DER HEIDEN HEILAND  77 77, \italic "Geystliche gesangk Buchleyn," Wittenberg. 1524; Harm. Melchior Vulpius (1560-1615)
      }
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

melody = \relative c'' {
  \global
 g4 g f bf |
 a8[ g] a4 g2 |
 g4 bf c4. bf8 |
 c4 d bf2 |
 
 bf4 c d bf |
 c bf8[ a] g2 |
 g4 g f bf |
 a8[ g] a4 g2 \bar "||" \break
 
 g2 g2 \bar "|."
}

alto = \relative c' {
  \global
d4 d d f |
f8[ d] f4 g2 |
d4 g g4. g8 |
a4 a g2 |

d4 f f g |
g4. fs8 g2 |
d4 ef d f |
f8[ d] f4 d2

ef2 d
}

tenor = \relative c' {
  \global
bf4 bf a d |
c8[ bf] a4 b2 |
bf4 d ef4. d8 |
f4 f d2 |

g,4 a bf bf |
ef d d2 |
b4 c a d |
c8[ bf] a4 b2

c2 b
}

bass = \relative c {
  \global
g4 g d' bf |
f'8[ g] d4 g,2 |
g'4 g c,4. g'8 |
f4 d g2 |

g4 f bf, ef |
c d g,2 |
g'4 c, d bf |
f'8[ g] d4 g,2

c2 g2
}

verseOne = \lyricmode {
  \vOne
Sav -- ior of the na -- tions, come,
Vir -- gin's Son, make here thy home!
Mar -- vel now, O heav'n and earth,
That the Lord chose such a birth.
}

verseTwo = \lyricmode {
  \vTwo
Not by hu -- man flesh and blood,
By the Spir -- it of our God,
Was the Word of God made flesh–
Wom -- an's Off -- spring, pure and fresh.
}

verseThree = \lyricmode {
  \vThree
Won -- drous birth! O won -- drous Child
Of the Vir -- gin un -- de -- filed!
Though by all the world dis -- owned,
Still to be in heav'n en -- throned.
}

verseFour = \lyricmode {
  \vFour
From the Fa -- ther forth He came
And re -- turn -- eth to the same,
Cap -- tive lead -- ing death and hell–
High the song of tri -- umph swell!

\vOff
\set stanza = "7."
A -- men.
}

verseFive = \lyricmode {
  \set stanza = "5. "
Thou, the Fa -- ther's on -- ly Son,
Hast o'er sin the vic -- t'ry won.
Bound -- less shall thy king -- dom be;
When shall we its glo -- ries see?
}

verseSix = \lyricmode {
  \set stanza = "6."
  Bright -- ly doth thy man -- ger shine,
  Glo -- rious is its light div -- ine.
  Let not sin o'er -- cloud this light;
  Ev -- er be our faith thus bright.
}

verseSeven = \lyricmode {
  \set stanza = "7."
  Praise to God the Fa -- ther sing,
  Praise to God the Son, our King,
  Praise to God the Spir -- it be
  Ev -- er and e -- ter -- nal -- ly.

\set stanza = "7."
A -- men.
}

extraVerses = 
      \markup {
    \vspace #1
  \fontsize #0.2 {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "Thou, the Father's only Son,"
  "Hast o'er sin the vict'ry won."
"Boundless shall thy kingdom be;"
"When shall we its glories see?"
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "Brightly doth thy manger shine,"
 "Glorious is its light divine."
  "Let not sin o'er-cloud this light;"
  "Ever be our faith thus bright."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
           "Praise to God the Father sing,"
  "Praise to God the Son, our King,"
  "Praise to God the Spirit be"
  "Ever and eternally. Amen."

          }
          }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
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
    \include "hymn_layout_ragged.ly"
  }
  
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
    \include "hymn_hymnal_layout_ragged.ly"
  }    
  
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
    \include "hymn_layout_ragged.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}
