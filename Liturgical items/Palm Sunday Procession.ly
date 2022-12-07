\version  "2.18.2"
\include "english.ly"
%\include "hymn_definitions.ly"

#(set-global-staff-size 17)

%%%%%%%%%%%%%%%%%%%%

\paper {
  #(set-paper-size "letter")
 % page-count = #1
	%#(set-paper-size "ustrade") 
	top-margin = 1\in
	bottom-margin = 1\in
	left-margin = 1\in
	right-margin = 1\in
	
	system-system-spacing =
    #'((basic-distance . 15) 
       (minimum-distance . 8)
       (padding . 1)
       (stretchability . 60)) 

}

hb = {
  %% This creates a half bar that reaches 
  \once \override Staff.BarLine.bar-extent = #'( -1 . 1 )
  \bar "|"
}

top = 
\markup {
  \column {
  \fill-line {\fontsize #4 \bold "PALM SUNDAY"}
  \fill-line {
    \column {
      \line {\fontsize #1 \italic \caps "HOSANNA FILIO DAVID"}
    }
    \right-column{
      \line {\italic "Graduale Romanum," Mode VII }
      \line {\italic Adapt. David O'Donnell, 2016}
    }
  }
  \vspace #1
}
}

chant = \relative c' {
  \key af \major
  \cadenzaOn
  \autoBeamOff
%\override Stem #'length = #0
  \override Voice.Rest #'staff-position = #0
  
  ef8 ef8[ bf'] bf4 bf8 af g af bf8[ c] bf4 \hb
  g8 af bf8[ c bf] af8[( bf8] af4) \bar "'"
  af8 f8[ ef] ef[ df] f[ af] af[^- f] g f8[ g] ef4 \bar "|"
  af8 af af af[~ af~ af] f8[ af] bf8[ af g af] af4( g) \hb \break
  ef8 ef[ bf'] bf8[ c af f] g f[ g] ef4 ef \bar "||" s1 s1 s1 \bar ""
  
 	%{b8\rest g8 g[ d'] d4 d8 c b c d[ e] d4 \hb
	b8 c d[ e d] c[ d]( c4) \bar "'" \break
	c8 a[ g] g[ f] a[ c] c[-- a] b a[ b] g4 \bar "|"
	b8\rest c8 c c c[( c c]) a[ c] d[ c b c] \bar "" \break
	c4( b) \hb
		g8 g[ d'] d[ e c a] b8 a[ b] g4 g \bar "||" %}
}


verse = \lyricmode {
         Ho -- san -- na to the Son of Da -- vid;
	bles -- sed is he who comes in the name of the Lord,
	the King of Is -- ra -- _ el.
	Ho -- san -- na in the high -- est.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%


 % \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score {
    \new Staff <<
        \new Voice = "soprano" { \voiceOne \chant }
      \new Lyrics  \lyricsto soprano \verse 
    >>
    \include "Weber_chant_melody_layout.ly"
  }
%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%

chanta = \relative c' {
    \key g \major
  \cadenzaOn
  \autoBeamOff
  %\override Voice.Rest #'staff-position = #0
   e8 g e8[ d] g a g[^- b] b4 \bar "'"
   b8 d b[ a] b[ a] g a[^- b] b4 \hb
   b8 a8[ g] a [g fs] e4 \hb
   g4( fs8) e8[ d] d e[ g] g4( a8) g4 \bar "'"
   g8 a8[ b] b[^- a fs] g fs e4 e \bar "||"
}


verseTwo = \lyricmode {
  The chil -- dren of the He -- brews,
	car -- ry -- ing o -- live bran -- ches,
	went to meet the Lord,
	cry -- ing out and say -- ing:
	Ho -- san -- na in the high -- est.
}


  %\include "hymn_paper.ly"
  \header {
    tagline = ""
  }
\markup {
  
}
  \score {
    \new Staff <<
        \new Voice = "soprano" { \voiceOne \chanta }
      \new Lyrics  \lyricsto soprano \verseTwo
    >>
    \layout {
  %indent = 0.0\cm
  ragged-right = ##f
  ragged-last = ##f
  %#(layout-set-staff-size 16)
  \context {
    \Score
    %**** Turns off bar numbering
    \remove "Bar_number_engraver"
  }
  \context {
    \Staff
    \remove "Time_signature_engraver"
  }
}
  }

%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%

chantc = \relative c' {
    \key g \major
  \cadenzaOn
  \autoBeamOff
  %\override Voice.Rest #'staff-position = #0

    e8 g e8[ d] g a g[^- b] b4 \bar "'"
  b8[ d] b b g fs fs8[ g] g4 \hb
  b8 g a fs g8[ fs] e4 \hb
  e8 g e fs g a fs g a4 
  fs8 g a[ b] a g g[ a g]^- \bar "'"
  fs8 g a8[ fs] g fs e4 \bar "||"
}


verseComm = \lyricmode {
   The chil -- dren of the He -- brews,
   spread their gar -- ments on the road,
   cry -- ing out and say -- ing:
   Ho -- san -- na to the Son of Da -- vid; bless -- ed is he who comes in the name of the Lord.
}

  %\include "hymn_paper.ly"
\header {
    tagline = ""
  }
\markup {
  
}
  \score {
    \new Staff <<
        \new Voice = "soprano" { \voiceOne \chantc }
      \new Lyrics  \lyricsto soprano \verseComm
    >>
    \include "Weber_chant_melody_layout.ly"
  }
  \markup {
    \vspace #3
  }