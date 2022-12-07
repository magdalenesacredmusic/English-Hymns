%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version "2.18.2"
\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: \italic "Corpus ave clarum Domini," Tr. H.T. Henry, \italic "Eucharistica," 1912
      }
      \wordwrap {
        Music: SONG 4, 10 10 10 10, Melody and bass by Orlando Gibbons 1583-1625
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {SONG 4  10 10 10 10 }
    }
    \column{
      \line {Melody and bass by Orlando Gibbons 1583-1625}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null
    \right-column {
      \line {\italic "Corpus ave clarum Domini"}
      \line {Tr. H.T. Henry, \italic "Eucharistica," 1912}
    }
  }
}

\header {
  tagline = ""
}

global = {
  \key d \major
  \time 3/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  b4\rest fs4 b as b cs |
  d a b g fs2 |
  b4\rest fs a gs fs4. e8 |
  d4 b e d cs2 |
  b'4\rest cs4 as fs b as |
  b fs b cs d2 |
  b4\rest fs gs as b cs |
  as d cs cs b2 \bar "|."
}

alto = \relative c' {
  \global
  s4 d d cs d e |
  fs d fs e8[ d] cs2 |
  s4 cs fs e d cs |
  b b cs b as2 |
  s4 fs' fs fs fs e |
  d d d e fs2 |
  s4 fs4 fs e d g |
  fs8[ e] d[ e] fs[ e] cs4 d2
}

tenor = \relative c {
  \global
  d4\rest b' fs fs fs a |
  a d8[ cs] b4 b as2 |
  d,4\rest a' cs cs8[ b] a4 a |
  fs d g fs fs2 |
  d4\rest as'4 cs as b cs |
  fs, b b8[ a] g4 a2 |
  d,4\rest b' b fs b e |
  cs b b as b2
}

bass = \relative c {
  \global
  s4 b b fs b a |
  d fs d e fs2 |
  s4 fs, fs' cs d a |
  b b e b fs2 |
  s4 fs4 fs'4. e8 d4 cs |
  b b'8[ a] g[ fs] e4 d2 |
  s4 d4 e fs g e |
  fs b, fs' fs, b2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Bod -- y of God,
  all hail! no shades of night
  Can thee en -- shroud,
  who art our Food and Light.
  Wash out all stain
  of sin, we hum -- bly pray,
  That we may gain
  the joys of end -- less Day.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Hail, Christ's dear Flesh!
  my on -- ly hope and store,
  Feed me a -- fresh
  when death knocks at my door.
  O Liv -- ing Bread,
  when my last flutt -- 'ring breath
  My soul hath sped,
  save from the Sec -- ond Death!
}

verseThree = \lyricmode {
  \set stanza = "3."
  My heart and mind
  a -- dore thee, Flesh of Christ,
  For all man -- kind
  on Cal -- v'ry sac -- ri -- ficed:
  In thee I find
  a trea -- sure all -- un -- priced.
  Let me at -- tain
  to thee, my heart's De -- sire!
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
    >>
    \include "hymn_layout.ly"
  }
  \markup { 
    \vspace #0.5 
  }
  % \bottom
  \refs
}
