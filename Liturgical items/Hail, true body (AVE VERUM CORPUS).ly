\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {AVE VERUM CORPUS}
    }
    \right-column{
      \line {Gregorian, Mode VI}
      \line {Harm. Achille Bragers}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Ave verum corpus"}
      \line {Tr. Henry Nutcombe Oxenham (1829-1888)}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key g \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g8[ a b] g a g4 c8 b a b4 \hb
  a8 g fs g a[ b] a a4( g) r8 \bar "||"
  
  g8[ a b] g a g4 c8 b a b4 \hb
  a8 g fs g a[ b] a a4( g) \bar "||"
  
  r8 b8 d e d4 c8 b a[ g a] b4 \hb
  c8 c8[ b a] b[ a] g[ fs] a[ b] a a4( g) \bar "||"
  
  r8 b8 d e d4 c8 b a[ g a] b4 \hb 
  c8 c8[ b a] b[ a] g[ fs] a[ b] a a4( g) r8 \bar "||"
  
  g8[ a b] g c4 c8[ b a] b4 r8 \bar "||"
  g8[ a b] g c4 c8[ b a] b4 r8 \bar "||" \break
  
  b4( d8[ e d]) c[ b a] b4 g8 a[ b] c b[ a] a4( g) \bar "||"
}

melodya = \relative c'' {
  \global
   \override Stem #'length = #0
  g4( a b) g a g2 c4 b a b2 \hb
  a4 g fs g a( b) a a2( g) \bar "||"
  
  g4( a b) g a g2 c4 b a b2 \hb
  a4 g fs g a( b) a a2( g) \bar "||"
  
  b4 d e d2 c4 b a( g a) b2 \hb \break
  c4 c4( b a) b( a) g( fs) a( b) a a2( g) \bar "||" \break
  
  b4 d e d2 c4 b a( g a) b2 \hb \break
  c4 c4( b a) b( a) g( fs) a( b) a a2( g) \bar "||"
  
  g4( a b) g c2 c4( b a) b2 \bar "||"
   g4( a b) g c2 c4( b a) b2 \bar "||" \break
  
  b2( d4 e d) c( b a) b2 g4 a( b) c b( a) a2( g) \bar "||"
}

alto = \relative c' {
  \global
  d4.~ d4 e4.~ e4 d~ 
  d2 e4. d4~ d4.~
  
  d4.~ d4 e4.~ e4~ e4~
  e4 fs e4. d2~
  
  d4 g4~ g2 a8[ g a] g4.
  e4.~ e4 d4 e4. d2~
  
  d4 g4~ g2 e4.~ e4.~
  e4. fs4 g8[ fs] e4. d4~ d4.
  
  g2 e4~ e4. g4.
  d2 c4 e4.~ e4.
  
  d4~ d4. e4. g4 g8~ g4. fs4 e d
}

tenor = \relative c' {
  \global
  b4.~ b4 c4.~ c4 d4~
  d2 c4. b4~ b4.~
  
  b4.~ b4~ b4. fs4 g4 
  b4~ b4 c4. b2~
  
  b4 a b d e4. d4.
  c4.~ c4 b4 c4. b2
  
  g4 a b2 c4. b4.
  g4. a4 b c4. b4~ b4.
  
  d2 c4~ c4. d4.
  b4 a g a4. g4.~
  
  g4 b4. c4. d4. c4.~ c4~ c b
}

bass = \relative c' {
  \global
 g4.~ g4~ g4.~ g4~ g
 a b c4. g4~ g4.~
 
 g4. fs4 e4.~ e4~ e4~
 e4 d c4. g'2~
 
 g2~ g2~ g4.~ g4.
 a4.~ a4 b4 c4. g2~
 
 g2~ g2 a4. g4.
 e4. d4~ d4 c4. g'4~ g4.
 
 b2 a4~ a4. g4.~
 g4 fs e~ e4.~ e4.
 
 g4~ g4.~ g4.~ g4.
 e4. d4 c g'4
}

verseOne = \lyricmode {
  Hail, true bo -- dy born of Ma -- ry
By a won -- drous vir -- gin -- birth!
Thou who on the Cross wast of -- fered
To re -- deem the Sons of earth;
Thou whose side be -- came a foun -- tain
Pour -- ing forth thy pre -- cious blood,
Give us now and at our dy -- ing
Thine own self to be our food.

O sweet -- est Je -- sus!
O gra -- cious Je -- sus!
O Je -- sus, bless -- èd Ma -- ry's Son!
}

verseTwo = \lyricmode {
  \vTwo
  A -- ve ve -- rum Cor -- pus na -- tum de Ma -- rí -- a
	Vír -- gi -- ne:
	Ve -- re pas -- sum, im -- mo -- lá -- tum
	in cru -- ce pro hó -- mi -- ne:
	Cu -- jus la -- tus per -- fo -- rá -- tum
	flu -- xit a -- qua et sán -- gui -- ne:
	Es -- to no -- bis prae -- gu -- stá -- tum
	mor -- tis in ex -- á -- mi -- ne.
	O Je -- su dul -- cis!
	O Je -- su pi -- e!
	O Je -- su fi -- li Ma -- rí -- ae.
}


\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { \transpose c bf,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      %\new Lyrics  \lyricsto soprano \verseTwo
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
     % \new Lyrics  \lyricsto soprano \verseTwo
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
     % \new Lyrics \lyricsto "tune" { \verseTwo }
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
