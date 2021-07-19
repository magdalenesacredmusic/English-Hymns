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
      \line {ECCE PANIS  88 87}
    }
    \right-column{
      \line {Hungarian, 1842; \italic "The Pius X Hymnal," 1953; harm. O'Donnell}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Ecce panis angelorum"}
      \line {Thomas Aquinas; tr. cento, \italic "The English Hymnal"}
    }
  } 
}

\header {
  tagline = ""
}

global = {
	\key ef \major
	\time 4/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	%Marier% 
%{ bf'4 g c bf |
	af g f ef \bar "||"

	bf' c d ef |
	d bf c bf \bar "||"

	ef bf c bf |
	bf af g f \bar "||"

	bf g c bf |
	af8[ g] f4 ef2 \bar "|." %}


bf'4 g c bf |
	af g f ef \bar "||"

	bf' c d ef |
	d bf c bf \bar "||"

	ef bf c bf |
	bf af g f \bar "||"

	bf g c bf |
	af8[ g] f4 ef2 \bar "|."
	
}

alto = \relative c' {
	\global
	 %Marier% 
%{ g'4 ef c8[ d] ef4 |
	f ef ef8[ d] c4 |

	d ef4 f g8[ a] |
	bf4 bf bf8[ a] bf4 

	ef, g af g |
	d f e f

	ef ef8[ df] c[ d] ef4 |
	f8[ ef] d4 ef2	%}


	ef4 ef c8[ d] ef4 |
	f ef ef8[ d] ef4 |

	f f f g |
	f4 g8[ f] f8[ ef] d4 

	g ef c8[ d] ef4 |
	f f ef d

	ef ef8[ df] c[ d] ef4 |
	f8[ ef] d4 ef2	
}

tenor = \relative c' {
	\global
	 %Marier% 
%{ ef4 bf af bf |
	c bf af g |
	
	g g8[ a] b4 c |
	f8[ ef] d4 ef d 
	
	bf ef ef ef |
	bf c bf c |
	
	ef bf af ef |
	c'8[ bf] bf[ af] g2 %}


	g4 bf af g |
	c g bf g |
	
	bf a bf g4 |
	bf bf4 a4 bf4 
	
	bf g af g |
	d' d g,8[ af] bf4 |
	
	g bf af ef |
	c'8[ bf] bf[ af] g2
}

bass = \relative c {
	\global
	 %Marier% 
%{ ef4 ef af, g |
	af bf b c |

	g' g g c, |
	d8[ ef] f4 f bf |

	g ef af bf |
	bf f g af |

	g ef af, g |
	af bf ef2 %}


ef4 ef af, ef' |
	af, c bf ef |

	d c bf c |
	d g,4 f bf |

	ef ef af, ef' |
	bf d ef bf |

	ef ef af, g |
	af bf ef2

}

verseOne = \lyricmode {
	\set stanza = "1."
	\tagIt Lo! the An -- gels' Food is giv -- en
	\tagIt To the pil -- grim who hath stri -- ven;
	\tagIt See the chil -- dren's Bread from hea -- ven,
	\tagIt Which to dogs may not be cast.
}

verseTwo = \lyricmode {
	\set stanza = "2."
	Truth the an -- cient types ful -- fill -- ing,
	I -- saac bound, a vic -- tim will -- ing,
	Pas -- chal lamb, its life -- blood spill -- ing,
	Man -- na sent in a -- ges past.
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
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 82 4)
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

