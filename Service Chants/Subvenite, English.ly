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
      \line {}
    }
    \right-column{
      \line {Plainsong, Mode VII}
      \line {Samuel Weber, OSB; arr. David O'Donnell, 2021}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Subvenite, sancti Dei"}
      \line {Tr. \italic "Order of Christian Funerals"}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f8[ e] f[ g] g4 \bar "'"
  bf8 a g a4 \bar "|"
  g8 g g g g \bar "'"
  a8 g f f 
    g4( f) \bar "|" \break
  b8\rest g8 g g g4 \bar "'" bf8 a g a4 \bar "|"
  g8 a g f g4( f) \bar "||" \break
  
  b8\rest g8 g g g g^- \bar "'"
  bf8 a g a a4 \bar "|"
  b8\rest g8 g g g g^- \bar "'"
  g8 g a g g f f g4( f)^\markup {\left-align \italic To \bold "℟."} \bar "||" \break
  
  b8\rest g8 g g g^- \bar "'"
  bf8 a a g a a4 \bar "|"
  b8\rest g8 g g g g g g^- \bar "'"
  a8 g f g4( f)^\markup {\left-align \italic To \bold "℟."} \bar "||"

\bar "|."
}

alto = \relative c' {
  \global
  c2~ c4 d4. c4~ c4.~ c4~ c2 d4 c
  
  d4~ d ef4 d4.~ d4~
  d8~ d4. c2
  
  c4~ c2 d2 c4~ 
   c4~ c4~ c4~ c4 \once \override Accidental #'stencil = ##f e4. d4 c2
  
  c4~ c4. d4.~ d4 c4~
  c4~ c2. e4. d4 c
}

tenor = \relative c {
  \global
  f2 e4 f4. f4
  e4.~ e4 f2 bf4 a
  
  bf4~ bf4~ bf4
  f4.~ f4~
  f8 f8[ g a] bf4 a
  
  \once \override Accidental #'stencil = ##f e4~ e2 d2 f4
  e4~ e4~ e4~ e4 a4.~ a4 bf4 a
  
  e4~ e4. d4.~ d4 f4
  e4~ e2. a4. bf4 a
}

bass = \relative c {
  \global
 a2 c4 bf4. f4 c'4.~ c4 f2 bf4 a
 
 g4~ g8[ f] ef4
 bf4. d4~ d8~ d4. f2
 
 c4~ c2 bf2 f4
 c'4~ c~ c4~c4~ c4. d4 f2
 
 c4~ c4. bf4.~ bf4 f4
 c'4~ c2.~ c4. bf4 f'4
}

verseOne = \lyricmode {
  Saints of God, come to his aid!
  Has -- ten to meet him, an -- gels of the Lord!
  
  \set stanza = "℟."
  Re -- ceive his soul and pre -- sent him
  to God the Most High.
  
  \set stanza = "℣."
  May Christ, who called you, take you to him -- self;
  may an -- gels lead you to the bos -- om of A -- bra -- ham.
  
  \set stanza = "℣."
  E -- ter -- nal rest grant un -- to him, O Lord,
  and let per -- pe -- tu -- al light shine up -- on him.
  

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
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
