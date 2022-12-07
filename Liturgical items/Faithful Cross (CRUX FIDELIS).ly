\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {CRUX FIDELIS}
    }
    \right-column{
      \line {Gregorian, Mode I}
      \line {\italic "Graduale Romanum"}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Pange lingua gloriosi, proelium certaminis"}
      \line {Venantius Fortunatus; Tr. Percy Dearmer and J.M. Neale}
    }
  }
}

\header {
  tagline = ""
}

global = {
	\key c \major
	\cadenzaOn
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  %\override Staff.StaffSymbol #'width = #(lambda (grob)
  %  (ly:output-def-lookup (ly:grob-layout grob) 'line-width))
	\global
	\slurDown
	
	d8 e g[ a] a[ g] a c c[ b] a--[ g] \bar "'"
	b8 c d[ e] a,[ g] c b[ a] a4 \hb
	a8 a[ c b] g g[ e] f d[ c] d[ e] e[( f] e4) \bar "'"
	d8 d[ a'] a[ g] e[ d] f  e[ d] d4 \hb
	a'8 a[ c b] g g[ e] f d[ c] d[ e] e[( f] e4) \bar "'"
	d8 d[ a'] a[ g] e[ d] f e[ d] d4 \bar "||"
	
}

refrain = \lyricmode {
	Faith -- ful Cross, a -- bove all o -- ther
	One and on -- ly no -- ble tree:
	None in fo -- liage, none in blos -- som, 
	None in fruit thy peer may be;
	Sweet -- est wood and sweet -- est i -- ron,
	Sweet -- est weight is hung on thee.
}

verseOne = \lyricmode {
	\set stanza = "1."
	Sing, my tongue, the glo -- rious bat -- tle,
	Sing the end -- ing of the fray;
	Now a -- bove the Cross, the tro --  phy,
	Sound the loud tri -- um -- phant lay:
	Tell how Christ, the world's Re -- deem -- er,
	As a Vic -- tim won the day.
}

verseTwo = \lyricmode {
	\set stanza = "2."
	God in pit -- y saw man fal -- len,
	Shamed and sunk in mis -- er -- y,
	When he fell on death by tast -- ing
	Fruit of the for -- bid -- den tree;
	Then an -- oth -- er tree was cho -- sen
	Which the world from death should free.
}

verseThree = \lyricmode {
	\set stanza = "3."
	Thus the scheme of our sal -- va -- tion
	Was of old in or -- der laid,
	That the man -- i -- fold de -- ceiv -- er's
	Art by art might be out -- weighed,
	And the lure the foe put for -- ward
	In -- to means of heal -- ing made.
}

verseFour = \lyricmode {
	\set stanza = "4."
	There -- fore when the_ap -- point -- ed full -- ness
	Of the ho -- ly time was come,	
	He was sent who mak -- eth all things 
	Forth from God's e -- ter -- nal home;
	Thus he came to earth, in -- car -- nate,
	Off -- spring of a mai -- den's womb.
}

verseFive = \lyricmode {
	\set stanza = "5."
	Lo! he lies, an in -- fant weep -- ing,
	Where the nar -- row man -- ger stands:
	While the Mo -- ther -- maid his mem -- bers
	Wraps in mean and low -- ly bands:
	And the swad -- dling clothes are wind -- ing
	Round God's help -- less feet and hands.
}

verseSix = \lyricmode {
	\set stanza = "6."
	Thir -- ty years a -- mong us dwel -- ling,
	His ap -- point -- ed time ful -- filled,
	Born for this, He meets His Pas -- sion,	
	For that this He free -- ly willed,
	On the Cross the Lamb is lift -- ed
	Where his life -- blood shall be spilled.
}

verseSeven = \lyricmode {
	\set stanza = "7."
	He en -- dured the nails, the spit -- ting,
	Vin -- e -- gar, and spear, and reed;
	From that ho -- ly Bo -- dy bro -- ken
	Blood and wa -- ter forth pro -- ceed:
	Earth, and stars, and sky, and o -- cean
	By that flood from stain are freed.
}	

verseEight = \lyricmode {
	\set stanza = "8."
	Bend thy boughs, O Tree of Glo -- ry!
	Thy re -- lax -- ing sin -- ews bend;
	For a -- while the an -- cient ri -- gour
	That thy birth be -- stowed, sus -- pend;
	And the King of heav'n -- ly beau -- ty
	On thy bo -- som gen -- tly tend!
}	

verseNine = \lyricmode {
	\set stanza = "9."
	Thou a -- lone was count -- ed wor -- thy
	This world's ran -- som to up -- hold;
	For a ship -- wreck'd race pre -- par -- ing
	Har -- bour, like the Ark of old;
	With the sa -- cred Blood a -- noint -- ed
	From the smit -- ten Lamb that rolled.
}

verseTen = \lyricmode {
	\set stanza = "10."
	To the Tri -- ni -- ty be glo -- ry
	Ev -- er -- last -- ing, as is meet;
	E -- qual to the Fa -- ther, e -- qual
	To the Son, and Par -- a -- clete:
	Tri -- nal U -- ni -- ty, whose prais -- es
	All cre -- a -- ted things re -- peat.
}

\book {
  \include "hymn_paper_multipage.ly"
  \header {
    tagline = ""
  }
  \top
  \score {
    \context Staff = upper <<
	\set Staff.instrumentName = \markup { \fontsize #3 I.}
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Lyrics = one \lyricsto sopranos \refrain
    >>
\header {
	piece = \markup { \small {Text: \italic "Crux fidelis/Pange, lingua, gloriosi proelium certaminis," Fortunatus; tr. P. Dearmer and J.M. Neale}}
}
	\layout { 
		\layoutVariable
	}
}


%%%%%%%%%%%%%
%v1
%%%%%%%%%%%%%

\score {
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
    >>
	\layout { 
		\layoutVariable
	}
}

%%%%%%%%%%%%%
%v2
%%%%%%%%%%%%%
\score {
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Lyrics = one \lyricsto sopranos \verseTwo
    >>
	\layout { 
		\layoutVariable
	}
}
%%%%%%%%%%%%%
%v3
%%%%%%%%%%%%%
\score {
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Lyrics = one \lyricsto sopranos \verseThree
    >>
	\layout { 
		\layoutVariable
	}
}
%%%%%%%%%%%%%
%4
%%%%%%%%%%%%%
\score {
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Lyrics = one \lyricsto sopranos \verseFour
    >>
	\layout { 
		\layoutVariable
	}
}
%%%%%%%%%%%%%
%v5
%%%%%%%%%%%%%
\score {
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Lyrics = one \lyricsto sopranos \verseFive
    >>
	\layout { 
		\layoutVariable
	}
}
%%%%%%%%%%%%%
%v6
%%%%%%%%%%%%%
\score {
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Lyrics = one \lyricsto sopranos \verseSix
    >>
	\layout { 
		\layoutVariable
	}
}
%%%%%%%%%%%%%
%v7
%%%%%%%%%%%%%
\score {
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Lyrics = one \lyricsto sopranos \verseSeven
    >>
	\layout { 
		\layoutVariable
	}
}
%%%%%%%%%%%%%
%v8
%%%%%%%%%%%%%
\score {
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Lyrics = one \lyricsto sopranos \verseEight
    >>
	\layout { 
		\layoutVariable
	}
}
%%%%%%%%%%%%%
%v9
%%%%%%%%%%%%%
\score {
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Lyrics = one \lyricsto sopranos \verseNine
    >>
	\layout { 
		\layoutVariable
	}
}
%%%%%%%%%%%%%
%v10
%%%%%%%%%%%%%
\score {
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Lyrics = one \lyricsto sopranos \verseTen
    >>
	\layout { 
		\layoutVariable
	}
}
  \bottom
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Hymnal")
\book {
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  \top
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
      \new Lyrics \lyricsto "tune" { \verseFour}
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
