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
        Music: DEO GRACIAS  LM, English, 15th cent.; Harm. \italic "The English Hymnal," 1906
      }
    }
  }
}


global = {
  \key f \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  d4 ^\markup { \italic "To be sung in unison." } |
  d2 c4 |
  d2 c4 |
  c b2 |
  a2 \bar ""

  d4 |
  d4( c) a |
  g( a) g8[ d] |
  f4 e2 |
  d \bar ""

  a'4 |
  c2 c4 |
  d( c) bf |
  a4 g2 |
  f \bar ""

  f4 |
  a2 a4 |
  g2 f4 |
  f4 e2 |
  d \bar "|."
}


alto = \relative c' {
  \global
  \partial 4
  <f a>4 |
  <f a>2 <e a>4 |
  <f a>2 <f a>4 |
  <e a>4 <e~ a> <e gs> |
  <cs e>2 

  <f a>4 |
  <f a>4 <e a>4 d |
  d2 d4 |
  d2 cs4 |
  d2 

  <d f!>4 |
  <ef g>2 <f a>4 |
  <f bf> <f a> <d g> |
  <d fs> <b d> <c e> |
  c2 

  d4 |
  <c f>2 d4 |
  <b d> <c e> <a c> |
  d2 cs4 |
  d2 
}

tenor = \relative c {
  \global
  \partial 4
  \teeny <d f a>4 |
  <d f a>2 <e a>4 |
  <f a>2 a4 |
  <e a>4 <e b'>2 |
  e2

  <f a>4 |
  <f a>~ <e a> a |
  \normalsize b a b |
  a2. |
  <fs a>2

  \teeny <f a>4 |
  <g c>2 <a c>4 |
  <f bf> <f a> <d g> |
  fs g2 |
  a2

  bf4 |
  a2 a4 |
  s2. |
  \normalsize a2. |
  <f a>2
}

bass = \relative c, {
  \global
  \partial 4
  d4 |
  d f a |
  d2 f4 |
  a, e2 |
  a 

  d,4 |
  d a' f |
  g f g |
  d' a2 |
  d 

  d4 |
  c2 f,4 |
  bf f g |
  d' g, c |
  f,2 

  bf4 |
  f2 f4|
  g c, f |
  d'4 a2 |
  d, 
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
