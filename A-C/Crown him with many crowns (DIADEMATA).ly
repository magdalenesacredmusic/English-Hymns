%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Matthew Bridges (1800-94)
      }
      \wordwrap {
        Music: DIADEMATA,  DSM, George Elvey (1816 – 1893)
      }
    }
  }
}

top = \markup {
\fill-line {
      \column {
          \line {DIADEMATA  DSM}
      }
      \column{
      \line {George Elvey (1816 – 1893)}
      }
}
}

bottom = \markup  {
 \fill-line {
     \null { "Matthew Bridges (1800-94)" }
  } 
}

global = {
	\key d\major
	\time 4/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	d4 d8 d fs4 fs |
	b2. b4 |
	a d, g fs |
  e2. \bar ""  \break
  
  e4 |
  fs a b a | 
  gs fs8[ e] a4 d | 
  cs d b b | 
  a2. \bar "" 
  
  a4 |
  a fs e d |
  b'2. b4 |
  b gs fs e |
  cs'2. \bar "" \break
  
  cs4 |
  d4. cs8 b4 a |
  g e fs a |
  g fs e e |
  d1 \bar "|."
}

melodya = \relative c' {
	\global
	d4 d8 d fs4 fs |
	b2. b4 |
	a d, g fs | %\break
  e2. \bar ""  %\break
  
  e4 |
  fs a b a |
  gs fs8[ e] a4 d |
  cs d b b |
  a2. \bar "" 
  
  a4 |
  a fs e d |
  b'2. b4 |
  b gs fs e |
  cs'2. \bar "" %\break
  
  cs4 |
  d4. cs8 b4 a |
  g e fs a |
  g fs e e |
  d1 \bar "|."
}

alto = \relative c' {
	\global
  a4 a8 a d4 d |
  d2. d4 
  d d cs d |
  cs2. 
  
  cs4 |
  d e d d |
  b b e d |
  e fs b, e |
  cs2.
  
  cs4 |
  d d cs d |
  d2. ds4 |
  e e d d |
  cs2. 
  
  e4 |
  d d d d |
  d cs d d |
  d d d cs |
  d1
}

tenor = \relative c {
	\global
  fs4 fs8 fs fs4 fs |
  g2. g4 |
  a b g a |
  a2. 
  
  a4 |
  a a fs fs |
  gs gs a gs |
  a a a gs |
  a2.
  
  a4 |
  a a g a |
  g2. a4 |
  gs b a b |
  a2. 
  
  a4 |
  a a g a |
  b a a a |
  b a a4. g8 |
  fs1
}

bass = \relative c {
	\global
  d4 d8 d8 b4 b |
  g2. g'4 |
  fs g e d |
  a2. 
  
  a4 |
  d cs b d |
  e d cs b |
  a d e e |
  a,2. 
  
  g'4 |
  fs d e fs |
  g2. fs4 |
  e e fs gs |
  a2. 
  
  g4 |
  fs fs g fs | 
  e a d, fs, |
  g d' a a |
  d1
}

verseOne = \lyricmode {
  \vOne
  Crown him with man -- y crowns,
  The Lamb up -- on his throne;
  Hark! how the heav'n -- ly an -- them drowns
  All mu -- sic but its own:
  A -- wake, my soul, and sing
  Of him who died for thee,
  And hail him as thy match -- less King
  through all e -- ter -- ni -- ty.
}

verseTwo = \lyricmode {
  \vTwo
  Crown him the Vir -- gin's Son,
  The God in -- car -- nate born,
  Whose arm those crim -- son tro -- phies won
  Which now his brow a -- dorn:
  Fruit of the mys -- tic Rose,
  As of that Rose the Stem;
  The Root whence mer -- cy ev -- er flows,
  The Babe of Beth -- le -- hem.
}

verseThree = \lyricmode {
  \vThree
  Crown him the Lord of love!
  Be -- hold his hands and side,
  Rich wounds yet vi -- si -- ble a -- bove
  In beau -- ty glo -- ri -- fied:
  No an -- gel in the sky
  Can ful -- ly bear that sight,
  But down -- ward bends his burn -- ing eye
  At mys -- ter -- ies so bright.
}

verseFour = \lyricmode {
	\vFour
  Crown him the Lord of peace,
  Whose pow'r a scep -- tre sways
  From pole to pole, that wars may cease,
  Ab -- sorbed in prayer and praise:
  His reign shall know no end,
  And round his pierc -- èd feet
  Fair flow'rs of Pa -- ra -- dise ex -- tend
  Their fra -- grance ev -- er sweet.
}

verseFive = \lyricmode {
	\vFive
  Crown him the Lord of years,
  The Po -- ten -- tate of time,
  Cre -- a -- tor of the roll -- ing spheres,
  In -- ef -- fab -- ly sub -- lime.
  Glassed in a sea of light,
  Where ev -- er -- last -- ing waves
  Re -- flect his throne- the In -- fi -- nite!
  Who lives- and loves- and saves.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
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
    \include "hymn_layout.ly"
  }
  % \bottom
  \refs
}

%%%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 16)
#(define output-suffix "Hymnal")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  %\top
  \score { %\transpose c d
    \new ChoirStaff <<
      \new Staff  <<
        \new Voice = "soprano" { \voiceOne \melodya }
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
    \include "hymn_hymnal_layout.ly"
  }    
  \refs
  %\bottom
}
%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  %  \top
  \score {
    %\transpose c bf,
    <<
      \new Voice = "tune" {
        \melodya
      }
      \new Lyrics \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
      \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}
