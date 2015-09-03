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
  poet = \markup{ \fontsize #4 \smallCaps "Eternal Father, Strong to Save"  }
  meter = \markup { \small { Music: MELITA, 88.88.88.; J.B. Dykes, 1861} }
  piece = \markup { \small {Text: W. Whiting, 1860 }}
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
  c4 |
  e4. e8 g4 g4 |
  a4 a g \bar "||"

  g |
  c d b g |
  g fs g \bar "||"

  d |
  f4. f8 e4 e |
  g4. g8 fs4 \bar "||"
  
    b |
  g fs e a |
  g fs e \bar "||"
  
    e |
  e4. e8 f4 f |
  fs4. fs8 g4 \bar "||"
  
    g |
  g a g e |
  d4. c8 c4 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  c4 |
  c4. c8 e4 e |
  f f e
  
    g |
  g4. fs8 g4. e8 |
  d4 d d 
  
    b |
  d4. d8 c4 c |
  e4. e8 d4 
  
    fs |
  e4. ds8 e4. fs8 |
  e4 ds e 
  
    b |
  as4. as8 a4 c |
  c4. c8 b4 
  
    f'! |
  e d e c |
  b4. c8 c4 \bar "|."
}

tenor = \relative c {
  \global
  \partial 4
  e4 |
  g4. g8 c4. b8 |
  a8[ b] c[ d] e4

  d |
  c a b d8[ c] |
  a4 a b 
  
    g |
  g4. g8 g4 g |
  a4. a8 a4 
  
    b |
  b a b c |
  b b g 
  
    g |
  g4. g8 f4 a |
  a4. a8 g4 
  
    d' |
  c c c g |
  f4. e8 e4 \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  c4 |
  c4. c8 c4 c4 |
  f8[ g] a[ b] c4 
    
    b |
  a d, g b,8[ c] |
  d4 d g 
    
    g |
  b,4. b8 c4 c |
  cs4. cs8 d4 
  
    ds |
  e fs g a |
  b b e, 
  
    e |
  c4. c8 f4 f |
  d4. d8 g4 
  
    b, |
  c fs, g g |
  g4. c8 c4 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  E -- ter -- nal Fath -- er, strong to save,
  Whose arm doth bind the rest -- less wave,
  Who bidd'st the migh -- ty o -- cean deep
  Its own ap -- point -- ed lim -- its keep;
  Oh, hear us when we cry to Thee,
  For those in per -- il on the sea!
}

verseTwo = \lyricmode {
  \set stanza = "2."
  O Sa -- viour, whose al -- might -- y word
  The winds and waves sub -- mis -- sive heard,
  Who walk -- edst on the foam -- ing deep,
  And calm a -- midst its rage didst sleep;
  Oh, hear us when we cry to Thee,
  For those in per -- il on the sea!
}

verseThree = \lyricmode {
  \set stanza = "3."
  O sa -- cred Spir -- it, who didst brood
  Up -- on the cha -- os dark and rude,
  And bad'st its an -- gry tu -- mult cease,
  And gav -- est light and life and peace:
  Oh, hear us when we cry to Thee,
  For those in per -- il on the sea!
}

verseFour = \lyricmode {
  \set stanza = "4."
  O Tri -- ni -- ty of love and pow'r!
  Our breth -- ren shield in dan -- ger's hour;
  From rock and tem -- pest, fire and foe,
  Pro -- tect them where -- so -- e'er they go;
  And ev -- er let there rise to Thee
  Glad hymns of praise from land and sea.
}

\score {
  \transpose c d
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
