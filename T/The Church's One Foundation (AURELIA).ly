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
      \line {AURELIA  76 76 D}
    }
    \column{
      \line {Samuel Sebastian Wesley, 1864}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Samuel John Stone, \italic "Lyra Fidelium," 1866}
    } 
  }
}

global = {
	\key ef \major
	\time 4/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
	\global
	\partial 4
	g4 |
	g g af g |
	g2 f4 ef |
	ef c' bf af |
	g2. \bar "||" 
	
	  af4 |
	bf ef ef d |
	d2 c4 bf |
	af bf g ef |
	f2. \bar "||"
	
	  f4 |
	g af bf c |
	c2 bf4 ef4 |
	ef4. d8 c4 g |
	af2. \bar "||"
	
	  f4 |
	g g af g |
	g2 f4 ef |
	ef f ef d |
	ef2. \bar "|."
}

alto = \relative c' {
	\global
	\partial 4
	ef4 |
	ef ef ef ef |
	ef2 d4 ef |
	c ef ef d |
	ef2. d4 |
	ef ef ef f |
	f2 ef4 g |
	g f ef ef |
	d2. d4 |
	ef d ef ef |
	ef2 ef4 g |
	g4. g8 g4 g4 |
	f2. f4 |
	ef ef ef ef |
	c2 c4 c |
	c c bf bf |
	bf2. \bar "|."
}

tenor = \relative c' {
	\global
	\partial 4	
	bf4 |
	bf bf c bf |
	bf2 bf4 bf |
	f f g bf |
	bf2. bf4 |
	bf bf b b |
	b2 c4 d |
	ef f bf, a |
	bf2. bf4 |
	bf bf bf af |
	af2 bf4 c |
	c4. b8 c4 c |
	c2. bf4 |
	bf bf c bf |
	bf2 af4 af |
	af af f af |
	g2. \bar "|."
}

bass = \relative c {
	\global
	\partial 4
	ef4 |
	ef ef ef ef |
	bf2 af4 g |
	af af bf bf |
	ef2. f4 |
	g g g g, |
	af2 af4 bf! |
	c d ef c |
	bf2. bf4 |
	ef f g af |
	af2 g4 c |
	g4. f8 ef4 e |
	f2. d4 |
	ef ef ef ef |
	af,2 af4 af |
	f f bf bf |
	ef2. \bar "|."
}

verseOne = \lyricmode {
	\set stanza = "1."
	The Church’s _ one foun -- da -- tion 
	Is Je -- sus Christ her Lord, 
	She is His new cre -- a -- tion 
	By wa -- ter and the Word: 
	From heav'n He came and sought her 
	To be His ho -- ly bride, 
	With His own blood He bought her 
	And for her life He died. 
	}

verseTwo = \lyricmode {
	\set stanza = "2."
	She is from ev' -- ry na -- tion 
	Yet one o'er all the earth, 
	Her char -- ter of sal -- va -- tion 
	One Lord, one faith, one birth, 
	One Ho -- ly Name she bles -- ses, 
	Par -- takes one Ho -- ly Food, 
	And to one Hope she pres -- ses 
	With ev' -- ry grace en -- dued. 
}

verseThree = \lyricmode {
	\set stanza = "3."
	The Church shall nev -- er per -- ish! 
	Her dear Lord to de -- fend, 
	To guide, sus -- tain, and cher -- ish, 
	Is with her to the end: 
	Though there be those who hate her, 
	And false sons in her pale, 
	A -- gainst or foe or trai -- tor 
	She ev -- er shall pre -- vail. 
}

%%% if more verses are needed in between the musical staves, uncomment this section
%{
verseFour = \lyricmode {
	\set stanza = "4."
	
}
%}

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
  \markup {
  \fill-line {
    \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
     \column {
      \line { \bold "4."
        \column {
        "Though with a scornful wonder" 
		"Men see her sore oppressed," 
		"By schisms rent asunder" 
		"By heresies distressed:" 
		"Yet saints their watch are keeping," 
		"Their cry goes up “How long?”"
		"And soon the night of weeping" 
		"Shall be the morn of song!" 
        }
      }
      \vspace #1.0 % adds vertical spacing between verses
      \line { \bold "5."
        \column {
        "'Mid toil and tribulation" 
		"And tumult of her war," 
		"She waits the consummation" 
		"Of peace forevermore;" 
		"Till, with the vision glorious," 
		"Her longing eyes are blest," 
		"And the great Church victorious" 
		"Shall be the Church at rest!" 
        }
      }
    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "6."
        \column {
        "Yet she on earth hath union" 
		"With God the Three in One," 
		"And mystic sweet communion" 
		"With those whose rest is won," 
		"With all her sons and daughters" 
		"Who, by the Master's Hand" 
		"Led through the deathly waters," 
		"Repose in Eden-land." 
        }
      }
      \vspace #1.0 % adds vertical spacing between verses
      \line { \bold "7."
        \column {
        "O happy ones and holy!" 
		"Lord, give us grace that we" 
		"Like them, the meek and lowly," 
		"On high may dwell with Thee:" 
		"There, past the border mountains," 
		"Where in sweet vales the Bride" 
		"With Thee by living fountains" 
		"For ever shall abide!" 
        }
      }
    }
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \markup {
  \fill-line {
    \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
     \column {
      \line { \bold "4."
        \column {
        "Though with a scornful wonder" 
		"Men see her sore oppressed," 
		"By schisms rent asunder" 
		"By heresies distressed:" 
		"Yet saints their watch are keeping," 
		"Their cry goes up “How long?”"
		"And soon the night of weeping" 
		"Shall be the morn of song!" 
        }
      }
      \vspace #1.0 % adds vertical spacing between verses
      \line { \bold "5."
        \column {
        "'Mid toil and tribulation" 
		"And tumult of her war," 
		"She waits the consummation" 
		"Of peace forevermore;" 
		"Till, with the vision glorious," 
		"Her longing eyes are blest," 
		"And the great Church victorious" 
		"Shall be the Church at rest!" 
        }
      }
    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "6."
        \column {
        "Yet she on earth hath union" 
		"With God the Three in One," 
		"And mystic sweet communion" 
		"With those whose rest is won," 
		"With all her sons and daughters" 
		"Who, by the Master's Hand" 
		"Led through the deathly waters," 
		"Repose in Eden-land." 
        }
      }
      \vspace #1.0 % adds vertical spacing between verses
      \line { \bold "7."
        \column {
        "O happy ones and holy!" 
		"Lord, give us grace that we" 
		"Like them, the meek and lowly," 
		"On high may dwell with Thee:" 
		"There, past the border mountains," 
		"Where in sweet vales the Bride" 
		"With Thee by living fountains" 
		"For ever shall abide!" 
        }
      }
    }
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
  }
}
  \bottom
}


