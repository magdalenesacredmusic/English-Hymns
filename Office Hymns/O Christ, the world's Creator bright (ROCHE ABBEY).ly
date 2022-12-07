\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {ROCHE ABBEY, LM}
    }
    \right-column{
      \line {Thomas Worsley Staniforth (1845-1909)} %Arundal Hymns #180, adapt. A Treasury of Catholic Song 1915 #126
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Auctor beati saeculi"}
      \line {Tr. Fredrich Charles Husenbeth (1796-1872)}
    }
  }
}

\header {
  tagline = ""
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
  g bf ef bf |
  c bf8[ af] g4 bf |
  ef, ef ef af | \break
  g g f \bar ""
  
  g4 |
  af bf c f, |
  g af bf ef, |
  f g af g |
  \time 3/4 f f ef4 \bar "||"
  
  \time 4/4 ef2 ef \bar "|."
}

alto = \relative c' {
  \global
  ef4 
  ef f ef ef 
  ef d ef bf
  ef bf c ef 
  ef ef d
  
  ef ef ef8[ df] c4 d
  ef f f ef
  ef d f8[ c] ef4
  ef d ef
  
  c2 bf2
}

tenor = \relative c' {
  \global
  g4
  bf f g bf
  af8[ g] f4 ef f
  g bf af c
  bf bf bf
  bf
  af g af bf
  bf c bf g
  c bf f bf
  bf af g
  
  af2 g
}

bass = \relative c {
  \global
 ef4 
 ef d c g
 af bf ef d
 c g af g 
 bf bf bf
 
 ef
 c ef af af 
 g f8[ ef] d4 c
 af g f g8[ af] 
 bf4 bf ef
 
 af,2 ef'2
}

verseOne = \lyricmode {
  \vOne
  O Christ, the world's Cre -- a -- tor bright,
  Who didst man -- kind from sin re -- deem,
  The Fa -- ther's ev -- er glo -- rious Light,
  True God of God, in bliss su -- preme.
}

verseTwo = \lyricmode {
  \vTwo
  Thy love com -- pelled thee to as -- sume
  A mor -- tal Bo -- dy, man to save;
  Re -- vers -- ing ol -- den Ad -- am's doom,
  The new -- er Ad -- am ran -- som gave.
}

verseThree = \lyricmode {
  \vThree
  That love which once cre -- a -- ted all,
  The earth, the stars, the won -- drous sea,
  Took pit -- y on our par -- ents fall, 
  Broke all our bonds and set us free.
}

verseFour = \lyricmode {
  \vFour
  O Sa -- vior, let thy po -- tent love
  Flow ev -- er from thy boun -- teous Heart;
  To na -- tions that pure fount a -- bove
  The grace of par -- don will im -- part.
  
  \set stanza = "6." A -- men.
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_layout.ly"
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
            "Thy Heart for this was opened wide,"
"And wounded by the soldier's spear,"
"That freely from thy sacred side"
"Might flow the streams our souls to clear."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "To God the Father, to the Son"
            "And to the Holy Ghost the same,"
            "Be glory, power, while ages run,"
            "And endless rule in endless fame.   Amen."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}
  \bottom
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Hymnal")
\book {
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  \top
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
      \new Lyrics \lyricsto "tune" { \verseFour}
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
