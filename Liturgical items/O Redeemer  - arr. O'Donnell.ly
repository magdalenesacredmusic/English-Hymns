\version "2.18.2"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup{ \fontsize #4 \smallCaps "O Redeemer"  }
  meter = \markup { \small { Music: Mode I plainsong, \italic "Roman Pontifical;" transcribed and accompanied by D. O'Donnell } }
  %piece = \markup { \small {Text: \italic "O Redemptor, sume carmen," Venantius Fortunatus (c. 520-609); tr. \italic "Roman Pontifical" }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

\paper {
  systems-per-page = 4
}

global = {
  \key f \minor
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \override Voice.Rest #'staff-position = #0
  \override Stem #'length = #0
  \hide Flag

  f8 af f( ef) ef f af af( bf) \hn af4 \divisioMinima \bar "" \noBreak
  af8( g) ef f af f ef( f) \hn f4 \bar "||" \break
  
  f8 ef f af bf af bf( c) \hn c4 \divisioMinima \bar "" \noBreak
  c8 bf c \bar "" \break
  
  bf( af) bf( c) bf( af) \hn af4 \divisioMaior \bar "" \noBreak
  af8 bf( c) c bf( af) bf( c) af( g) f( af) \hn af4 \divisioMinima \bar ""
  
  af8( g) f ef( f) af( bf af) f ef( f) \hn f4 \bar "||"
}

soprano = \relative c' {
  \global
  \override Voice.Rest #'staff-position = #0

  f8 af f[ ef] ef f af af[ bf] af4 
  af8[ g] ef f af f ef[ f] f4 
  
  f8 ef f af bf af bf[ c] c4 
  c8 bf c
  
  bf[ af] bf[ c] bf[ af] af4 
  af8 bf[ c] c bf[ af] bf[ c] af[ g] f[ af] af4 
  
  af8[ g] f ef[ f] af[ bf af] f ef[ f] f4 
}

alto = \relative c' {
  \global
  c4~ c4. df4~ df4 c4
  ef4. df4. bf4 c4
  
  c4~ c ef4~ ef4~ ef4 
  
  f4.
  df4 ef4~ ef c4~
  c8 ef4. f4 ef4 ef4 df4 f4
  
  df4 c8 bf4 df2 ef4 c4
}

tenor = \relative c' {
  \global
  af4 g4. af8[ f] f4~ f4
  bf4. af8 f4 g4 af4
  
  af4~ af4 g4~ g af
  af4.
  
  bf4~ bf f f4~
  f8 g4. bf4~ bf4 c4~ c4~ c4
  bf4 af8 g4 f4. af8 bf4 af4
}

bass = \relative c {
  \global
  f4 c4. df4 bf f'4 
  ef4. df4 bf8 c4 f4
  
  af4 f4 g4 ef4 c4 
  f4.~
  
  f4 g ef f4~
  f8 ef4. df4 c4~ c4 df4 f4~
  
  f4~ f8 ef4 df2 g4 f4
}

%%%%%%%%%%
%%%%%%%%%%
%%%%%%%%%%

melodyB = \relative c' {
  \global
  \override Voice.Rest #'staff-position = #0
  \override Stem #'length = #0
  \hide Flag
  
  f8 ef f af bf af bf( c) \hn c4 \divisioMinima \bar "" \noBreak
  c8 bf c \bar "" \break
  
  bf( af) bf( c) bf( af) \hn af4 \divisioMaior \bar "" \noBreak
  af8 bf( c) c bf( af) bf( c) af( g) f( af) \hn af4 \divisioMinima \bar ""
  
  af8( g) f ef( f) af( bf af) f ef( f) \hn f4 \bar "||"
}

sopranoB = \relative c' {
  \global
  \override Voice.Rest #'staff-position = #0
  
  f8 ef f af bf af bf[ c] c4 
  c8 bf c
  
  bf[ af] bf[ c] bf[ af] af4 
  af8 bf[ c] c bf[ af] bf[ c] af[ g] f[ af] af4 
  
  af8[ g] f ef[ f] af[ bf af] f ef[ f] f4 
}

