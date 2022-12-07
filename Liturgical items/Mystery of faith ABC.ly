\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {\large \smallCaps "Memorial Acclamation"}
      \line {\large \smallCaps "A"}
    }
    \right-column{
      \line {\italic "The Roman Missal;" harm. ICEL}
      \line {transcribed D. O'Donnell}
    }
  }
}

middle = \markup  {
    \left-column {
      \line {\large \smallCaps B}
      \line {}
    }
  }

bottom = \markup  {
    \left-column {
      \line {\large \smallCaps C}
      \line {}
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

melody = \relative c'' {
        \global
    a8 a g a c b a4 \hb
	e8 g a a b a g[ a] g4 \bar "'"
	a8 a f g[ a] g e4 \bar "||"
}

alto = \relative c' {
	\global
    e2 g4 e
	d e~ e~ e2
	e4. d4. b4
}

tenor = \relative c' {
	\global
    c2 d4 c
	b c d8[ c] b2
	a4. b4. g4
}

bass = \relative c' {
	\global
    a2 e4 a 
	b4 a~ a e2
	c4. b4. e4
}

verseOne = \lyricmode {
	\set stanza = "℟."
	We pro -- claim your Death, O Lord, 
	and pro -- fess your Res -- ur -- rec -- tion
	un -- til you come a -- gain.
}

sopranob = \relative c' {
        \global
       e8 g a a g a c b a4 \hb
       a8 a  %\bar "" \break
         b a g[ a] g  g4 \hb
       a8 a f g[ a] g e4 \bar "||"
}

altob = \relative c' {
	\global
	d4 e2 g4 e4 
	e4~ e4~ e4.~ e4 
	e4. d4. b4
}

tenorb = \relative c' {
	\global
        b4 c2 d4 c
        c4 d8[ c] b4.~ b4
        a4. b4. g4
}

bassb = \relative c' {
	\global
	b4 a2 e4 a 
	a4~ a4 e4.~ e4 
	c4. b4. e4
}

verseTwo = \lyricmode {
	\set stanza = "℟." 
	When we eat this Bread and drink this Cup, 
	we pro -- claim your Death, O Lord, un -- til you come a -- gain.
}

sopranoc = \relative c'' {
  \global
  a8[ c] a g e g a a4 \hb
  a8 g a c[ b] a b a g[ a] g4 \hb
  a8 f g[ a] g e4 \bar "||"
}

altoc = \relative c' {
  \global
  e4.~ e4~ e4~ e4
  e4. f4.~ f4 d2
  e4 d4. b4
}

tenorc = \relative c' {
  \global
  c4. b4 c4 c4
  a4. d4. c4~ c4 b
  a4 b4. g4
}

bassc = \relative c' {
  \global
  a4. e4~ e4 a4
  c,4. d4. d4 g2
  c,4 b4. e4
}

verseThree = \lyricmode {
  \set stanza = "℟." Save us, Sav -- ior of the world,
  for by your Cross and Res -- ur -- rec -- tion
  you have set us free.
}
%%%%%%%%%%%%%
%%%%%%%%%%%%%
%%%%%%%%%%%%%

sopranoa = \relative c'' {
        \global
        b8 a8[ g] g[ a] b a[ b] a4 \bar "||"
	
	s32 g8 g4( a) \bar "||"
}

altoa = \relative c' {
	\global     
	s1 s4
	
	s32 e4.~ e4
}

tenora = \relative c' {
	\global
          s1 s4
          
        s32 b4. c4
}

bassa = \relative c {
	\global
	s1 s4
	
	s32 e4. a,4
}

verseA = \lyricmode {
	\set stanza = "℣."
	for ev -- er and ev -- er.
	
	\set stanza = "℟." A -- men.
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
  \middle
   \score { \transpose c bf,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \sopranob }
        \new Voice = "alto" { \voiceTwo \altob }
      >>
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenorb }
        \new Voice = "bass" { \voiceTwo \bassb }
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
    \score { \transpose c bf,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \sopranoc }
        \new Voice = "alto" { \voiceTwo \altoc }
      >>
      \new Lyrics  \lyricsto soprano \verseThree
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenorc }
        \new Voice = "bass" { \voiceTwo \bassc }
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
\markup  {
    \left-column {
      \line {\large \smallCaps Doxology}
    }
}
 \score { \transpose c bf,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \sopranoa }
        \new Voice = "alto" { \voiceTwo \altoa }
      >>
      \new Lyrics  \lyricsto soprano \verseA
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenora }
        \new Voice = "bass" { \voiceTwo \bassa }
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
}
%{

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
      \new Lyrics \lyricsto "tune" { \verseA }
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
} %}
