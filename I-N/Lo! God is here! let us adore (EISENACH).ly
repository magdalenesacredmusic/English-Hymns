%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/
%}

\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: German, Gerhardt Tersteegen (1697-1769); Tr. John Wesley (1703-1791)
      }
      \wordwrap {
        Music: EISENACH, 88 88 88, Melody from Johann Hermann Schein (1586-1630), 1628; Harm. J.S. Bach (1685-1750)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {EISENACH  88 88 88}
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
      \line {Melody from J.H. Schein, 1628}
      \line {Harm. J.S. Bach (1685-1750)}
    }
  }
}

\header {
  tagline = ""
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
	g fs e \bar ""

	a4 |
	b cs d cs | \break
	b b a \bar "" %\break
	
	d,8[ e] |
	fs4 g a a |
	g fs e \bar ""

	a4 |
	b cs d cs |  
	b b a \bar ""

	a |
	d cs b a |
	g fs e \bar ""

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
	
	a,4 |
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
	
	fs,8[ g] |
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
	<<{\voiceFour \shiftOff \teeny d4 } \\ { \voiceTwo \override Stem #'length = #4.5 d'4 } >> |
	d b fs b |
	<<{\voiceFour \shiftOff \teeny e, fs8[ g] a4 } \\ { \voiceTwo \override Stem #'length = #4.5 e' fs8[ g] \override Stem #'length = #4.5 a4 } >>  

	a4 |
	gs fs8[ e] fs[ gs] a4 |
	d, e a, 
	
	<<{\voiceFour \shiftOff \teeny d,4 } \\ { \voiceTwo \override Stem #'length = #4.5 d'4 } >> |
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
	a8[ g] a4 d
}

verseOne = \lyricmode {
  \vOne
  Lo! God is here! let us a -- dore
  And own how dread -- ful is this place!
  Let all with -- in us feel his power,
  And si -- lent bow be -- fore his face,
  Who know his power, his grace who prove,
  Serve him with awe, with rev -- 'rence love.
}

verseTwo = \lyricmode {
  \vTwo
  Lo! God is here! Him day and night
  The~u -- nit -- ed choirs of An -- gels sing;
  To him, en -- throned a -- bove all height,
  Heav'n's hosts their nob -- lest prais -- es bring;
  To thee may all our thoughts a -- rise
  Cease -- less, ac -- cept -- ed Sac -- ri -- fice.
}


#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
  \score { %\transpose c bf,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
     % \new Lyrics  \lyricsto soprano \verseThree
      %\new Lyrics \lyricsto soprano \verseFour
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
  % \bottom
  \refs
}

%%%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 16)
#(define output-suffix "Hymnal")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  %\top
  \score { %\transpose c bf,
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
     % \new Lyrics  \lyricsto soprano \verseThree
     % \new Lyrics \lyricsto soprano \verseFour
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
    \include "hymn_hymnal_layout.ly"
  }    
  \refs
  %\bottom
}
%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  %  \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melody
      }
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
     % \new Lyrics \lyricsto "tune" { \verseThree }
     % \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}