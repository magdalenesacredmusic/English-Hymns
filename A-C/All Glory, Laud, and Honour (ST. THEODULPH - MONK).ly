%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.19.82"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
\fill-line {
      \column {
          \line {ST. THEODULPH   76 76 D}
      }
      \column{
      \line {Melchior Teschner; harm. W.H. Monk}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {\italic "Gloria, laus, et honor"}
     \line {"Palm Sunday Procession, tr. J.M. Neale,"}
     \line {\italic "Hymns Ancient and Modern"}
   }
  } 
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

refrain = \relative c' {
  \global
  \partial 4
  \repeat volta 2 {
    c4 |
    g' g a b |
    c2 c4 \bar "|"

    e |
    d c c b |
    c2. ^\markup { \italic Fine.}
  } \break
}

verses = \relative c'' {

  c4 |
  e4 e d c |
  b4( a4) g \bar "|"

  b4 |
  c b a a |
  g2. \bar "|"

  g4 |
  e4 g4 a g |
  g( f) e \bar "|"

  g4 |
  f e d d |
  c2. ^\markup { \italic D.C. }\bar "||"
}

alto = \relative c' {
  \global
  \partial 4
  \repeat volta 2 {
c4 |
d e f f |
f( e8[ d]) e4 

  g |
g8[ f] e4 d d |
e2. 
  }
  
  e4 |
  g a8[ g] fs4 g8[ a] |
  g4( fs) g 
  
    g |
  e8[ fs] g4 g fs |
  g2. 
  
    d4 |
  c c f e |
  d( b) c 
  
    c |
  c c c b |
  c2.
}

tenor = \relative c {
  \global
  \partial 4
  \repeat volta 2 {
  e4 |
  g c c g |
  g2 g4 
  
    c |
  b c a g |
  g2.
  }

  g4 |
  c c8[ b] a4 d |
  d( c) b 
  
    e |
  c d e d8[ c] |
  b2.
  
    g4 |
  g c c c |
  g2 g4 
  
    g |
  a g g4. f8 |
  e2.
}

bass = \relative c {
  \global
  \partial 4
  \repeat volta 2 {
    c4 |
    b c f d |
    c2 c4

      c4 |
    g' a f g |
    c,2.
  }

    c4 |
  c c d e8[ fs] |
  g4( d) e 
  
    e |
  a, b c d |
  g2. 
  
    b,4 |
  c e f c |
  b( g) c 
  
    e |
  f c g g |
  c2.
}


refrainText = \lyricmode {
  <<
    {
      \override LyricText #'font-shape = #'italic
      All glo -- ry, laud, and hon -- our
      To Thee, Re -- dee -- mer, King,
    }
    \new Lyrics {
      \set associatedVoice = "refrain"
      \override LyricText #'font-shape = #'italic
      To whom the lips of chil -- dren
      Made sweet ho -- san -- nas ring.
    }
  >>
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Thou art the King of Is -- rael,
  Thou Da -- vid's roy -- al Son,
  Who in the Lord's name com -- est,
  The King and Bles -- sèd One.
}

verseThree = \lyricmode {
  \set stanza = "3."
  The com -- pa -- ny of An -- gels
  Are prais -- ing Thee on high,
  And mor -- tal men and all things
  Cre -- a -- ted make re -- ply.
}

verseFour = \lyricmode {
  \set stanza = "4."
  The peo -- ple of the He -- brews
  With palms to meet Thee went:
  Our praise and pray'r and an -- thems
  Be -- fore Thee we pre -- sent.
}

verseFive = \lyricmode {
  \set stanza = "5."
  To Thee be-- fore Thy Pas -- sion
  They sang their hymns of praise;
  To Thee now high ex -- alt -- ed
  Our mel -- o -- dy we raise.
}

verseSix = \lyricmode {
  \set stanza = "6."
  Thou didst ac -- cept their prais -- es,
  Ac -- cept the praise we bring,
  Who in all good de -- light -- est,
  Thou good and gra -- cious King.
}

%%%%%%
%%%%%%
%%%%%%

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
\score { \transpose c bf,
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice = refrain {
        \voiceOne
        \refrain {
          \context Voice = verses {
            \voiceOne
            \verses
          }
        }
      }
      \context Voice =
      altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto refrain \refrainText
      \context Lyrics = two \lyricsto verses \verseTwo
      \context Lyrics = three \lyricsto verses \verseThree
      \context Lyrics = four \lyricsto verses \verseFour
      \context Lyrics = five \lyricsto verses \verseFive
      \context Lyrics = six \lyricsto verses \verseSix
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenor >> }
      \context Voice =
      basses { \voiceTwo << \bass >> }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 84 4)
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
      \new Voice = "refrain" {
        \refrain
      }
            \new Lyrics \lyricsto "refrain" { \refrainText }
         \new Voice = "tune" {
        \verses
      }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
         \new Lyrics \lyricsto "tune" { \verseFive }
            \new Lyrics \lyricsto "tune" { \verseSix }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}
