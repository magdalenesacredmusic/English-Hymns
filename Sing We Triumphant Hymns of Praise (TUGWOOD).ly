\version "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
   poet = \markup{ \fontsize #4 \smallCaps "Sing We Triumphant Hymns of Praise"  }
    meter = \markup { \small { Music: TUGWOOD, L.M.; N. Gatty, 1906} }
    piece = \markup { \small {Text: \italic "Hymnum canamus Domino," The Venerable Bede (673-735) Tr. B. Webb, \italic "The Hymnal Noted," 1854 }}
    %breakbefore
    %copyright = ""
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
	a2 \bar "||"

	a2 d,4 e \bar "|"
	fs a g fs \bar "|"
	e2 \bar "||"

	a2 a4 a \bar "|"
	a fs b cs \bar "|"
	d2 \bar "||"

	g,2 a4 b \bar "|"
	a d, e e \bar "|"
	d2 \bar "|."
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
}

verseOne = \lyricmode {
	\set stanza = "1."
	Sing we tri -- um -- phan hymns of praise,
	New hymns to heav'n ex -- ul -- ting raise:
	Christ, by a road be -- fore un -- trod,
	As -- cend -- eth to the throne of God.
}

verseTwo = \lyricmode {
	\set stanza = "2."
	The ho -- ly ap -- os -- tol -- ic band
	Up -- on the Mount of Ol -- ives stand,
	And with the Vir -- gin -- mo -- ther see
	Je -- sus’ re -- splen -- dent maj -- es -- ty.
}

verseThree = \lyricmode {
	\set stanza = "3."
	To whom the an -- gels, draw -- ing nigh,
	‘Why stand and gaze up -- on the sky?
	This is the Sa -- vior!’ thus they say,
	‘This is His no -- ble tri -- umph day!’
}

verseFour = \lyricmode {
	\set stanza = "4."
	‘A -- gain ye shall be -- hold Him, so
	As ye to -- day have seen Him go;
	In glo -- rious pomp as -- cend -- ing high,
	Up to the por -- tals of the sky.’
}


verseFive = \lyricmode {
	\set stanza = "5."
	O grant us thith -- er -- ward to tend,
	And with un -- wea -- ried hearts as -- cend
	To -- ward Thy king -- dom’s throne, where Thou
	As is our faith, art seat -- ed now.
}



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
  \layout { }
}

\markup {
  \large{
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
            "With Father and with Spirit One."
          }
        }
      }
      \hspace #1.0

    }
  }
}

