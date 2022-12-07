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
    \column{
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f8 f d ef f[ g] f bf a g[ a] g4 \bar "'"
  g8 a bf a g[ f] 
  g[ a] g f4 f \divisioMaior \bar ""
  f8 f[ g] f ef8 g bf c bf4 \bar "'"
  c8 d[ c] bf 
  bf8 a4( g) \divisioMaior \bar ""
  g8 a bf[ a] g[ f] g[ a] g f4 f \bar "||"
  
   %verse
   \transpose c df {
     \relative c' {
  a'8\rest e8 fs8[ e] e[ a] a a a a a a a4 \bar "|"
  a8 a  \bar "" \break
  a4 gs8 e8[ fs] a[ gs] fs e4 \bar "||"
  % Glory be
  b'8\rest e,8 fs8[ e] e[ a] a a a a a a a a4 \bar "'" \break
  a8 a a8[ gs] a[ b] b a[ b] a4 \bar "|"
  %as it was
  a8[ fs] fs8[ a] a a a a a a4 \bar "'" \break
  a8 a a8[ gs] a[ b] b a[ b] a4 \bar "|"
  a4 gs8 e8[ fs] a[ gs] fs e4 \bar "||"
     }
   }
}

melodya = \relative c' {
  \global
     \override Stem #'length = #0
  f4 f d ef f( g) f bf a g( a) g4 \bar "'"
  g4 a bf a g( f)
  g( a) g f2 f \divisioMaior \bar ""
  f4 f( g) f ef \bar "" g bf c bf2 \bar "'"
  c4 d( c) bf 
  bf4 a2( g) \divisioMaior \bar "" \break
  g4 a bf( a) g( f) \bar "" g( a) g f2 f \bar "||" s1 s1 s1 s1 \bar "" s1 s1 s1 \bar "" \break
  
   \transpose c df {
     \relative c' {
  e4 fs4( e) e( a) a a a a a a a2 \bar "|"
  a4 a  
  a2 gs4 e4( fs) a( gs) fs e2 \bar "||"
  % Glory be
  e4 fs4( e) e( a) a a a a a a a a2 \bar "'" \break
  a4 a a4( gs) a( b) b a( b) a2 \bar "|"
  %as it was
  a4( fs) fs( a) a a a a a a2 \bar "'" \break
  a4 a a4( gs) a( b) b a( b) a2 \bar "|"
  a4 gs4 e4( fs) a( gs) fs e2 \bar "||"
     }
   }
}

alto = \relative c' {
  \global
  bf4~ bf~ bf4. f'4 d2~ 
  d4 f4 ef~ ef4. c2
  bf2 ef4 f2~
  f8~ f4~ f4 d2
  d4 g bf, ef4. c2
  
  %verse
   \transpose c df {
     \relative c' {
  s4 cs4~ cs4~ cs2.~ cs4
  fs4
  e2~ e8 b4.~ b4
  
  s4 cs1~ cs8~ cs4~ cs4~
  
  cs4 e4~ e4. d4 cs4
  d2~ d8 fs4. e4.~
  
  e2 d4.~ d4 cs4
  e4. d4 b4.~ b4
     }
   }
}

tenor = \relative c {
  \global
  d4 f4~ f4. c'4~ c bf~
  bf4~ bf4~ bf~ bf4.~ bf4 a
  f2 g4 bf2~ bf8 a4 d4 c bf
  bf4~ bf f bf4.~ bf4 a
  
   %verse
    \transpose c df {
     \relative c {
  s4 a'~ a~ a2.~ a4~ 
  a4~
    a2~ a8 fs4. gs4
  
  s4 a1~ a8~ a4~ a4
  
  a4 b a gs8 fs4~ fs
  a2~ a8~ a4.~ a4.~
  
  a2 fs4.~ fs4~ fs
  a4.~ a4 fs4. gs4
     }
    }
}

bass = \relative c {
  \global
   bf4~ bf d4.~ d4 g2~
   g4 d4 ef c4. f2
   d2 c4 d2~
   d8 d4~ d4 g2
   f4 ef4 d c4. f2
   
   \transpose c df {
     \relative c {  
       c4\rest a'4 gs fs2.~ fs4 
 d4
 
 cs2~ cs8 d4. e4
 s4 a1~ a8 gs4 fs~
 
 fs4 e~ e4. fs4~ fs4~
 fs2~ fs8 d4. cs~
 
 cs2 b4. d4 fs
 cs4. d4~ d4. e4 
     }
   }
}

verseOne = \lyricmode {
  I saw wa -- ter flow -- ing from the Tem -- ple,
  from its right -- hand side, al -- le -- lu -- ia;
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
        \melodya
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
