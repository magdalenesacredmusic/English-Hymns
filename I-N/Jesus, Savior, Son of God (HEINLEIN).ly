%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/
%}
\version "2.22.2"

\include "english.ly"
\include "hymn_definitions.ly"

refs = \markup {
  \fontsize #-3 {
    \left-column {
      \wordwrap {
        Text: Horatius Bonar (1808-1889)
      }
      \wordwrap {
        Music: AUS DER TIEFE, 77 77, Martin Herbst, (1654-1581); Harm. \italic "The English Hymnal," 1906
      }
    }
  }
}

top = \markup {
  \fill-line {
    \column {
      \line {AUS DER TIEFE 77 77}
    }
    \right-column{
      \line {Martin Herbst, (1654-1581) harm. \italic "The English Hymnal"}
    }
  }
}

bottom = \markup  {
  \fill-line {
    \null 
    \right-column {
      \line {Horatius Bonar (1808-1889) }
    }
  } 
}

\header {
  tagline = ""
}


global = {
  \key d \minor
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a4 a d, e |
  f g a2 |
  a4 a8[ b] c4 c |
  b4. a8 a2 |
  a4 a bf! bf |
  g g a2 |
  a4 a g f |
  e4. e8 d2 \bar "|."
}

alto = \relative c' {
  \global
  d4 d d cs |
  d4. e8 d4( cs) |
  d d8[ f] e4 f |
  f8[ e] d4 cs2 |
  fs4 fs g g8[ f] |
  e[ d] c4 c2 |
  c8[ bf] c[ d] e4 d |
  d cs d2 |
}

tenor = \relative c {
  \global
  f4 f8[ g] a4 a |
  a4. g8 e2 |
  f8[ g] a[ d] c4 a |
  a gs a2 |
  a4 d d d |
  c4. bf8 a2 |
  a8[ g] a[ bf] c4 a |
  a8[ g] e4 f2 \bar "|."
}

bass = \relative c {
  \global
  d4 d8[ e] f4 a4 |
  d,8[ c] bf4 a2 |
  d8[ e] f[ g] a4 f8[ e] |
  d4 e a,2 |
  d8[ c] bf[ a] g4 bf |
  c e f2 |
  f4 f c d |
  a a d2 |
}

verseOne = \lyricmode {
  \vOne
  Je -- sus, Sa -- vior, Son of God,
Bear -- er of the sin -- ner's load,
Break -- er of the cap -- tive's chain,
Cleans -- er of the guil -- ty's stain.
}

verseTwo = \lyricmode {
  \vTwo
  Thou the sin -- ner's death hast died,
Thou for us wast cru -- ci -- fied:
For our sins thy flesh was torn,
Thou our pen -- al -- ty hast borne.
}

verseThree = \lyricmode {
  \vThree
  Sa -- vior, Sure -- ty, Lamb of God,
Thou hast bought us with thy Blood;
Thou hast wiped the debt a -- way,
Noth -- ing left for us to pay;
}

verseFour = \lyricmode {
  \vFour
  Noth -- ing left for us to bear,
Noth -- ing left for us to share
But the par -- don and the bliss,
But the love, the light, the peace.
}

extraVerses = 
   \markup {
    \vspace #1
  \fontsize #0.2 {
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "I to Thee will look and live,"
"And, in looking, praises give;"
"Looking lightens, looking heals,"
"Looking all the gladness seals."
          }
        }
    \vspace #1
        \line {
          \bold "6. "
          \column {
            "Jesus, Savior, Son of God,"
"Bearer of the sinner's load,"
"I would rise to Thee above,"
"I would look, and praise, and love."
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}

%%%%%%%%
%%%%%%%%%%
%%%%%%%%%%%%
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
      \new Lyrics \with {
        \override VerticalAxisGroup.
        nonstaff-relatedstaff-spacing.padding = #1.5 } \lyricsto "tune" { \verseOne }
      \new Lyrics \lyricsto "tune" { \verseTwo }
      \new Lyrics \lyricsto "tune" { \verseThree }
      \new Lyrics \lyricsto "tune" { \verseFour }
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