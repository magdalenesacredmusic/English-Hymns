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
          \line {EVENTIDE  10 10 10 10}
      }
      \column{
      \line {W.H. Monk (1823 – 1889)}
      }
}
}

bottom = \markup  {
 \fill-line {
     \null { "H.F. Lyle (1793-1847)" }
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
	g2 g4 f |
	ef2 bf'2 |
	c4 bf bf af |
	g1 \bar "||" \break
	
	g2 af4 bf |
	c2 bf2 |
	af4 f g a |
	bf1 \bar "||" \break

	g2 g4 f |
	ef2 bf'2 |
	bf4 af af g |
	f1 \bar "||" \break

	f2 g4 af |
	g f ef af |
	g2 f2 |
	ef1 \bar "|."
}

alto = \relative c' {
	\global
	ef2 d4 d |
  ef2 ef |
  ef4 d ef f |
  ef1 |

  ef2 ef4 ef |
  ef2 ef |
  ef4 f ef ef |
  d1 |

  ef2 d4 d | 
  ef2 ef |
  ef4 ef e e |
  f1 |

  d2 ef4 d |
  ef d ef f |
  ef2 d |
  ef1
}

tenor = \relative c' {
	\global
	 bf2 bf4 af |
  g2 ef |
  ef4 bf' bf bf |
  bf1 |

  bf2 af4 g |
  af2 g |
  c4 bf bf ef, |
  f1 |

  g4( af) bf af |
  g2 ef'4( d) |
  c4 c c bf |
  af1 |

  bf2 bf4 bf |
  bf af g c |
  bf2. af4 |
  g1
}

bass = \relative c {
	\global
	ef2 bf4 bf |
  c2 g |
  af4 bf c d |
  ef1 |

  ef4( d) c bf |
  af2 ef' |
  f4 d ef c |
  bf1 |

  ef2 bf4 bf |
  c2 g |
  af4. bf8 c4 c |
  f1 |

  af2 g4 f |
  ef bf c af |
  bf2 bf |
  ef1
}

verseOne = \lyricmode {
  \set stanza = "1. "
  A -- bide with me: fast falls the e -- ven -- tide;
  The dark -- ness deep -- ens; Lord, with me a -- bide:
  When oth -- er help -- ers fail and com -- forts flee,
  Help of the help -- less, O a -- bide with me.
}

verseTwo = \lyricmode {
  \set stanza = "2. "
  Swift to its close ebbs out life's lit -- tle day,
  Earth's joys grow dim, its glo -- ries pass a -- way,
  Change and de -- cay in all a -- round I see;
  O thou who chang -- est not, a -- bide with me.
}

verseThree = \lyricmode {
  \set stanza = "3. "
	I need thy pres -- ence ev -- 'ry pass -- ing hour;
	What but thy grace can foil the temp -- ter's pow'r?
	Who, like thy -- self, my guide and stay can be?
	Through cloud and sun -- shine, Lord, a -- bide with me.
}

verseFour = \lyricmode {
	\set stanza = "4. "
	I fear no foe, with thee at hand to bless;
	Ills have no weight, and tears no bit -- ter -- ness.
	Where is death's sting? where, grave, thy vic -- to -- ry?
	I tri -- umph still, if thou a -- bide with me.
}

verseFive = \lyricmode {
	\set stanza = "5. "
	Hold thou thy Cross be -- fore my clos -- ing eyes;
	Shine through the gloom, and point me to the skies;
	Heav'n's morn -- ing breaks, and earth's vain sha -- dows flee:
	In life, in death, O Lord, a -- bide with me.
}



\book {
  \include "hymn_paper.ly"

\top

  \header {
    tagline = ""
  }

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Voice =
         altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
	  \context Lyrics = two \lyricsto sopranos \verseTwo
	  \context Lyrics = three \lyricsto sopranos \verseThree
	  \context Lyrics = four \lyricsto sopranos \verseFour
	  \context Lyrics = five \lyricsto sopranos \verseFive
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
        tenors { \voiceOne << \tenor >> }
      \context Voice =
        basses { \voiceTwo << \bass >> }
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
  \bottom
}


%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  #(set-global-staff-size 16)
  %#(layout-set-staff-size 15)
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
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_melody_layout.ly"
  }
  %{ \markup \override #'(baseline-skip . 1.7) {
    \vspace #0.7
    \teeny
    \column {
      \line { Music: EVENTIDE, 10.10.10.10., W.H. Monk (1823 – 1889) }
      \line{ Text: H.F. Lyle (1793-1847) }
    }
  } %}
\bottom
}