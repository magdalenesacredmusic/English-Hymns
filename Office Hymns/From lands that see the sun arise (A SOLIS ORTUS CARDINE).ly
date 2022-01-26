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
      \line {A SOLIS ORTUS CARDINE  LM}
    }
    \right-column{
      \line {Plainsong, Mode III, \italic"Liber Usualis"}
      \line {Harm. arr. David O'Donnell, 2021 }
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "A olis ortus cardine"}
      \line {Tr. John Mason Neale}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d8 e f g[ a] d, e8[ g] f[ e] e4 \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|"
  g8 a8[ c] c c[ b] a[ g] a[ b] b b4 \bar "|"
  a8 a[ c d] c c[ b] a[ g] a g[ f] e[(^- d] f8[ g] a4) \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|"
 d,8 e f g8[ a] g[ f] g f e4 \bar "||" \break
 
 e8[ f e] d4( e) \bar "||"
}

melodya = \relative c' {
  \global
  \override Stem #'length = #0
  d4 e f g( a) d, e( g) f( e) e2 \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|"
  g4 a( c) c c( b) a( g) a( b) b b2 \bar "|"
  a4 a( c d) c c( b) a( g) a g( f) e4(^- d f g a2) \once \override Staff.BarLine.bar-extent = #'( -1 . 1 ) \bar "|"
 d,4 e f g4( a) g( f) g f e4 \bar "||" \break
 
 e4( f e) d2( e) \bar "||"
}

alto = \relative c' {
  \global
  d4. e4 d8 c4~ c b~ |
  b8 f'4. g4 e~ e4.~ e4
  r8 e2~ e4 f4. g8[ f] e8[ d]~ d4 e
  d4. e2 c4 b
  
  c4. d4 b
}

tenor = \relative c {
  \global
  f8[ g a] g4 g8 e4 a g~ |
  g8 c4.g4 b c4. b4
  s8 c2~ c4~ c4. b4 b4 a4~ a
  f8[ g a] g2 a4 g
  
  a4.~ a4~ a8[ g]
}

bass = \relative c {
  \global
  d4. c4 b8 a4~ a e'~ |
  e8 f4. e4~ e a4. g4
  d8\rest a'2 g4 f4. d4 g4 d c
  d4. c2 a4 e'
  
  a4. f4 e
}

verseOne = \lyricmode {
  \set stanza = "1."
From lands that see the sun a -- rise
To earth's re -- mot -- est boun -- a -- ries,
The Vir -- gin -- born to -- day we sing,
The Son of Mar -- y, Christ the King.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Blest Au -- thor of this earth -- ly frame
  To take a ser -- vant's form he came,
  That lib -- er -- at -- ing flesh by flesh
  Whom he had made might live a -- fresh.
}

verseThree = \lyricmode {
  \set stanza = "3."
  In that chaste par -- ent's ho -- ly womb,
  Ce -- les -- tial grace had found its home;
  And she, as earth -- ly Bride un -- known,
  Yet calls that Off -- spring blest her own.
}

verseFour = \lyricmode {
  \set stanza = "4."
  The man -- sion of the mod -- est breast
  Be -- comes a shrine where God shall rest;
  The pure and un -- de -- fil -- ed One
  Con -- ceiv -- èd in her womb the Son.
  
  \set stanza = "8."
  A -- men.
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
      }
    }
    \include "hymn_layout_ragged.ly"
  }
    \markup {
    \vspace #1
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "That Son, that Royal Son, she bore,"
            "  Whom Gabriel's voice had told before;"
            "Whom, in his mother yet concealed"
            "  The infant Baptist had revealed."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "The manger and teh straw he bore,"
            "  The cradle he did not abhor;"
            "A little milk his infant fare"
            "  Who feedeth all the fowl of air."
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
            "The heavenly chorus filled the sky,"
            "  The angels sang to God on high,"
            "What time to shepherds watching lone,"
            "  They made creation's Shepherd known."
          }
        }
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "All honor, praise and glory be,"
            "  O Jesus, Virgin-born, to thee;"
            "All glory, as is ever meet,"
            "  To Father, and to Paraclete.  Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}
\markup {
  \vspace #1
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
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour}
    >>
    \include "hymn_layout_ragged.ly"
  }
      \markup {
    \vspace #0.5
  \large {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "That Son, that Royal Son, she bore,"
            "  Whom Gabriel's voice had told before;"
            "Whom, in his mother yet concealed"
            "  The infant Baptist had revealed."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "The manger and teh straw he bore,"
            "  The cradle he did not abhor;"
            "A little milk his infant fare"
            "  Who feedeth all the fowl of air."
          }
        }
      \vspace #1
        \line {
          \bold "7. "
          \column {
            "The heavenly chorus filled the sky,"
            "  The angels sang to God on high,"
            "What time to shepherds watching lone,"
            "  They made creation's Shepherd known."
          }
        }
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "All honor, praise and glory be,"
            "  O Jesus, Virgin-born, to thee;"
            "All glory, as is ever meet,"
            "  To Father, and to Paraclete.  Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}
\markup {
  \vspace #1
}
  \bottom
}
