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
      \line {ADESTAE FIDELIS  Irreg.}
    }
    \right-column{
      \line {\italic "Cantus Diversi," J.F. Wade; harm. \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Adeste, fideles," John Francis Wade}
      \line {tr. F. Oakely, W.T Brooke, and others}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  \teeny g4 |
  \normalsize g2 d4 g |
  a2 d, |
  b'4 a b c |
  b2 a4 \teeny g | \break
  \normalsize g2 fs4 e |
  \set melismaBusyProperties = #'() \slurDashed fs( g) a b |
  \unset melismaBusyProperties \slurSolid fs2( e4.) d8 |
  d2. b'4\rest | \break
  d2 c4 b |
  c2 b |
  a4 b g a |
  fs2 d4 \bar "||" \break

  g4 |
  g fs g a |
  g2 d4 b' |
  b a b c |
  b2 a4 b |
  c b a g |
  fs2 g4( c) |
  b2( a4.) g8 |
  g1 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  \teeny d4 |
  \normalsize d2 d4 d |
  e2 d |
  d4 d d e |
  d2 d4 \teeny b |
  \normalsize b( cs) d cs |
  \tieDashed d4~ d4 d4 d |
  d2( cs4.) d8 |
  d2. s4 |
  d2 e8[ fs] g4 |
  g( fs) g2 |
  d4 d e e |
  d2 d4 \bar "||"

  s4 |
  \teeny d1~ |
  d2. \normalsize d4 |
  d d d d |
  d2 d4 g |
  fs g d d8[ cs] |
  d2 \slurSolid d4( e) |
  d2( d4.) b8 |
  b1 \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4
  \teeny b4 |
  \normalsize b2 b4 b |
  c2 a |
  g4 a g g |
  g2 fs4 \teeny g4 |
  \normalsize g2 a4 a |
  \slurDashed a( g) fs d |
  \slurSolid a'2( g4.) fs8 |
  fs2. d4\rest |
  b'2 c4 b |
  c2 d |
  d4 g, b c |
  a2 fs4 \bar "||"

  \teeny b |
  b a b c |
  g2. \normalsize g4 |
  g fs g a |
  g2 fs4 d' |
  d d a a |
  a2 g |
  g( fs4.) g8 |
  g1 \bar "|."
}

bass = \relative c' {
  \global
  \partial 4
  \teeny g4 |
  \normalsize g2 g4 g |
  g2 fs |
  g4 fs g c, |
  d2 d4 \teeny e |
  \normalsize e2 d4 a |
  \slurDashed d4( b) fs g |
  \slurSolid a2( a4.) d8 |
  d2. s4 |
  b'2 a4 g |
  a2 g |
  fs4 g e c |
  d2 d4 \bar "||"

  \teeny g,4_\markup { \italic "Without pedals."  } |
  g1~ |
  g1 |
  \normalsize r1 |
  r2 r4 g'4_\markup { \teeny \italic Pedals.  } |
  a g fs e |
  \slurSolid d4( c) b( c) |
  d2~ d4. g,8 |
  g1 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  O come, all ye faith -- ful,
  Joy -- ful and tri -- um -- phant,
  O come ye, O come _ ye to Beth -- le -- hem;
  Come and be -- hold Him
  Born the King of An -- gels:
  \override LyricText #'font-shape = #'italic
  O come, let us a -- dore Him,
  O come, let us a -- dore Him,
  O come, let us a -- dore Him, Christ the Lord!
  \override LyricText #'font-shape = #'italic
}

verseTwo = \lyricmode {
  \set stanza = "2."
  _ God of __ _ God, __ _
  Light __ _ of __ _ Light, __ _
  _ Lo! he ab -- hors _ not the Vir -- gin's womb;
  Ve -- ry __ _ God,
  Be -- got -- ten, not cre -- a -- ted:
}

verseThree = \lyricmode {
  \set stanza = "3."
  _ Sing, choirs of An -- gels,
  Sing in ex -- ul -- ta -- tion,
  _ Sing, all ye ci -- ti -- zens of heav'n a -- bove;
  Glo -- ry to God, all
  glo -- ry in the high -- est.
}


verseFour = \lyricmode {
  \set stanza = "4."
  _ Yea, Lord, we greet Thee,
  Born this hap -- py morn -- ing,
  _ Je -- sus, to Thee _ be all glo -- ry giv'n;
  Word of the Fa -- ther,
  Now in flesh ap -- pear -- ing:
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
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}


%{ Vs. 3 and 4 were are sometimes sung as vs. 6 and 7, respectively. The additional verses, 3-5, are found below:

\markup {
	\normalsize {
	\fill-line {
	\hspace #1.0
	\column {
		\line { \bold "3.* "
		\column {
		"    See how the Shepherds"
		"    Summoned to His cradle,"
		"Leaving their flocks, draw nigh with lowly fear;"
		"    We too will thither"
		"    Bend our joyful footsteps:"
		}
		}
		\vspace #0.5
		\line { \bold "4.** "
		\column {
		"    Lo, star-led chieftains,"
		"    Magi, Christ adoring,"
		"Offer him incense, gold, and myrrh;"
		"    We to the Christ Child"
		"    Bring our hearts' oblations:"
  		}
		}
	\vspace #0.5
		\line { \bold "5.* "
		\column {
		"    Child, for us sinners"
		"    Poor and in the manger,"
		"Fain we embrace Thee, with awe and love;"
		"    Who would not love Thee,"
		"    Loving us so dearly?"
  		}
		}
		}
	\hspace #1.0
	}
  }
}

%}

