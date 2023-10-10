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
        Text: Gerard Moultrie, 1863, adapt. \italic "The English Hymnal," 1906
      }
      \wordwrap {
        Music: \italic "Neues Geistreiches Gesangbuch," 1714, from \italic "The English Hymnal," 1906
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {PRESSBURG 77 77 77}
    }
    \right-column{
      \line {\italic "Neues Geistreiches Gesangbuch," 1714}
      \line {from \italic "The English Hymnal," 1906}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Gerard Moultrie, 1863}
      \line {adapt. \italic "The English Hymnal," 1906}
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key a \minor
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a4 gs a e |
  c' b8[ a] gs2 |
  
  g!4 a8[ e] f4 g8[ d] |
  e4. d8 e2 |
  
  e'4 b c g |
  a g8[ f] e2 |
  
  g4 g a8[ b] c4 |
  e, d c2 \bar "||"
  
  e'4^\markup {\caps Refrain} e d e8[ b] |
  c4 b8[ a] gs2 |
  
  b8[ c] d4 c8[ d] e4 |
  c b a2 \bar "|."
}

alto = \relative c' {
  \global
  e4 d e e |
  e f e2 |
  e4 e d d |
  d8[ c] a4 b2 |
  e4 e e e |
  f8[ e] d4 c2 |
  c4 c c c |
  c b c2 |
  e8[ f] g4 g e |
  a8[ g] f4 e2 |
  e4 e e e |
  e e8[ d] c2
}

tenor = \relative c' {
  \global
  c4 b a a |
  c d b2 |
  b4 a a g |
  g a gs2 |
  gs8[ a] b4 c8[ d] e4 |
  c4. b8 g2 |
  e8[ f] g4 c g8[ a] |
  g4 g8[ f] e2 |
  g4 c c8[ b] b[ e] |
  c4 d b2 |
  b4 b a a |
  a gs a2
}

bass = \relative c {
  \global
  a4 b c c8[ b] |
  a4 d e2 |
  e8[ d] cs4 d8[ c] b4 |
  c f e2 |
  e8[ fs] gs4 a8[ b] c4 |
  f, g c,2 |
  c8[ d] e4 f c8[ f] |
  g4 g, c2 |
  c8[ d] e[ f] g4 gs |
  a4 d, e2 |
  gs4 gs a c,8[ d] |
  e4 e a,2
}

verseOne = \lyricmode {
  \vOne
  Now the la -- bourer's toils are o'er
  Fought the bat -- tle, won the crown:
  On life's rough and bar -- ren shore
  Thou hast laid thy bur -- den down:
  \override LyricText #'font-shape = #'italic
  Grant \revert Lyrics.LyricText #'font-shape
  him,
  \vOff
  \override LyricText #'font-shape = #'italic
  Lord, e -- ter -- nal rest,
  With the spi -- rits of the blest.
}

verseTwo = \lyricmode {
  \vTwo
  An -- gels bear thee to the land
  Where the towers of Si -- on rise;
  Safe -- ly lead thee by the hand
  To the fields of Par -- a -- dise:
}

verseThree = \lyricmode {
  \vThree
  White -- robed, at the gol -- den gate
  Of the new Je -- ru -- sa -- lem,
  May the host of Mar -- tyrs wait;
  Give thee pat and lot with them:
}


verseFour = \lyricmode {
  \vFour
  Friends and dear ones gone be -- fore
  To the land of end -- less peace,
  Meet thee on that fur -- ther shore
  Where all tears and weep -- ing cease:
}

verseFive = \lyricmode {
  \vFive
  Rest in peace: the gates of hell
  Touch thee not, till he shall come
  For the souls he loves so well,-
  Dear Lord of the heav'n -- ly home:
}

verseSix = \lyricmode {
  \vSix
  Earth to earth, and dust to dust,
  Clay we give to kin -- dred clay,
  In the sure and cer -- tain trust
  Of the Re -- sur -- rec -- tion day:
}


extraVerses = 
   \markup {
  \fontsize #0.2 {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "5. "
          \column {
            "Rest in peace: the gates of hell"
            "Touch thee not, till he shall come"
            "For the souls he loves so well,-"
            "Dear Lord of the heav'nly home:"
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "Earth to earth, and dust to dust,"
            "Clay we give to kindred clay,"
            "In the sure and certain trust"
            "Of the Resurrection day:"
          }
        }
      }
      \hspace #1.0

    }
  }
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
     % \new Lyrics \lyricsto soprano \verseFive
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
  \extraVerses
  \markup {
    \vspace #0.5
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
     % \new Lyrics \lyricsto soprano \verseFive
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
  \extraVerses
    \markup {
    \vspace #0.5
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
     % \new Lyrics \lyricsto "tune" { \verseFive}
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \extraVerses
    \markup {
    \vspace #0.5
  }
  \refs
}
