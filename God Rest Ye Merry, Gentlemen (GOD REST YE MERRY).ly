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
  poet = \markup{ \fontsize #4 \smallCaps "God Rest Ye Merry, Gentlemen"  }
  meter = \markup { \small { Music: GOD REST YE MERRY, 86.86.86. w/refrain; English, harm. J. Stainer } }
  piece = \markup { \small {Text:  }}
  %breakbefore
  %copyright = ""
  tagline = ""
}


global = {
  \key g \major
  \time 2/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  e4 |
  e b' b a |
  g fs e d |
  e fs g a |
  b2. 
  
    e,4 |
  e b' b a |
  g( fs) e d |
  e fs g a |
  b2. b4 |

  c a b c |
  d e b a |
  g e fs g |
  a2 \bar "||"
  
  g4( a) |
  b2 c4 b |
  b( a) g fs |
  e2 g8 fs e4 |
  a2 g4( a)
  b( c) d e
  b( a) g fs |
  e2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  e4 |
  e g fs ds |
  e d c b |
  e ds e e |
  ds2. 
  
  e4 |
  e g fs ds |
  e( d) c b |
  e ds e e |
  ds2. 
  
  e4 |
  e d d g |
  f e d ds |
  e cs d g |
  fs2
  
  g4( d) |
  d2 e4 d |
  g( fs) e ds |
  e2 b8 b cs4 |
  d2 e4( fs) |
  g2 g4 g |
  g( fs) e ds |
  e2.
}

tenor = \relative c {
  \global
  \partial 4
  e4 |
  g e fs b |
  b b g g |
  g b b e, |
  fs2. 
  
  e4 |
  g e fs b |
  b2 g4 g |
  g b b e, |
  fs2. 
  
  gs4 |
  a a g g |
  g g g fs |
  g g a d |
  d( c)
  
  
  b( a) |
  g2 g4 g |
  d'( c) b b |
  g2 g8 g g4 |
  fs( a) d( c) |
  b( g) d' c |
  d( c) b4 b |
  g2.
}

bass = \relative c {
  \global
  \partial 4
  e4 |
  e e ds b |
  e b c g |
  c b e c |
  b2. 
  
  e4 |
  e e ds b |
  e( b) c g |
  c b e c |
  b2. 
  
  e4 |
  a fs g e |
  b c g b |
  e e d c |
  d2

  e4( fs) |
  g2 c,4 g' |
  g,( a) b b |
  e2 e8 e e4 |
  d( c) b( a) |
  g( e') b c |
  g( a) b b |
  e2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  God rest you mer -- ry, gen -- tle -- men,
Let noth -- ing you dis -- may.
For Je -- sus Christ our Sa -- vior,
Was born on Christ -- mas Day;
To save us all from Sa -- tan’s power,
When we were gone a -- stray.

O ti -- dings of com -- fort and joy,
com -- fort and joy,
O ti -- dings of com -- fort and joy.
}

verseTwo = \lyricmode {
  \set stanza = "2."
 In Bethlehem, in Jury,
This blessed Babe was born,
And laid within a manger,
Upon this blessed morn;
The which His mother Mary
Did nothing take in scorn.
}

verseThree = \lyricmode {
  \set stanza = "3."
From God our heavenly Father,
A blessed angel came.
And unto certain shepherds,
Brought tidings of the same,
How that in Bethlehem was born,
The Son of God by name:
}


verseFour = \lyricmode {
	\set stanza = "4."
Fear not, then said the Angel,
Let nothing you affright,
This day is born a Savior,
Of virtue, power, and might;
So frequently to vanquish all,
The friends of Satan quite;
}

verseFive = \lyricmode {
	\set stanza = "5."
The shepherds at those tidings,
Rejoiced much in mind,
And left their flocks a feeding,
In tempest, storm, and wind,
And went to Bethlehem straightway,
This blessed babe to find:
}

verseSix = \lyricmode {
	\set stanza = "6."
But when to Bethlehem they came,
Whereas this infant lay
They found him in a manger,
Where oxen feed on hay;
His mother Mary kneeling,
Unto the Lord did pray:
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
      tempoWholesPerMinute = #(ly:make-moment 96 4)
    }
  }
  \layout {}
}


7. With sudden joy and gladness
The shepherds were beguiled,
To see the Babe if Israel,
Before His mother mild,
O then with joy and cheerfulness
Rejoice, each mother's child.

8. Now to the Lord sing praises,
All you within this place,
And with true love and brotherhood,
Each other now embrace;
This holy tide of Christmas,
Doth bring redeeming grace.