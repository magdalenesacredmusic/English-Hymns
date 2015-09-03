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
  poet = \markup{ \fontsize #4 \smallCaps "Unto Us is Born a Son"  }
  meter = \markup { \small { Music: PUER NOBIS NASCITUR, 77.77.; \italic "Piae Cantiones," 1582; arr. G. Shaw, 1913  } }
  piece = \markup { \small {Text: \italic "Puer nobis nascitur," Medieval Carol; tr. G.R. Woodward }}
  %breakbefore
  %copyright = ""
  tagline = ""

}


global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d4 e fs g |
  fs e d2 |
  a'4 a b cs |
  d2 d |

  d4 e cs d |
  b a a fs |
  a g fs e |
  \set melismaBusyProperties = #'()
  d( e)
  \unset melismaBusyProperties
  fs g |
  a g fs e |
  d2 d2 \bar "|."

}

alto = \relative c' {
  \global
  d2. b4 |
  cs2 d |
  d4 d d g |
  g2 fs |

  a4 b a fs |
  g e fs d |
  fs e d cs |
  b cs d b |
  a b cs2 |
  d4 b a2

}

tenor = \relative c {
  \global
  fs4 g a g |
  a g fs2 |
  s2 g4 s4 |
  s1 |

  s1 |
  s 1|
  s2 a4 s4 |
  fs4 e d e |
  fs4 g a g |
  fs g fs2
}

bass = \relative c {
  \global
  d2. e4 |
  a,2 d |
  <fs a>4 <d fs> g <e g> |
  \tieNeutral
  <d a'>2~ <d a'> |

  <fs d'>4 <g b> <a e> <b d> |
  <g e'> <a cs>~ <fs cs'> <b d> |
  <fs a> <g b> g <a, g'> |
  b2. e4 |
  a,1 |
  d1
}

verseOne = \lyricmode {
  \set stanza = "1."
  Un -- to us is born a son,
	King of choirs su -- per -- nal:
	See on earth his life be -- gun,
	Of lords the Lord e -- ter -- _ nal,
  Of lords the Lord e -- ter -- nal.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Christ, from heav'n des -- cend -- ing low,
	Comes on earth a stran -- ger;
	Ox and ass their Own -- er know
	Now cra -- dled in a man -- _ ger,
  Now cra -- dled in a man -- ger.
}

verseThree = \lyricmode {
  \set stanza = "3."
  This did He -- rod sore af -- fray,
	And did him be -- wil -- der,
	So he gave the word to slay,
	And slew the lit -- tle chil -- _ der,
  And slew the lit -- tle chil -- der.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Of his love and mer -- cy mild
	Hear the Christ -- mas sto -- ry:
	O that Ma -- ry's gen -- tle Child
	Might lead us up to glo -- _ ry,
  Might lead us up to glo -- ry!
}

verseFive = \lyricmode {
  \set stanza = "5."
  O and A and A and O,
	\override LyricText #'font-shape = #'italic
  Can -- te -- mus in cho -- ro,
  \revert Lyrics.LyricText.font-shape
  Voice and or -- gan, sing we so,
	\override LyricText #'font-shape = #'italic
  Be -- ne -- di -- ca -- mus Do -- mi -- no,
  Be -- ne -- di -- ca -- mus \set associatedVoice = "altos" Do -- mi -- no.
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
      tempoWholesPerMinute = #(ly:make-moment 69 2)
    }
  }
  \layout {}
}

