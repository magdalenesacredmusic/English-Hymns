\version "2.22.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Samuel Francis Smith (1808-1895), 1832
      }
      \wordwrap {
        Music: AMERICA, 664 6664, \italic "Harmonia Anglicana," c. 1744
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {AMERICA, 664 6664}
    }
    \right-column{
      \line {\italic "Harmonia Anglicana," c. 1744}
      \line {}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {Samuel Francis Smith (1808-1895), 1832}
      \line {}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key f \major
  \time 3/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f4 f g
  e4. f8 g4
  a a bf
  a4. g8 f4
  g f e 
  f2.
  
  c'4 c c 
  c4. bf8 a4
  bf4 bf bf 
  bf4. a8 g4
  a4 bf8[ a] g[ f] 
  a4. bf8 c4
  d8[ bf] a4 g
  f2. \bar "|."
}

alto = \relative c' {
  \global
  c4 d d 
  c4. d8 e4
  f f g
  f4. e8 f4
  d4 c c 
  c2.
  
  a'4 a a 
  a4. g8 f4
  g4 g g
  g4. f8 e4
  f4 f c8[ f]
  f4. f8 f4
  f8[ g] f4 e
  f2.
}

tenor = \relative c' {
  \global
  a4 a bf 
  g4. g8 c4
  c d d 
  c4. bf8 a4
  bf a g 
  a2.
  c4 c c 
  c4. c8 c4
  c c c 
  c4. c8 c4
  c4 d8[ c] bf[ a] 
  c4. c8 c4
  bf8[ d] c4 bf 
  a2.
}

bass = \relative c {
  \global
 f4 d bf
 c4. c8 c4
 f4 d bf
 c4. c8 d4
 bf c c 
 f2. 
 
 f4 a c
 f,4. f8 f4
 c4 e g
 c,4. c8 c4
 f4 f f 
 f4. g8 a4
 bf4 c c, 
 f2.
}

verseOne = \lyricmode {
  \vOne
My coun -- try, 'tis of thee,
sweet land of lib -- er -- ty,
Of thee I sing:
Land where my fath -- ers died,
Land of the pil -- grims' pride,
From ev -- 'ry moun -- tain -- side
Let free -- dom ring!
}

verseTwo = \lyricmode {
  \vTwo
My nat -- ive coun -- try, thee,
Land of the no -- ble free,
Thy name I love;
I love thy rocks and rills,
Thy woods and tem -- pled hills;
My heart with rap -- ture thrills
Like that a -- bove.
}

verseThree = \lyricmode {
  \vThree
Let mu -- sic swell the breeze,
And ring from all the trees
Sweet free -- dom's song:
Let mor -- tal tongues a -- wake,
Let all that breathe par -- take;
Let rocks their si -- lence break,
The sound pro -- long.
}

verseFour = \lyricmode {
  \vFour
  Our fa -- thers' God, to thee,
  Au -- thor of lib -- er -- ty,
  To thee we sing.
  Long may our land be bright
  With free -- dom's ho -- ly light;
  Pro -- tect us by thy might, 
  Great God, our King.
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
    %  \new Lyrics \lyricsto soprano \verseFive
      \new Staff  <<
        \clef bass
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 80 4)
      }
    }
    \include "hymn_layout.ly"
  }
  % \bottom
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
    %  \new Lyrics \lyricsto soprano \verseFive
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
  %  \top
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
   %   \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}
