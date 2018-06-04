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
  poet = \markup{ \fontsize #4 \smallCaps "The First Nowell"  }
  meter = \markup { \small { Music: The First Nowell, Irregular with refrain; Traditional, arr. 1833 } }
  piece = \markup { \small {Text: Traditional English Carol }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key d \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  fs8[ e] |
  d4.( e8) fs[ g] |
  a2 b8[ cs] |
  \set melismaBusyProperties = #'()
  d4( cs) b |
  a2 b8[ cs] |
  d4( cs) b |
  a( b) cs |
  d( a) g |
  fs2 \bar "||"

  fs8[ e] |
  d4.( e8) fs[ g] |
  a2 b8[ cs] |
  d4( cs) b |
  a2 b8[ cs] |
  d4( cs) b |
  a( b) cs |
  d( a) g |
  fs2 \bar "||" \break
  fs8[ e] |
  d4.( e8) fs[ g] |
  a2 d8[ cs] |
  b2 b4 a2. |
  d4 cs b |
  a( b) cs |
  d( a) g |
  fs2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  a2 d4 |
  e2 e4 |
  a~ a g |
  fs2 d8[ e] |
  a4( fs) g |
  a( d,) g |
  fs~ fs e |
  d2
  cs4 |
  a2 d4 |
  e2 e4 |
  a~ a g |
  fs2
  d8[ e] |
  a4( fs) g |
  a( g) g |
  fs~ fs e |
  d2
  cs4 |
  a2 d4 |
  cs2 fs4 |
  g2 g4 |
  fs2( a4) |
  fs fs g
  fs2 g4 |
  fs2 e4 |
  d2 \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4
  a8[ g] |
  fs2 d'4 |
  cs( a) b |
  a~ a b8[ cs] |
  d2 b8[ a] |
  a4~ a cs |
  d( b) g |
  a( d) a |
  a2 a8[ g] |
  fs2 d'4 |
  d( cs) b |
  a~ a b8[ cs] |
  d2 b8[ a] |
  a4~ a cs |
  d~ d e |
  a,( d) a |
  a2
  a8[ g] |
  fs2 b4 |
  a2 a4 |
  b4.( cs8) d[ e] |
  fs2( e4) |
  d d d |
  d2 g,4 |
  a2 a4 |
  a2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  d2 b4 |
  a2 g'4 |
  fs~ fs g |
  d2 g8[ g] |
  fs4( d) e |
  fs( g) e |
  fs8[( g] a4) a |
  d,2
  d4 |
  d2 b4 |
  a( a') g |
  fs~ fs g |
  d2 g8[ g] |
  fs4( d) e |
  fs( g) e |
  fs8[( g] a4) a, |
  d2 a4 |
  d2 b4 |
  fs'2 d4 |
  g4.( a8) b[ cs] |
  d2( cs4) |
  b a g |
  d'( d,) e |
  fs8[( g] a4) a, |
  d2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  The first Now -- ell the an -- gel did say
  Was to cer -- tain poor shep -- herds in fields as they lay;
  In _ fields _ where _ they lay _ keep -- ing their sheep,
  On a cold win -- ter’s night _ that was _ so deep.
  Now -- _ ell, _ Now -- _ ell, Now -- _ ell, Now -- ell,
  Born is the King _ of Is -- _ ra -- el.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  They look -- èd up and saw _ a star
  Shin -- ing in _ the east, _ be -- yond _ them far;
  And _ to _ the _ earth it _ gave _ great light,
  And _ so it con -- tin -- ued both day _ and night.
}

verseThree = \lyricmode {
  \set stanza = "3."
  And by the light of that _ same star
  Three _ Wise _ Men came _ from coun -- _ try far;
  To _ seek _ for a King was _ their _ in -- tent,
  And to fol -- low the star _ wher -- ev -- er it went.
}


verseFour = \lyricmode {
  \set stanza = "4."
  This star drew nigh to the _ north -- west,
  O -- ver Beth -- _ le -- hem _ it took _ its rest;
  And _ there _ it _ did both _ stop _ and stay,
  Right _ o -- ver the place _ where Je -- _ sus lay.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Then en -- tered in those Wise _ Men three,
  Full _ rev' -- _ rent -- ly _ up -- on _ the knee,
  And _ of -- _ fered _ there, in _ His _ pre -- sence,
  Their _ gold _ and myrrh _ and frank -- _ in -- cense.

}

verseSix = \lyricmode {
  \set stanza = "6."
  Then let us all with one _ ac -- cord
  Sing _ prais -- _ es to _ our heav' -- _ nly Lord;
  That _ hath _ made _ Heav'n and _ earth _ of naught,
  And _ with _ His blood _ man -- kind _ hath bought.
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
      tempoWholesPerMinute = #(ly:make-moment 80 4)
    }
  }
  \layout {}
}

%{
\markup {
	\normalsize {
	\fill-line {
	\hspace #1.0
	\column {
		\line { \bold "5. "
		\column {
		"Then did they know assuredly"
		"Within that house the King did lie;"
		"One entered it them for to see,"
		"And found the Babe in poverty."
		}
		}
		\vspace #0.5
		\line { \bold "6. "
		\column {
		"Then entered in those Wise Men three,"
		"Full reverently upon the knee,"
		"And offered there, in His presence,"
		"Their gold and myrrh and frankincense."
  		}
\line { \bold "7. "
		\column {
		"Then let us all with one accord"
		"Sing praises to our heavenly Lord;"
		"That hath made Heaven and earth of naught,"
		"And with His blood mankind hath bought."
		}
		}
		}
		}
	\hspace #1.0

	}
  }
}
%}


%{ 8. If we in our time shall do well,
We shall be free from death and hell;
For God hath prepared for us all
A resting place in general. %}
