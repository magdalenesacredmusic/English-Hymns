\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Hymnum canamus Domino," The Venerable Bede (673-735); Tr. Benjamin Webb (1819-85), \italic "The Hymnal Noted," 1854
      }
      \wordwrap {
        Music: TUGWOOD  LM, Nicolas Gatty (1874-1946), 1906
      }
    }
  }
}

\header {
  tagline = ""
}

global = {
	\key d \major
	\cadenzaOn
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
	\global
	a2 a4 a \bar "|"
	a a b b \bar "|"
	a2 \bar ""

	a2 d,4 e \bar "|"
	fs a g fs \bar "|"
	e2 \bar ""

	a2 a4 a \bar "|"
	a fs b cs \bar "|"
	d2 \bar ""

	g,2 a4 b \bar "|"
	a d, e e \bar "|"
\time 1/2	d2 \bar "||"

	\time 4/4 d2 d2 \bar "|."
	
}

alto = \relative c' {
	\global
	d2 d4 fs 
	e fs g g 
	fs2
	d2 d4 cs 
	d e d d
	cs2
	d2 d4 fs 
	e d d fs 
	fs2
	e4( d) cs b 
	cs d d cs 
	d2
	
	b2 a2
}

tenor = \relative c {
	\global
	fs2 a4 d
	cs d d d
	d2
	a fs4 a
	a a d a 
	a2
	fs a4 d
	cs d b as 
	b2
	b a4 g 
	a a b a 
	fs2	
	
	g2 fs
}

bass = \relative c {
	\global
	d2 fs4 g 
	a d, g g,
	d'2
	fs, b4 a 
	d cs b d
	a2
	d fs4 g a d, 
	g fs b,2
	e fs4 g
	g, fs g a 
	d2
	
	g,2 d'2
}

verseOne = \lyricmode {
	\vOne
	Sing we tri -- um -- phan hymns of praise,
	New hymns to heav'n ex -- ul -- ting raise:
	Christ, by a road be -- fore un -- trod,
	As -- cend -- eth to the throne of God.
}

verseTwo = \lyricmode {
	\vTwo
	The ho -- ly ap -- os -- tol -- ic band
	Up -- on the Mount of Ol -- ives stand,
	And with the Vir -- gin -- mo -- ther see
	Je -- sus’ re -- splen -- dent maj -- es -- ty.
}

verseThree = \lyricmode {
	\vThree
	To whom the an -- gels, draw -- ing nigh,
	‘Why stand and gaze up -- on the sky?
	This is the Sa -- vior!’ thus they say,
	‘This is his no -- ble tri -- umph day!’
}

verseFour = \lyricmode {
	\vFour
	‘A -- gain ye shall be -- hold Him, so
	As ye to -- day have seen him go;
	In glo -- rious pomp as -- cend -- ing high,
	Up to the por -- tals of the sky.’
}


verseFive = \lyricmode {
	\vFive
	O grant us thith -- er -- ward to tend,
	And with un -- wea -- ried hearts as -- cend
	To -- ward thy king -- dom’s throne, where thou
	As is our faith, art seat -- ed now.
	
	\set stanza = "7."
	A -- men.
}

extraVerses =
  \markup {
  \fontsize #0.2 {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "6. "
          \column {
            "Be Thou our joy and strong defense,"
            "Who art our future recompense:"
            "So shall the light that springs from Thee"
            "Be ours through all eternity."
          }
        }
        \vspace #1
        \line {
          \bold "7. "
          \column {
            "O risen Christ, ascended Lord,"
            "All praise to Thee let earth accord,"
            "Who art, while endless ages run,"
            "With Father and with Spirit One.  Amen."
          }
        }
      }
      \hspace #1.0

    }
  }
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
      }
    }
    \include "hymn_layout.ly"
  }
  
\extraVerses
\markup {
  \vspace #0.5
}
  %}
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
      \new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \include "hymn_hymnal_layout.ly"
  }    
  
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
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
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}
