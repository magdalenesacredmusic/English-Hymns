%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Cecil Frances Alexander (1818-1895)
      }
      \wordwrap {
        Music: ALL THINGS BRIGHT AND BEAUTIFUL, 76 76 and refrain, William Henry Monk (1823-1889)
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {ALL THINGS BRIGHT AND BEAUTIFUL  76 76 and refrain}
    }
    \column{
      \line {William Henry Monk (1823-1889)}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Cecil Frances Alexander (1818-1895)}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  c4^\markup {\italic Refrain} e, f a |
  g4. e8 c4 e |
  d b' b a |
  g1 |
  c4 e, f a |
  g4. e8 c4 a' |
  g c e,4. d8 |
  c2.^\markup {\italic Fine} \bar "|." \break
  
  \key g \major
  e4^\markup {\italic Verses} |
  d g g4. fs8 |
  g2 g4 e |
  d g g4. fs8 |
  g2. \bar ""
  
  gs4 |
  a4. b8 c4 a |
  fs2 g4 e |
  d4. e8 fs4 a |
  g1^\markup {\italic "back to refrain"} \bar "||"
}

alto = \relative c' {
  \global
  e4 c c f |
  e4. c8 c4 c |
  d b c c |
  b1 |
  
  c4 c b b |
  c4. b8 c4 c8[ b] |
  c4 c8[ d] e[ c] b4 |
  c2. 
  
  c4 |
  d b c4. c8 |
  b4( d8[ c]) b4 c |
  d b8[ c] d4. c8 |
  b4( d8[ c] b4) 
  
  d4 |
  e4. d8 c4 e |
  e( d8[ c]) b4 c |
  b4. b8 c4 c |
  b1 |
}

tenor = \relative c' {
  \global
  g4 g f b |
  c4. g8 e4 e8[ fs] |
  g4 g e fs |
  g1 |
  
  g4 g g g |
  g4. g8 e4 f |
  g4 e8[ f] g4. f8 |
  e2. 
  
  \key g \major
  g4 |
  g g e4. d8 |
  g4( b8[ a]) g4 g |
  g g8[ a] b4. a8 |
  g4( b8[ a] g4) 
  
  b4 |
  c4. gs8 a4 a |
  a8[( c] b[ a]) g4 g |
  g4. g8 a4 fs |
  g1
}

bass = \relative c {
  \global
 c4 c a d |
 e4. e8 a,4 a |
 b8[ c] d4 d d |
 g2.( f!4) |
 e4 c d f |
 e4. e8 a,4 d |
 e a, g g |
 c2. 
 
 c4 |
 b g a4. d8 |
 g,2 g4 c |
 b e d4. d8 |
 g,2. 
 
 e'4 |
 e4. e8 a,4 c |
 d2 e4 c |
 d4. d8 d4 d |
 \small g4_\markup {\tiny Org.} f e d
}

verseOne = \lyricmode {
  \override Lyrics.LyricText.font-shape = #'italic
  All things bright and beau -- ti -- ful,
  All crea -- tures great and small,
  All things wise and won -- der -- ful,
  The Lord God made them all.
  
  \revert Lyrics.LyricText.font-shape
  \vOne
  Each lit -- tle flower that o -- pens,
  Each lit -- tle bird that sings,
  He made their glow -- ing co -- lors,
  He made their ti -- ny wings:
}

verseTwo = \lyricmode {
  _ _ _ _ _ _ _
  _ _ _ _ _ _
  _ _ _ _ _ _ _
  _ _ _ _ _ _
  
  \vTwo
  The pur -- ple -- head -- ed moun -- tain
  The riv -- er run -- nig by,
  The sun -- set, and the morn -- ing
  That bright -- ens up the sky:
}

verseThree = \lyricmode {
  _ _ _ _ _ _ _
  _ _ _ _ _ _
  _ _ _ _ _ _ _
  _ _ _ _ _ _
  
  \vThree
  The cold wind in the win -- ter,
  The plea -- sant sum -- mer sun,
  The ripe fruits in the gar -- den,
  He made them ev -- 'ry one:
}

verseFour = \lyricmode {
  _ _ _ _ _ _ _
  _ _ _ _ _ _
  _ _ _ _ _ _ _
  _ _ _ _ _ _
  
  \vFour
  The tall trees in the green -- wood,
  The mea -- dows where we play,
  The rush -- es by the wa -- ter
  We gath -- er ev -- 'ry day:
}

verseFive = \lyricmode {
  _ _ _ _ _ _ _
  _ _ _ _ _ _
  _ _ _ _ _ _ _
  _ _ _ _ _ _
  
  \vFive
 He gave us eyes to see them,
 And lips that we might tell
 How great is God al -- might -- y,
 Who has made all things well:
}

#(set-global-staff-size 20)
\book {
  \include "hymn_paper.ly"
  \header {
    tagline = ""
  }
 % \top
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_layout.ly"
  }
  %\bottom
  \refs
}

%%%%%%
%%%%%%
%%%%%%
#(set-global-staff-size 16)
#(define output-suffix "Hymnal")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_hymnal_paper.ly"
  \header {
    tagline = ""
  }
  %\top
  \score { %\transpose c d
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
        tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }
    \include "hymn_hymnal_layout.ly"
  }    
  \refs
  %\bottom
}

%%%%%%
%%%%%%
%%%%%%
#(define output-suffix "Melody")
\book {
  \include "lilypond-book-preamble.ly"
  \include "hymn_melody_paper.ly"
  %\top
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
      \new Lyrics \lyricsto "tune" { \verseFive }
    >>
    \include "hymn_layout.ly"
  }
  \markup {
    \vspace #0.5
  }
  %\bottom
  \refs
}
