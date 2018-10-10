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
      \line {SALVE FESTA DIES  Irreg.}
    }
    \right-column{
      \line {Ralph Vaughan Williams, 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Salve, festa dies"}
      \line {Venantius Fortunatus; tr. M.F. Bell, 1906}
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
	%\set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
	\global
	\repeat volta 2 {
	g4 d' c b8 a |
	g2. b4 |
	a g8 fs g a4 fs8 |
	e2 d \bar "||" \break 
	e4 fs8 g a4 c |
	b2 d4 e8 d |
	b2 a4. g8 |
	}
	\alternative {
	{ g1 }
	{ g1 \bar "||"}
	} \break

%even verses
	a4 a8 a b4 a8 b |
	c2. d8 d |
	e4 \slurDashed \set melismaBusyProperties = #'() d8( c) \unset melismaBusyProperties b4 c8 a |
	\slurSolid gs2 e \bar "||" \break
	a2 b4 a8[ b] |
	c4 e8 e d4( b) |
	c4 b8 b a b4 g8 |
	d'1^\markup { \small { \caps Repeat \italic "'Hail thee'"}} \bar "||" \break 
%odd verses
	\times 2/3 { e,4 e e } \set melismaBusyProperties = #'() \times 2/3 { f \slurDashed e( f) } \unset melismaBusyProperties
	\set melismaBusyProperties = #'() g4 \tieDashed c8~ c8 b4 a8~ a \unset melismaBusyProperties |
	\tieSolid g2~ g4 a8 g |
	e2 d \bar "||" \break
	\times 2/3 {e4 e e} \set melismaBusyProperties = #'() \times 2/3 {fs! g( a)} \unset melismaBusyProperties
	b2 c4 b8 c |
	g2 fs4. e8 |
	\slurSolid e2(^\markup { \small { \caps Repeat \italic "'Hail thee'"}} fs) \bar "||" \break
%refrain
	g4^\markup { \caps "Refrain after each Verse." } d' c b8 a |
	g2. b4 |
	a g8 fs g a4 fs8 |
	e2 d \bar "||" \break
	e4 fs8 g a4 c |
	b2 d4 e8 d |
	b2 a4. g8 |
	g1 \bar "|."
}

soprano = \relative c'' {
	\global
	\repeat volta 2 {
	g4 d' c b8 a |
	g2. b4 |
	a g8 fs g a4 fs8 |
	e2 d \bar "||"
	e4 fs8 g a4 c |
	b2 <d, d'>4 <e e'>8 <d d'> |
	b'2 a4. g8 |
	}
	\alternative {
	{ g1 }
	{ g1 }
	}
%even verses
	a4 a8 a b4 a8 b |
	c2. d8 d |
	e4 d8 c b4 c8 a |
	gs2 e \bar "||"
	a2 b4 a8[ b] |
	c4 e8 e d4( b) |
	c4 b8 b a b4 g8 |
	d'1
%odd verses
	\times 2/3 { e,4 e e } \times 2/3 { f e f }
	g4 c <g b> a |
	g2~ g4 a8 g |
	e2 d
	\times 2/3 {e4 e e} \times 2/3 {fs! g a}
	b2 c4 b8 c |
	g2 fs4. e8 |
	e2( fs)
%refrain
	g4 d' c b8 a |
	g2. b4 |
	a g8 fs g a4 fs8 |
	e2 d \bar "||"
	e4 fs8 g a4 c |
	b2 <d, d'>4 <e e'>8 <d d'> |
	b'2 a4. g8 |
	g1
}

alto = \relative c' {
	\global
	\repeat volta 2 {
	<b d>4 <d g> <e g> fs |
	e2. <cs g>4 |
	d d d2 |
	d4 cs d2 |
	e4 d <e a>2 |
	<ds a'>4 <e g> g2 |
	<d g> <<{\voiceTwo fs2}\\{d4 c}>> |
	}
	\alternative {
	{ b4 e d c }
	{ <b d>1 }
	}
%even verses
	e4 c e fs8[ gs] |
	<e a>2. <d a'>4 |
	<e a>2 f4 d |
	e2 b |
	e2 e4 fs8[ gs] |
	<e a>4 fs g2 |
	e e |
	<d fs> <e g>4 <fs a> 
%odd verses
	c2 c |
	<b d>4 <c g'> <<{\stemDown c2}\\{s4 f4}>> |
	c b c2 |
	c2. b4 |
	c2 <c e> |
	<b e> <e g>4 e |
	e2 ds4. e8 |
	b2( d!)
%refrain
	<b d>4 <d g> <e g> fs |
	e2. <cs g>4 |
	d d d2 |
	d4 cs d2 |
	e4 d <e a>2 |
	<ds a'>4 <e g> g2 |
	<d g> <<{\voiceTwo fs2}\\{d4 c}>> |
	<b d>1
}

