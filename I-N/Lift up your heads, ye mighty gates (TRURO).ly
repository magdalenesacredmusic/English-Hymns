%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/
%}


\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "	Macht hoch die Tür," George Weissel (1590-1635), 1642; Tr. Catherine Winkworth (1829-78)
      }
      \wordwrap {
        Music: TRURO, LM, \italic "Psalmodia Evangelica," 1789
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {TRURO  LM}
    }
    \column{
      \line {\italic "Psalmodia Evangelica," 1789}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "	Macht hoch die Tür"}
      \line {George Weissel (1590-1635), 1642; Tr. Catherine Winkworth (1829-78)}
      %text from Service Book and Hymnal of the Lutheran Church in America, 1958
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \time 2/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}
%harmony from the red Trinity Hymnal of the Presbyterian Church, differs from the harmony in the English Hymnal
melody = \relative c' {
  \global
  c2 e4. f8 |
  g2. g4 |
  a2 b |
  c2. g4 | 
  c2 g | \break
  f4( e) d( c) |
  f2 e |
  d2. \bar "" %\break
    d4 |
  g2 a |
  b2. d4 |
  d( c) b( a) |
  g2. g4 |
  g2 c |
  d,4( a') g( f) |
  e2 d |
  c1
\bar "|."
}

melodya = \relative c' {
  \global
  c2 e4. f8 |
  g2. g4 |
  a2 b |
  c2. \bar "" \break g4 |
  c2 g |
  f4( e) d( c) |
  f2 e |
  d2. \bar "" \break
    d4 |
  g2 a |
  b2. d4 |
  d( c) b( a) |
  g2. \bar "" \break g4 |
  g2 c |
  d,4( a') g( f) |
  e2 d |
  c1
\bar "|."
}

alto = \relative c' {
  \global
  c2 c4. b8 |
  c2. e4 |
  f2 f |
  e2. d4 |
  c2 d |
  c a4( g) |
  a( b) c2 |
  b2. b4 |
  d2 d |
  d2. d4 |
  e2 d4( c) |
  b2. b4 |
  c2 e |
  d4( f) e( d) |
  c2 b |
  c1
}

tenor = \relative c {
  \global
  e2 g4. g8 |
  g2. c4 |
  c2 f, |
  g2. g4 |
  e2 g |
  g f4( g) |
  f2 g |
  g2. g4 |
  g2 fs |
  g2. g4 |
  g2 g4( fs) |
  g2. g4 |
  g2 g |
  a4( f) g( a) |
  g2. f4 |
  e1
}

bass = \relative c {
  \global
 c2 c4. d8 |
 e2. c4 |
 f2 d |
 c2. b4 |
 a2 b |
 c f4( e) |
 d2 c |
 g2. g4 |
 b2 d |
 g2. b,4 |
 c2 d |
 g,2. f'4 |
 e2 c |
 f4( d) e( f) |
 g2 g, |
 c1
}

verseOne = \lyricmode {
  \vOneL
  Lift up your heads, ye might -- y gates,
  Be -- hold the King of glo -- ry waits!
  The King of kings is draw -- ing near,
  The Sav -- ior of the world is here.
}

verseTwo = \lyricmode {
  \vTwoL
  O blest the land, the cit -- y blest,
  Where Christ the rul -- er is con -- fessed!
  O hap -- py hearts and hap -- py homes
  To whom this King in tri -- umph comes!
}

verseThree = \lyricmode {
  \vThreeL
  Fling wide the por -- tals of your heart,
  Make it a tem -- ple set a -- part
  From earth -- ly use for heav'n's em -- ploy,
  A -- dorned with prayer and love and joy.
}

verseFour = \lyricmode {
  \vFourL
  Re -- deem -- er, come! with us a -- bide;
  Our hearts to thee we o -- pen wide,
  Let us thy in -- ner pre -- sence feel,
  Thy grace and love in us re -- veal.
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  % \top
  \score { %\transpose c bf,
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
  \score { %\transpose c bf,
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
        \melody
      }
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}