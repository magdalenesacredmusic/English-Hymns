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
      \line {ERHALT' UNS, HERR   LM}
    }
    \column{
      \line {Martin Luther; adapt. J.S. Bach}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Clarum decus jejunii"}
      \line {Gregory the Great; tr. M.F. Bell}
    } 
  }
}


global = {
  \key f \minor
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  f8[ g8] |
  af4 g8[ f8] e4 f8[ g8] |
  af4 g f \bar "" 
  
    af |
  bf bf c af |
  bf bf c \bar "" 
  
    c |
  df c8[ df] ef[ df] c4 |
  bf8[ af]bf4 af4 \bar "" 
  
    c |
  af bf af g |
  f e f2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  c4 |
  f8[ ef] df4 c c8[ e] |
  f4 e c

  f |
  ef8[ f] g4 af c, |
  f8[ af] g[ f] e4

  f |
  f8[ g] af4 bf af |
  g8[ af] af[ g] ef4

  g4 |
  f f8[ e8] f4 e! |
  f8[ df] c4 c2 |
}

tenor = \relative c' {
  \global
  \partial 4
  af8[ bf] |
  c4 bf8[ af] g4 af8[ bf] |
  c8[ df8] g,8[ c8] af4

  c4 |
  bf ef ef f |
  f bf, g

  af |
  bf ef ef ef |
  df8[ c] df[ bf] c4

  c4 |
  c bf c c8[ bf8] |
  af4 g8[ af16 bf] af2 |

}

bass = \relative c, {
  \global
  \partial 4
  f4 |
  f'4 bf,4 c8[ bf] af[ g] |
  f[ bf] c4 f,4

  f'4 |
  g ef af8[ g] f[ ef] |
  df8[ c8] df4 c4

  f4 |
  bf, af g af |
  ef' ef af

  e |
  f8[ f,8] g4 af8[ bf] c4 |
  df8[ bf] c4 f,2 |

}

verseOne = \lyricmode {
  \set stanza = "1."
  The glo -- ry of these for -- ty days
  We cel -- e -- brate with songs of praise;
  For Christ, by Whom all things were made,
  Him -- self has fast -- ed and has prayed.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  A -- lone and fast -- ing Mo -- ses saw
  The lov -- ing God Who gave the law;
  And to E -- li -- jah, fast -- ing, came
  The steeds and char -- i -- ots of flame.
}

verseThree = \lyricmode {
  \set stanza = "3."
  So Dan -- iel trained his mys -- tic sight,
  De -- liv -- ered from the li -- ons’ might;
  And John, the Bride -- groom’s friend, be -- came
  The her -- ald of Mes -- si -- ah’s Name.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Then grant us, Lord, like them to be
     Full oft in fast and prayer with thee;
       Our spir -- its streng -- then with thy grace,
       And give us joy to see thy face.
}

verseFive = \lyricmode {
  \set stanza = "5."
            O Fa -- ther, Son, and Spir -- it blest,
            To thee be ev -- 'ry prayer ad -- dressed,
            Who art in three -- fold Name a -- dored,
            From age to age, the on -- ly Lord.
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
        \new Voice = "tune" {
          \melody
        }
        \new Lyrics \lyricsto "tune" { \verseOne }
        \new Lyrics \lyricsto "tune" { \verseTwo }
        \new Lyrics \lyricsto "tune" { \verseThree }
        \new Lyrics \lyricsto "tune" { \verseFour }
        \new Lyrics \lyricsto "tune" { \verseFive }
      >>
      \include "hymn_layout.ly"
    }
    \markup { 
      \vspace #0.5 
    }
    \bottom
  }