\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {VIDI AQUAM}
    }
    \right-column{
      \line {Mode 2 plainsong}
      \line {Adapt. Samuel Weber, © St. Meinrad Archabbey}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Vidi aquam"}
      \line {Tr. \italic "The Roman Missal," 3rd Edition}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key a \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  e8[ fs] fs8[ d fs e] e[--fs-- e]-- e4 \bar "'"
  a8[( a] a[ b]) fs fs8[ e] fs fs[ gs fs] fs4 \hb \break
  
  e8[ fs] e a~( a[ b]) fs8[ e] e8[( fs e]~ e d4) \hb
  e8 e8[ fs d e] e8[( fs] a[ fs gs]) fs4( e) \bar "|" \break
  
  e8[ fs] e8[-- fs\prall gs a] gs gs[( a] gs4) \bar "'"
  a8[( a~] a[ gs]) fs[ b] a[ gs] a[( b] a[ gs a] gs[ fs e] fs4 e) \hb \break
  
  a8[ b] cs[( b a]~ a[ gs] fs4) \bar "'"
  fs8[ e] fs fs[( a e fs] e4 d) \hb \break
  
  e8[ fs] fs fs[ gs fs] fs4 \bar "|"
  fs8[ e d] e[( fs] a4 fs8[-- gs\prall a]) e8[-- fs-- e]-- e4 \bar "||" \break
  
  %verse
  b'8\rest e,8 fs8[ e] e[ a] a a a a a a a4 \bar "|"
  a8 a  \bar "" \break
  a8[ a] gs8 e8[ fs] a[ gs] fs e4 \bar "||"
  % Glory be
  b'8\rest e,8 fs8[ e] e[ a] a a a a a a a a4 \bar "'" \break
  a8 a a8[ gs] a[ b] b a[ b] a4 \bar "|"
  %as it was
  a8[ fs] fs8[ a] a a a a a a4 \bar "'" \break
  a8 a a8[ gs] a[ b] b a[ b] a4 \bar "|"
  a8[ a] gs8 e8[ fs] a[ gs] fs e4 \bar "||"
}

alto = \relative c' {
  \global
  cs4 d2 e8[ fs e] e4~
  e2~ e8 fs8[ e] fs cs4.~ cs4
  
  b4. cs4. b4 a b2~
  b2~ b8 a2~ a8 b4( b4)~
  
  b4 cs4~ cs4. e4~ e4
  cs2 fs2 e~ e8~ e4. cs4 b
  
  e2 d4. cs4~
  cs4. a2 b
  
  d4. cs~ cs4
  d4.~ d4 a4 b4.~ b4.~ b4
  
  %verse
  s4 cs4~ cs4~ cs2.~ cs4
  fs4
  e2~ e8 b4.~ b4
  
  s4 cs1~ cs8~ cs4~ cs4~
  
  cs4 e4~ e4. d4 cs4
  d2~ d8 fs4. e4.~
  
  e2 d4.~ d4 cs4
  e4. d4 b4.~ b4
}

tenor = \relative c' {
  \global
  a4~ a2 b4. cs4~
  cs2~ cs8 b4.~ b4. a4
  
  gs4. a4. fs4 e fs2~
  fs~ fs8 e2~ e8 fs4 gs4~
  
  gs4 a~ a4. cs4 b
  a2 b cs~ cs8 b4. a4 gs
  
  a2 b4. a4~
  a4. e2 fs~
  
  fs4.~ fs4.~ fs4~
  fs4.~ fs4 e fs4. a gs4
  
  %verse
  s4 a~ a~ a2.~ a4~ 
  a4~
    a2~ a8 fs4. gs4
  
  s4 a1~ a8~ a4~ a4
  
  a4 b a gs8 fs4~ fs
  a2~ a8~ a4.~ a4.~
  
  a2 fs4.~ fs4~ fs
  a4.~ a4 fs4. gs4
}

bass = \relative c {
  \global
 a'4 fs2 gs4. a4~
 a2~ a8 gs4. fs4.~ fs4
 
 gs4. fs d4 cs b2~
 b2~ b8 cs2~ cs8 d4 e4~
 
 e4 a4 fs4. e4~ e
 fs2 d cs~ cs8 e4.~ e4~ e4
 
 cs2 b4. fs'4~
 fs4. cs2 b~
 
 b4.~ b4. a4
 b4.~ b4 cs4 d4.~ d4. e4
 
 d4\rest a'4 gs fs2.~ fs4 
 d4
 
 cs2~ cs8 d4. e4
 s4 a1~ a8 gs4 fs~
 
 fs4 e~ e4. fs4~ fs4~
 fs2~ fs8 d4. cs~
 
 cs2 b4. d4 fs
 cs4. d4~ d4. e4
}

verseOne = \lyricmode {
  I saw wa -- ter \set stanza = "*"
  flow -- ing from the Tem -- ple,
  from its right -- hand side,
  al -- le -- lu -- ia:
  
  and all to whom this wa -- ter came
  were saved and shall say:
  Al -- le -- lu -- ia, al -- le -- lu -- ia.
  
  \set stanza = "℣." O give thanks to the Lord, for he is good,
  \set stanza = "*" for his love en -- dures for -- ev -- er.
  
  Glo -- ry be to the Fa -- ther, and to the Son,
  and to the Ho -- ly Spir -- it. \set stanza = "*"
  As it was in the be -- gin -- ning,
  is now and ev -- er shall be,
  world with -- out end. A -- men.

}

verseTwo = \lyricmode {
  \vTwo

}

verseThree = \lyricmode {
  \vThree

}

verseFour = \lyricmode {
  \vFour

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
