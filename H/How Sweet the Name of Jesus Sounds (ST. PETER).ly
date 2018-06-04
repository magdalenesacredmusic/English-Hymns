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
  poet = \markup{ \fontsize #4 \smallCaps "How Sweet the Name of Jesus Sounds"  }
  meter = \markup { \small { Music: ST. PETER, C.M.; A.R. Reinagle, 1836} }
  piece = \markup { \small {Text: J. Newton, 1774 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key ef \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  bf4 |
  ef d c bf |
  bf af g \bar "||"

  g |
  f ef af g |
  f2. \bar "||" \break

  g4 |
  af g c bf |
  bf af g \bar "||"

  ef |
  g f ef d |
  ef2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  ef4 |
  g g ef ef |
  f d ef

  ef |
  c8[ d] ef4 d ef |
  d2.

  ef4 |
  ef ef ef ef |
  c d ef

  c |
  ef c bf bf |
  bf2.
}

tenor = \relative c' {
  \global
  \partial 4
  g4 |
  bf bf af bf |
  bf bf bf

  bf |
  c bf af bf |
  bf2.

  bf4 |
  af bf c ef, |
  f f ef

  g |
  bf af g f8[ af] |
  g2.
}

bass = \relative c {
  \global
  \partial 4
  ef4 |
  ef g af g |
  d bf ef

  ef |
  af g f ef |
  bf2.

  ef8[ df] |
  c4 bf af g |
  f bf c

  c |
  g af bf bf |
  ef2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  How sweet the name of Je -- sus sounds
  In a be -- liev -- er's ear!
  It soothes his sor -- rows, heals his wounds,
  And drives a -- way his fear.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  It makes the wound -- ed spi -- rit whole,
  And calms the trou -- bled breast;
  'Tis man -- na to the hun -- gry soul,
  And to the wea -- ry rest.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Dear name! the rock on which I build,
  My shield and hid -- ing -- place,
  My ne -- ver -- fail -- ing treas -- ury, filled
  With bound -- less stores of grace.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Je -- sus! my Shep -- herd, Hus -- band, Friend,
  My Pro -- phet, Priest, and King,
  My Lord, my Life, my Way, my End,
  Ac -- cept the praise I bring.
}


verseFive = \lyricmode {
  \set stanza = "5."
  Weak is the ef -- fort of my heart,
  And cold my warm -- est thought;
  But when I see Thee as Thou art,
  I'll praise Thee as I ought.
}

verseSix = \lyricmode {
  \set stanza = "6."
  Till then I would Thy love pro -- claim
  With ev' -- ry fleet -- ing breath;
  and my the mu -- sic of Thy name
  Re -- fresh my soul in death.
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
      \context Lyrics = six \lyricsto sopranos \verseSix
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
      tempoWholesPerMinute = #(ly:make-moment 84 4)
    }
  }
  \layout {}
}

