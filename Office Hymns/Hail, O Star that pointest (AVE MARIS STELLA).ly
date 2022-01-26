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
      \line {AVE MARIS STELLA  77 77}
    }
    \right-column{
      \line {Mode I, Roman Use}
      \line {harm. J.H. Desrocquettes}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Ave, maris stella"}
      \line {Tr. Athelstan Riley, 1906}
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
  %\once \override Score.SeparationItem #'padding = #2
  d8 a'[ b] g a[ b] d c[( b a g] a4) \bar "'"
  a8 a %\bar "" %\break
  d,[ e] g f[ e] d4 \divisioMaior \bar ""
  f8 e g a a d,[(^- e f e d] c4) \bar "'"
  e8 g e f e d4 \bar "||" \break
  
  d8[ e d] c4( d) \bar "||"
 
}

melodya = \relative c' { 
  \global
   \override Stem #'length = #0
  %\once \override Score.SeparationItem #'padding = #2
  d4 a'( b) g a( b) d c( b a g a2) \bar "'"
  a4 a %\bar "" %\break
  d,( e) g f( e) d2 \divisioMaior \bar ""
  f4 e g a a d,(^- e f e d c2) \bar "'"
  e4 g e f e d2 \bar "||" \break
  
  d4( e d) c2( d) \bar "||"
 
}

alto = \relative c' {
  \global
  r8 f4. d4. e2~e4 
  c4 d4. c4 a4~ \hb 
  a8 c4~c a~ a4. c4~
  c8~ c4~ c a4~ 
  
  a4.~ a2 
}

tenor = \relative c' { 
  \global
  d8\rest a4.~ a4.~a4 b c~ 
  c a4.~ a4 f4~ \hb
  f8 g4 e f~f4. g4~ 
  g4. a4 f 
  
  g4. e4 f
}

bass = \relative c { 
  \global
  s8 d4. f4. a2~ a4 
  f4~ f4. a4 d,4 \hb 
  d8 c4~ c d4~ d4. e4~ 
  e4. a4 d,~ 
  
  d4.~ d2 
}

verseOne = \lyricmode {
  \set stanza = "1."
  Hail, O Star that point -- est
  Towards the port of heav -- en,
  Thou to whom as maid -- en
  God for Son was giv -- en.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  When the sal -- u -- ta -- tion
  Ga -- bri -- el had spo -- ken,
  Peace was shed up -- on us,
  E -- va's bonds were bro -- ken.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Bound by Sa -- tan's fet -- ters,
  Health and vi -- sion need -- ing,
  God will aid and light us
  At thy gen -- tle plead -- ing.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Je -- sus' ten -- der Moth -- er,
  Make thy sup -- pli -- ca -- tion
  Un -- to him who chose thee
  At his In -- car -- na -- tion.
  
   \set stanza = "7."
  A -- men.
}

verseFive = \lyricmode {
  \set stanza = "5."
  That, O match -- less Maid -- en,
              Pass -- ing meek and low -- ly,
            Thy dear Son may make us
            Blame -- less, chaste and ho -- ly.
}

verseSix = \lyricmode {
  \set stanza = "6."
  So, as now we jour -- ney,
              Aid our weak en -- deav -- or,
            Till we gaze on Je -- sus,
              And re -- joice for ev -- er.
}

verseSeven = \lyricmode {
  \set stanza = "7."
  Fa -- ther, Son and Spir -- it,
             Three in One con -- fess -- ing,
            Give we e -- qual glo -- ry,
             E -- qual praise and bless -- ing.
  
 % \set stanza = "7."
 % A -- men.
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
    \include "hymn_layout_ragged.ly"
  }
   \markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "That, O matchless Maiden,"
            "  Passing meek and lowly,"
            "Thy dear Son may make us"
            "  Blameless, chaste and holy."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "So, as now we journey,"
            "  Aid our weak endeavor,"
            "Till we gaze on Jesus,"
            "  And rejoice for ever."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "Father, Son and Spirit,"
            "  Three in One confessing,"
            "Give we equal glory,"
            "  Equal praise and blessing."
            "                                 Amen."
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
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour}
      \new Lyrics \lyricsto "tune" { \verseFive }
      \new Lyrics \lyricsto "tune" { \verseSix }
       \new Lyrics \lyricsto "tune" { \verseSeven }
    >>
    \include "hymn_layout_ragged.ly"
  }
%{  \markup {
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
            "That, O matchless Maiden,"
            "  Passing meek and lowly,"
            "Thy dear Son may make us"
            "  Blameless, chaste and holy."
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "So, as now we journey,"
            "  Aid our weak endeavor,"
            "Till we gaze on Jesus,"
            "  And rejoice for ever."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "Father, Son and Spirit,"
            "  Three in One confessing,"
            "Give we equal glory,"
            "  Equal praise and blessing."
            "                                 Amen."
          }
        }
      }
      \hspace #1.0

    }
  }
} %}
  \bottom
}
