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
      \line {NARENZA  SM}
    }
    \column{
      \line {Melody from Leisentritt's \italic "Catholicum Hymnologium"}
      \line {\italic "Germanicum," 1584. Adapted by W. H. Havergal, 1793-1870}
      \line { from the \italic "Cöln Gesanguch," 1619}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Summi parentis filio"}
      \line {Roman Breviary, 1736; Tr. Edward Caswall, 1814-1876}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key bf \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  bf4 |
  a f g a |
  bf2. d4 |
  c a bf g |
  f2. \bar "" \break
  
  f4 |
  f f g a |
  bf g a d |
  c bf c c |
\partial 2.  bf2.
\bar "||" \break

  bf2 bf \bar "|."
}

alto = \relative c' {
  \global
  f4 |
  f f bf, ef |
  d2. f4 |
  e f d c |
  a2. 
  
  d4 |
  ef d ef ef |
  d g fs f |
  f d g f8[ ef] |
  d2.
  
  ef2 d
}

tenor = \relative c' {
  \global
  \partial 4
  d4 |
  c bf bf c |
  f,2. bf4 |
  g f f e |
  f2. 
  
  f4 |
  c'4 bf bf c |
  bf c a bf |
  a bf bf a |
  bf2.
  
  g2 f
}

bass = \relative c {
  \global
   bf4 
   f' d ef c |
   bf2. bf4 |
   c d bf c |
   f2. 
   
     bf,4 |
     a bf ef c |
     g' ef d bf |
     f' g ef f |
     bf,2.
     
    ef2 bf2
}

verseOne = \lyricmode {
  \set stanza = "1."
  To Christ the Prince of Peace,
  And Son of God most high,
  The Fa -- ther of the world to come,
  Our joy -- ful priase we cry.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Deep in his Heart for us
  The wound of love he bore,
  That love where -- with he still in -- flames
  The hearts that him a -- dore.
}

verseThree = \lyricmode {
  \set stanza = "3."
  O Je -- sus, Vic -- tim blest,
  What else but love di -- vine
  Could thee con -- strain to o -- pen thus
  That Sa -- cred Heart of thine.
}

verseFour = \lyricmode {
  \set stanza = "4."
  O Fount of end -- less life;
  O Spring of wa -- ters clear:
  O Flame e -- les -- tial clean -- sing all
  Who un -- to thee draw near.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Hide me in thy dear Heart,
  For thi -- ther do I fly,
  There seek thy grace through life, in death
  Thine im -- mor -- tal -- i -- ty.
}

verseSix = \lyricmode {
  \set stanza = "6."
    To God the Fa -- ther praise,
    Praise to th'E -- ter -- nal Son,
    And praise to God the Ho -- ly Ghost
    While end -- less a -- ges run.
    
     \set stanza = "6." A -- men.
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
            \new Lyrics \lyricsto soprano \verseSix
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
            \new Lyrics \lyricsto "tune" { \verseFive}
                  \new Lyrics \lyricsto "tune" { \verseSix}
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  \bottom
}
