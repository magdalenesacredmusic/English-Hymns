%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup{ \fontsize #4 \smallCaps "The Strife is O'er"  }
  meter = \markup { \small { Music: VICTORY, 88.84.; G.P. Palestrina, 1591; arr. W.H. Monk, 1861 } }
  %piece = \markup { \small {Text: \italic "Finita jam sunt praelia," 18th %cent; tr. F. Pott, 1861 }}
  %breakbefore
  %copyright = ""
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
  b4\rest^\markup { \italic "Antiphon" } fs4 fs |
  g2. |
  fs4 a a |
  b2. |
  a4 a d |
  cs2. |
  d2.  \bar "|."
}

melodyb = \relative c'' {
  \global
  \bar ".|:" a4 a a |
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
  d2. \bar ":|."

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
}

altob = \relative c' {
  \global
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
}

tenorb = \relative c' {
  \global
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
}

bassb = \relative c {
  \global
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

antiphon = \lyricmode {
  Al -- le -- lu -- ia, al -- le -- lu -- ia, al -- le -- lu -- ia.
}

verseOne = \lyricmode {
  \set stanza = "1."
  The strife is o'er, the bat -- tle done;
  Now is the Vic -- tor's tri -- umph won;
  O let the song of praise be sung:
  Al -- le -- lu -- ia!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Death's migh -- tiest pow'rs have done their worst,
  And Je -- sus hath his foes dis -- persed;
  Let shouts of praise and joy out -- burst:
  Al -- le -- lu -- ia!

}


verseThree = \lyricmode {
  \set stanza = "3."
  On the third morn he rose a -- gain
  Glo -- rious in ma -- jes -- ty to reign;
  O let us swell the joy -- ful strain:
  Al -- le -- lu -- ia!
}

verseFour = \lyricmode {
  \set stanza = "4."
  He brake the age -- bound chains of hell;
  The bars from heav'n's high por -- tals fell;
  Let hymns of praise his tri -- umph tell:
  Al -- le -- lu -- ia!
}

verseFive = \lyricmode {
  \set stanza = "5."
  Lord, by the stripes which wound -- ed Thee
  From death's dread sting Thy ser -- vants free,
  That we may live, and sing to Thee:
  Al -- le -- lu -- ia!
}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranos { \voiceOne << \melody >> }
      \context Voice =
      altos { \voiceTwo << \alto >> }
      \context Lyrics = ant \lyricsto sopranos \antiphon
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenor >> }
      \context Voice =
      basses { \voiceTwo << \bass >> }
    >>
  >>
  \header {
    piece = \markup { \small {Text: \italic "Finita jam sunt praelia," 18th cent; tr. F. Pott, 1861 }}
  }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 100 4)
    }
  }
  \layout {
  ragged-last = ##f
  }
}


%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranos { \voiceOne << \melodyb >> }
      \context Voice =
      altos { \voiceTwo << \altob >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
      \context Lyrics = two \lyricsto sopranos \verseTwo
      \context Lyrics = three \lyricsto sopranos \verseThree
      \context Lyrics = four \lyricsto sopranos \verseFour
      \context Lyrics = five \lyricsto sopranos \verseFive
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenorb >> }
      \context Voice =
      basses { \voiceTwo << \bassb >> }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 100 4)
    }
  }
  \layout {}
}
