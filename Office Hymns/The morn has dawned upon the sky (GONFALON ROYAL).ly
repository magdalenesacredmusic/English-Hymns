%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {GONFALON ROYAL  LM}
    }
    \column{
      \line {P.C. Buck, 1918}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Vs. 1-5 "Vexilla Regis prodeunt"}
      \line {Venantius Fortunatus; tr. J.M. Neale}
    } 
  }
}


global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d4 |
  e g c b8[ a] |
  b4 g e2~ |
  e4 e a fs | %\break
  d g c8[ b] a[ g] | 
  a2. \bar "||" 

  a4 | 
  d b g4. g8 | 
  c4 a fs \bar "" %\break
  
    e8[ fs] |
  g[ a] b[ a] c4 b | 
  a e d2 \bar "||" \break

  \time 1/4
  d4( |
  \time 4/4
  e4 g a2) |
  g2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  b4^\markup { \italic "Unison."} |
  b c e d |
  d2 c4 d |
  c2. d4 |
  d2. cs4 |
  d2.

  f4 |
  f2 e |
  e ds4 cs8[ ds] |
  e4 f e d |
  e c a2

  b4 |
  b e8[ d] c4 a |
  b2
}

tenor = \relative c' {
  \global
  \partial 4
  g4 |
  g e g fs |
  g2. gs4 |
  a2 d,4 a' |
  a g2 g4 |
  g( fs f) 
  
  d'8[ c] |
  b8[( c] d4) d( c8[ b]) |
  a8[( b] c4) b2 |
  b4 f a fs8[ gs] |
  a4 g2 fs4 |
  
  b4 |
  g2. fs4 |
  g2
}

bass = \relative c' {
  \global
  \partial 4
  g4 |
  e c a d |
  g, b c b |
  a g fs c' |
  b2 e,4 e' |
  d2.
  
  d4 |
  g,2 c |
  fs, b |
  e4 d a b |
  c a d2 
  
  g4 |
  e c8[ b] a4 d |
  g,2
}

verseOne = \lyricmode {
  \set stanza = "1."
  The morn has dawned up -- on the sky,
The sac -- red day of joy and light,
When Christ, our hope a -- rose on high
A -- bove the stars in glo -- ry bright.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  To heaven as -- cends Our Lord and King,
As King and Lord he takes his throne;
Re -- joic -- ing choirs of An -- gels sing
Tri -- um -- phant songs to greet the Son.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Our glor -- ious prince, in bat -- tle tried
With sin and death and deep dis -- grace,
In hu -- man form all glor -- i -- fied,
Now stands be -- fore the Fa -- ther’s face.
}

verseFour = \lyricmode {
  \set stanza = "4."
  He rose in glo -- ry through the skies,
And gave to all a hope sub -- lime,
He open'd the gates of Pa -- ra -- dise,
That long were closed by A -- dam’s crime.
}

verseFive = \lyricmode {
  \set stanza = "5."
  O won -- drous joy! the Vir -- gin -- born,
Our hope, our love, our Ho -- ly One,
Af -- ter the blows of spite and scorn
Is seat -- ed on the Fa -- ther’s throne.

 \set stanza = "9." A -- men.
}

\book {
  \include "hymn_paper_multipage.ly"
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
        tempoWholesPerMinute = #(ly:make-moment 84 4)
      }
    }
    \include "hymn_layout_ragged.ly"
  }
  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "6."
          \column {
            "Let thanks arise on every side"
"To Christ our help, our God of might,"
"Who hath our body glorified"
"And raised it to the throne of light."
          }
        }
        \vspace #0.5
        \line {
          \bold "7."
          \column {
            "Abounding joy shall e’er remain,"
"And earth and heaven with glory fill:"
"In heaven, that Christ returns again,"
"On earth, that Christ is with us still."
          }
        }
        \vspace #0.5
        \line {
          \bold "8."
          \column {
            "Then let our hearts with love o’erflow,"
"Our words and deeds be all of light,"
"That when we leave these walks below,"
"Our souls shall climb the heavenly height."
          }
        }
        \vspace #0.5
        \line {
          \bold "9."
          \column {
            "To Christ the Lord sing praises meet,"
"Who rose in might the stars above,"
"Unto the Father and Paraclete,"
"Give equal meed of praise and love."
            "Amen."
          }
        }
      }
      \hspace #1.0

    }
  }
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
      \new Lyrics \lyricsto "tune" { \verseFour }
\new Lyrics \lyricsto "tune" { \verseFive}   
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "6."
          \column {
            "Let thanks arise on every side"
"To Christ our help, our God of might,"
"Who hath our body glorified"
"And raised it to the throne of light."
          }
        }
        \vspace #0.5
        \line {
          \bold "7."
          \column {
            "Abounding joy shall e’er remain,"
"And earth and heaven with glory fill:"
"In heaven, that Christ returns again,"
"On earth, that Christ is with us still."
          }
        }
        \vspace #0.5
        \line {
          \bold "8."
          \column {
            "Then let our hearts with love o’erflow,"
"Our words and deeds be all of light,"
"That when we leave these walks below,"
"Our souls shall climb the heavenly height."
          }
        }
        \vspace #0.5
        \line {
          \bold "9."
          \column {
            "To Christ the Lord sing praises meet,"
"Who rose in might the stars above,"
"Unto the Father and Paraclete,"
"Give equal meed of praise and love."
            "Amen."
          }
        }
      }
      \hspace #1.0

    }
  }
}
  \bottom
}