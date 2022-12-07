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
      \line {VENI CREATOR SPIRITUS}
    }
    \column{
      \line {\italic "Graduale Romanum," Mode VIII}
      \line {Harm. David O'Donnell, 2022}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Veni Creator Spiritus"}
      \line {Tr. Edward Caswall, alt. traditional}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f8 g f[ ef] f g[ f] bf c bf4 \hb
  bf8 \bar "" \break f g bf c[ bf] c d c4 \bar "|" \break 
  bf8 c[ d] bf[ a] g[ f] bf[ c] f, g bf4 \hb \break
  a8[ bf] g f[ ef] g g[ a g] f ef f4 \bar "||" \break
  f8[ g f] ef4( f) \bar "||"
}

alto = \relative c' {
	\global
  d8 bf4. d4. ef4 d4.
  d4. g4 f4~ f
  d8 f4 d ef f ef d
  f ef8 f8[ ef] ef~ ef4. c4~ c
  
  d4. c4~ c
%{
	d4~ d4.~ d4 ef d4.
	f4. g4 f~ f~ 
	f~ f d ef f ef d~ 
	d4. r4 r8 d4. c4~ c4.

	d4. bf4 c
%}
}

tenor = \relative c' {
	\global
  bf8 g4. bf~ bf4~ bf4.
  bf4.~ bf4~ bf4 a
  bf8 a4 g8[ f] bf4~ bf c bf
  bf4~ bf8 c4.~ c4 bf8~ bf4 a
  
  bf4. g4 a
	
     %{   bf4~ bf4. a4 g f4.
	bf4.~ bf4 bf4 a 
	g a bf2~ bf4 c bf4~ 
	bf4. bf~ bf~ bf4 a4.
	
	bf4. g4 a
     %}
}

bass = \relative c {
	\global
	  bf8 ef4. d4. c4 g'4.
	  d4. ef4 f~ f
	  g8 f4 g8[ f] ef4 d c g'
	  d4 ef8~ ef4. c4. f4~ f
	  
	  bf,4. c4 f
	
	%{
	bf4~ bf4.~ bf2~ bf4.
	d ef4 f~ f~
	f~ f4 g2 d4 c g' 
	bf4. g4. ef4. f4 f4. 
	
	f4.~ f4~ f %}
}

verseOne = \lyricmode {
  \set stanza = "1."
  Come, O Cre -- a -- tor Spir -- it blest!
  And in our souls take up thy rest; 
  Come, with thy grace and heav'n -- ly aid, 
  To fill the hearts which Thou hast made.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Great Par -- a -- clete! to Thee we cry: 
  O high -- est gift of God most high! 
  O fount of life! O fire of love! 
  And sweet an -- noint -- ing from a -- bove!
}

verseThree = \lyricmode {
  \set stanza = "3."
  O Fin -- ger of the hand Di -- vine
  The seven -- fold gifts of grace are Thine;
  The pro -- mise of the Fa -- ther Thou!
  Who does the tongue with pow'r en -- dow.
}


verseFour = \lyricmode {
  \set stanza = "4."
  Our sen -- ses touch with light and fire; 
  Our hearts with char -- i -- ty in -- spire; 
  And, with en -- dur -- ance from on high 
  The weak -- ness of our flesh sup -- ply.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Far back our en -- e -- my re -- pel,
  And let Thy peace with -- in us dwell, 
  So may we hav -- ing Thee for guide 
  Turn from each hurt -- ful thing a -- side.
  
  \set stanza = "7." A -- men.
}

verseSix = \lyricmode {
  \set stanza = "6."
  Grant us through Thee, O Ho -- ly One,
  To know the Fa -- ther and the Son;
  And be this our un -- chang -- ing creed,
  That Thou dost from Them both pro -- ceed.
}

verseSeven = \lyricmode {
  \set stanza = "7."
  To God the Fa -- ther praise be paid, 
  Praise to the Son who from the dead 
  A -- rose, and per -- fect praise to Thee
  O Ho -- ly Ghost e -- ter -- nal -- ly. 

  
}

\book {
  \include "hymn_paper_multipage.ly"
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
        tempoWholesPerMinute = #(ly:make-moment 80 4)
      }
    }
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \large {
      \fill-line {
        \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
        \column {
          \line {
            \bold "6."
            \column {
              "Grant us through Thee, O Holy One,"
              "To know the Father and the Son;"
              "And be this our unchanging creed,"
              "That Thou dost from Them both proceed."
            }
          }
        }
        \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
        \column {
          \line {
            \bold "7."
            \column {
              "To God the Father praise be paid," 
              "Praise to the Son who from the dead" 
              "Arose, and perfect praise to Thee"
              "O Holy Ghost eternally." 
              "Amen."
            }
          }
        }
        \hspace #0.1 % gives some extra space on the right margin;
        % can be removed if page space is tight
      }
    }
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
      \new Lyrics \lyricsto "tune" { \verseFour}
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout_ragged.ly"
  }
  \markup {
    \large {
      \fill-line {
        \hspace #1.0
        \column {
          \line {
            \bold "6. "
            \column {
              "Grant us through Thee, O Holy One,"
              "To know the Father and the Son;"
              "And be this our unchanging creed,"
              "That Thou dost from Them both proceed."
            }
          }
          \vspace #1
          \line {
            \bold "7. "
            \column {
              "To God the Father praise be paid," 
              "Praise to the Son who from the dead" 
              "Arose, and perfect praise to Thee"
              "O Holy Ghost eternally." 
              "Amen." 
            }
          }
        }
        \hspace #1.0

      }
    }
  }
  
 
  \bottom
}
