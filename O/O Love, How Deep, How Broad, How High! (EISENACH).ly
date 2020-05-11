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
      \line {EISENACH  LM}
    }
    \right-column{
      \line {adapt. from J.H. Schein; harm. J.S. Bach }
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "O Amor, quam ecstaticus"}
      \line {15th cent.; tr. B Webb, 1852}
    }
  } 
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  d8[ e] |
  fs4 g a a |
  g fs e \bar "||"

  a4 |
  b cs d cs |
  b b a \bar "||"

  a |
  d cs b a |
  g fs e \bar "||"

  a |
  g fs e8[ fs] g4 |
  fs e d \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  a4 |
  d d d d |
  d8[ cs] d4 cs

  e |
  fs gs a8[ e] e4 |
  fs gs e

  e |
  fs e d8[ e] fs4 |
  e a,8[ b] cs4

  fs8[ e] |
  d[ e] e[ d] d[ cs] d4 |
  d cs a \bar "|."
}

tenor = \relative c {
  \global
  \partial 4
  fs8[ g] |
  a4 b c b8[ a] |
  b4 a a

  cs |
  b e a,8[ b] cs4 |
  d8[ cs] b4 cs

  cs8[ b] |
  a[ fs] g[ a] b4 b |
  b8[ cs] d4 a

  cs |
  b8[ a] a4 a g |
  a4. g8 fs4 \bar "|."
}

bass = \relative c, {
  \global
  \partial 4
  <<{\voiceFour \shiftOff \teeny d4_\markup {\italic Ped.} } \\ {\ignore  \voiceTwo \override Stem #'length = #4.5 d'4 } >> |
  d b fs b |
  <<{\voiceFour \shiftOff \teeny e, fs8[ g] a4 } \\ { \voiceTwo\ignore  \override Stem #'length = #4.5 e' fs8[ g] \override Stem #'length = #4.5 a4 } >>

  a4 |
  gs fs8[ e] fs[ gs] a4 |
  d, e a,

  a'8[ g] |
  fs[ d] e[ fs] g[ fs] e[ ds] |
  e4 fs8[ g] a4

  fs |
  b,8[ cs] d4 a b |
  a8[ g] a4 d \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  O love, how deep, how broad, how high,
  How pas -- sing though and fan -- ta -- sy,
  That God, the Son of God, should take
  Our mor -- tal form for mor -- tals’ sake!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  He sent no An -- gel to our race
  Of high -- er or of low -- er place,
  But wore the robe of hu -- man frame
  And He Him -- self to this world came.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Nor will'd He on -- ly to ap -- pear;
  His plea -- sure was to tar -- ry hear;
  And God and Man with man would be
  The space of thir -- ty years and three.
}

verseFour = \lyricmode {
  \set stanza = "4."
  For us bap -- tized, for us He bore
  His ho -- ly fast and hun -- gered sore,
  For us temp -- ta -- tion sharp He knew;
  For us the temp -- ter o -- ver -- threw.
}

\book {
  \include "hymn_paper.ly"
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
  \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "For us He preaches and He prays,"
            "Would do all things, would try all ways;"
            "By words, and signs, and actions, thus"
            "Still seeking not Himself, but us."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "For us to wicked men betrayed,"
            "Scourged, mocked, in Crown of Thorns arrayed;"
            "For us He bore the Cross's death,"
            "For us at length gave up His breath."
          }
        }
        }
      \hspace #0.1  % adds horizontal spacing between columns;
      % if they are still too close, add more " " pairs
      % until the result looks good
      \column {
        \line {
          \bold "7. "
          \column {
            "For us He rose from death again,"
            "For us He went on high to reign,"
            "For us He sent His Spirit here"
            "To guide, to strengthen, and to cheer."
          }
        }
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "All honour, laud, and glory be,"
            "O Jesu, Virgin-born, to Thee!"
            "All glory, as is ever meet,"
            "To Father and to Paraclete."
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
    >>
    \include "hymn_layout.ly"
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
          \bold "5. "
          \column {
            "For us He preaches and He prays,"
            "Would do all things, would try all ways;"
            "By words, and signs, and actions, thus"
            "Still seeking not Himself, but us."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "For us to wicked men betrayed,"
            "Scourged, mocked, in Crown of Thorns arrayed;"
            "For us He bore the Cross's death,"
            "For us at length gave up His breath."
          }
        }
        }
      \hspace #0.1  % adds horizontal spacing between columns;
      % if they are still too close, add more " " pairs
      % until the result looks good
      \column {
        \line {
          \bold "7. "
          \column {
            "For us He rose from death again,"
            "For us He went on high to reign,"
            "For us He sent His Spirit here"
            "To guide, to strengthen, and to cheer."
          }
        }
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "All honour, laud, and glory be,"
            "O Jesu, Virgin-born, to Thee!"
            "All glory, as is ever meet,"
            "To Father and to Paraclete."
          }
        }
      }
      \hspace #1.0
    }
  }
}
  \bottom
}



