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
          \line {SONNE DER GERECHTIGKEIT 77 77}
      }
      \column{
      \line {\italic "Kirchengeseng," Bohemian Brethren, 1566}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line {\italic "Ad regias Agni dapes," Latin, 6th cent}
     \line { tr. Robert Campbell, 1849; adapt. \italic "Annus Sanctus," 1884}
   }
  } 
}

divisioMinima = {
  \once \override BreathingSign.stencil = #ly:breathing-sign::divisio-minima
  \once \override BreathingSign.Y-offset = #2
  \breathe
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

melody = \relative c' {
	\global
	d2 d \bar "|"
	a' d cs4( b8[ a] b4) b \bar "|"
	a1 \divisioMinima \bar ""
	b2 b \bar "|" \break
	
	cs b a4( b a) g \bar "|"
	fs1 \divisioMinima \bar ""
	fs4 e fs g \bar "|" \break
	
	a a d,2 \divisioMinima \bar ""
	fs4 e fs d \bar "|"
	cs d e \divisioMinima \bar ""
	g4 fs2 e \bar "|"
	d1 \bar "|."
}

alto = \relative c' {
	\global
	a2 b 
	cs fs e2. e4
	cs1
	fs2 d e e cs4( fs) e2 
	d1 
	d4 b d d d cs b2
	d4 e cs b 
	a b b
	e cs2 cs2 
	a1
}

tenor = \relative c {
	\global
	fs2 fs 
	a2. b4 cs4( a2) gs4 
	a1
	fs2 fs2 a \orAcc g fs( a4) b
	b1 
	b4 g a b a a fs2
	fs4 a a fs 
	fs fs g
	b a2 a2 
	fs1	
}

bass = \relative c {
	\global
	d2 b 
	fs' d a'4( cs,4) e2 
	a,1
	d2 b a e' fs4( d cs) e
	b1 
	b4 e d b fs fs b2
	d4 cs a b 
	fs' b, g'
	e fs g a2 
	d,1
}

verseOne = \lyricmode {
	\set stanza = "1."
	At the Lamb’s high feast we sing,
	Praise to our vic -- to -- rious King,
	Washed our gar -- ments in the tide
	Flow -- ing from his pierc -- èd side;
	\override LyricText #'font-shape = #'italic 
	\override LyricText.extra-offset = #'(0 . -3.5)
    \override LyricExtender.extra-offset = #'(0 . -3.5)
    \override LyricHyphen.extra-offset = #'(0 . -3.5) 	Al -- le -- lu -- ia.
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	Praise we Him, whose love di -- vine
	Gives the guests his blood for wine,
	Gives his bod -- y for the feast,
	Love the Vic -- tim, love the Priest.
}

verseThree = \lyricmode {
	\set stanza = "3."
	Where the pas -- chal blood is poured,
	Death’s dark an -- gel sheathes his sword;
	Is -- rael’s hosts tri -- um -- phant go
	Through the wave that drowns the foe.
}

verseFour = \lyricmode {
	\set stanza = "4."
	Christ, the Lamb whose blood was shed,
	Pas -- chal vic -- tim, pas -- chal bread;
	With sin -- cer -- i -- ty and love
	Eat we man -- na from a -- bove.
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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 60 2)
      }
    }
    \include "hymn_layout.ly"
  }
  \bottom
  \markup {
    	\vspace #1
  }
  
  \markup {
	\large {
  \fill-line {
    \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
     \column {
      \line { \bold "5. "
		\column {
		"Mighty victim from the sky,"
		"Pow'rs of hell beneath Thee lie;"
		"Death is conquered in the fight,"
		"Thou hast brought us life and light."
		\italic "                              Alleluia."
        }
     	}
		\vspace #0.5
		\line { \bold "6. "
		\column {
		"Now thy banner thou dost wave;"
		"Vanquished Satan and the grave;"
		"Angels join his praise to tell-"
		"See o'erthrown the prince of hell."
		\italic "                              Alleluia."

  		}	
		}
    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "7. "
		\column {
		"Paschal triumph, paschal joy,"
		"Only sin can this detroy;"
		"From the death of sin set free"
		"Souls reborn, dear Lord, in Thee."
		\italic "                              Alleluia."

        }
      	}
		\vspace #0.5
		\line { \bold "8. "
		\column {
		"Hymns of glory, songs of praise,"
		"Father, unto thee we raise;"
		"Risen Lord, all praise to Thee,"
		"Ever with the Spirit be."
		\italic "                              Alleluia."

  		}	
		}
    }
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
  }
}
}
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}



