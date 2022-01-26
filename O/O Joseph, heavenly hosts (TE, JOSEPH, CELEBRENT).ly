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
      \line {TE JOSEPH CELEBRENT  12 12 12 8}
    }
    \right-column{
      \line {\italic "Antiphonale Romanum," Mode I} 
      \line {Harm. Achille P. Bragers}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Te Ioseph celebrent," Tr. Thomas Isaac Ball}
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
  d8 f8[ e] f g a d,[ c] f e f d c c4( d) \hb
  d8[ a'] g f[ e] f g g[ a] a[ g] a b c b[ a] a4 \bar "|" \break
  a8[ d] c[ b] a[ g] %\bar ""
  a8 g f[ e] d[ g] f d e d[ c] c4 \hb
  e8 g[ a] d,[ c] d e f e[ d] d4 \bar "||"
  
  d8[ e d] c4( d) \bar "||"
}

melodychant = \relative c' {
  \global
  \override Stem #'length = #0
  d4 f4( e) f g a d,( c) f e f d c c2( d) \hb
  d4( a') g f( e) f g g( a) a( g) \bar "" a b c b( a) a2 \bar "|"
  a4( d) c( b) a( g) \bar "" \break
  a4 g f( e) d( g) f d e d( c) c2 \hb
  e4 g( a) d,( c) d e f e( d) d2 \bar "||" \break
  
  d4( e d) c2( d) \bar "||"
}

alto = \relative c' {
  \global
  a8 c4.~ c4 a4.~ a4 s4 s2 
  d4.~ d4 c2~ |
  
  c4 f4.~ f4 e4
  f2. c2 a4~ a4.~ a4 c4~
  c8~ c4 d8[ c] a4.~ a4~ a4
  
  a4. g4 a4
}

tenor = \relative c {
  \global
  f8~ f4. e4 f4.~ f4 g4 a2~
  a4.~ a4~ a2~
  
  a4~ a4.~ a4~ a4~
  a2. g2 f4~ f4.~ f4 g4~
  g8~ g2~ g4.~ g4 f4
  
  f4. g4 f
}

bass = \relative c {
  \global
 d8 a4. c4 d4.~ d4 e f2~
 f4.~ f4~ f2
 
 e4 d4.~ d4 c4
 d2. e2 f4~ f4.~ f4 e4~
 e8~ e2 d4.~ d4~ d4
  
  d4. e4 d
}

verseOne = \lyricmode {
  \set stanza = "1."
  O Jo -- seph, heav'n -- ly hosts thy worth -- i -- ness pro -- claim,
  And Chris -- ten -- dom con -- spires to cel -- e -- brate thy fame,
  Thou who in pur -- est bonds were to the Vir -- gin bound;
  How glo -- rious is thy name re -- nowned.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Thou, when thou didst be -- hold thy Spouse a -- bout to bear,
  Were sore op -- pressed with doubt, were filled with won -- d'ring care;
  At length the An -- gel's word thy an -- xious heart re -- lieved:
  She by the Spir -- it hath con -- ceived.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Thou with thy new -- born Lord didst seek far E -- gypt's land,
  As wan -- d'ring pil -- grims, ye fled o'er the des -- ert sand;
  That Lord, when lost, by thee is in the tem -- ple found,
  While tears are shed, and joys a -- bound.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Not till death's hour is past do o -- ther men ob -- tain
  The meed of ho -- li -- ness, and glo -- rious rest at -- tain;
  Thou, like to An -- gels made, in life com -- plete -- ly blest,
  Dost clasp thy God un -- to thy breast.
}

verseFive = \lyricmode {
  \set stanza = "5."
 O Ho -- ly Trin -- i -- ty, thy sup -- pliant ser -- vants spare;
 Grant us to rise to heav'n for Jo -- seph's sake and prayer,
 And so our grate -- ful hearts to thee shall ev -- er raise
 Ex -- ult -- ing can -- ti -- cles of praise.
 
 \set stanza = "5."
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
        \melodychant
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour}
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