altoB = \relative c' {
  \global

  c4~ c ef4~ ef4~ ef4 
  
  f4.
  df4 ef4~ ef c4~
  c8 ef4. f4 ef4 ef4 df4 f4
  
  df4 c8 bf4 df2 ef4 c4
}

tenorB = \relative c' {
  \global
  
  af4~ af4 g4~ g af
  af4.
  
  bf4~ bf f f4~
  f8 g4. bf4~ bf4 c4~ c4~ c4
  bf4 af8 g4 f4. af8 bf4 af4
}

bassB = \relative c' {
  \global
  
  af4 f4 g4 ef4 c4 
  f4.~
  
  f4 g ef f4~
  f8 ef4. df4 c4~ c4 df4 f4~
  
  f4~ f8 ef4 df2 g4 f4
}


verseOne = \lyricmode {
  O Re -- deem -- er, hear the an -- them
  which your peo -- ple ga -- thered sing.

  \set stanza = "1."
  On the fer -- tile tree the kind -- ly 
  sun -- light formed this of -- fer -- ing,
  which, bowed down, your peo -- ple ga -- thered
  to the a -- ges' Sa -- vior bring.
}

verseTwo = \lyricmode {
  _ _ _ _ _ _ _ _     _ _ _ _ _ _ _
  \set stanza = "2."
  King of our e -- ter -- nal home -- land
  con -- se -- crate this o -- live oil, 
  for our use: a liv -- ing sign which
  Sa -- tan's e -- vil laws will foil
}

verseThree = \lyricmode {
  _ _ _ _ _ _ _ _     _ _ _ _ _ _ _
  \set stanza = "3."
  So may all, both men and wo -- men, 
  who are by the Chri -- sm sealed
  be re -- newed, that hu -- man na -- ture's 
  wound -- ed glo -- ry may be healed.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Bath -- ing in the sa -- cred well -- spring
  shall the mind from sin re -- deem; 
  where the fore -- head is a -- noint -- ed
  char -- is -- ma -- tic grac -- es stream.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Of the Fa -- ther's love be -- got -- ten, 
  grac -- ing once the Vir -- gin's womb,
  'light -- en all who share this Chri -- sm;
  close the door which leads to doom.
}

verseSix = \lyricmode {
  \set stanza = "6."
  Let this be for us a feast day,
  while the a -- ges pass a -- way,
  sanc -- ti -- fied by wor -- thy prais -- es
  and un -- dimmed by time's de -- cay.
}

\score {
 % \transpose c bf,
  <<
    \new Voice = chant {\melody }
    \context Lyrics = one \lyricsto chant \verseOne
    \context Lyrics = two \lyricsto chant \verseTwo
    \context Lyrics = three \lyricsto chant \verseThree
    \context ChoirStaff <<
      \context Staff = upper <<
        \context Voice =
        sopranos { \voiceOne << \soprano >> }
        \context Voice =
        altos { \voiceTwo << \alto >> }

      >>
      \context Staff = lower <<
        \clef bass
        \context Voice =
        tenors { \voiceOne << \tenor >> }
        \context Voice =
        basses { \voiceTwo << \bass >> }
      >>
    >>
  >>
  \header {
  piece = \markup { \small {Text: \italic "O Redemptor, sume carmen," Venantius Fortunatus (c. 520-609); tr. \italic "Roman Pontifical" }}
}
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 80 4)
    }
  }
  \layout {
  ragged-last = ##f
  }
}

\score {
 % \transpose c bf,
  <<
    \new Voice = chant {\melodyB }
    \context Lyrics = four \lyricsto chant \verseFour
    \context Lyrics = five \lyricsto chant \verseFive
    \context Lyrics = six \lyricsto chant \verseSix
    \context ChoirStaff <<
      \context Staff = upper <<
        \context Voice =
        sopranos { \voiceOne << \sopranoB >> }
        \context Voice =
        altos { \voiceTwo << \altoB >> }

      >>
      \context Staff = lower <<
        \clef bass
        \context Voice =
        tenors { \voiceOne << \tenorB >> }
        \context Voice =
        basses { \voiceTwo << \bassB >> }
      >>
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 80 4)
    }
  }
  \layout {
  ragged-last = ##f
  }
}