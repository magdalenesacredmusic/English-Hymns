\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: "Amor Patris et Filii," 12th cent.; tr. Robert Bridges (1844-1930), 1899
      }
      \wordwrap {
        Music: SONG 22  10 10 10 10, Orlando Gibbons (1583-1625)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {song 22  10 10 10 10}
    }
    \right-column{
      \line {Orlando Gibbons}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Amor Patris et Filii"}
      \line {12th cent.; tr. Robert Bridges, 1899}
    }
  } 
}

\header {
  tagline = ""
}


global = {
	\key f \major
	\time 4/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
	\global
	c2 c4 a |
	d2 c |
	b4\rest c2 bf4 |
	a c g2 \bar "|"

	b4\rest g a f |
	bf2 g4 c~ |
	c f, a g |
	f2. \bar "|"

	a4 |
	bf c d d |
	g, c c b |
	c2. \bar "|"

	e,4 |
	f g a4. bf8 |
	c4 d g, g |
	f1 \bar "|."
}

alto = \relative c' {
	\global
	f2 g4 f |
	f2 f |
	s4 f2 d8[ e] |
	f4 f e2 

	s4 e4 f d |
	d2 e |
	f4 f f e |
	f2. 

	f4 |
	f ef d8[ ef] f4 |
	g af d, d e!2. 

	c4 |
	c d8[ e] f4( e8) d |
	c4 f f e |
	f1
}

tenor = \relative c' {
	\global
	a2 c4 c |
	bf2 a |
	d,4\rest a'2 bf4 |
	c a c2 

	d,4\rest c'4 c bf |
	d2 c |
	c4 d c4. bf8 |
	a2. 

	c4 |
	f, g8[ a] bf[ c] d4 |
	d c g g |
	g2. 

	g4 |
	c bf c4. g8 |
	c4 bf8[ a] g4 g |
	a1
}

bass = \relative c {
	\global
	f2 e4 f |
	bf,2 f' |
	s4 f2 g4 |
	a f c'2 

	s4 << { \voiceTwo \override Stem #'length = #4.5 c4 f, bf~ 
				bf4 g c2
				a4 bf c4 c,4 } \\ 
			{ \voiceFour \shiftOff \teeny c4 f, bf~ 
				bf4 g c2
				a4 bf c4 } >> 
	f2. 
	
	f4
	d c bf bf 
	ef f g g, c2.

	c4 
	a g f4. a8 
	a4 bf c c

	f1
}

verseOne = \lyricmode {
	\vOne
	Love of the Fa -- ther, Love of God the Son,
	From whom all came, in whom was all be -- gun;
	Who form -- est heav' -- nly beau -- ty out of strife,
	Cre -- a -- tion's whole de -- sire and breath of life.
	}

verseTwo = \lyricmode {
	\vTwo
	Thou the All -- ho -- ly, Thou su -- preme in might,
	Thou dost give peace, Thy pre -- sence mak -- eth right;
	Thou with Thy fa -- vor all things dost en -- fold,
	With Thine all -- kind -- ness free from harm wilt hold.

}

verseThree = \lyricmode {
	\vThree
	Hope of all com -- fort, splen -- dor of all aid,
	That dost not fail nor leave the heart a -- fraid:
	To all that cry Thou dost all help ac -- cord,
	The an -- gels' ar -- mor and the saints' re -- ward.
}

extraVerses = 
  \markup { 
	\fontsize #0.2 {
	\fill-line {
	\hspace #1.0
	\column {
		\line { \bold "4. "
		\column {
		"Purest and highest, wisest and most just,"
		"There is no truth save only in Thy trust;"
		"Thou dost the mind from earthly dreams recall,"
		"And bring, through Christ, to him for whom are all."
		}
		}
		\vspace #1
		\line { \bold "5. "
		\column {
		"Eternal Glory, all men Thee adore,"
		"Who art and shalt be worshiped evermore:"
		"Us whom Thou madest, comfort with Thy might,"
		"And lead us to enjoy Thy heavenly light."
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
     % \new Lyrics \lyricsto soprano \verseFour
     % \new Lyrics \lyricsto soprano \verseFive
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
  \score { %\transpose c d
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics  \lyricsto soprano \verseOne
      \new Lyrics  \lyricsto soprano \verseTwo
      \new Lyrics  \lyricsto soprano \verseThree
    %  \new Lyrics \lyricsto soprano \verseFour
    %  \new Lyrics \lyricsto soprano \verseFive
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
    \extraVerses
  \markup {
    \vspace #0.5
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
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
     % \new Lyrics \lyricsto "tune" { \verseFour }
    %  \new Lyrics \lyricsto "tune" { \verseFive}
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
  % \bottom
  \refs
}
