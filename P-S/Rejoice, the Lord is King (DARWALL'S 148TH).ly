\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Charles Wesley (1707-1788)
      }
      \wordwrap {
        Music: DARWALL'S 148TH  66 66 44 44, John Darwall (1731-1789)
      }
    }
  }
}


\header {
  tagline = ""
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
\partial 4
  c |
e c g' e |
c'2. b4 |
a g f e |
d2. \bar"" \break

d4 |
e c a' g |
fs4 d d' c |
b2 c2 |
d2. \bar "" \break

g,4 |
a2 b |
c2. \bar ""

c,4 |
d e f g |
c b c d |
c2 b |
c2. \bar "|."
}

alto = \relative c' {
  \global
\partial 4
c4 |
c c d e |
e2. e4 |
f c b c |
b2. 

b4 |
c c e d |
d d d e |
d2 d |
d2.

e4 |
f2 f |
e2. 

c4 |
 b c c c |
c f e d |
e2 d |
e2. 
}

tenor = \relative c {
  \global
  \partial 4
e4 |
g e g g |
a2. b4 |
c g g g |
g2.

g4 |
g g c b |
a fs g g |
g2 fs4( c') |
b2.

c4 |
c2 d |
c2.

g4 |
g g f e |
f f g a |
g2 g |
g2.
}

bass = \relative c {
  \global
\partial 4
c4 |
c c b c |
a'2. 

g4 |
f e d c |
g2. 

g4 |
c e a, b8[ c] |
d4 d8[ c] b4 c |
d2 d2 |
g,2.

c4 |
f2 d |
a2. 

e'4 |
d c a c |
f d e f |
g2 g, |
c2.
}

verseOne = \lyricmode {
  \vOneL
Re -- joice, the Lord is King,
  Your Lord and King a -- dore;
Mor -- tals, give thanks and sing,
  And tri -- umph ev -- er -- more:
}

verseTwo = \lyricmode {
  \vTwoL
Je -- sus, the Sav -- ior, reigns,
  The God of truth and love;
When he had purged our stains,
  He took his seat a -- bove:
}

verseThree = \lyricmode {
  \vThreeL
His king -- dom can -- not fail;
  He rules o'er earth and heav'n;
The keys of death and hell
  Are to our Je -- sus giv'n:
  
    \vOff
  Lift up your heart, 
  lift up your voice;
    Re -- joice, a -- gain I say, re -- joice.
}

verseFour = \lyricmode {
  \vFourL
He sits at God's right hand
  Till all his foes sub -- mit,
And bow to his com -- mand,
  And fall be -- neath his feet:
}

verseFive = \lyricmode {
  \vFiveL
  Re -- joice in glo -- rious hope!
  Our Lord, the Judge, shall come,
  And take his ser -- vants up to their e -- ter -- nal home.
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
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
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
    \include "hymn_hymnal_layout.ly"
  }    
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
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
        \melody
      }
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
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
  %{
\extraVerses
\markup {
  \vspace #0.5
}
  %}
  \refs
}
