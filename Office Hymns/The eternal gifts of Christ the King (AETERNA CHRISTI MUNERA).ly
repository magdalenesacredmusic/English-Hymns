\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

top = \markup {
  \fill-line {
    \column {
      \line {AETERNA CHRISTI MUNERA, LM}
    }
    \right-column{
      \line {Melody from Guidetti,}
      \line {\italic "Directorium Chori," 1582}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Aeterna Christi munera"}
      \line {Ambrose of Milan (340-397); tr. J.M. Neale, 1851}
    } 
  }
}


\header {
  tagline = ""
}

global = {
  \key f \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f4 f g \bar "!"
  a2. f4 \bar "!"
  g4( a bf a g4.) f8 \bar "!"
  f2. \bar "|"
  
  f4 a bf \bar "!"
  c d( c) a bf \bar "!"
  c2. \bar "|"
  
  c4 c c \bar "!"
  d4 c bf a \bar "!" \break
  g( a bf a g2 f) \bar "|"
  
  f4 f g \bar "!"
  a2. f4 \bar "!"
  g4( a bf a g4.) f8 \bar "!"
  f2. \bar "||" \break
  
  f4( g f e f) f2 \bar "||"
}

alto = \relative c' {
  \global
  c4^\markup {\italic "To be sung in unison."} d e
  <c f>2. d4
  <bf d>1~ <bf d>4. <a d>8 
  <a d>2.
  
  <d f>2 f4
  e <d f>1
  <e g>2.
  
  <f a>4 <f a> <e g> 
  <f bf> <e g> <d f>~ <c f>
  <bf d>1~ <bf d>2~ <a d>2 
  
  d4 c d8[ e]
  f2. d4
  d1 <c e>4. <a c>8 
  <a c>2.
  
  d2 c2. c2
}

tenor = \relative c' {
  \global
  a4 <f a> <g c>
  f2. a4
  g1~ g4. f8
  f2.
  a2 bf4 
  <g c> f1
  g2.
  c4 c2
  bf4 g bf a
  g1~ g2 f
  f bf4
  a2. a4
  bf1 g4. f8 
  f2.
  
  a4 bf a g a a2
}

bass = \relative c {
  \global
 f4 d c 
 f,2. d'4
 g1~ g4. d8 
 d2.
 
 d2. 
 c4 bf2 d
 c2.
 f4 f c
 bf c d f
 g,1~ g2 d'2
 
 bf4 a g
 f2. d'4
 g,1 c4. <f, c'>8 
 <f c'>2.
 
 d'4 g, a c f, f2
}

verseOne = \lyricmode {
	\vOne
	Th'e -- ter -- nal gifts of Christ the King,
	Th'A -- pos -- tles' glo -- rious deeds we sing:
	And while due hymns of praise we pay,
	Our thank -- ful hearts cast grief a -- way.
	}

verseTwo = \lyricmode {
	\vTwo
	The Church in these her prin -- ces boasts,
	These vic -- tor chiefs of war -- rior hosts:
	The sol -- diers of the heav' -- nly hall,
	The lights that rose on earth for all.
}

verseThree = \lyricmode {
	\vThree
	'Twas thus the yearn -- ing faith of Saints,
	Th'un -- con -- quer'd hope that nev -- er faints,
	The love of Christ that knows not shame,
	The Prince of this world o -- ver -- came.
}

verseFour = \lyricmode {
  \vFour
     In these the Fa -- ther's glo -- ry shone,
	In these the will of God the Son:
	In these ex -- ults the Ho -- ly Ghost,
	Through these re -- joice the Heav'n -- ly host.
}

verseFive = \lyricmode {
  \vFive
  	Re -- deem -- er, hear us of Thy love,
	That with this glo -- rious band a -- bove,
	Here -- aft -- er, of Thine end -- less grace,
	Thy ser -- vants al -- so may have place.
	
	A -- men.
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_layout_ragged.ly"
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_layout_ragged.ly"
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
    \vspace #0.5
  }
  \bottom
}
