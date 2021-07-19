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
      \line {EISENACH  LM}
    }
    \column{
      \line {adapt. from J.H. Schein; harm. J.S. Bach}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Quem terra, pontus, aethera"}
      \line {Venantius Fortunatus; tr. J.M. Neale}
    } 
  }
}


global = {
	\key d \major
	\time 4/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	\partial 4
	d8[ e] |
	fs4 g a a |
	g fs e \bar "||"

	a4 |
	b cs d cs |  \break
	b b a \bar "||"

	a |
	d cs b a |
	g fs e \bar "||"

	a |
	g fs e8[ fs] g4 |
	fs e d \bar "|."
}

alto = \relative c' {
	\global
	\partial 4
	a4 |
	d d d d |
	d8[ cs] d4 cs 

	e |
	fs gs a8[ e] e4 |
	fs gs e 

	e |
	fs e d8[ e] fs4 |
	e a,8[ b] cs4 

	fs8[ e] |
	d[ e] e[ d] d[ cs] d4 |
	d cs a \bar "|."
}

tenor = \relative c {
	\global
	\partial 4
	fs8[ g] |
	a4 b c b8[ a] |
	b4 a a 

	cs |
	b e a,8[ b] cs4 |
	d8[ cs] b4 cs 

	cs8[ b] |
	a[ fs] g[ a] b4 b |
	b8[ cs] d4 a 

	cs |
	b8[ a] a4 a g |
	a4. g8 fs4 \bar "|."	
}

bass = \relative c, {
	\global
	\partial 4
	<<{\voiceFour \shiftOff \teeny d4_\markup {\italic Ped.} } \\ { \voiceTwo \override Stem #'length = #4.5 d'4 } >> |
	d b fs b |
	<<{\voiceFour \shiftOff \teeny e, fs8[ g] a4 } \\ { \voiceTwo \override Stem #'length = #4.5 e' fs8[ g] \override Stem #'length = #4.5 a4 } >>  

	a4 |
	gs fs8[ e] fs[ gs] a4 |
	d, e a, 

	a'8[ g] |
	fs[ d] e[ fs] g[ fs] e[ ds] |
	e4 fs8[ g] a4 

	fs |
	b,8[ cs] d4 a b |
	a8[ g] a4 d \bar "|."
}

verseOne = \lyricmode {
	\set stanza = "1."
	The God whom earth, and sea, and sky,
	A -- dore, and laud, and mag -- ni -- fy,
	Who o’er their three -- fold fab -- ric reigns,
	The Vir -- gin’s spot -- less womb con -- tains.
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	The God whose will by moon and sun
	And all things in due course is done,
	Is borne up -- on a Maid -- en’s breast,
	By ful -- lest heav'n -- ly grace pos -- sessed.
}

verseThree = \lyricmode {
	\set stanza = "3."
	How blest the Mo -- ther, in whose shrine
	The great Ar -- ti -- fi -- cer Di -- vine,
	Whose hand con -- tains the earth and sky,
	Vouch -- safed, as in His ark, to lie!
}

verseFour = \lyricmode {
	\set stanza = "4."
	Blest, in the mes -- sage Ga -- briel brought;
	Blest, by the work the Spir -- it wrought:
	From whom the Great De -- sire of earth
	Took hu -- man flesh and hu -- man birth.
	}

verseFive = \lyricmode {
	\set stanza = "5."
	All ho -- nor, laud, and glo -- ry be,
	O Je -- su, Vir -- gin -- born, to Thee!
	All glo -- ry, as is ev -- er meet,
	To Fa -- ther and to Par -- a -- clete.
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
        tempoWholesPerMinute = #(ly:make-moment 84 4)
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
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}