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
      \line {VICTORY   88 84}
    }
    \right-column{
      \line {G.P. Palestrina, 1591; arr. W.H. Monk, 1861}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {\italic "Finita jam sunt praelia"}
      \line {18th cent; Tr. F. Pott, 1861}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key d \major
  \time 3/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global

}

melody = \relative c'' {
  \global
    b4\rest^\markup { \italic "Antiphon" } fs4 fs |
  g2. |
  fs4 a a |
  b2. |
  a4 a d |
  cs2. |
  d2.  \bar "|."
  
   a4 a a |
  b2 a4 |
  a( g) fs4 |
  a2. |
  fs4 fs fs | \break
  fs2 fs4 |
  fs( e) d |
  e2. |
  a4 a a |
  b2 a4 | \break
  a( g) fs |
  a2. |
  b4\rest a4 d |
  cs2. |
  d2. \bar "||"

}

alto = \relative c' {
  \global
  s4 d4 d |
  d2. |
  d4 d d |
  d2. |
  d4 d fs |
  e2. |
  fs |

  fs4 fs fs |
  g2 fs4 |
  fs( b,) d |
  e2. |
  d4 d d |
  d2 cs4 |
  d( b) b |
  cs2. |
  cs4 fs fs |
  g2 fs4 |
  fs( b,) d |
  e2. |
  s4 d fs |
  e2. |
  fs |
}

tenor = \relative c' {
  \global
  r4 a a |
  b2. |
  a4 fs fs |
  g2. |
  fs4 a a |
  a2. |
  a |

  d4 d d |
  d2 d4 |
  cs( e) d|
  cs2. |
  a4 a a |
  b2 a4 |
  a( g) fs |
  a2. |
  a4 d d |
  d2 d4 |
  cs( e) d |
  cs2.
  d,4\rest d' a |
  a2. |
  a
}

bass = \relative c {
  \global
  \tiny d,4_\markup {\italic Ped.} \normalsize d' d
  g,2. |
  d'4 d d |
  g,2. |
  d'4 fs d |
  a2. |
  d |

  d4 d d |
  g2 d4 |
  fs( e) b' |
  a2. |
  d,4 d d |
  b2 fs'4 |
  d( e) b |
  a2. |
  fs'4 d d |
  g2 d4 |
  fs( e) b' |
  a2. |
  s4 fs d |
  a2. |
  d
}

verseOne = \lyricmode {
  Al -- le -- lu -- ia, al -- le -- lu -- ia, al -- le -- lu -- ia.
  
  \set stanza = "1."
  The strife is o'er, the bat -- tle done;
  Now is the Vic -- tor's tri -- umph won;
  O let the song of praise be sung:
  Al -- le -- lu -- ia!
}

verseTwo = \lyricmode {
  _ _ _ _   _ _ _ _    _ _ _ _
  \set stanza = "2."
  Death's migh -- tiest pow'rs have done their worst,
  And Je -- sus hath his foes dis -- persed;
  Let shouts of praise and joy out -- burst:
  Al -- le -- lu -- ia!
}

verseThree = \lyricmode {
    _ _ _ _   _ _ _ _    _ _ _ _
  \set stanza = "3."
  On the third morn he rose a -- gain
  Glo -- rious in ma -- jes -- ty to reign;
  O let us swell the joy -- ful strain:
  Al -- le -- lu -- ia!
}

verseFour = \lyricmode {
    _ _ _ _   _ _ _ _    _ _ _ _
  \set stanza = "4."
  He brake the age -- bound chains of hell;
  The bars from heav'n's high por -- tals fell;
  Let hymns of praise his tri -- umph tell:
  Al -- le -- lu -- ia!
}

verseFive = \lyricmode {
    _ _ _ _   _ _ _ _    _ _ _ _
  \set stanza = "5."
  Lord, by the stripes which wound -- ed Thee
  From death's dread sting Thy ser -- vants free,
  That we may live, and sing to Thee:
  Al -- le -- lu -- ia!
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
  \bottom
}