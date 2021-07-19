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
          \line {MELITA 88 88 88}
      }
      \column{
      \line {John Bacchus Dykes, 1861}
      }
}
}

bottom = \markup  {
 \fill-line {
   \null 
   \right-column {
     \line { "st. 1 and 4, William Whiting, 1860, alt."}
     \line {"st. 2 and 3, The Hymnal 1940, alt"}
   }
  } 
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

\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
  \top
  \score { \transpose
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
        tempoWholesPerMinute = #(ly:make-moment 86 4)
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  \bottom
}


