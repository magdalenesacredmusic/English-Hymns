%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

%%%%%%%%
%%%%%%%%
%%%%%%%%
refs = \markup {
  \fontsize #-3 {
    \left-column {
      \line {
        Text: EIN FESTE BURG, 87 87 66 66 7, Martin Luther, 1529
      }
      \wordwrap {
        Music: \italic "Ein feste burg", Martin Luther, 1529; Tr. Fredrick H. Hedge, 1852
      }
    }
  }
}

top = \markup {
\fill-line {
      \column {
          \line {EIN FESTE BURG  87 87 66 66 7}
      }
      \column{
      \line { Martin Luther, 1529}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {\italic "Ein feste burg"}
     \line {"Martin Luther, 1529; tr. Fredrick H. Hedge, 1852"}
   }
  } 
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  c4 |
  c4 c g8[ a] b4 |
  c8[ b] a4 g c |
  b a g a |
  f8[( e] d4) c4 \bar ""

  c'4 |
  c4 c g8[ a] b4 |
  c8[ b] a4 g c |
  b a g a |
  f8([ e] d4) c \bar "" \break

  c4 |
  g' a g fs |
  g2. c,4 |
  g' g a b |
  c2.  \bar ""

  b4 |
  c b a a |
  g2. a4 |
  a g a f |
  e2. \bar ""

  c'4 |
  b a g a |
  f8[( e] d4) c \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  e4 |
  c e d g |
  e fs g e |
  e c c c |
  a( b) c4

  e |
  c e d g |
  e fs g e |
  e c c c |
  a( b) c

  c |
  c e d d8[ c] |
  b2. c4 |
  d e f f |
  g2.

  e4 |
  c d e d8[ c] |
  b2. f'4 |
  f e e d |
  b2.

  c4 |
  f4 f f e |
  d8[( c] b4) c4
}

tenor = \relative c' {
  \global
  \partial 4
  g4 |
  g g b b |
  a d8[ c] b4 a |
  g f e e |
  f( g) e

  g4 |
  g g b b |
  a4 d8[ c8] b4 a4 |
  g f e e |
  f( g) e

  e |
  e c' b a |
  g2. e4 |
  g c c d |
  e2.

  g,4 |
  e8[ fs] g4 g fs |
  g2. c4 |
  c4. bf8 a4 a |
  gs2.

  a4 |
  a8[ b] c4 d a |
  a( g8[ f]) e4 \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  c4 |
  e c g' e |
  a, d g, a |
  e' f c a |
  d( g,) c

  c |
  e c g' e |
  a, d g, a |
  e' f c a |
  d( g,) c

  c |
  c a b8[ c] d4 |
  g,2. a4 |
  b c f8[ e] d4 |
  c2. e4 |
  a, b c d |
  g2.

  f4 |
  f, c' cs d |
  e2. a,4 |
  d c b cs |
  d( g,) c

}

verseOne = \lyricmode {
  \vOneLL
  A might -- y for --  tress is our God, a bul -- wark ne -- ver fail -- ing;
  Our hel -- per He, a -- mid the flood of mor -- tal ills pre -- vail -- ing:
  For still our an -- cient foe doth seek to work us woe;
  His craft and pow'r are great, and, armed with cru -- el hate,
  On earth is not his e -- qual.
}

verseTwo = \lyricmode {
  \vTwoLL
  Did we in our own strength con -- fide, our striv -- ing would be los -- ing;
  Were not the right Man on our side, the Man of God’s own choos -- ing:
  Dost ask who that may be? Christ Je -- sus, it is He;
  Lord Sa -- ba -- oth, His Name, from age to age the same,
  And He must win the bat -- tle.
}

verseThree = \lyricmode {
  \vThreeLL
  And though this world, with de -- vils filled, should threat -- en to un -- do us,
  We will not fear, for God hath willed His truth to tri -- umph through us:
  The Prince of Dark -- ness grim, we trem -- ble not for him;
  His rage we can en -- dure, for lo, his doom is sure,
  One lit -- tle word shall fell him.
}

verseFour = \lyricmode {
  \vFourLL
  That word a -- bove all earth -- ly pow'rs, no thanks to them, a -- bid -- eth;
  The Spi -- rit and the gifts are ours through Him Who with us sid -- eth:
  Let goods and kind -- red go, this mor -- tal life al -- so;
  The bod -- y they may kill: God’s truth a -- bid -- eth still,
  His king -- dom is for -- ev --  er.
}

%%%%%
%%%%
%%%%

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
        tempoWholesPerMinute = #(ly:make-moment 88 4)
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
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  %\bottom
  \markup {
    \vspace #1
  }
  \refs
}



