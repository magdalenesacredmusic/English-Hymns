\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {ASPERGES ME}
    }
    \right-column{
      \line {Mode 6 plainsong}
      \line {accompanied J. Descroquettes, adapt.}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Asperges me"}
      \line {Tr. based on \italic "A Manual of Prayers," 1888}
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

melody = \relative c' {
	\global
	d8[ e] g[ fs e] fs g a4 \bar "'"
	b8--[ c\prall d] d[ c] b[ a]
	b a[ g] fs[ g] \bar ""
	a[ g e] fs d--[ e-- d--] d4 \bar "|" 
	d8[ e] g[ fs e] fs[ g] a4 \hb
	a8--[ b\prall c b a] g[ fs] \bar ""
	e g fs[ g] a[ g e] fs d--[ e-- d--] d4 \bar "||" \break
%verse	
	d8[ g fs] g[ a] a a[ c] b \bar ""
			b[ a] a4( b) \bar "|"
	a8[ fs] g[ a] a a--[ b\prall c] a g g[( g g]) e4( d) \bar "||" 
%Gloria Patri	
	d8[ g fs] g[ a] a
			a a a a a a a a4 \bar "'"
	a8 a a a[ c] b b[ a] a4( b) \bar "|"
	a8[ fs] g[ a] \bar "" \break 
	      a a a a a a 4 \bar "'"
	a8 a[ c]b b a a4 b \bar "|"
	a8[ fs] g[ a] a--[ b\prall c] a[ g] g[( g g]) e4( d) \bar "||"

}

melodya = \relative c' {
	\global
  \override Stem #'length = #0
	\hide Flag
d8( e) g( fs e) fs g \hn a4 \divisioMinima \bar ""
	\hn b8( c d) d( c) b( a)
	b a( g) fs( g) \bar "" \break
	a( g e) fs d^-( e^- d^-) \hn d4 b'\rest \bar "|" 
	d,8( e) g( fs e) fs( g) \hn a4 \divisioMaior \bar ""
	\hn a8( b c b a) g( fs) \bar "" \break
	e g fs( g) a( g e) fs d^-( e^- d^-) \hn d4 \finalis \bar ""
%verse	
	d8( g fs) g( a) a a( c) b \bar "" \break 
			b( a) \hn a4( \hn b) b\rest \bar "|"
	a8( fs) g( a) a \hn a( b c) a g \tieUp g~ g~ g \hn e4( \hn d) \finalis \bar "" \break
%Gloria Patri	
	d8( g fs) g( a) a
			a a a a a a a \hn a4 \divisioMinima \bar ""
	a8 a a \bar ""  \break 
a( c) b b( a) \hn a4( \hn b) b\rest \bar "|"
	a8( fs) g( a) a a a a a \hn a4 \divisioMinima \bar ""
	a8 a( c) b \bar "" \break
		b a \hn a4 \hn b b\rest \bar "|"  \noBreak
	a8( fs) g( a) \hn a( b c) a( g) g~ g~ g \hn e4( \hn d) \finalis

}

alto = \relative c' {
	\global
	b4 d4.~ d4~ d4~
	d4.~ d4~ d4.
	b2
	a~ a4.~ a4
	b4~ b4.~ b4 d 
	e~ e4.~ e4 b d
	a2~ a4.~ a4

	r8 d4~ d4. c d4~ d2~ 
	d2 s8 e4 c b8 a4.~ a2
	
	r8 d2~ d1~ d4.~ d4 c4 e8~ e4 d2
	d2~ 
	  d4~ d4.~ d4.
	e4 g8 fs4~ fs g4
	e2 e4 c b8 a4.~ a2
}

tenor = \relative c' {
	\global
	g4~ g4.~ g4 fs4 
	g4.~ g4 fs4. g2~ g2~ g4. fs4
	g4~ g4.~ g4 fs a~ a4. b4 g~ g e g~ g4. fs4

	d8\rest g4~ g fs8 e4 g8 fs4 g2
	fs2 s8 g4~ g4. e g4 fs

	d8\rest g2~ g1 fs4.~ fs4
	g4~ g8~ g4~ g2
	fs2~ 
	  fs4~ fs4.~ fs4.
	c'~ c4 c b4
	c2 a4 g4. e g4 fs
}

bass = \relative c' {
	\global
	g4 b,4.~ b4 d 
	g,4. b4 d4.
	e2 c2 d4.~ d4
	g4 e4.~ e4 d4 c a4. e'4~ e4 b c2 d4.~ d4

	s8 b4 d4. a d4 g,2
	d'2 s8 c4 e4. c d2

	s8 b2 d1~ d4.~ d4 e4~ e8 c4 g2
	d'2~ d4~ d4. d4. 
	a' a4 e2
	a,2 c4 e4. c d2
}

verseOne = \lyricmode {
	%\set lyricMelismaAlignment = #CENTER 
You shall sprin -- kle me,
	O Lord, with hys -- sop,
	and I shall be cleansed:
	You shall wash me,
	and I shall be made whi -- ter than snow.
	
	\set stanza = "℣."
	Have mer -- cy on me, O God,
	ac -- cor -- ding to your great mer -- cy.
	
	Glo -- ry be to the Fa -- ther, 
	and to the Son, and to the Ho -- ly Spi -- rit.
	As it was in the be -- gin -- ning,
	is now, and ev -- er shall be,
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