tenor = \relative c {
	\global
	\repeat volta 2 {
	<g g'>4 s4 s4 d''8[ c] |
	b2. g4 |
	a2 g4 fs |
	b a <fs a>2 |
	g <\tweak #'font-size #-2 a c> |
	\tiny b \normalsize g |
	s2 s |
	}
	\alternative {
	{ g1 }
	{ g1 }
	}
%even verses
	e1~ |
	e4 s2. |
	s2 a2 |
	b gs |
	e1~ |
	e4 a b2 |
	a4 g g2 |
	d'1
%even verses
	g,2 f |
	s1 |
	e4 f g c |
	g2~ g |
	g a |
	g g4 b8[ a] |
	g4 a b a |
	g2( a) |
%refrain
	<g, g'>4 s4 s4 d''8[ c] |
	b2. g4 |
	a2 g4 fs |
	b a <fs a>2 |
	g <\tweak #'font-size #-2 a c> |
	\tiny b \normalsize g |
	s2 s |
	g1
}

bass = \relative c {
	\global
	\repeat volta 2 {
	s4 b c d |
	e fs g e |
	fs d b a |
	g a d2 |
	c4 b_\markup { \small \italic {(Small notes optional.)}  } a g |
	<<{\voiceTwo fs e}\\{\voiceTwo \tiny   \override Stem #'length = #4
 fs' e}>> b c8[ b] |
	d2 <<{\tiny \stemDown d,}\\{\override Stem #'length = #4 d'}>> |
	}
	\alternative {
	{ g,4 c b a } 
	{ g1 }
	}
%even verses	
	c4 a gs e |
	a a' g f |
	c a d f |
	e fs e d |
	c a gs e |
	a c b e |
	a, b c cs |
	d c b a |
%odd verses
	c2 a |
	g4 e f a |
	c d e f |
	g2 g, |
	c a |
	e'4 d c g8[ a] |
	b1 |
	e2( d) |
%refrain	
	s4 b c d |
	e fs g e |
	fs d b a |
	g a d2 |
	c4 b_\markup { \small \italic {(Small notes optional.)}  } a g |
	<<{\voiceTwo fs e}\\{\voiceTwo \tiny   \override Stem #'length = #4
 fs' e}>> b c8[ b] |
	d2 <<{\tiny \stemDown d,}\\{\override Stem #'length = #4 d'}>> |
	g,1
}


verseOne = \lyricmode {
	\set stanza = "1."
	\repeat volta 2 { Hail thee, Fes -- ti -- val Day! blest day that art hal -- lowed for ev -- er;
	Day where -- in Christ a -- rose, break -- ing the king -- dom of }
        \alternative { { death. } { death. } } 
	
	<< { \set stanza = "2."
	Lo, the fair bea -- ty of earth, from the death of the win -- ter a -- ris -- ing,
	Ev' -- ry good gift of the year now with its Mas -- ter re -- turns.}
	
	\new Lyrics = "fourthVerse" \with {alignBelowContext = #"firstVerse"} {
	\set associatedVoice = "melody"
	\set stanza = "4." God of all pit -- y and pow'r, let Thy Word be as -- sured to the doubt -- ing;
	Light on the third day re -- turns: rise, Son of God, from the tomb! }
	
	\new Lyrics = "sixthVerse" \with {alignBelowContext = #"fourthVerse"} {
	\set associatedVoice = "melody"
	\set stanza = "6."
	Ill it be -- seem -- eth that Thou, by whose hand all __ _ things are en -- com -- passed,
	Cap -- tive and bound shouldst re -- main, deep in the bloom of the rock.
	}

	\new Lyrics = "eighthVerse" \with {alignBelowContext = #"sixthVerse"} {
	\set associatedVoice = "melody"
	\set stanza = "8."
	Moun -- ing they laid Thee to rest, who art Au -- thor of life and cre -- a -- tion; 
	Tread -- ing the path -- way of death, life Thou be -- stow -- edst on man.
	}

	\new Lyrics = "tenthVerse" \with {alignBelowContext = #"eighthVerse"} {
	\set associatedVoice = "melody"
	\set stanza = "10."
	Out of the pri -- son of death Thou art res -- cu -- ing num -- ber -- less cap -- tives;
	Free -- ly they tread in the way whi -- ther their Ma -- ker has gone.
	}
	>>

	<<{ \set stanza = "3."
	He who was nailed to the Cross is _ God and the Ru -- ler of all things;
	All things cre -- a -- ted on earth wor -- ship the Ma -- ker of all.}

	\new Lyrics = "fifthVerse" \with {alignBelowContext = #"firstVerse"} {
	\set associatedVoice = "melody"
	\set stanza = "5."
	Ill doth it seem that Thy limbs should _ ling -- er in low -- ly dis -- hon -- our,
	Ran -- som and price of the world, veiled from the vi -- sion of men.
	}
	
	\new Lyrics = "seventhVerse" \with {alignBelowContext = #"fifthVerse"} {
	\set associatedVoice = "melody"
	\set stanza = "7."
	Rise now, O Lord, from the grave and _ cast off the shroud that en -- wrapped Thee;
	Thou art suf -- fi -- cient for us: noth -- ing with -- out Thee ex -- ists.
	}

	\new Lyrics = "ninthVerse" \with {alignBelowContext = #"seventhVerse"} {
	\set associatedVoice = "melody"
	\set stanza = "9."
	Show us Thy face once -- _ more, that the a -- ges may joy in Thy bright -- ness;
	Give us the light of __ _ day, dark -- ened on earth at Thy death.
	}

	\new Lyrics = "eleventhVerse" \with {alignBelowContext = #"ninthVerse"} {
	\set associatedVoice = "melody"
	\set stanza = "11."
	Je -- sus has har -- row -- ed hell; he has led cap -- _ ti -- vi -- ty cap -- tive:
	Dark -- ness and cha -- os and death flee from the face of the light.
	}
	>>

	\override LyricText #'font-shape = #'italic Hail thee, Fes -- ti -- val Day! blest day that art hal -- lowed for ev -- er;
	Day where -- in Christ a -- rose, break -- ing the king -- dom of death.
}

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score {<<
     \new Voice = "tune" {
        \melody
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melody }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
          >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 100 4)
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}

%{
\score { <<
	 \new Voice = "melody" {\melody }
	\new Lyrics = "firstVerse" \lyricsto "melody" \verseOne 
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \soprano >> }
      \context Voice =
         altos { \voiceTwo << \alto >> }
      
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
        tenors { \voiceOne << \tenor >> }
      \context Voice =
        basses { \voiceTwo << \bass >> }
    >>
  >>
>>
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 144 4)
            }
       }
  \layout {
    \context {
      \Score
      % **** Turns off bar numbering
      \remove "Bar_number_engraver"
    }
	\context {
		\Staff
		\remove "Time_signature_engraver"
		 }
    \context {
      \Lyrics
      % **** Prevents lyrics from running too close together
      \override LyricSpace #'minimum-distance = #0.6
      % **** Makes the text of lyrics a little smaller
      \override LyricText #'font-size = #-1
      % **** Moves lines of lyrics closer together
      \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 1)
    }
  }
}

%}
